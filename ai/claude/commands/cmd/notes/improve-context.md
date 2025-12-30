---
description: improve index files based on notes currently in context
---

# META

Feedback loop for zjv's notes index system.

GOAL: After loading notes via `/inject-context`, use what you learned from reading them to improve the TOPICS/SEARCH/RELATED tags in the index files. This makes future lookups better.

INDEX LOCATION: `/Users/zach/Documents/denv/dotfiles/ai/claude/context/notes`

# INSTRUCTIONS

1. Identify which note files are currently in context (from prior `/inject-context` or manual @ loading).

2. For each loaded note, analyze:
   - Major topics/concepts covered
   - Key terms, tools, authors, libraries mentioned
   - Cross-references (🗄️ links to other notes)
   - Headers and structure

3. Compare against current index entry for that file.

4. Propose improvements:
   - Missing SEARCH terms (important keywords not in index)
   - Missing RELATED links (cross-refs found in note but not in index)
   - Better TOPICS summary (if current one is vague or incomplete)

5. Present changes for approval:
```
PROPOSED INDEX UPDATES:

sw/design/data/sql.md
  SEARCH: + "lateral join", "materialized view", "pg_stat"
  RELATED: + design/data/dataframes.md (mentioned in analytics section)

domains/art/music/theory.md
  SEARCH: + "modal interchange", "tritone substitution"
  TOPICS: update to "harmony, chord progressions, modes, cadence, reharmonization"
```

6. After approval, edit the relevant index file(s):
   - `context/notes/bookcase.md`
   - `context/notes/domains.md`
   - `context/notes/sw.md`

# WHAT TO LOOK FOR

SEARCH TERMS
* Proper nouns: authors (Kleppmann, Beaulieu), tools (DuckDB, pytest), libraries
* Technical terms: specific concepts that someone might search for
* Acronyms: MVCC, CTE, CRDT, GIL
* Chinese terms where present: 汉字, 道德经

RELATED LINKS
* Explicit 🗄️ cross-refs in the note
* Implicit connections (e.g., `stat.md` mentions pandas → relates to `dataframes.md`)
* Cross-domain links (e.g., `philosophy.md` mentions Kahneman → relates to `psychology.md`)

TOPICS
* Should be concise (5-10 words)
* Capture the major themes, not exhaustive list

# EXAMPLES

EXAMPLE 1: After loading sql.md
```
Found in note but missing from index:
- "lateral join" mentioned in advanced joins section
- "pg_stat_statements" in optimization section
- Cross-ref to analytics.md not in RELATED

Propose: add these to SEARCH, add RELATED link
```

EXAMPLE 2: After loading theory.md
```
Found in note but missing from index:
- Entire section on "modal interchange"
- "Tagg" as author reference
- Cross-ref to piano.md for voicings

Propose: add to SEARCH, add RELATED link
```

# NOTES

- Don't add every term - focus on ones likely to be searched
- Keep SEARCH lines reasonable length (wrap to multiple lines if needed)
- Preserve existing terms, only add missing ones
- If a note has no improvements needed, say so
