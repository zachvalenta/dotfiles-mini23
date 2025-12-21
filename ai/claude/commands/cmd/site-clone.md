---
description: replicate visual system from a reference site
---

# META

Generate and use an evidence bundle from a reference URL to replicate its reading-layout visual system (typography + layout + in-body components) in our codebase.

# INSTRUCTIONS

1. Ask the user for the reference URL ($URL) if not already provided in the conversation.
2. Ask the user what page type they want to match (default: "reading page / prose"): "docs", "blog/article", or "other".
3. Ask the user what the main content root selector should be (default: `main, article, .prose, [role=main], body`).
4. Ask the user what styling approach to use (default: CSS variables):
   - `css-vars` (vanilla CSS vars + `.prose` / `ContentLayout`)
   - `tailwind` (theme tokens + prose wrapper)
5. Ask the user where changes are allowed (dirs/files). If they don't specify, assume a minimal safe surface (new files only + the target page).
6. Generate the evidence bundle by running:

