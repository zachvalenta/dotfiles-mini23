---
description: replicate visual system from a reference site
---

# META

Extract and apply visual patterns from a reference URL.

GOAL: Help iterate through admired sites by first creating a faithful local baseline, then cherry-picking small elements or applying a full-page visual system with evidence.

# INSTRUCTIONS

1. Take URL as argument (required).

2. Ask: "What element do you want to clone?" Options:
   - `header` / `nav`
   - `typography` (fonts, sizes, line-height)
   - `colors` (palette)
   - `blockquotes`
   - `code blocks`
   - `links`
   - `layout` (content width, spacing)
   - `full page` (everything - use sparingly)

3. For `layout` or `full page`, first create a local baseline mirror:
```sh
python /Users/zach/Documents/denv/dotfiles/ai/claude/commands/impl/site_clone.py \
  --url "<URL>" \
  --out /tmp/site-clone-artifacts \
  --mirror-local
```

This produces the normal scan artifacts plus:
- `/tmp/site-clone-artifacts/local-reference/index.html`
- local copies of same-origin CSS, JS, fonts, icons, and CSS-referenced font assets

Open/screenshot the local baseline at the same viewport and hash before applying styles. This catches the failure mode where token extraction is technically right but the implementation misses structure, local fonts, icon fonts, hash landing state, or fixed sidebars.

For narrow elements like `typography`, `colors`, `blockquotes`, `code blocks`, or `links`, the normal scanner is enough:
```sh
python /Users/zach/Documents/denv/dotfiles/ai/claude/commands/impl/site_clone.py \
  --url "<URL>" \
  --out /tmp/site-clone-artifacts
```
This produces:
- `/tmp/site-clone-artifacts/screenshots/{375,768,1200}.png`
- `/tmp/site-clone-artifacts/tokens.json` (design tokens)
- `/tmp/site-clone-artifacts/metrics.json` (full computed styles per element)
- `/tmp/site-clone-artifacts/report.md`

4. Read `tokens.json`, `metrics.json`, `report.md`, and, for layout/full-page work, inspect `local-reference/index.html`.

For layout/full-page work, verify:
   - document structure: nav/header/article/main/sidebar/TOC selectors
   - viewport behavior: desktop/tablet/mobile screenshots
   - local rendering: fonts and icons are actually loaded, not browser fallbacks
   - hash behavior: if the user supplied `#section`, screenshot that state too
   - measured layout: content width, sidebar position/width/top, nav height, gutters

Pull computed values for ONLY the requested element unless the user asked for `full page`.

5. Show the user:
   - Screenshot of reference (read the 1200.png)
   - For layout/full-page work, screenshot of the local baseline mirror
   - Extracted values for the requested element (exact computed px/color/font values)
   - Proposed changes (SCSS + template if needed), translating px back to rem where appropriate

6. Ask: "Apply?" Only modify project files after confirmation.

> If you need to download a font, use brew and version control here: /Users/zach/Documents/denv/logs/brew/fonts

7. Build and screenshot the result for comparison:
```sh
cd /Users/zach/Documents/zv/projects/design/ux/myblog && zola build
```

Prefer comparing against the local baseline mirror, not just the live site. The local baseline is the known-good target because it uses the same fetched content, same assets, and same hash state.

# CONTEXT

* PROJECT: `/Users/zach/Documents/zv/projects/design/ux/myblog`
* SCANNER: `/Users/zach/Documents/denv/dotfiles/ai/claude/commands/impl/site_clone.py`
* SSG: Zola (use `zola build`, `zola serve --port XXXX`)
* STYLES: `sass/styles.scss`
* TEMPLATES: `templates/*.html` (base.html has nav)

# EXAMPLES

EXAMPLE 1: Clone just the header
```
/site-clone https://sethmlarson.dev/
```
User says: "header"
→ Run scanner → read tokens.json
→ See: nav background-color, link color, font-weight, font-size
→ Update `.main-nav` in SCSS + nav links in base.html
→ Result: matching header

EXAMPLE 2: Clone typography
```
/site-clone https://macwright.com/
```
User says: "typography"
→ Run scanner → read tokens.json
→ See: font_sans, text_base (px), leading_base, h1/h2/h3 sizes and weights
→ Translate px → rem (divide by 16), update SCSS variables only
→ Result: matching typography

EXAMPLE 3: Clone blockquotes
```
/site-clone https://danluu.com/
```
User says: "blockquotes"
→ Run scanner → read metrics.json blockquote node
→ See: background-color, border widths/colors, padding values
→ Update just the `blockquote` rule in SCSS
→ Result: matching blockquotes

EXAMPLE 4: Clone layout/full page
```
/site-clone https://gendignoux.com/blog/2026/03/02/swiss-marriage-tax.html#overview-of-the-swiss-tax-system
```
User says: "layout and styles"
→ Run scanner with `--mirror-local`
→ Open `/tmp/site-clone-artifacts/local-reference/index.html#overview-of-the-swiss-tax-system`
→ Confirm local fonts/icons load and the fixed TOC/sidebar matches the live screenshot
→ Extract article padding, content width, nav height, TOC width/top/left, typography, link/code/blockquote styles
→ Apply to project templates and SCSS
→ Screenshot project and compare to the local baseline
