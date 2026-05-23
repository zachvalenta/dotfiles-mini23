#!/usr/bin/env python3
"""
Scan a reference site for layout/typography/system tokens + screenshots.

Outputs an evidence bundle:
- artifacts/screenshots/{375,768,1200}.png
- artifacts/metrics.json
- artifacts/tokens.json
- artifacts/report.md

Usage:
  python site_clone_scan.py --url "https://example.com/article"
"""

from __future__ import annotations

import argparse
import json
import os
import re
import shutil
from pathlib import Path
from urllib.parse import urldefrag, urljoin, urlparse
from urllib.request import urlopen

from playwright.sync_api import sync_playwright


BREAKPOINTS = [
    {"name": "375", "width": 375, "height": 900},
    {"name": "768", "width": 768, "height": 900},
    {"name": "1200", "width": 1200, "height": 900},
]

TARGETS = {
    "container": None,
    "p": "p",
    "h1": "h1",
    "h2": "h2",
    "h3": "h3",
    "h4": "h4",
    "ul": "ul",
    "ol": "ol",
    "li": "li",
    "a": "a",
    "blockquote": "blockquote",
    "hr": "hr",
    "code_inline": "code",
    "pre": "pre",
    "table": "table",
    "th": "th",
    "td": "td",
    "img": "img",
    "figure": "figure",
    "figcaption": "figcaption",
    "strong": "strong",
    "em": "em",
    "kbd": "kbd",
}

STYLE_PROPS = [
    # Typography
    "fontFamily",
    "fontSize",
    "fontWeight",
    "fontStyle",
    "lineHeight",
    "letterSpacing",
    "textTransform",
    "textDecorationLine",
    "textUnderlineOffset",
    "textDecorationThickness",
    "fontOpticalSizing",
    "fontKerning",
    "fontFeatureSettings",
    "fontVariationSettings",
    # Color
    "color",
    "backgroundColor",
    # Box / rhythm
    "marginTop",
    "marginBottom",
    "marginLeft",
    "marginRight",
    "paddingTop",
    "paddingBottom",
    "paddingLeft",
    "paddingRight",
    "borderTopWidth",
    "borderRightWidth",
    "borderBottomWidth",
    "borderLeftWidth",
    "borderTopStyle",
    "borderBottomStyle",
    "borderTopColor",
    "borderBottomColor",
    "borderRadius",
    "boxShadow",
    # Layout-ish
    "display",
    "position",
    "maxWidth",
    "width",
    "gap",
    "rowGap",
    "columnGap",
]

ASSET_ATTR_RE = re.compile(r"""(?P<attr>href|src|srcset)=(?P<quote>["'])(?P<value>.*?)(?P=quote)""", re.I | re.S)
CSS_URL_RE = re.compile(r"""url\((?P<quote>["']?)(?P<value>[^"')]+)(?P=quote)\)""", re.I)

MIRROR_ATTRS = {"href", "src"}
MIRROR_EXTS = {
    ".css",
    ".js",
    ".mjs",
    ".woff2",
    ".woff",
    ".ttf",
    ".otf",
    ".eot",
}


SCAN_JS = r"""
(args) => {
  const { contentSelector, targets, styleProps } = args;

  function firstVisible(sel, root) {
    const scope = root || document;
    const els = Array.from(scope.querySelectorAll(sel));
    for (const el of els) {
      const cs = getComputedStyle(el);
      const r = el.getBoundingClientRect();
      if (r.width > 0 && r.height > 0 && cs.visibility !== "hidden" && cs.display !== "none") return el;
    }
    return null;
  }

  const root =
    document.querySelector(contentSelector) ||
    document.querySelector("main") ||
    document.querySelector("article") ||
    document.body;

  const rootRect = root.getBoundingClientRect();

  const p = firstVisible("p", root) || firstVisible("p", document);
  let paragraphWidthPx = null;
  let approxCharsPerLine = null;

  if (p) {
    const pr = p.getBoundingClientRect();
    paragraphWidthPx = pr.width;

    const text = (p.innerText || "").replace(/\s+/g, " ").trim();
    const sample = text.slice(0, 200);
    if (sample.length > 0) {
      const approxCharWidth = pr.width / sample.length;
      if (approxCharWidth > 0) approxCharsPerLine = Math.round(pr.width / approxCharWidth);
    }
  }

  const gutterLeftPx = Math.max(0, rootRect.x);
  const gutterRightPx = Math.max(0, window.innerWidth - (rootRect.x + rootRect.width));

  function stylesFor(el) {
    const cs = getComputedStyle(el);
    const out = {};
    for (const p of styleProps) out[p] = cs[p];
    const r = el.getBoundingClientRect();
    out.__rect = { x: r.x, y: r.y, width: r.width, height: r.height };
    return out;
  }

  const nodes = {};
  nodes.container = { selectorUsed: contentSelector, styles: stylesFor(root) };

  for (const [name, sel] of Object.entries(targets)) {
    if (name === "container") continue;
    const el = firstVisible(sel, root) || firstVisible(sel, document);
    nodes[name] = el ? { selectorUsed: sel, styles: stylesFor(el) } : null;
  }

  return {
    url: location.href,
    viewport: { w: window.innerWidth, h: window.innerHeight },
    measure: {
      containerWidthPx: rootRect.width,
      paragraphWidthPx,
      approxCharsPerLine,
      gutterLeftPx,
      gutterRightPx,
    },
    nodes,
  };
}
"""


def _ensure_dir(p: Path) -> None:
    p.mkdir(parents=True, exist_ok=True)


def _write_json(path: Path, obj) -> None:
    path.write_text(json.dumps(obj, indent=2), encoding="utf-8")


def _fetch_bytes(url: str, timeout: int) -> bytes:
    with urlopen(url, timeout=timeout / 1000) as resp:
        return resp.read()


def _fetch_text(url: str, timeout: int) -> str:
    data = _fetch_bytes(url, timeout)
    return data.decode("utf-8-sig", errors="replace")


def _is_same_origin(a: str, b: str) -> bool:
    pa = urlparse(a)
    pb = urlparse(b)
    return (pa.scheme, pa.netloc) == (pb.scheme, pb.netloc)


def _path_for_url(assets_root: Path, url: str) -> Path:
    parsed = urlparse(url)
    clean_path = parsed.path.lstrip("/") or "index"
    return assets_root / clean_path


def _local_ref_from_url(page_dir: Path, path: Path) -> str:
    return path.relative_to(page_dir).as_posix()


def _should_mirror_url(url: str) -> bool:
    ext = Path(urlparse(url).path).suffix.lower()
    return ext in MIRROR_EXTS


def _download_asset(
    url: str,
    *,
    page_dir: Path,
    assets_root: Path,
    page_url: str,
    timeout: int,
    seen: set[str],
) -> Path | None:
    url, _fragment = urldefrag(url)
    if not url or not _is_same_origin(url, page_url):
        return None

    out_path = _path_for_url(assets_root, url)
    if url in seen:
        return out_path

    seen.add(url)
    _ensure_dir(out_path.parent)
    data = _fetch_bytes(url, timeout)
    out_path.write_bytes(data)

    if out_path.suffix.lower() == ".css":
        css = data.decode("utf-8-sig", errors="replace")
        css = _rewrite_css_urls(
            css,
            css_url=url,
            css_path=out_path,
            page_dir=page_dir,
            assets_root=assets_root,
            page_url=page_url,
            timeout=timeout,
            seen=seen,
        )
        out_path.write_text(css, encoding="utf-8")

    return out_path


def _rewrite_css_urls(
    css: str,
    *,
    css_url: str,
    css_path: Path,
    page_dir: Path,
    assets_root: Path,
    page_url: str,
    timeout: int,
    seen: set[str],
) -> str:
    def repl(m: re.Match) -> str:
        raw = m.group("value").strip()
        if raw.startswith(("data:", "blob:", "#")):
            return m.group(0)

        abs_url = urljoin(css_url, raw)
        if not _should_mirror_url(abs_url) or not _is_same_origin(abs_url, page_url):
            return f"url({abs_url})"

        local_path = _download_asset(
            abs_url,
            page_dir=page_dir,
            assets_root=assets_root,
            page_url=page_url,
            timeout=timeout,
            seen=seen,
        )
        if not local_path:
            return m.group(0)

        rel = os.path.relpath(local_path, css_path.parent).replace(os.sep, "/")
        return f"url({rel})"

    return CSS_URL_RE.sub(repl, css)


def _rewrite_srcset(value: str, base_url: str) -> str:
    parts: list[str] = []
    for item in value.split(","):
        item = item.strip()
        if not item:
            continue
        bits = item.split()
        bits[0] = urljoin(base_url, bits[0])
        parts.append(" ".join(bits))
    return ", ".join(parts)


def _mirror_reference_page(url: str, out_dir: Path, timeout: int) -> Path:
    page_url, fragment = urldefrag(url)
    html = _fetch_text(page_url, timeout)
    page_dir = out_dir / "local-reference"
    assets_root = page_dir
    if page_dir.exists():
        shutil.rmtree(page_dir)
    _ensure_dir(page_dir)

    seen: set[str] = set()

    def repl(m: re.Match) -> str:
        attr = m.group("attr").lower()
        quote = m.group("quote")
        value = m.group("value")

        if attr == "srcset":
            new_value = _rewrite_srcset(value, page_url)
            return f"{attr}={quote}{new_value}{quote}"

        abs_url = urljoin(page_url, value)
        if attr in MIRROR_ATTRS and _should_mirror_url(abs_url) and _is_same_origin(abs_url, page_url):
            local_path = _download_asset(
                abs_url,
                page_dir=page_dir,
                assets_root=assets_root,
                page_url=page_url,
                timeout=timeout,
                seen=seen,
            )
            if local_path:
                return f"{attr}={quote}{_local_ref_from_url(page_dir, local_path)}{quote}"

        if value.startswith("/"):
            return f"{attr}={quote}{urljoin(page_url, value)}{quote}"
        return m.group(0)

    html = ASSET_ATTR_RE.sub(repl, html)
    if fragment:
        html = html.replace(
            "</body>",
            f"<script>if (!location.hash) location.replace(location.href + '#{fragment}');</script></body>",
            1,
        )

    out_html = page_dir / "index.html"
    out_html.write_text(html, encoding="utf-8")
    return out_html


def _pick(nodes: dict, key: str, prop: str, fallback=""):
    try:
        return nodes.get(key, {}).get("styles", {}).get(prop) or fallback
    except Exception:
        return fallback


def _to_tokens(scan: dict) -> dict:
    nodes = scan.get("nodes", {}) or {}
    measure = scan.get("measure", {}) or {}

    return {
        "font_sans": _pick(nodes, "p", "fontFamily"),
        "text_color": _pick(nodes, "p", "color"),
        "bg_color": _pick(nodes, "container", "backgroundColor") or _pick(nodes, "p", "backgroundColor"),
        "text_base": _pick(nodes, "p", "fontSize"),
        "leading_base": _pick(nodes, "p", "lineHeight"),
        "tracking_base": _pick(nodes, "p", "letterSpacing"),
        "h1_size": _pick(nodes, "h1", "fontSize"),
        "h1_leading": _pick(nodes, "h1", "lineHeight"),
        "h1_weight": _pick(nodes, "h1", "fontWeight"),
        "h2_size": _pick(nodes, "h2", "fontSize"),
        "h2_leading": _pick(nodes, "h2", "lineHeight"),
        "h2_weight": _pick(nodes, "h2", "fontWeight"),
        "h3_size": _pick(nodes, "h3", "fontSize"),
        "h3_leading": _pick(nodes, "h3", "lineHeight"),
        "h3_weight": _pick(nodes, "h3", "fontWeight"),
        "link_color": _pick(nodes, "a", "color"),
        "link_decoration": _pick(nodes, "a", "textDecorationLine"),
        "link_underline_offset": _pick(nodes, "a", "textUnderlineOffset"),
        "link_decoration_thickness": _pick(nodes, "a", "textDecorationThickness"),
        "font_mono": _pick(nodes, "code_inline", "fontFamily"),
        "code_bg": _pick(nodes, "code_inline", "backgroundColor"),
        "code_radius": _pick(nodes, "code_inline", "borderRadius"),
        "measure_px": measure.get("paragraphWidthPx"),
        "measure_ch_approx": measure.get("approxCharsPerLine"),
        "container_width_px": measure.get("containerWidthPx"),
        "gutter_left_px": measure.get("gutterLeftPx"),
        "gutter_right_px": measure.get("gutterRightPx"),
    }


def _summarize(scans_by_bp: dict) -> str:
    desktop = scans_by_bp.get("1200") or {}
    lines: list[str] = []
    lines.append("# site-clone-scan report")
    lines.append("")
    lines.append(f"Reference: {desktop.get('url', '')}")
    lines.append("")

    lines.append("## Breakpoints")
    for bp in ["375", "768", "1200"]:
        s = scans_by_bp.get(bp)
        if not s:
            continue
        m = s.get("measure", {}) or {}
        lines.append(f"### {bp}px")
        lines.append(f"- containerWidthPx: {m.get('containerWidthPx')}")
        lines.append(f"- paragraphWidthPx: {m.get('paragraphWidthPx')}")
        lines.append(f"- approxCharsPerLine: {m.get('approxCharsPerLine')}")
        lines.append(f"- gutters (L/R): {m.get('gutterLeftPx')} / {m.get('gutterRightPx')}")
        lines.append("")

    def show(key: str, label: str) -> None:
        node = (desktop.get("nodes") or {}).get(key)
        if not node:
            return
        lines.append(f"## {label} (desktop computed styles)")
        lines.append("```json")
        lines.append(json.dumps(node.get("styles", {}), indent=2))
        lines.append("```")
        lines.append("")

    show("container", "Container")
    show("p", "Paragraph")
    show("h1", "H1")
    show("h2", "H2")
    show("a", "Link")
    show("blockquote", "Blockquote")
    show("code_inline", "Inline code")
    show("pre", "Pre")

    return "\n".join(lines).rstrip() + "\n"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--url", required=True, help="Reference URL to scan")
    ap.add_argument("--out", default="artifacts", help="Output directory (default: artifacts)")
    ap.add_argument(
        "--selector",
        default="main, article, .prose, [role=main], body",
        help="Main content selector (comma-separated)",
    )
    ap.add_argument(
        "--wait",
        default="networkidle",
        choices=["networkidle", "load", "domcontentloaded"],
        help="Navigation wait mode",
    )
    ap.add_argument("--timeout", type=int, default=45_000, help="Navigation timeout in ms")
    ap.add_argument(
        "--mirror-local",
        action="store_true",
        help="Also create a faithful local baseline page with same-origin CSS/fonts/icons/scripts mirrored.",
    )
    args = ap.parse_args()

    out_dir = Path(args.out).resolve()
    ss_dir = out_dir / "screenshots"
    _ensure_dir(out_dir)
    _ensure_dir(ss_dir)

    local_reference: Path | None = None
    if args.mirror_local:
        local_reference = _mirror_reference_page(args.url, out_dir, args.timeout)

    scans: dict[str, dict] = {}
    tokens: dict[str, dict] = {}

    with sync_playwright() as p:
        browser = p.chromium.launch()
        for bp in BREAKPOINTS:
            context = browser.new_context(
                viewport={"width": bp["width"], "height": bp["height"]},
                device_scale_factor=1,
            )
            page = context.new_page()
            page.set_default_navigation_timeout(args.timeout)

            page.goto(args.url, wait_until=args.wait)

            # Screenshot
            shot_path = ss_dir / f"{bp['name']}.png"
            page.screenshot(path=str(shot_path), full_page=True)

            # Scan
            scan = page.evaluate(
                SCAN_JS,
                {
                    "contentSelector": args.selector,
                    "targets": TARGETS,
                    "styleProps": STYLE_PROPS,
                },
            )
            scans[bp["name"]] = scan
            tokens[bp["name"]] = _to_tokens(scan)

            context.close()

        browser.close()

    _write_json(out_dir / "metrics.json", scans)
    _write_json(out_dir / "tokens.json", tokens)
    (out_dir / "report.md").write_text(_summarize(scans), encoding="utf-8")

    print("Wrote:")
    print(f"- {out_dir / 'metrics.json'}")
    print(f"- {out_dir / 'tokens.json'}")
    print(f"- {out_dir / 'report.md'}")
    print(f"- {ss_dir}/(375|768|1200).png")
    if local_reference:
        print(f"- {local_reference}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
