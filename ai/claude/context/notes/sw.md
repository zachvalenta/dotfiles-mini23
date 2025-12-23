# OVERVIEW

LOCATION: `/Users/zach/Documents/zv/notes/sw`

PURPOSE
* software engineering knowledge base
* learning progress tracking
* reference/reading lists per topic

# STRUCTURE

```
sw/
├── comp-sci/
│   ├── ai/         # agentic, ml, models
│   ├── algos.md
│   ├── compilers.md
│   ├── computation.md
│   ├── data-structures.md
│   └── security.md
├── design/
│   ├── app/        # api, flask, django, frontend, site, terminal
│   ├── architecture/  # design-patterns, domain, test
│   ├── data/       # sql, nosql, orm, OLTP, OLAP, analytics, BI, dataframes, internals
│   └── system/     # aws, cloud, distributed, infra, telemetry
├── guts/
│   ├── network/    # application, http, link, tcp-ip
│   ├── operating-systems/  # containers, denv, distros, interfaces, linux, threads, tools
│   └── protocols/  # edi, serde, spec
├── lang/
│   ├── python/     # cq, collections, feedback, logic, obj, pkg, runtime, stdlib
│   ├── bash.md
│   ├── c.md
│   ├── golang.md
│   ├── lisp.md
│   ├── plt.md      # programming language theory
│   └── rust.md
└── za/             # git, hw, it, keyboards, vim, work
```

# NOTE FORMAT

Same pattern as domains:

```markdown
# ⛩️

## 参考

🗄️ <cross-refs to other notes>
🔍 <reference sites, Stack Exchange>
📚 <reading list>
📜 <official docs>

## 进步

* _YY_: what I learned/did that year

# <TOPIC SECTIONS>
```

CONVENTIONS
* `🗄️` cross-reference: `🗄️ \`sql.md\` joins`
* `📙` book reference: `📙 Beaulieu [47]`
* `📜` official docs
* `🛠️` tool
* `⭐️` priority item
* `✅` completed/read
* `🎗️` reminder/bookmark
* `🏔️` aspirational/someday
* code blocks with comments for examples

# KEY FILES

For site redesign:
* `design/app/site.md` - SSGs, hosting, content strategy
* `design/app/frontend.md` - HTML/CSS/JS

For Python work:
* `lang/python/*.md` - split by concern (stdlib, pkg, runtime, etc.)

For data work:
* `design/data/sql.md` - DML, DDL, queries
* `design/data/OLTP.md` - transactional databases
* `design/data/analytics.md` - analysis patterns

# USE CASES

When working with sw notes:
* implementing something (find patterns, examples)
* learning new tech (add to 进步, build reading list)
* debugging (find past solutions)
* cross-referencing with domains (e.g., stat.md ↔ analytics.md)
