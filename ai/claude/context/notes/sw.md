# OVERVIEW

LOCATION: `/Users/zach/Documents/zv/notes/sw`

# INDEX

## comp-sci/

```
├── ai/
│   ├── agentic.md
│   │   └── TOPICS: Claude Code, MCP, agents, prompting, vibe coding
│   │   └── SEARCH: Anthropic, CLAUDEMD, Cursor
│   │   └── RELATED: ml.md, models.md
│   │   └── HEADERS: AGENTS (aider, Amp, Codex, Conductor, Crush, Gemini, OpenCode, BYO, extensions, IDE, models), CLAUDE (config: cost control/upgrades/modes/perms/files, slash cmd, hooks, plugins, skills, spec), CONTEXT (taxonomy, file soup, input fmt, ACP, MCP, window, prompting, memories)
│   ├── ml.md
│   │   └── TOPICS: machine learning, neural nets, training
│   │   └── SEARCH: TensorFlow, gradient descent, backprop
│   │   └── HEADERS: ⭕️ CORE, embeddings (repr ++), features (input var), inference (prediction), labels (output var), vectors (repr), 🏛️ CLASSICAL, 🛖 KNN, 📈 linear regression, 🌳 random forest, 🌐 NLP, sentiment analysis, entity recognition, CRFs (Conditional Random Fields), HMM (Hidden Markov Models), SVM, 🧠 NEURAL NETWORKS, deep learning, transformers, tokens, CNNs, RNNs, ☸️ LLMs, evals, train, 🛠️ STDLIB, jax, numpy, pytorch, scikit, scipy, spacy, sympy, 🟨️ ZA, cleanup, winter / overrated
│   └── models.md
│       └── TOPICS: LLMs, embeddings, RAG, fine-tuning
│       └── SEARCH: GPT, Claude, Llama, transformer, context window, tokens
│       └── HEADERS: 🥗 MENU, hardware, ☸️ ChatGPT, 🟫 Claude, 🆇 Grok, 📚 Perplexity, 🌉 Gemini, 🦙 llama, 🖲️ INTERFACES, CLI, 💄 mods, ♎️ llm, GUI, TUI (Elia), 🟨 ZA, audio, img, operationalize, Hugging Face, RAG, search (semantic)
├── algos.md
│   └── TOPICS: algorithms, complexity, interview prep
│   └── SEARCH: time complexity, Big O, NP, sorting, graphs, Dijkstra, BFS, DFS, difflib, flashtext, bm25, LeetCode, Bhargava, Skiena
│   └── RELATED: data-structures.md, lang/python/collections.md
│   └── HEADERS: 🧮 COMPLEXITY, constants, NP, runtimes, 💘 MATCHING, difflib, mask, flashtext, Levenshtein distance, rapidfuzz, thefuzz, 🥇 RANKING, bm25, PageRank, TF-IDF, 🔍 SEARCH, binary, bfs/dfs, engine, ⚔️ STRATEGIES, brute force, dynamic programming, greedy, linear programming, 🦋 TYPES, knapsack problem, PRNG, set covering, sort, 🟨 ZA, recursion, regex
├── compilers.md
│   └── TOPICS: lexers, parsers, AST, code generation
│   └── SEARCH: LLVM, grammar, BNF, interpreter, Ball
│   └── RELATED: lang/plt.md
│   └── HEADERS: 🦠 COMPILE, lex, parse, semantic analysis, AST, IR, LLVM, WASM, backend (code gen), linking, 🔮 RUNTIME, minimal, VMs, ABI, FFI, 🔬 STATIC CODE ANALYSIS, lint (ruff), type check (pyright), symbol index (ctags), semantic analysis (jedi), LSP, 🟨 ZA, output, taxonomy, garbage collection
├── computation.md
│   └── TOPICS: automata, Turing machines, computability
│   └── SEARCH: state machine, halting problem, Church-Turing
│   └── HEADERS: 🪨 FOUNDATIONS, logic gates, information theory, compression, entropy, models, SAT, turing machine, state machine, 🧠 PROCESSORS, ALU, cache, register, ISA, GPU, 💻 HARDWARE, chips, memory, storage, 🌌 PROCESSORS
├── data-structures.md
│   └── TOPICS: arrays, trees, graphs, hash tables
│   └── SEARCH: linked list, binary tree, heap, trie, B-tree
│   └── RELATED: algos.md, design/data/internals.md
└── security.md
    └── TOPICS: auth, encryption, vulnerabilities
    └── SEARCH: OAuth, JWT, HTTPS, TLS, OWASP, XSS, SQL injection, bcrypt
    └── HEADERS: ⚔️ EXPLOITS, file inclusion, SQL injection, XSS, 🧮 CRYPTOGRAPHY, encryption, hashing, 👽 USERS, access control, auth, Auth0, Dex, Kerberos, LDAP, OAuth, better auth, Tinyauth, passwords, ZA, culture, DMZ, privacy
```

## design/

```
├── app/
│   ├── #meta.md
│   ├── api.md
│   │   └── TOPICS: REST, GraphQL, API design
│   │   └── SEARCH: OpenAPI, Swagger, HATEOAS
│   │   └── HEADERS: 🏮 DESIGN, GraphQL, REST, RPC, 📰 SCHEMA, contract testing, JSON:API, JSON Schema, OPEN API, 🟨 ZA, pagination, public, rate limiting, slugs, versioning
│   ├── django.md
│   │   └── TOPICS: Django framework, ORM, admin, auth
│   │   └── SEARCH: models, DRF, Celery, htmx, Vincent, Layman
│   │   └── RELATED: infra.md, architecture/test.md
│   │   └── HEADERS: 🛰️ API, DRF, middleware, serialization, URLs, views, 🔑 AUTH, users, permissions, default, custom, magic links, registration-redux, allauth, ⚙️ CONFIG, deployment, denv, project structure, security, settings, static files, 🍱 DB, admin, DDL, managed, meta, DML, migrations, 💳 LIBS, code quality, debug, money, need for prod, real-time (channels), tasks, TUI, 🟨 ZA, design, governance, templates, signals, testing
│   ├── flask.md
│   │   └── TOPICS: Flask framework, blueprints
│   │   └── SEARCH: Werkzeug, Jinja, gunicorn
│   │   └── HEADERS: STRUCTURE, blog, 🌱 single module, 🌿 n modules, 🍀 pkg, 🗣 Ray, 🗣 Grinberg, sink, ZA, auth, config, context, dev server, Flask SQLAlchemy, libs, REST, routing, templates, testing
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
│       └── HEADERS: 🖱️ CLICK, basic, args, default cmd, 🔣 INPUT, 🚅 bullet, questionary, 📺 TUI, 🦄 Charm, ratatui, Textual, 🟨 ZA, assorted Golang, design, 🍬 gum, 💰 rich, terminal text effects
├── architecture/
│   ├── #meta.md
│   ├── design-patterns.md
│   │   └── TOPICS: GoF patterns, SOLID
│   │   └── SEARCH: dependency injection
│   │   └── HEADERS: 🏭 CREATIONAL, ✅ factory, ✅ builder, singleton, 🦠 STRUCTURAL, adapter (interface), 📍 decorator, 🔍 BEHAVIORAL, command, observer, iterator, 📍 strategy
│   ├── domain.md
│   │   └── TOPICS: DDD, bounded contexts, aggregates
│   │   └── SEARCH: value object, repository, CQRS
│   │   └── HEADERS: 🗺️ STRATEGIC (domain), bounded context, ubiquitous language, DSLs, invariants / rule encapsulation, unit of work, 🛠️ TACTICAL, obj (entity), services, data mapper, repo, 🏗️ IMPL, rf, 🟧 Kero, Evans, Percival, Django
│   └── test.md
│       └── TOPICS: testing strategies, TDD, fixtures
│       └── SEARCH: pytest, unittest, mocking, coverage, integration, e2e
│       └── HEADERS: 🕋 DESIGN, taxonomy, TDD, BDD, 🔬 FORMAL METHODS, constraint modeling, model checking (TLA+), theorem proving, 👾 GENERATIVE, fuzz, mutation, property, 🕳️ INTEGRATION, API, load, browser, db, 🔣 IO, doubles, factories | fixtures, golden file, snapshot
├── data/
│   ├── #meta.md
│   ├── analytics.md
│   │   └── TOPICS: data analysis, metrics, dashboards, EDA
│   │   └── SEARCH: pandas, DuckDB, metrics, KPIs, xsv, xan
│   │   └── RELATED: domains/stem/math/stat.md, dataframes.md, OLAP.md
│   │   └── HEADERS: 💿 DATA, canonical, generate, datasets, pedagogy, regression, seed, 🛠️ TOOLING, EDA (WTFK), entry (dataclerk), spreadsheet (Excel), 💊 xan, ❎ xsv, 💻 GUI, Harlequin, TablePlus, Ultorg, uuuge, 🟦 VISIDATA, ⭐️ config, ⭐️ Mongo loader, attr, DML, records, sheets
│   ├── BI.md
│   │   └── TOPICS: business intelligence, reporting
│   │   └── SEARCH: Metabase, Tableau, dashboards
│   │   └── HEADERS: ⛽️ PLATFORMS, 📼 Datasette, 💄 Great Tables, Holoviz, 🔵 Quarto, 🪶 Superset, 📉 CHARTING, types, further options, asciigraph, fastplotlib, incplot, plotext, plotille, rich, tabulate, termgraph, uniplot, xan, 🥗 GUI, 🎁 datawrapper, 🟩 Great Tables, 🦋 matplotlib, 💶 TradingView
│   ├── dataframes.md
│   │   └── TOPICS: tabular data, pandas, Polars
│   │   └── SEARCH: Arrow, lazy evaluation
│   │   └── HEADERS: ⚙️ DESIGN, 🦢 Ibis, 🐋 Narwhals, 🖥️ TLV, 🐼 PANDAS, DML, IO, 🐻‍❄️ POLARS, read, EDA, joins, predicates, select, write
│   ├── internals.md
│   │   └── TOPICS: database internals, query engines, storage
│   │   └── SEARCH: B-tree, LSM, WAL, MVCC, Petrov
│   │   └── RELATED: data-structures.md, OLTP.md
│   │   └── HEADERS: 🏎️ ENGINES, query, storage, logging, perf, 🛠️ MAINTENANCE, vacuuming, analyze, reindexing, checkpoint, 🔍 INDEXING, basics, data structures, usage, types, 🟨 ZA, async, BYO, connections, 🦠 FoundationDB
│   ├── nosql.md
│   │   └── TOPICS: document stores, key-value, graph DBs
│   │   └── SEARCH: MongoDB, Redis, Neo4j, DynamoDB, Cassandra
│   │   └── HEADERS: 🟩 MONGO, find, aggregation, admin, UI, existing, shell, fix, 🗺️ NON, column store, document, graph, key, time series
│   ├── OLAP.md
│   │   └── TOPICS: analytics databases, columnar storage, data engineering, pipelines
│   │   └── SEARCH: BigQuery, star schema, fact table, Parquet, DBT, ETL, ELT, lakehouse, Kleppmann, Reis
│   │   └── RELATED: infra.md, dataframes.md
│   │   └── HEADERS: 🦆 DUCKDB, CLI, design, lib, ✰ Spark, 🌊 PIPELINE, clean, 🐠 DBT, 🍞 miller, test, reconciliation, 🔍 QUERY ENGINES, ☢️ DataFusion, Graft, ⦊ Presto, 🐰 Trino, 🏭 WAREHOUSE, Bauplan, 🔵 Bemi, 🐿️ Crunchy, 🌕 Clickhouse, 🧱 Databricks, ❄️ Snowflake, 🟪 Materialize, ⛵️ LAKE, DuckLake, pg lake, Hadoop, Hudi, 🧊 Iceberg, mesh, 🟨 ZA, metadata (Datahub)
│   ├── OLTP.md
│   │   └── TOPICS: transactional databases, ACID
│   │   └── SEARCH: transactions, indexes, vacuum
│   │   └── RELATED: sql.md, internals.md
│   │   └── HEADERS: 🐘 POSTGRES, auth, CLI, extensions, internals, psycopg, 🔵 psql, 🟠 pgcli, 🔴 GUI (Mathesar), 🟦 SQLITE, CLI, design, extensions, 🟠 litecli, ⚛️ sqlite-utils, 🌐️ DISTRIBUTED / NEWSQL, 🪳 CockroachDB, 🌐 PlanetScale, 🐯 TigerBeetle, 🟨 ZA, 💿 dbcli, MySQL, Oracle
│   ├── orm.md
│   │   └── TOPICS: object-relational mapping
│   │   └── SEARCH: Django ORM, Prisma, N+1, eager loading
│   │   └── HEADERS: 🟥 SQLAlchemy, alternatives, design, snippets, backrefs, 🟨️ ZA, code gen, design, n+1,  impendence, query builders
│   └── sql.md
│       └── TOPICS: SQL syntax, queries, optimization
│       └── SEARCH: joins, subquery, CTE, window functions, EXPLAIN, Beaulieu
│       └── RELATED: OLTP.md, internals.md
└── system/
└── HEADERS: 🟩 MONGO, find, aggregation, admin, UI, existing, shell, fix, 🗺️ NON, column store, document, graph, key, time series
    ├── #meta.md
    ├── aws.md
    │   └── TOPICS: AWS services
    │   └── SEARCH: EC2, S3, Lambda, RDS, ECS, IAM, CloudFormation
    │   └── HEADERS: 🤖 COMPUTE, containers, EC2, Lambda, 🕸️ NETWORK, Route53, VPC, 🧳️ STORAGE, RDS, S3, 🟨 ZA, certification, IaC, IAM, interfaces, messaging, telemetry
    ├── cloud.md
    │   └── TOPICS: cloud architecture, IaC
    │   └── SEARCH: Terraform, Pulumi, serverless, multi-cloud
    │   └── HEADERS: 🧮 IaC, Ansible, Copilot, Sake, Terraform, 🚢 PaaS, CF, coolify, fly.io, platform.sh, pico, railyway, Python Anywhere, OpenCloud, Supabase, ⭐️ SST, Val Town, 🏡 SELF HOST, Dokploy, Dokku, Kamal, oxide, Piku, Ubicloud, 🟨 ZA, cost control, 🌈 GCP, IaaS, stack native, 🐳 Tailscale
    ├── distributed.md
    │   └── TOPICS: distributed systems, consensus, CAP
    │   └── SEARCH: Raft, Paxos, CRDT, eventual consistency, Lamport, Kleppmann
    │   └── RELATED: computation.md
    │   └── HEADERS: 🤝 CONSENSUS, CRDT, Paxos, Raft, VSR, 🏦 TRANSACTIONS, ACID, CAP theorem, consistency, locks, retry, 🟨 ZA, blockchain, caching / perf, service discovery
    ├── infra.md
    │   └── TOPICS: infrastructure, queues, caching, workflow orchestration
    │   └── SEARCH: Kafka, RabbitMQ, Redis, Celery, nginx, load balancer, Airflow, Dagster, Prefect, Gunicorn, cron, CDN, feature flags, HAProxy
    │   └── RELATED: OLAP.md, django.md
    └── telemetry.md
        └── TOPICS: observability, logging, metrics, tracing
        └── SEARCH: Prometheus, Grafana, OpenTelemetry, ELK, Datadog
        └── HEADERS: 📊 METRICS, bandwidth, latency, perf, throughput, load parameters, ⭕️ factors, 🩻 MONITORING, Beszel, 🐶 Datadog, Grafana, 🪨 Graphite, Honey Badger, HyperDX, 🔥 Logfire, OpenTelemetry, Prometheus, 🟪 Sentry, Side Eye, 🟧 Signoz, 🔭 PROFILING, benchmark, timeit, start here, options, types, 🔬 TRACING, bpf, 🟨 ZA, customer analytics, incidents, Honeycomb, logging, uptime / healthcheck / heartbeat
```

## guts/

```
├── network/
│   ├── application.md
│   │   └── TOPICS: application layer protocols
│   │   └── SEARCH: DNS, FTP, WebSocket
│   │   └── HEADERS: 📖 DNS, packets, records, registrars / servers, 🐶 tooling (doggo), URLs, zones, 📫 EMAIL, clients, delivery, SMTP, 🫸 PUSH, SSE, WebSockets, 🔐 SECURE, file transfer (SFTP), SSH, TLS, OpenSSL, PKI, 🟨 ZA, IRC, NTP
│   ├── http.md
│   │   └── TOPICS: HTTP protocol, headers, caching
│   │   └── SEARCH: GET, POST, HTTP/2, HTTP/3
│   │   └── HEADERS: what happens when, 📇 HEADERS, caching / perf, cookies, connection, CORS, custom, rate limiting, security, tokens, 🔢 STATUS CODES, 🟢 200s, 🔄 300s (redirect), 🙈 400s (client err), 🛑 500s (server err), 🛠️ TOOLING, curl, httpie, http-prompt, 🟨 ZA, methods / verbs
│   ├── link.md
│   │   └── TOPICS: data link layer, ethernet
│   │   └── HEADERS: 🏠 HOME INTERNET, ISP, debug, hardware, speed, config, 🟨️ ZA, data centers, hardware, telephony, transmissions
│   └── tcp-ip.md
│       └── TOPICS: TCP/IP stack, sockets, VPN, firewalls
│       └── SEARCH: TCP, UDP, IP, ports, handshake, congestion, nftables, PF, iptables, packet filter
│       └── HEADERS: 📡 IP, addresses, packet, 🟨️ ZA, UDP, TCP, tooling, VPN, firewall
├── operating-systems/
│   ├── containers.md
│   │   └── TOPICS: Docker, container runtimes
│   │   └── SEARCH: containerd, Dockerfile
│   │   └── RELATED: aws.md (ECS), infra.md
│   │   └── HEADERS: ⛵️ DOCKER, 🟩 cmd, components, compose, data mgmt, Capp, 🛠️ tooling, volumes, 🔬️ INTERNALS, approaches, 🍎 container, 🦙 Colima, 🦭 Podman, engines, Evans, images, 🚢 KUBERNETES, design, util, 🟨 ZA, 🐍 Python, secrets
│   ├── denv.md
│   │   └── TOPICS: development environment setup
│   │   └── SEARCH: Nix, asdf
│   │   └── HEADERS: 🏗️ BUILD SYSTEMS, just, make, poe, task, 📦 PACKAGING, binaries, dependencies, semver, 🍺 Homebrew, constraints, registries, managers, 🧬 Nix, 🟨 ZA, dotfiles, env var, path, profiles, XDG
│   ├── distros.md
│   │   └── TOPICS: Linux distributions
│   │   └── SEARCH: Ubuntu, Debian, Alpine, Arch, NixOS
│   │   └── HEADERS: 🍎 MACOS, apps, bindings, command line tools, provision, rosetta, settings, 🟨 ZA, alternatives, history
│   ├── interfaces.md
│   │   └── TOPICS: shell, terminal emulators
│   │   └── SEARCH: zsh, bash, Alacritty, Kitty
│   │   └── HEADERS: 🖥️ DESKTOP ENVIRONMENT, compositors, managers, launcher / workflows (Raycast), 🐚 SHELL, 🐠 fish, history (atuin), line editor (readline), prompt (oh-my-posh), 🦓 zsh, 🪟️ TERMINAL, color, features, ttys, 👻 ghostty, 🍎 iTerm, 🍃⭐️ Wave, multiplex, prise, 🟩 tmux, tuios, 🧩 Zellij
│   ├── linux.md
│   │   └── TOPICS: Linux internals, syscalls
│   │   └── SEARCH: systemd, cgroups, namespaces, procfs
│   │   └── HEADERS: 🗃️ FILES, descriptors, fs, globbing, links, sockets, 🌊 FLOW, IO, operators, xargs, 🟨 ZA, date/time, exit codes, kernel, man pages, scripts, perms + user/group
│   ├── threads.md
│   │   └── TOPICS: concurrency, parallelism
│   │   └── SEARCH: threads, GIL, asyncio
│   │   └── HEADERS: 🐍 PYTHON, 🖖 CONCURRENCY, async, design, event loops, 🛤️ PARALLEL, goroutines, GIL, multiprocessing, threading, 🧵 PROCESSES, basics, background, creation, segments, traits, problems
│   └── tools.md
│       └── TOPICS: CLI tools, utilities
│       └── SEARCH: grep, sed, awk, jq, fzf, ripgrep
└── protocols/
└── HEADERS: 📄 FILE, diff, find (fd), fuzzy find, 🌸 fzf, 🔭 Telescope, 📺 Television, explorer, 🟦 broot, 🗄️ browsr, 🦆 yazi, jump (zoxide), list, 🪨 eza, 🇲🇦 lla, watchers, 🔬 MONITORING, disk (dust/df), mem/CPU (ps/procs), ports (havn), progress bars (tqdm), psutil, ✏️ TEXT, awk, pager (bat), search (ripgrep), stream edit (sed), string processing, 🟨️ ZA, coreutils, clipboard, trash
    ├── edi.md
    │   └── TOPICS: electronic data interchange
    │   └── HEADERS: 🗺️ ECOSYSTEM, standards bodies, middlemen, constraints, replacement, 🧬 SEGMENTS, semantics, sequence, ☸️ meta, ISA, GS, ST / SE, BCT (purpose), CTT / GE / IEA, 🛰️ info, LIN (ID), G53 (op), DTM (date range), CTB (order quantity), PID (desc), LDT (lead time), CTP (price), G39 (physical characteristics), 🛠️ TOOLING, pyedi, Stedi
    ├── serde.md
    │   └── TOPICS: serialization formats
    │   └── SEARCH: JSON, YAML, TOML, Protobuf, MessagePack, Avro
    └── spec.md
        └── TOPICS: specifications, standards
        └── HEADERS: 🗃️ CONFIG, Cuelang, INI, KDL, TOML, XML, YAML, 📜 DOCUMENTS, Canva, LaTeX, Markdown, PDF, 🪪 ENCODING, semantics, ascii, utf-8, Unicode, prefix codes, 🧮 NUMBERS, binary, hex, 🟨 ZA, identifiers, standards bodies, structure
```

## lang/

```
├── python/
│   ├── collections.md
│   │   └── TOPICS: data structures, built-in types
│   │   └── SEARCH: set, defaultdict, Counter, deque
│   │   └── RELATED: comp-sci/data-structures.md
│   │   └── HEADERS: 🧬 CHARACTERISTICS, hashable, mutable, subscriptable, perf, 🎡 ITERATION, comprehensions, iterables, itertools, generators, 🎰 OPERATIONS, copy, lodash, query, slice, sort, 🦜 TYPES, dict, list, string, tuple
│   ├── cq.md
│   │   └── TOPICS: code quality, linting, formatting
│   │   └── SEARCH: black, mypy, flake8, isort, pre-commit
│   │   └── HEADERS: 🔬 TEST, behave (BDD), coverage, doctest, mocks, pytest, snob, tox, unittest, ward, 🟨 ZA, docstring, lint / fmt (ruff), logging (loguru), stats, style
│   ├── feedback.md
│   │   └── TOPICS: debugging, profiling
│   │   └── SEARCH: pdb, ipdb, cProfile, memory_profiler, py-spy
│   │   └── HEADERS: 🐛 DEBUG, alternatives, AST, inspect, pdb, pudb, 📔 NOTEBOOK, design, hosted, 🟧 Jupyter, 🟩 Marimo, 👾 REPL, features, 🟦 iPython, startup
│   ├── logic.md
│   │   └── TOPICS: control flow, exceptions
│   │   └── SEARCH: try/except, match/case, walrus operator
│   │   └── HEADERS: 🌊 CONTROL FLOW, conditionals, exceptions, matching, operators, try/catch, 🤖 FUNCTIONS, args, functional, inner / closures, lambdas
│   ├── obj.md
│   │   └── TOPICS: OOP, classes, metaclasses
│   │   └── SEARCH: ABC
│   │   └── HEADERS: 🗂 CLASSES, dataclass, dunder, comparison, context mgmt, init, methods, property, ䷤ INHERITANCE, interfaces, mixin, protocol, 🪷 METAPROGRAMMING, getattr rabbit hole, other uses, decorators, descriptor, 🕉 OBJECTS, memory, assignment, packing, intern, symbol table, 🎹 TYPING, 🟦 mypy, 🔺 pydantic
│   ├── pkg.md
│   │   └── TOPICS: packaging, distribution, environments
│   │   └── SEARCH: pip, uv, PyPI, pyinstaller
│   │   └── RELATED: linux.md (packaging)
│   │   └── HEADERS: 📮 DISTRO, executables, publish, registries, 🕰️ HISTORY, PEPs, build backends, distutils, setup, wheel, venv, 📦 MANAGERS, pip, Poetry, pipx, 🟪 UV, diving in, scripts, 2019-2024 workflow, inheritance, migrate, denv, Build Standalone, lzma thing, 🖲️ VERSION MGMT, antipatterns, pyenv, upgrades
│   ├── runtime.md
│   │   └── TOPICS: CPython internals, memory
│   │   └── SEARCH: GIL, garbage collection, bytecode, dis, importlib
│   │   └── HEADERS: 🐍 CPYTHON, alternatives, compilation, JIT, extensions, 🦀 PyO3, 🌐 ECOSYSTEM, contributing, design, usage, governance, 🧱 IMPORTS, pytest choking on Python stupidity, exec, namespaces, project structure, scope, semantics, underscores
│   └── stdlib.md
│       └── TOPICS: standard library modules
│       └── SEARCH: pathlib, itertools, functools, os, sys, subprocess
│       └── HEADERS: 🤖 OS, env, files, pathlib, process exec, 🛰️ SERDE, 🪲 jiter, json, 🍫 Marshmallow, orjson, 🕸️ WEB, HTTP (requests), scraping, server gateway (SGI), 🟨 ZA, datetime, git, math, regex
├── bash.md
│   └── TOPICS: shell scripting
│   └── SEARCH: variables, loops, conditionals, pipes, redirection
│   └── HEADERS: ⑃ CONTROL FLOW, checks, operators, iteration, conditionals, 🟨 ZA, args, design, execution, snippets, variables
├── c.md
│   └── TOPICS: C programming, memory management
│   └── SEARCH: pointers, malloc, structs, headers
│   └── HEADERS: 📝 LANG, compilers, design, stdlib, packaging, 🦑 RELATIVES, 🧱 assembly, ➕ C++, ☕️ Java, ⚡️ Zig, 🟨 ZA, history, projects
├── golang.md
│   └── TOPICS: Go programming
│   └── SEARCH: goroutines, channels, interfaces, defer
│   └── HEADERS: 📝 LANG, collections, design, functions, variables, 📦 PACKAGING, previous writeup, GOPATH is not dead, Python devs have it worse, Golang is contra-consensus on packaging in general, semantics, workspaces, modules, env var, installs, project structure, version mgmt, 📔 STDLIB, web, 🟨 ZA
├── lisp.md
│   └── TOPICS: Lisp, Scheme, Clojure
│   └── SEARCH: SICP, macros, homoiconicity
│   └── HEADERS: 👽 LISPS, 🟩 Clojure, 🟦 Racket, 🦑 RELATIVES, 👾 Elixir, 🐘 Haskell, 🐪 OCaml, 🟨 ZA, language, s expressions
├── plt.md
│   └── TOPICS: programming language theory
│   └── SEARCH: type systems, lambda calculus, semantics
│   └── RELATED: compilers.md, linguistics.md
└── rust.md
    └── TOPICS: Rust programming
    └── SEARCH: ownership, borrowing, lifetimes, cargo
    └── HEADERS: 📝 LANG, borrow checker / ownership, design, 📦 CARGO, stdlib, flowistry, ratatui, 🟨 ZA, project structure, example codebases
```

## za/

```
├── git.md
│   └── TOPICS: version control, workflows
│   └── SEARCH: rebase, merge, cherry-pick, bisect, reflog, hooks
│   └── HEADERS: 🐙 GITHUB, Actions, CLI, Markdown, repos, assessment tool, search, 🔬️ INTERNALS, states, design, db of hashes, 🛠️ TOOLING, ⬆️ GUI (GitUp), 🔻 pager (delta), 🐼 porcelain (lazygit), ⛳️ repo browser (Tig | serie), tracker (jiancha), 🏗️ WORKFLOW, branch, commit, tags, diff, hooks, log, cherry pick, merge, remotes, stash, undo, the past (blame / bisect), workflow, worktrees, 🟨 ZA, config, monorepo, review, server
├── hw.md
│   └── TOPICS: hardware, components
│   └── SEARCH: CPU, RAM, SSD, ARM, M1/M2
│   └── HEADERS: 📋 MANIFEST, mbp14, mini23, 🏭 MANUFACTURERS, 🍎 Apple, 🐧 Linux, 🪟 Windows, 🖥️ MONITORS, aspect ratio, coloration, frames, pixels, specs, models, 🟨️ ZA, cameras, iPad, KVM, mice, phone, screencast
├── it.md
│   └── TOPICS: IT operations, sysadmin
│   └── HEADERS: 🐙 GITHUB, Actions, CLI, Markdown, repos, assessment tool, search, 🔬️ INTERNALS, states, design, db of hashes, 🛠️ TOOLING, ⬆️ GUI (GitUp), 🔻 pager (delta), 🐼 porcelain (lazygit), ⛳️ repo browser (Tig | serie), tracker (jiancha), 🏗️ WORKFLOW, branch, commit, tags, diff, hooks, log, cherry pick, merge, remotes, stash, undo, the past (blame / bisect), workflow, worktrees, 🟨 ZA, config, monorepo, review, server
├── keyboards.md
│   └── TOPICS: mechanical keyboards, layouts
│   └── SEARCH: QMK, Colemak, split, ergonomic
│   └── HEADERS: 🗓️ CURRENT PLAN, layout, prompt, completion, previous, 📐 LAYOUTS, programmable, HRM, mapping, ⌨️ MODELS, BYO, ergo, 🪐 ZSA, 🟨 ZA, dictation, features, keycaps, switches, typing
├── vim.md
│   └── TOPICS: Vim/Neovim, modal editing
│   └── SEARCH: Neovim, LazyVim, Telescope, LSP, motions, registers, Neil practical vim, buffers, windows
└── work.md
    └── TOPICS: career, workplace
    └── HEADERS: 🔮 FUTURES, bioinformatics, embedded / robotics, PLC, video games, 📉 RESUME, ⭐️ portfolio, quality of life, 2025.12.08, doc, experience, languages, core, 🏢 JOB MARKET, career advice, profiles, leads, companies, apply, 🚨 INTERVIEWING, answers, questions, ⛩️ OPEN SOURCE, funding, licenses, 🪐️ INDUSTRY, defining eng, Hacker News, Stack Overflow
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
