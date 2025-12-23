# OVERVIEW

LOCATION: `/Users/zach/Documents/zv/notes/sw`

# INDEX

## comp-sci/

```
├── ai/
│   ├── agentic.md
│   │   └── TOPICS: Claude Code, MCP, agents, prompting, vibe coding
│   │   └── SEARCH: Claude, Anthropic, MCP, skills, hooks, CLAUDEMD, Cursor, Amp
│   │   └── RELATED: ml.md, models.md
│   ├── ml.md
│   │   └── TOPICS: machine learning, neural nets, training
│   │   └── SEARCH: scikit, PyTorch, TensorFlow, gradient descent, backprop
│   └── models.md
│       └── TOPICS: LLMs, embeddings, RAG, fine-tuning
│       └── SEARCH: GPT, Claude, Llama, transformer, context window, tokens
├── algos.md
│   └── TOPICS: algorithms, complexity, interview prep
│   └── SEARCH: time complexity, Big O, NP, sorting, graphs, Dijkstra, BFS, DFS
│   └── SEARCH: difflib, flashtext, bm25, LeetCode, Bhargava, Skiena
│   └── RELATED: data-structures.md, lang/python/collections.md
├── compilers.md
│   └── TOPICS: lexers, parsers, AST, code generation
│   └── SEARCH: LLVM, grammar, BNF, interpreter, Ball
│   └── RELATED: lang/plt.md
├── computation.md
│   └── TOPICS: automata, Turing machines, computability
│   └── SEARCH: state machine, halting problem, Church-Turing
├── data-structures.md
│   └── TOPICS: arrays, trees, graphs, hash tables
│   └── SEARCH: linked list, binary tree, heap, trie, B-tree
│   └── RELATED: algos.md, design/data/internals.md
└── security.md
    └── TOPICS: auth, encryption, vulnerabilities
    └── SEARCH: OAuth, JWT, HTTPS, TLS, OWASP, XSS, SQL injection, bcrypt
```

## design/

```
├── app/
│   ├── #meta.md
│   ├── api.md
│   │   └── TOPICS: REST, GraphQL, API design
│   │   └── SEARCH: OpenAPI, Swagger, HATEOAS, versioning, rate limiting
│   ├── django.md
│   │   └── TOPICS: Django framework, ORM, admin
│   │   └── SEARCH: models, views, templates, migrations, DRF, Celery
│   ├── flask.md
│   │   └── TOPICS: Flask framework, blueprints
│   │   └── SEARCH: Werkzeug, Jinja, SQLAlchemy, gunicorn
│   ├── frontend.md
│   │   └── TOPICS: HTML, CSS, JS frameworks, SPA vs MPA
│   │   └── SEARCH: React, Vue, htmx, Alpine, Tailwind, vanilla JS, jQuery
│   │   └── SEARCH: SPA tradeoffs, progressive enhancement, McMaster Carr
│   │   └── RELATED: site.md, domains/art/text/design.md
│   ├── site.md
│   │   └── TOPICS: SSGs, personal sites, blogging, visual design
│   │   └── SEARCH: Zola, Hugo, Jekyll, Pelican, layout, typography
│   │   └── RELATED: frontend.md, domains/art/text/design.md
│   └── terminal.md
│       └── TOPICS: TUI, CLI frameworks
│       └── SEARCH: Click, Typer, Rich, Textual, curses, ANSI
├── architecture/
│   ├── #meta.md
│   ├── design-patterns.md
│   │   └── TOPICS: GoF patterns, SOLID
│   │   └── SEARCH: singleton, factory, observer, strategy, dependency injection
│   ├── domain.md
│   │   └── TOPICS: DDD, bounded contexts, aggregates
│   │   └── SEARCH: Evans, entity, value object, repository, CQRS
│   └── test.md
│       └── TOPICS: testing strategies, TDD, fixtures
│       └── SEARCH: pytest, unittest, mocking, coverage, integration, e2e
├── data/
│   ├── #meta.md
│   ├── analytics.md
│   │   └── TOPICS: data analysis, metrics, dashboards
│   │   └── SEARCH: pandas, DuckDB, metrics, KPIs
│   │   └── RELATED: domains/stem/math/stat.md, dataframes.md
│   ├── BI.md
│   │   └── TOPICS: business intelligence, reporting
│   │   └── SEARCH: Metabase, Superset, Tableau, dashboards
│   ├── dataframes.md
│   │   └── TOPICS: tabular data, pandas, Polars
│   │   └── SEARCH: Polars, pandas, Arrow, lazy evaluation, scan vs read
│   ├── internals.md
│   │   └── TOPICS: database internals, query engines, storage
│   │   └── SEARCH: query optimizer, B-tree, LSM, WAL, MVCC, Petrov
│   │   └── RELATED: data-structures.md, OLTP.md
│   ├── nosql.md
│   │   └── TOPICS: document stores, key-value, graph DBs
│   │   └── SEARCH: MongoDB, Redis, Neo4j, DynamoDB, Cassandra
│   ├── OLAP.md
│   │   └── TOPICS: analytics databases, columnar storage
│   │   └── SEARCH: ClickHouse, Snowflake, BigQuery, star schema, fact table
│   ├── OLTP.md
│   │   └── TOPICS: transactional databases, ACID
│   │   └── SEARCH: Postgres, MySQL, SQLite, transactions, indexes, vacuum
│   │   └── RELATED: sql.md, internals.md
│   ├── orm.md
│   │   └── TOPICS: object-relational mapping
│   │   └── SEARCH: SQLAlchemy, Django ORM, Prisma, N+1, eager loading
│   └── sql.md
│       └── TOPICS: SQL syntax, queries, optimization
│       └── SEARCH: joins, subquery, CTE, window functions, EXPLAIN, Beaulieu
│       └── RELATED: OLTP.md, internals.md
└── system/
    ├── #meta.md
    ├── aws.md
    │   └── TOPICS: AWS services
    │   └── SEARCH: EC2, S3, Lambda, RDS, ECS, IAM, CloudFormation
    ├── cloud.md
    │   └── TOPICS: cloud architecture, IaC
    │   └── SEARCH: Terraform, Pulumi, serverless, multi-cloud
    ├── distributed.md
    │   └── TOPICS: distributed systems, consensus, CAP
    │   └── SEARCH: Raft, Paxos, CRDT, eventual consistency, Lamport, Kleppmann
    │   └── RELATED: computation.md
    ├── infra.md
    │   └── TOPICS: infrastructure, queues, caching
    │   └── SEARCH: Kafka, RabbitMQ, Redis, Celery, nginx, load balancer
    └── telemetry.md
        └── TOPICS: observability, logging, metrics, tracing
        └── SEARCH: Prometheus, Grafana, OpenTelemetry, ELK, Datadog
```

## guts/

```
├── network/
│   ├── application.md
│   │   └── TOPICS: application layer protocols
│   │   └── SEARCH: DNS, SMTP, FTP, WebSocket
│   ├── http.md
│   │   └── TOPICS: HTTP protocol, headers, caching
│   │   └── SEARCH: GET, POST, status codes, CORS, cookies, HTTP/2, HTTP/3
│   ├── link.md
│   │   └── TOPICS: data link layer, ethernet
│   └── tcp-ip.md
│       └── TOPICS: TCP/IP stack, sockets
│       └── SEARCH: TCP, UDP, IP, ports, handshake, congestion
├── operating-systems/
│   ├── containers.md
│   │   └── TOPICS: Docker, container runtimes
│   │   └── SEARCH: Docker, Podman, Colima, containerd, Dockerfile, compose
│   │   └── RELATED: aws.md (ECS), infra.md
│   ├── denv.md
│   │   └── TOPICS: development environment setup
│   │   └── SEARCH: dotfiles, Homebrew, Nix, asdf
│   ├── distros.md
│   │   └── TOPICS: Linux distributions
│   │   └── SEARCH: Ubuntu, Debian, Alpine, Arch, NixOS
│   ├── interfaces.md
│   │   └── TOPICS: shell, terminal emulators
│   │   └── SEARCH: zsh, bash, fish, iTerm, Alacritty, Kitty
│   ├── linux.md
│   │   └── TOPICS: Linux internals, syscalls
│   │   └── SEARCH: kernel, systemd, cgroups, namespaces, procfs
│   ├── threads.md
│   │   └── TOPICS: concurrency, parallelism
│   │   └── SEARCH: threads, processes, GIL, async, multiprocessing, asyncio
│   └── tools.md
│       └── TOPICS: CLI tools, utilities
│       └── SEARCH: grep, sed, awk, jq, fzf, ripgrep
└── protocols/
    ├── edi.md
    │   └── TOPICS: electronic data interchange
    ├── serde.md
    │   └── TOPICS: serialization formats
    │   └── SEARCH: JSON, YAML, TOML, Protobuf, MessagePack, Avro
    └── spec.md
        └── TOPICS: specifications, standards
```

## lang/

```
├── python/
│   ├── collections.md
│   │   └── TOPICS: data structures, built-in types
│   │   └── SEARCH: list, dict, set, tuple, defaultdict, Counter, deque
│   │   └── RELATED: comp-sci/data-structures.md
│   ├── cq.md
│   │   └── TOPICS: code quality, linting, formatting
│   │   └── SEARCH: ruff, black, mypy, flake8, isort, pre-commit
│   ├── feedback.md
│   │   └── TOPICS: debugging, profiling
│   │   └── SEARCH: pdb, ipdb, cProfile, memory_profiler, py-spy
│   ├── logic.md
│   │   └── TOPICS: control flow, exceptions
│   │   └── SEARCH: try/except, match/case, walrus operator
│   ├── obj.md
│   │   └── TOPICS: OOP, classes, metaclasses
│   │   └── SEARCH: dunder, dataclass, property, descriptor, ABC
│   ├── pkg.md
│   │   └── TOPICS: packaging, distribution, environments
│   │   └── SEARCH: pip, Poetry, uv, pyenv, venv, PyPI, pyinstaller
│   │   └── RELATED: linux.md (packaging)
│   ├── runtime.md
│   │   └── TOPICS: CPython internals, memory
│   │   └── SEARCH: GIL, garbage collection, bytecode, dis, importlib
│   └── stdlib.md
│       └── TOPICS: standard library modules
│       └── SEARCH: pathlib, itertools, functools, os, sys, subprocess
├── bash.md
│   └── TOPICS: shell scripting
│   └── SEARCH: variables, loops, conditionals, pipes, redirection
├── c.md
│   └── TOPICS: C programming, memory management
│   └── SEARCH: pointers, malloc, structs, headers
├── golang.md
│   └── TOPICS: Go programming
│   └── SEARCH: goroutines, channels, interfaces, defer
├── lisp.md
│   └── TOPICS: Lisp, Scheme, Clojure
│   └── SEARCH: SICP, macros, homoiconicity
├── plt.md
│   └── TOPICS: programming language theory
│   └── SEARCH: type systems, lambda calculus, semantics
│   └── RELATED: compilers.md, linguistics.md
└── rust.md
    └── TOPICS: Rust programming
    └── SEARCH: ownership, borrowing, lifetimes, cargo
```

## za/

```
├── git.md
│   └── TOPICS: version control, workflows
│   └── SEARCH: rebase, merge, cherry-pick, bisect, reflog, hooks
├── hw.md
│   └── TOPICS: hardware, components
│   └── SEARCH: CPU, RAM, SSD, ARM, M1/M2
├── it.md
│   └── TOPICS: IT operations, sysadmin
├── keyboards.md
│   └── TOPICS: mechanical keyboards, layouts
│   └── SEARCH: QMK, Colemak, split, ergonomic
├── vim.md
│   └── TOPICS: Vim/Neovim, modal editing
│   └── SEARCH: Neovim, LazyVim, Telescope, LSP, motions, registers
│   └── SEARCH: Neil practical vim, buffers, windows
└── work.md
    └── TOPICS: career, workplace
```

# KEY CROSS-REFERENCES

SITE REDESIGN
* `design/app/site.md` → SSGs, Zola, layout
* `design/app/frontend.md` → HTML/CSS, frameworks
* `domains/art/text/design.md` → color, typography

DATA PIPELINE
* `design/data/sql.md` ↔ `design/data/OLTP.md` ↔ `design/data/internals.md`
* `design/data/analytics.md` ↔ `design/data/dataframes.md`
* `domains/stem/math/stat.md` → statistical concepts

PYTHON
* `lang/python/*.md` - split by concern (8 files)
* `design/app/flask.md`, `design/app/django.md` → web frameworks
* `design/architecture/test.md` → pytest

DEVOPS
* `guts/operating-systems/containers.md` → Docker, Colima
* `design/system/infra.md` → queues, caching
* `design/system/aws.md` → cloud services
