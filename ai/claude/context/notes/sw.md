# OVERVIEW

LOCATION: `/Users/zach/Documents/zv/notes/sw`

# INDEX

## design/

```
├── backend/
│   ├── api.md
│   │   └── TOPICS: REST, GraphQL, API design
│   │   └── SEARCH: OpenAPI, Swagger, HATEOAS
│   │   └── HEADERS: 🏮 DESIGN, GraphQL, REST, RPC, 📰 SCHEMA, contract testing, JSON:API, JSON Schema, OPEN API, 🟨 ZA, pagination, public, rate limiting, slugs, versioning
│   ├── django.md
│   │   └── TOPICS: Django framework, ORM, admin, auth
│   │   └── SEARCH: models, DRF, Celery, htmx, Vincent, Layman
│   │   └── RELATED: design/system/middleware.md, design/architecture/test.md
│   │   └── HEADERS: 🛰️ API, DRF, middleware, serialization, URLs, views, 🔑 AUTH, users, permissions, default, custom, magic links, allauth, ⚙️ CONFIG, deployment, denv, project structure, security, settings, static files, 🍱 DB, admin, DDL, managed, meta, DML, migrations, 💳 LIBS, code quality, debug, money, real-time (channels), tasks, 🟨 ZA, design, governance, templates, signals, testing
│   ├── fast-api.md
│   │   └── TOPICS: FastAPI, ASGI, Python web framework
│   │   └── SEARCH: ASGI, SGI, server gateway interface, async web API
│   │   └── RELATED: lang/python/stdlib.md (SGI)
│   └── flask.md
│       └── TOPICS: Flask framework, blueprints
│       └── SEARCH: Werkzeug, Jinja, gunicorn
│       └── HEADERS: STRUCTURE, blog, 🌱 single module, 🌿 n modules, 🍀 pkg, 🗣 Ray, 🗣 Grinberg, ZA, auth, config, context, dev server, Flask SQLAlchemy, libs, REST, routing, templates, testing
├── architecture/
│   ├── code.md
│   │   └── TOPICS: software design principles, refactoring, OOP, functional patterns
│   │   └── SEARCH: SOLID, composition, coupling, cohesion, DI, IoC, MVC, hexagonal architecture, clean code, method chaining
│   │   └── HEADERS: 🖲️ STYLE, Hickey/Lisp/data-driven, functional, object-oriented, method chaining, ⠎ PATTERNS, composition, coupling/cohesion, dependency injection (DI), IoC, plugins, SOLID, 🏗️ REFACTORING, extract, inline, 🟨 ZA, comments
│   ├── design-patterns.md
│   │   └── TOPICS: GoF patterns, SOLID
│   │   └── SEARCH: dependency injection
│   │   └── HEADERS: 🏭 CREATIONAL, ✅ factory, ✅ builder, singleton, 🦠 STRUCTURAL, adapter (interface), 📍 decorator, 🔍 BEHAVIORAL, command, observer, iterator, 📍 strategy
│   ├── domain.md
│   │   └── TOPICS: DDD, bounded contexts, aggregates
│   │   └── SEARCH: value object, repository, CQRS
│   │   └── HEADERS: 🗺️ STRATEGIC (domain), bounded context, ubiquitous language, DSLs, invariants / rule encapsulation, unit of work, 🛠️ TACTICAL, obj (entity), services, data mapper, repo, 🏗️ IMPL, rf, 🟧 Kero, Evans, Percival, Django
│   └── profiling.md
│       └── TOPICS: Python profiling, benchmarking, performance measurement
│       └── SEARCH: cProfile, pyinstrument, memray, py-spy, timeit, sampling profiler, memory profiler, hyperfine, tracemalloc
│       └── RELATED: tools/feedback/debug.md, guts/operating-systems/linux.md
│       └── HEADERS: benchmark, timeit, start here, options (memray), types
├── system/
│   ├── aws.md
│   │   └── TOPICS: AWS services
│   │   └── SEARCH: EC2, S3, Lambda, RDS, ECS, IAM, CloudFormation
│   │   └── HEADERS: 🤖 COMPUTE, containers, EC2, Lambda, 🕸️ NETWORK, Route53, VPC, 🧳️ STORAGE, RDS, S3, 🟨 ZA, certification, IaC, IAM, interfaces, messaging, telemetry
│   ├── caches.md
│   │   └── TOPICS: caching layers, Redis, memcached, in-process cache
│   │   └── SEARCH: diskcache, moka, Redis, memcached, Valkey, Dragonfly, Redka, cache invalidation, TTL, Celery, iredis
│   │   └── RELATED: design/system/distributed.md, guts/network/http.md
│   │   └── HEADERS: diskcache / moke, memcached, Redis
│   ├── deployment.md
│   │   └── TOPICS: CI/CD, IaC, secrets management, containerized deployment
│   │   └── SEARCH: Ansible playbooks, Terraform state, Docker composition, environment variables, Gunicorn, Nginx, feature flags, blue-green deployment, dotenvx
│   │   └── HEADERS: IaC, Ansible, Terraform, Deployment, CICD, denv (dev containers), feature flag, secrets (dotenvx), env var
│   ├── distributed.md
│   │   └── TOPICS: distributed systems, consensus, CAP
│   │   └── SEARCH: Raft, Paxos, CRDT, eventual consistency, Lamport, Kleppmann
│   │   └── RELATED: guts/comp-sci/computation.md
│   │   └── HEADERS: 🤝 CONSENSUS, CRDT, Paxos, Raft, VSR, 🏦 TRANSACTIONS, ACID, CAP theorem, consistency, locks, retry, 🟨 ZA, blockchain, caching / perf, service discovery
│   ├── infra.md
│   │   └── TOPICS: self-hosting, bare-metal deployment, stack-native vs cloud-native
│   │   └── SEARCH: Dokku, Kamal, Piku, Dokploy, Ubicloud, Hetzner, oxide, cost control
│   │   └── HEADERS: 🏡 SELF HOST, stack native, Dokploy, Dokku, Kamal, oxide, Piku, Ubicloud, 🟨 ZA, cost control
│   └── queues.md
│       └── TOPICS: message queues, task queues, event streaming, workflow engines
│       └── SEARCH: RabbitMQ, Kafka, Celery, ARQ, Airflow, Dagster, Prefect, Temporal, pub-sub, AMQP, cron, PGMQ, Nats, n8n
│       └── RELATED: data/analytics/OLAP.md, design/system/distributed.md
│       └── HEADERS: cron, msg (PGMQ), task (DJT, Celery, ARQ), workflow engine (Airflow | zapier), 🐙 EVENT (KAFKA)
└── ux/
    ├── css.md
    │   └── TOPICS: CSS fundamentals, layout, CSS frameworks, responsive design
    │   └── SEARCH: Flexbox, Grid, positioning, selectors, Tailwind, BEM, animations, SASS/SCSS, CSS variables, water.css, pico
    │   └── RELATED: design/ux/html.md, domains/art/text/design.md
    │   └── HEADERS: HOWTO, ZA, Tailwind, FRAMEWORKS, layout, selectors
    ├── frontend.md
    │   └── TOPICS: web frameworks, SPAs vs server-side rendering, hypermedia, progressive enhancement
    │   └── SEARCH: htmx, Alpine, React, Vue, Svelte, Remix, Next.js, Datastar, LiveView, Django integration, SPA tradeoffs
    │   └── RELATED: lang/productive/js.md, design/ux/html.md
    │   └── HEADERS: 🪀 INTERACTIVE, 🐟 alpine, 🪷 jQuery, 🛜 HYPERMEDIA, 🌌 Datastar, 🟦 htmx, 🎮 LiveView, 🛁 SPA, ☢️ React, 🟩 Vue, 🟨 ZA, design, state
    ├── html.md
    │   └── TOPICS: HTML semantics, forms, static site generators, CMS & templating
    │   └── SEARCH: SSG, Zola, Hakyll, Eleventy, Quartz, Hastie, forms, semantic HTML, metadata, RSS, tags, search
    │   └── RELATED: design/ux/css.md, design/ux/frontend.md
    │   └── HEADERS: ELEMENTS, HOWTO, SEMANTICS, FORMS, 🦾 SSG, alternatives, features, ♾️ Hakyll, ◻️ Hastie, 🪴 Quartz, 🔲 Zola, 🟨 ZA, archive
    ├── mobile.md
    │   └── TOPICS: cross-platform app development, mobile frameworks, native app development
    │   └── SEARCH: Tauri, Flutter, React Native, Expo, Kotlin, Apple ID, in-app purchases, app stores, Xamarin
    │   └── HEADERS: Tauri, alternatives, Apple ID, native
    └── terminal.md
        └── TOPICS: TUI, CLI frameworks, terminal aesthetics
        └── SEARCH: Click, Typer, Rich, Textual, Charm, Bubbletea, Ratatui, gum, readline autocomplete, Golang CLI, Rust CLI
        └── HEADERS: 🖱️ CLICK, 🔣 INPUT, 📺 TUI, 🎆 PIZAZZ, 🍬 gum, 💰 rich, terminal text effects, 🟨 ZA, assorted Golang
```

## data/

```
├── analytics/
│   ├── BI.md
│   │   └── TOPICS: business intelligence, reporting, BI platforms
│   │   └── SEARCH: Metabase, Tableau, dashboards, Datasette, Quarto, Superset, Great Tables
│   │   └── HEADERS: ⛽️ PLATFORMS, 📼 Datasette, 💄 Great Tables, Holoviz, 🔵 Quarto, 🪶 Superset, 🥗 GUI, 🎁 datawrapper, 🟩 Great Tables, 🦋 matplotlib, 💶 TradingView
│   ├── charting.md
│   │   └── TOPICS: data visualization, terminal plotting, chart types, Python charting
│   │   └── SEARCH: asciigraph, plotext, termgraph, xan, youplot, uniplot, sparkline, Tufte, line charts, bar charts, histogram, CSV, real-time updates, fastplotlib, incplot, plotille
│   │   └── HEADERS: 📊 TYPES, 🛠️ TOOLS, MAYBE, NO, asciigraph, fastplotlib, incplot, plodder, plotext, plotille, rich, termgraph, uniplot, xan, youplot, 🟧 ZA, semantics
│   ├── dataframes.md
│   │   └── TOPICS: tabular data, pandas, Polars
│   │   └── SEARCH: Arrow, lazy evaluation, Narwhals, Ibis
│   │   └── HEADERS: ⚙️ DESIGN, 🦢 Ibis, 🐋 Narwhals, 🖥️ TLV, 🐼 PANDAS, DML, IO, 🐻‍❄️ POLARS, read, EDA, joins, predicates, select, write
│   ├── OLAP.md
│   │   └── TOPICS: analytics databases, columnar storage, data engineering, pipelines
│   │   └── SEARCH: BigQuery, star schema, fact table, Parquet, DBT, ETL, ELT, lakehouse, Kleppmann, Reis, DuckDB
│   │   └── RELATED: design/system/queues.md, dataframes.md
│   │   └── HEADERS: 🦆 DUCKDB, CLI, design, lib, ✰ Spark, 🌊 PIPELINE, clean, 🐠 DBT, 🍞 miller, test, reconciliation, 🔍 QUERY ENGINES, ☢️ DataFusion, Graft, ⦊ Presto, 🐰 Trino, 🏭 WAREHOUSE, Bauplan, 🔵 Bemi, 🐿️ Crunchy, 🌕 Clickhouse, 🧱 Databricks, ❄️ Snowflake, 🟪 Materialize, ⛵️ LAKE, DuckLake, pg lake, Hadoop, Hudi, 🧊 Iceberg, mesh, 🟨 ZA, metadata (Datahub)
│   └── stat.md
│       └── TOPICS: statistics, data analysis workflow, EDA tooling
│       └── SEARCH: Bayes, regression, p-value, visidata, xan, xsv, Huff, Silver, Nield, sampling, analytics, pandas, EDA
│       └── RELATED: domains/stem/math/stat.md, analytics/BI.md
│       └── HEADERS: 💿 DATA, 🛠️ TOOLING, EDA, 💻 GUI, Harlequin, TablePlus, Ultorg, 🟦 VISIDATA, ⭐️ config, ⭐️ Mongo loader, attr, DML, records, sheets, 💊 xan, ❎ xsv, spreadsheet (Excel)
├── internals/
│   ├── byo.md
│   │   └── TOPICS: build-your-own database, database fundamentals pedagogy
│   │   └── SEARCH: CMU, Pavlo, FoundationDB, layered architecture, simulation testing, py-caskdb, learndb
│   │   └── HEADERS: BYO, 🦠 FoundationDB, async
│   ├── engines.md
│   │   └── TOPICS: query engines, storage engines, database execution internals
│   │   └── SEARCH: Petrov, Kleppmann, query plan, columnar, B-tree, LSM, WAL, MVCC, vacuum, analyze, checkpoint
│   │   └── RELATED: data/transactions/sql.md, guts/comp-sci/data-structures.md
│   │   └── HEADERS: 🏎️ ENGINES, query, storage, logging, perf, 🛠️ MAINTENANCE, vacuuming, analyze, reindexing, checkpoint
│   └── indexing.md
│       └── TOPICS: database indexes, expression indexes, index types
│       └── SEARCH: Winand, partial indexes, expression index, function-based index, B-tree index, covering index
│       └── RELATED: guts/comp-sci/data-structures.md, data/transactions/sql.md
│       └── HEADERS: START HERE, data structures, usage, types
└── transactions/
    ├── nosql.md
    │   └── TOPICS: document stores, key-value, graph DBs
    │   └── SEARCH: MongoDB, Redis, Neo4j, DynamoDB, Cassandra
    │   └── HEADERS: 🟩 MONGO, find, aggregation, admin, UI, existing, shell, fix, 🗺️ NON, column store, document, graph, key, time series
    ├── OLTP.md
    │   └── TOPICS: transactional databases, ACID
    │   └── SEARCH: transactions, indexes, vacuum
    │   └── RELATED: sql.md, internals/
    │   └── HEADERS: 🐘 POSTGRES, auth, CLI, extensions, internals, psycopg, 🔵 psql, 🟠 pgcli, 🔴 GUI (Mathesar), 🟦 SQLITE, CLI, design, extensions, 🟠 litecli, ⚛️ sqlite-utils, 🌐️ DISTRIBUTED / NEWSQL, 🪳 CockroachDB, 🌐 PlanetScale, 🐯 TigerBeetle, 🟨 ZA, 💿 dbcli, MySQL, Oracle
    ├── orm.md
    │   └── TOPICS: object-relational mapping
    │   └── SEARCH: Django ORM, Prisma, N+1, eager loading
    │   └── HEADERS: 🟥 SQLAlchemy, alternatives, design, snippets, backrefs, 🟨️ ZA, code gen, design, n+1, impedance, query builders
    └── sql.md
        └── TOPICS: SQL syntax, queries, optimization
        └── SEARCH: joins, subquery, CTE, window functions, EXPLAIN, Beaulieu
        └── RELATED: transactions/OLTP.md, internals/
```

## guts/

```
├── comp-sci/
│   ├── algos.md
│   │   └── TOPICS: algorithms, complexity, interview prep
│   │   └── SEARCH: time complexity, Big O, NP, sorting, graphs, Dijkstra, BFS, DFS, difflib, flashtext, bm25, LeetCode, Bhargava, Skiena
│   │   └── RELATED: data-structures.md, lang/python/collections.md
│   │   └── HEADERS: 🧮 COMPLEXITY, constants, NP, runtimes, 💘 MATCHING, difflib, mask, flashtext, Levenshtein distance, rapidfuzz, thefuzz, 🥇 RANKING, bm25, PageRank, TF-IDF, 🔍 SEARCH, binary, bfs/dfs, engine, ⚔️ STRATEGIES, brute force, dynamic programming, greedy, linear programming, 🦋 TYPES, knapsack problem, PRNG, set covering, sort, 🟨 ZA, recursion, regex
│   ├── compilers.md
│   │   └── TOPICS: lexers, parsers, AST, code generation
│   │   └── SEARCH: LLVM, grammar, BNF, interpreter, Ball
│   │   └── RELATED: lang/plt.md
│   │   └── HEADERS: 🦠 COMPILE, lex, parse, semantic analysis, AST, IR, LLVM, WASM, backend (code gen), linking, 🔮 RUNTIME, minimal, VMs, ABI, FFI, 🔬 STATIC CODE ANALYSIS, lint (ruff), type check (pyright), symbol index (ctags), semantic analysis (jedi), LSP, 🟨 ZA, output, taxonomy, garbage collection
│   └── data-structures.md
│       └── TOPICS: arrays, trees, graphs, hash tables
│       └── SEARCH: linked list, binary tree, heap, trie, B-tree
│       └── RELATED: algos.md, data/internals/engines.md
├── ml/
│   ├── classical.md
│   │   └── TOPICS: supervised learning, regression, ensemble methods, clustering, recommendation
│   │   └── SEARCH: KNN, k-means, linear regression, logistic regression, random forest, Bayesian, clustering
│   │   └── HEADERS: KNN, linear regression, random forest
│   ├── core.md
│   │   └── TOPICS: ML fundamentals, vectors, embeddings, features, labels, evaluation
│   │   └── SEARCH: vector databases, word embeddings, precision/recall, F1-score, confusion matrix, pgvector, ChromaDB, Pinecone, Word2Vec, GloVe, FastText
│   │   └── HEADERS: embeddings, features, inference, labels, vectors, evaluation
│   ├── history.md
│   │   └── TOPICS: AI evolution, deep learning emergence, ChatGPT discourse, LLM capabilities
│   │   └── SEARCH: Dartmouth Summer Project, Eliza, AGI, AI winters, transformers, DALL-E, hallucination, adversarial examples
│   │   └── HEADERS: from Eliza to LLM, TYPES, winter / overrated, ChatGPT / LLM discourse
│   ├── llms.md
│   │   └── TOPICS: LLM evaluation, training, fine-tuning, context windows, scaling
│   │   └── SEARCH: Braintrust, evals, LoRA, RLHF, transfer learning, synthetic data, Ring Attention, token pricing, legal compliance
│   │   └── HEADERS: evals, train, learn, context window, legal / data
│   ├── neural.md
│   │   └── TOPICS: neural network fundamentals, architectures, transformers, backpropagation
│   │   └── SEARCH: activation functions, weights, backprop, BERT, GPT, T5, attention mechanisms, CNNs, RNNs, deep learning
│   │   └── HEADERS: FUNCTIONS, PROPAGATION, BASICS, TYPES, deep learning, transformers, tokens, CNNs, RNNs
│   ├── nlp.md
│   │   └── TOPICS: text processing, NER, sentiment analysis, sequence tasks
│   │   └── SEARCH: tokenization, stemming, CRFs, HMM, SVM, TF-IDF, bag of words, BLEU, ROUGE, perplexity, spaCy, lemmatization, dependency parsing
│   │   └── HEADERS: tokenization, n-grams, feature engineering, evaluation, entity recognition, text classification, speech recognition, sentiment analysis
│   └── stdlib.md
│       └── TOPICS: Python ML libraries, numerical computing, deep learning frameworks
│       └── SEARCH: Keras, scikit-learn, JAX, NumPy, TensorFlow, PyTorch, SciPy, spaCy, SymPy, automatic differentiation, JIT, GPU acceleration
│       └── HEADERS: jax, scikit, scipy, spacy, sympy, TENSORS (numpy, tensorflow, pytorch)
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
│   ├── bash.md
│   │   └── TOPICS: shell scripting
│   │   └── SEARCH: variables, loops, conditionals, pipes, redirection, set strict mode, test operators
│   │   └── HEADERS: ⑃ CONTROL FLOW, checks, operators, iteration, conditionals, 🟨 ZA, args, design, execution, snippets, variables
│   ├── containers.md
│   │   └── TOPICS: Docker, container runtimes
│   │   └── SEARCH: containerd, Dockerfile
│   │   └── RELATED: design/system/aws.md (ECS), design/system/middleware.md
│   │   └── HEADERS: ⛵️ DOCKER, 🟩 cmd, components, compose, data mgmt, Capp, 🛠️ tooling, volumes, 🔬️ INTERNALS, approaches, 🍎 container, 🦙 Colima, 🦭 Podman, engines, Evans, images, 🚢 KUBERNETES, design, util, 🟨 ZA, 🐍 Python, secrets
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
│   └── threads.md
│       └── TOPICS: concurrency, parallelism
│       └── SEARCH: threads, GIL, asyncio
│       └── HEADERS: 🐍 PYTHON, 🖖 CONCURRENCY, async, design, event loops, 🛤️ PARALLEL, goroutines, GIL, multiprocessing, threading, 🧵 PROCESSES, basics, background, creation, segments, traits, problems
└── protocols/
    ├── edi.md
    │   └── TOPICS: electronic data interchange
    │   └── HEADERS: 🗺️ ECOSYSTEM, standards bodies, middlemen, constraints, replacement, 🧬 SEGMENTS, semantics, sequence, ☸️ meta, ISA, GS, ST / SE, BCT (purpose), CTT / GE / IEA, 🛰️ info, LIN (ID), G53 (op), DTM (date range), CTB (order quantity), PID (desc), LDT (lead time), CTP (price), G39 (physical characteristics), 🛠️ TOOLING, pyedi, Stedi
    └── serde.md
        └── TOPICS: serialization formats
        └── SEARCH: JSON, YAML, TOML, Protobuf, MessagePack, Avro
```

## lang/

```
├── academic/
│   ├── haskell.md
│   │   └── TOPICS: Haskell, lazy evaluation, pure functions, type system
│   │   └── SEARCH: monads, pattern matching, resilience
│   ├── lisp.md
│   │   └── TOPICS: Lisp, Scheme, Clojure, Racket, functional paradigms, metaprogramming
│   │   └── SEARCH: SICP, macros, homoiconicity, s-expressions, prefix notation, code-as-data, Phoenix/LiveView, Elixir processes
│   │   └── HEADERS: 👽 LISPS, 🟩 Clojure, 🟦 Racket, 🦑 RELATIVES, Elm, Scala, 👾 Elixir, 🐘 Haskell, 🐪 OCaml, 🟨 ZA, language, s expressions
│   └── ocaml.md
│       └── TOPICS: OCaml, ML family, pattern matching, transpilation
│       └── SEARCH: F#, serde, Melange, Google Drive FUSE
├── low-level/
│   ├── assembly.md
│   │   └── TOPICS: assembly language, CPU architecture, low-level programming, ARM
│   │   └── SEARCH: x86-64, ARM, intrinsics, HLA, compiler explorer, nand2tetris, machine code, bytecode
│   ├── c.md
│   │   └── TOPICS: C programming, memory management, build tooling
│   │   └── SEARCH: pointers, malloc, structs, headers, undefined behavior, linking, GDB, POSIX, assembly interop, libc, musl
│   │   └── HEADERS: 📝 LANG, compilers, design, stdlib, packaging, 🦑 RELATIVES, 🧱 assembly, ➕ C++, ☕️ Java, ⚡️ Zig, 🟨 ZA, history, projects
│   ├── odin.md
│   │   └── TOPICS: Odin, C replacement, game engines, OS work
│   │   └── SEARCH: FFI, game dev
│   │   └── HEADERS: Odin, DESIGN
│   ├── rust.md
│   │   └── TOPICS: Rust, memory safety, ownership/borrowing, cargo ecosystem
│   │   └── SEARCH: borrow checker, lifetimes, cargo install, ratatui, sqlx, flowistry, Axum
│   │   └── HEADERS: 📝 LANG, borrow checker / ownership, design, 📦 PACKAGING (CARGO), stdlib, ratatui, 🟨 ZA, community, project structure, example codebases
│   └── zig.md
│       └── TOPICS: Zig, C replacement, build system, compile-time computation
│       └── SEARCH: comptime, build tools, Uber, TigerBeetle, TUI apps
├── productive/
│   ├── beam.md
│   │   └── TOPICS: BEAM VM, Gleam, functional programming, distributed systems
│   │   └── SEARCH: Elixir, Erlang VM, statically-typed, concurrency patterns
│   │   └── HEADERS: Gleam
│   ├── golang.md
│   │   └── TOPICS: Go programming, concurrency, systems programming, packaging
│   │   └── SEARCH: goroutines, channels, interfaces, defer, GOPATH, generics, chi, echo, gin, cross-compilation
│   │   └── HEADERS: 📝 LANG, collections, design, functions, variables, 📦 PACKAGING, modules, semantics, workspaces, env var, installs, project structure, version mgmt, 📔 STDLIB, web, 🟨 ZA, CMDS
│   ├── java.md
│   │   └── TOPICS: Java language, JVM architecture, Spring framework, Maven, concurrency
│   │   └── SEARCH: JDK/JRE/JVM, Spring Boot, Hibernate, Maven, classpath, annotations, checked exceptions, beans, dependency injection, Kotlin
│   │   └── HEADERS: Eclipse, Kotlin scripting, HTTP client, dev env, concurrency, exceptions, governance, GUI, imports, primitives, JNDI, testing, PACKAGES, HIBERNATE, JVM, MAVEN, SPRING
│   ├── js.md
│   │   └── TOPICS: JavaScript language, package management, runtimes, browser APIs, performance
│   │   └── SEARCH: Node.js, npm, TypeScript, Deno, Bun, Webpack, tree-shaking, bundling, service workers, fetch, browser storage, dev tools
│   │   └── RELATED: design/ux/frontend.md, lang/productive/ts.md
│   │   └── HEADERS: 🥟 JAVASCRIPT, lang, packaging, MANAGERS, REGISTRIES, runtimes, VERSION MGMT, 📔 STDLIB, internationalization, search, 🟨 ZA, browser, STATE, BROWSERS, perf
│   ├── lua.md
│   │   └── TOPICS: Lua, embedded scripting, Neovim/game engine integration
│   │   └── SEARCH: LuaJIT, metatables, OOP patterns, Fennel, LuaRocks, Redis scripting
│   │   └── HEADERS: 📝 LANG, tables, self, OOP, modules, 📦 PACKAGING, 📔 STDLIB, 🟨 ZA, embedded, usage
│   ├── r.md
│   │   └── TOPICS: R language, statistical computing, Tidyverse, data visualization
│   │   └── SEARCH: CRAN, tidyverse, ggplot2, dplyr, tibble, tidyr, purrr, RStudio, SAS, statistical analysis
│   │   └── RELATED: domains/stem/math/stat.md
│   ├── ruby.md
│   │   └── TOPICS: Ruby language
│   │   └── SEARCH: Ruby Under a Microscope
│   └── ts.md
│       └── TOPICS: TypeScript
│       └── SEARCH: TypeScript handbook, gibbok
├── python/
│   ├── collections.md
│   │   └── TOPICS: data structures, built-in types
│   │   └── SEARCH: set, defaultdict, Counter, deque
│   │   └── RELATED: guts/comp-sci/data-structures.md
│   │   └── HEADERS: 🧬 CHARACTERISTICS, hashable, mutable, subscriptable, perf, 🎡 ITERATION, comprehensions, iterables, itertools, generators, 🎰 OPERATIONS, copy, lodash, query, slice, sort, 🦜 TYPES, dict, list, string, tuple
│   ├── cq.md
│   │   └── TOPICS: code quality, linting, formatting
│   │   └── SEARCH: black, mypy, flake8, isort, pre-commit
│   │   └── HEADERS: 🔬 TEST, behave (BDD), coverage, doctest, mocks, pytest, snob, tox, unittest, ward, 🟨 ZA, docstring, lint / fmt (ruff), logging (loguru), stats, style
│   ├── logic.md
│   │   └── TOPICS: control flow, exceptions
│   │   └── SEARCH: try/except, match/case, walrus operator
│   │   └── HEADERS: 🌊 CONTROL FLOW, conditionals, exceptions, matching, operators, try/catch, 🤖 FUNCTIONS, args, functional, inner / closures, lambdas
│   ├── obj.md
│   │   └── TOPICS: OOP, classes, metaclasses
│   │   └── SEARCH: ABC
│   │   └── HEADERS: 🗂 CLASSES, dataclass, dunder, comparison, context mgmt, init, methods, property, ䷤ INHERITANCE, interfaces, mixin, protocol, 🪷 METAPROGRAMMING, getattr rabbit hole, decorators, descriptor, 🕉 OBJECTS, memory, assignment, packing, intern, symbol table, 🎹 TYPING, 🟦 mypy, 🔺 pydantic
│   ├── pkg.md
│   │   └── TOPICS: packaging, distribution, environments
│   │   └── SEARCH: pip, uv, PyPI, pyinstaller
│   │   └── RELATED: guts/operating-systems/linux.md (packaging)
│   │   └── HEADERS: 📮 DISTRO, executables, publish, registries, 🕰️ HISTORY, PEPs, build backends, distutils, setup, wheel, venv, 📦 MANAGERS, pip, Poetry, pipx, 🟪 UV, diving in, scripts, 2019-2024 workflow, inheritance, migrate, denv, Build Standalone, 🖲️ VERSION MGMT, antipatterns, pyenv, upgrades
│   ├── runtime.md
│   │   └── TOPICS: CPython internals, memory
│   │   └── SEARCH: GIL, garbage collection, bytecode, dis, importlib
│   │   └── HEADERS: 🐍 CPYTHON, alternatives, compilation, JIT, extensions, 🦀 PyO3, 🌐 ECOSYSTEM, contributing, design, usage, governance, 🧱 IMPORTS, pytest choking on Python stupidity, exec, namespaces, project structure, scope, semantics, underscores
│   └── stdlib.md
│       └── TOPICS: standard library modules
│       └── SEARCH: pathlib, itertools, functools, os, sys, subprocess
│       └── HEADERS: 🤖 OS, env, files, pathlib, process exec, 🛰️ SERDE, 🪲 jiter, json, 🍫 Marshmallow, orjson, 🕸️ WEB, HTTP (requests), scraping, server gateway (SGI), 🟨 ZA, datetime, git, math, regex
└── plt.md
    └── TOPICS: programming language theory
    └── SEARCH: type systems, lambda calculus, semantics
    └── RELATED: guts/comp-sci/compilers.md, domains/linguistics.md
```

## tools/

```
├── agentic/
│   ├── agents.md
│   │   └── TOPICS: AI coding agents, model capabilities, agent architecture, editor extensions
│   │   └── SEARCH: Devin, Cursor, Windsurf, Copilot, function calling, multi-agent orchestration, Amp, Codex, Conductor, Crush, OpenCode
│   │   └── RELATED: claude.md, context.md, models.md
│   │   └── HEADERS: AGENTS (overview), Amp, clawbot, Codex, Conductor, Crush, Gemini, OpenCode, BYO (build your own), extensions, IDE (Zed), models, notes
│   ├── claude.md
│   │   └── TOPICS: Claude Code setup & configuration, cost control, plugins & skills, hooks
│   │   └── SEARCH: permissions, settings.json, slash commands, MCP servers, skill invocation, prompt caching, terminal integration, authentication
│   │   └── RELATED: context.md, agents.md
│   │   └── HEADERS: CONTEXT (slash commands, plugins, skills), COST CONTROL (cleanup, setup, math), CONFIG (modes, perms, files), ZA (usage, install), hooks
│   ├── cleanup.md
│   │   └── TOPICS: agentic tools ecosystem, recent Claude Code releases, quality-of-life features
│   │   └── SEARCH: Ralph, Conductor, task automation, LSP support, transcript mode, MCP interoperability, subagents
│   │   └── HEADERS: 2026 RESTART, notes, ZA (cleanup, agents, reqs)
│   ├── context.md
│   │   └── TOPICS: context management, prompt engineering, MCP protocol, file taxonomies, RAG
│   │   └── SEARCH: CLAUDE.md, repomix, MCP servers, structured output, prompt injection, context window, CLAUDEMD
│   │   └── HEADERS: CONTEXT (taxonomy, file soup, input fmt), ACP, MCP, window (SIZE context windows), prompting (SEMANTICS), memories
│   └── models.md
│       └── TOPICS: LLM models & pricing, model selection, local models, cloud providers, benchmarks
│       └── SEARCH: Claude Opus/Sonnet/Haiku, GPT-4o/o1, Gemini, DeepSeek, open-source models, inference, fine-tuning, RAG systems, evaluation
│       └── HEADERS: MENU (SLM, ZA, OPEN/CLOSED), hardware, ChatGPT, Claude, Grok, Perplexity, Gemini, llama, INTERFACES (CLI, mods, llm, GUI, TUI), audio, img, operationalize, Hugging Face, RAG, search
├── feedback/
│   ├── data.md
│   │   └── TOPICS: database GUIs, SQL clients, data entry tools, Visidata
│   │   └── SEARCH: Harlequin, TablePlus, Ultorg, DBeaver, Beekeeper, DataGrip, rainfrog, Visidata, vd, dblab, lazysql
│   │   └── RELATED: data/analytics/stat.md, data/transactions/OLTP.md
│   │   └── HEADERS: 💻 GUI, Harlequin, TablePlus, Ultorg, 🟦 VISIDATA, config, Mongo loader, attr, DML, records, sheets, 🟨 ZA, EDA, entry (dataclerk), spreadsheet (Excel)
│   ├── debug.md
│   │   └── TOPICS: Python debugging, introspection, AST analysis
│   │   └── SEARCH: debuggers, sys.settrace, ipdb, pudb, stack traces, breakpoints, inspect module
│   │   └── HEADERS: INTERNALS/DESIGN, alternatives, IPYTHON, ALTERNATIVES (pdb++, pyrewind, nvim-dap), AST, inspect, pdb, pudb
│   ├── IDE.md
│   │   └── TOPICS: editor comparison, IDE vs text editor, editor design philosophy
│   │   └── SEARCH: VS Code, Zed, Neovim, Helix, JetBrains, PyCharm, Emacs, remote development, Vim emulation, LSP integration
│   │   └── HEADERS: ALTERNATIVES (Emacs, Helix, Jetbrains, Zed), VS Code (features, config, keybindings, negatives, workspaces, installs)
│   ├── neovim.md
│   │   └── TOPICS: Neovim configuration, plugin ecosystem, LSP setup, theming
│   │   └── SEARCH: LazyVim, Mason, Telescope, aerial, treesitter, nvim-cmp, lsp-zero, DAP, Astro
│   │   └── RELATED: vim.md
│   │   └── HEADERS: 2026 RESTART, CONFIG (files/opts/keys, DIY, pre-built, Astro, LazyVim, options, paths, plugins, vimrc, mappings, help), UTILS (highlight, LSP, fold, git, lint, search, fuzzy, viz)
│   ├── notebooks.md
│   │   └── TOPICS: interactive Python environments, notebook alternatives, literate programming
│   │   └── SEARCH: Jupyter, Marimo, IPython, Zed notebooks, Positron, Clerk, WASM-based notebooks, observable
│   │   └── HEADERS: NOTEBOOK ALTERNATIVES, RICH TERMINAL, TAXONOMY, NOTEBOOK (design, hosted, Jupyter, Marimo)
│   ├── repl.md
│   │   └── TOPICS: Python REPL customization, iPython features, interactive development
│   │   └── SEARCH: PYTHONSTARTUP, magic commands, IPython profile, history, reload, object inspection
│   │   └── HEADERS: REPL (features), iPython, startup, MAGIC (commands), STACK TRACES
│   └── vim.md
│       └── TOPICS: Vim fundamentals, motions, operators, text objects, buffers, windows
│       └── SEARCH: text objects, registers, macros, substitute, jumps, marks, clipboard, undo tree, yank/paste, Neil practical vim
│       └── RELATED: neovim.md
│       └── HEADERS: ORG (BARBAR, buffers, tabs/sessions, windows, workspaces), CORE (visual mode, modes, semantics, snippets, substitute), command mode, motions, normal mode, operators, registers
└── za/
    ├── git.md
    │   └── TOPICS: version control, workflows
    │   └── SEARCH: rebase, merge, cherry-pick, bisect, reflog, hooks, worktrees
    │   └── HEADERS: 🐙 GITHUB, Actions, CLI, Markdown, repos, search, 🔬️ INTERNALS, states, design, db of hashes, 🛠️ TOOLING, GUI (GitUp), delta, lazygit, Tig, jiancha, 🏗️ WORKFLOW, branch, commit, tags, diff, hooks, log, cherry pick, merge, remotes, stash, undo, blame / bisect, workflow, worktrees, 🟨 ZA, config, monorepo, review, server
    ├── hw.md
    │   └── TOPICS: hardware, components
    │   └── SEARCH: CPU, RAM, SSD, ARM, M1/M2
    │   └── HEADERS: 📋 MANIFEST, mbp14, mini23, 🏭 MANUFACTURERS, 🍎 Apple, 🐧 Linux, 🪟 Windows, 🖥️ MONITORS, aspect ratio, coloration, frames, pixels, specs, models, 🟨️ ZA, cameras, iPad, KVM, mice, phone, screencast
    ├── it.md
    │   └── TOPICS: IT operations, sysadmin, home lab
    └── keyboards.md
        └── TOPICS: mechanical keyboards, layouts
        └── SEARCH: QMK, Colemak, split, ergonomic
        └── HEADERS: 🗓️ CURRENT PLAN, layout, prompt, completion, previous, 📐 LAYOUTS, programmable, HRM, mapping, ⌨️ MODELS, BYO, ergo, 🪐 ZSA, 🟨 ZA, dictation, features, keycaps, switches, typing
```

## work/

```
├── leads/
│   ├── funnel.md
│   │   └── TOPICS: job search strategy, networking, job boards, application process
│   │   └── SEARCH: HN hiring, remote job boards, LinkedIn recruiter outreach, cover letters, apply timing
│   │   └── HEADERS: leads (boards, network, generation), job market (career advice, profiles, apply, companies, finance)
│   ├── futures.md
│   │   └── TOPICS: alternative career paths, embedded systems, robotics, trades, side income
│   │   └── SEARCH: robotics, drones, FPGA, PLC, CDL, lineman, HVAC, data engineering freelance, tech writing
│   │   └── HEADERS: IRL (PLC, embedded, robotics, drones), backup (law, manufacturing, CDL, lineman, trades), side (data eng freelance, tech writing, property management)
│   ├── industry.md
│   │   └── TOPICS: software industry dynamics, career paths, open source ecosystems, licensing
│   │   └── SEARCH: startup culture, technical debt, freelance consulting, maintainer economics, GPL, MIT, AGPL
│   │   └── HEADERS: Industry (defining eng, HN, Stack Overflow, Open Source), funding, licenses
│   └── site.md
│       └── TOPICS: personal branding, content strategy, technical writing, portfolio
│       └── SEARCH: blog platforms, RSS syndication, book reviews, Manim, animation, technical writing samples
├── mianshi/
│   ├── ai.md
│   ├── api.md
│   │   └── TOPICS: API interview questions, REST, rate limiting, async
│   │   └── SEARCH: REST design, rate limiting, exponential backoff, async vs sync, tenacity
│   ├── architecture.md
│   ├── behavioral.md
│   ├── data.md
│   │   └── TOPICS: data engineering interview questions
│   ├── ds.md
│   ├── guts.md
│   │   └── TOPICS: systems/infra interview questions, containers, Kubernetes, load balancers
│   │   └── SEARCH: Docker, Pod, Kubernetes, Helm, Terraform, load balancer
│   ├── languages.md
│   ├── perf.md
│   │   └── TOPICS: performance optimization, high-performance code
│   │   └── SEARCH: ByteByteGo, performance engineering, optimization techniques
│   └── system-design.md
│       └── TOPICS: distributed systems architecture, scalability, system design interview prep
│       └── SEARCH: CAP theorem, eventual consistency, sharding, replication, circuit breakers, rate limiting
└── repr/
    ├── cv.md
    │   └── TOPICS: professional experience, technical skills, career timeline
    │   └── SEARCH: Python, Django, Flask, FastAPI, Vue, React, AWS, Terraform, Docker, Polars, DuckDB, work history
    │   └── HEADERS: ME (profile, skills, open source, experience timeline), Kero Sports, Capp, United Masters, Eliassen, JP Morgan, doc
    ├── phone-screen.md
    ├── portfolio.md
    └── stack.md
        └── TOPICS: technology stack preferences, learning roadmap, core competencies
        └── SEARCH: Python, Golang, Rust, Django, FastAPI, SQLite, Postgres, DuckDB, Neovim, Zellij, Polars
        └── HEADERS: core (OLAP, backend, frontend), STACK (sys design, languages, frameworks, infra, data), denv (agentic tools, editor stack)
```

# KEY CROSS-REFERENCES

SITE / UX
* `design/ux/html.md` → SSGs, Zola, Hakyll, semantic HTML
* `design/ux/css.md` → CSS layout, Tailwind, selectors
* `design/ux/frontend.md` → htmx, React, Vue, Alpine, hypermedia
* `lang/productive/js.md` → JS language, Node, Bun, runtimes
* `design/ux/mobile.md` → Tauri, React Native, Flutter
* `domains/art/text/design.md` → color, typography theory

DATA PIPELINE
* `data/transactions/sql.md` ↔ `data/transactions/OLTP.md` ↔ `data/internals/`
* `data/analytics/stat.md` ↔ `data/analytics/dataframes.md`
* `data/analytics/OLAP.md` → warehouses, DuckDB, DBT
* `domains/stem/math/stat.md` → statistical concepts

PYTHON
* `lang/python/*.md` - split by concern (7 files)
* `design/backend/flask.md`, `design/backend/django.md`, `design/backend/fast-api.md` → web frameworks
* `design/architecture/profiling.md` → benchmarking, profiling
* `tools/feedback/debug.md`, `tools/feedback/notebooks.md`, `tools/feedback/repl.md` → dev workflow

ML / AI
* `guts/ml/core.md` → vectors, embeddings, evaluation
* `guts/ml/classical.md` → KNN, regression, random forest
* `guts/ml/neural.md` → networks, transformers, backprop
* `guts/ml/llms.md` → fine-tuning, evals, context windows
* `guts/ml/nlp.md` → text processing, NER, spaCy
* `guts/ml/stdlib.md` → JAX, PyTorch, scikit, scipy

AGENTIC / AI
* `tools/agentic/agents.md` → agent landscape, Amp, Codex, Cursor
* `tools/agentic/claude.md` → Claude Code config, hooks, skills
* `tools/agentic/context.md` → MCP, prompting, context window
* `tools/agentic/models.md` → model selection, pricing, RAG

DEVOPS / INFRA
* `design/system/deployment.md` → CI/CD, IaC, secrets
* `design/system/queues.md` → message queues, Kafka, Celery, workflow engines
* `design/system/caches.md` → Redis, memcached, diskcache
* `design/system/infra.md` → self-hosting (Kamal, Dokku, Piku)
* `guts/operating-systems/containers.md` → Docker, Colima

EDITORS
* `tools/feedback/vim.md` → Vim fundamentals
* `tools/feedback/neovim.md` → Neovim config, plugins
* `tools/feedback/IDE.md` → VS Code, Zed, Helix comparison
