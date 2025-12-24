---
description: refactor notes - taxonomy, connections, and substantive content review
---

# META

Deep refactoring for zjv's notes system. This is the token-intensive command.

GOAL: After loading notes via `/inject-context`, go deeper - read the notes thoroughly and help zjv understand what they know, what they're missing, and what they need to learn.

NOTES LOCATION: `/Users/zach/Documents/zv/notes`
MARKDOWN GUIDELINES: `/Users/zach/Documents/denv/dotfiles/ai/claude/context/markdown.md` (for your own writing)

# INSTRUCTIONS

1. Identify which note files are currently in context (from prior `/inject-context` or manual @ loading).

2. Read the markdown guidelines so you follow zjv's conventions when writing.

3. Dive deep into the loaded notes. Analyze for three categories:

## A. TAXONOMY (filesystem)

Look for:
- Files that have grown too large (should be split)
- Content that belongs in a different file
- Missing files (gaps in coverage)
- Redundant files (should be merged)
- Misplaced files (wrong directory)

## B. CONNECTIONS

Look for:
- Missing 🗄️ cross-references (concepts mentioned but not linked)
- Orphan sections (content that relates to other notes)
- Duplicate content across files (should be consolidated + cross-ref'd)

## C. CONTENT (substantive review)

This is the core of `/rf`. Read the notes and assess:

WHAT YOU KNOW
- Summarize zjv's current understanding based on notes
- Identify areas of depth vs. surface-level coverage
- Note which sources they've engaged with (✅ items)

WHAT YOU SHOULD KNOW
- Gaps: important concepts missing from notes
- Misconceptions: things that seem wrong or outdated
- Outdated info: libraries deprecated, patterns superseded, facts changed
- Incomplete mental models: partial understanding that needs filling in

WHAT YOU NEED TO KNOW
- Priority learning path based on gaps
- Specific resources to fill gaps (books, docs, tutorials)
- Connections to existing knowledge that would help
- Practical next steps

4. Present findings:

```
TAXONOMY PROPOSALS:
[filesystem changes if any]

---

CONNECTION PROPOSALS:
[cross-ref additions if any]

---

CONTENT REVIEW:

## what you know

Your notes show solid grounding in:
- SQL fundamentals (Beaulieu coverage, practical examples)
- Query optimization basics (EXPLAIN, indexes)

Depth in: DML, joins, window functions
Surface-level: DDL, migrations, constraints

## what you should know

GAPS
- Recursive CTEs: mentioned but no examples/explanation
- Materialized views: not covered, useful for your analytics work
- Connection pooling: critical for production, not in notes

MISCONCEPTIONS
- Your note says "indexes always speed up queries" - not true for small tables or high-write workloads
- The section on transactions conflates ACID with isolation levels

OUTDATED
- References to `psycopg2` - consider `psycopg3` or `asyncpg`
- Your Postgres version notes are from v12, now on v16

## what you need to know

PRIORITY PATH
1. Recursive CTEs (builds on your window function knowledge)
2. Materialized views (connects to your analytics.md interests)
3. Connection pooling (PgBouncer, for your Flask/Django work)

RESOURCES
- 📙 Petrov "Database Internals" ch. 4-5 (already in your reading list)
- https://www.postgresql.org/docs/current/queries-with.html
- Your own internals.md has B-tree coverage that connects here

NEXT STEPS
- Add recursive CTE examples to sql.md
- Create section on materialized views
- Cross-ref to internals.md for deeper understanding
```

5. After discussion, help write/edit the notes to fill gaps (following markdown guidelines).

# SCOPE OPTIONS

User can request specific scope:

- `/rf taxonomy` - only filesystem proposals
- `/rf connections` - only cross-reference proposals
- `/rf content` - substantive review (the main event)
- `/rf` (no arg) - all three

# EXAMPLES

EXAMPLE 1: Compiler design
```
User: /inject-context I want to understand compilers better
User: /rf content

WHAT YOU KNOW: lexing/parsing basics, AST concept, Ball's interpreter book
WHAT YOU SHOULD KNOW:
- Gap: no coverage of type checking or semantic analysis
- Gap: code generation is mentioned but not explained
- Misconception: your note conflates parsing and lexing
WHAT YOU NEED TO KNOW:
- Priority: semantic analysis (bridges parsing → codegen)
- Resource: Nystrom's "Crafting Interpreters" (free online)
- Your plt.md has type system notes that connect here
```

EXAMPLE 2: Django auth
```
User: /inject-context Django authentication options
User: /rf

CONTENT REVIEW:
Your django.md covers basic auth but you're missing:
- OAuth/social auth (django-allauth)
- JWT for APIs (djangorestframework-simplejwt)
- Session vs token auth tradeoffs

Your security.md has OAuth notes - should cross-ref.
Your api.md mentions JWT but doesn't connect to Django.
```

# NOTES

- This command is intentionally token-intensive - that's the point
- Be direct about gaps and misconceptions (professional objectivity)
- Connect gaps to existing knowledge where possible
- Prioritize actionable recommendations
- When writing new content, follow markdown.md conventions
