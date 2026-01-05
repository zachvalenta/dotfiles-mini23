---
description: load relevant notes into context using index files
---

# META

Smart context loader for zjv's notes system.

GOAL: Instead of manually using @ or grepping through hundreds of files, use the pre-built index files to quickly identify and load relevant notes.

NOTES LOCATION: `/Users/zach/Documents/zv/notes`
INDEX LOCATION: `/Users/zach/Documents/denv/dotfiles/ai/claude/context/notes`

# INSTRUCTIONS

1. Read the three index files:
   - `context/notes/bookcase.md` (reading lists, literature)
   - `context/notes/domains.md` (non-software knowledge)
   - `context/notes/sw.md` (software/tech)

2. Parse user's query to identify relevant topics. Consider:
   - Explicit mentions (e.g., "SQL" → `sw/design/data/sql.md`)
   - Related concepts (e.g., "database performance" → `sql.md` + `internals.md` + `OLTP.md`)
   - Cross-domain connections (e.g., "site redesign" → `site.md` + `frontend.md` + `design.md`)
   - If in a project directory, check for spec files to understand tech stack

3. Match query against index metadata:
   - TOPICS: High-level themes and subject areas
   - SEARCH: Keywords and terms not in HEADERS
   - HEADERS: Actual section structure and organization of each file

4. Follow RELATED links to pull in connected files.

5. Load the identified note files (aim for 3-7 files, not too many).

6. Report what was loaded:
```
LOADED CONTEXT:
- sw/design/app/site.md (SSGs, layout)
- sw/design/app/frontend.md (HTML/CSS, frameworks)
- domains/art/text/design.md (color, typography)
```

7. Then address the user's actual question/task using the loaded context.

# EXAMPLES

EXAMPLE 1: Tech stack decision
```
User: /inject-context I'm trying to decide on a stack for a new CLI tool
→ Load: sw/design/app/terminal.md, sw/lang/python/pkg.md, sw/lang/golang.md, sw/lang/rust.md
→ Report loaded files
→ Discuss Click vs Typer vs Go vs Rust based on user's notes
```

EXAMPLE 2: Site redesign
```
User: /inject-context I want to redesign my personal site's typography
→ Load: sw/design/app/site.md, sw/design/app/frontend.md, domains/art/text/design.md, domains/art/text/writing.md
→ Report loaded files
→ Pull relevant typography/font notes to inform discussion
```

EXAMPLE 3: Learning a topic
```
User: /inject-context I'm trying to understand distributed consensus
→ Load: sw/design/system/distributed.md, sw/comp-sci/computation.md
→ Report loaded files
→ Use notes + reading list to guide learning path
```

EXAMPLE 4: Cross-domain
```
User: /inject-context I want to analyze my reading habits statistically
→ Load: bookcase/books.md, domains/stem/math/stat.md, sw/design/data/analytics.md
→ Report loaded files
→ Connect bibliography data with stats/analysis approaches
```

# NOTES

- Prefer loading fewer, more relevant files over many tangentially related ones
- Match against TOPICS (themes), SEARCH (keywords), and HEADERS (file structure)
- HEADERS show you the actual organization and sections within each file
- RELATED links help you find connected concepts across domains
- If uncertain, ask user to clarify before loading
