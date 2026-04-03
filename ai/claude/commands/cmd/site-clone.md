---
description: replicate visual system from a reference site
---

# META

Extract a specific visual element from a reference URL.

GOAL: Help iterate through visual styles from admired sites, cherry-picking small elements one at a time.

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

3. Run the scanner to extract computed styles and screenshots:
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

4. Read `tokens.json` and `report.md`. Pull computed values for ONLY the requested element.

5. Show the user:
   - Screenshot of reference (read the 1200.png)
   - Extracted values for the requested element (exact computed px/color/font values)
   - Proposed changes (SCSS + template if needed), translating px back to rem where appropriate

6. Ask: "Apply?" Only modify files after confirmation.

> If you need to download a font, use brew and version control here: /Users/zach/Documents/denv/logs/brew/fonts

7. Build and screenshot the result for comparison:
```sh
cd /Users/zach/Documents/zv/projects/design/ux/myblog && zola build
```

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
