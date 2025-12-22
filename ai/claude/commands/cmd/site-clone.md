---
description: replicate visual system from a reference site (user)
---

# META

Extract a specific visual element from a reference URL and apply it to myblog.

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

3. Screenshot the reference site (desktop viewport):
```sh
mkdir -p artifacts/screenshots
```
Save to `artifacts/screenshots/reference.png`

4. Extract styles for ONLY the requested element using Playwright's `page.evaluate()`.

5. Show the user:
   - Screenshot of reference
   - Extracted values for that element
   - Proposed changes (SCSS + template if needed)

6. Ask: "Apply?" Only modify after confirmation.

7. Screenshot the result and show comparison.

# MYBLOG CONTEXT

PROJECT: `/Users/zach/Documents/zv/projects/active/sites/myblog`
SSG: Zola (use `zola build`, `zola serve --port XXXX`)
STYLES: `sass/styles.scss`
TEMPLATES: `templates/*.html` (base.html has nav)

# EXAMPLES

EXAMPLE 1: Clone just the header
```
/site-clone https://sethmlarson.dev/
```
User says: "header"
→ Screenshot Seth's site
→ See: black bar, white underlined links, colon separators
→ Update `.main-nav` in SCSS + nav links in base.html
→ Result: matching header

EXAMPLE 2: Clone typography
```
/site-clone https://macwright.com/
```
User says: "typography"
→ Extract: font-family, font-size, line-height from body/headings
→ Update SCSS variables only
→ Result: matching typography

EXAMPLE 3: Clone blockquotes
```
/site-clone https://danluu.com/
```
User says: "blockquotes"
→ Extract: blockquote styles (bg, border, padding)
→ Update just the `blockquote` rule in SCSS
→ Result: matching blockquotes
