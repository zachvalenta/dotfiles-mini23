# FILESYSTEM

## dir

Here's how I have everything organized for work.

```sh
 .
├──  denv  # creds, sims, VPN; not a place you should ever have to look
│   ├──  accounts.md
│   ├──  backend.env
│   ├──  bookmarks_11_24_25.html
│   ├──  db
│   ├──  docker-compose.yaml
│   ├──  sims
│   └── 󱁻 zjv-mini23-wireguard.conf
├──  docs
│   ├──  agentic  # slash commands for Claude Code
│   ├──  eng      # notes
│   ├──  tickets  # repo for Jira tickets; I find this faster than writing everything in Jira + this company doesn't really care about Jira, everything happens on Telegram
│   └──  worklogs # logs of what I worked on by day/week
└── 󰣞 src  # codebase
    ├──  automation
    ├──  messaging
    └──  pricing
```

Here's the main zsh env var that go along with this:

```sh
# every work repo that I have cloned on my machine, organized by vertical
KERO_SRC="$KERO_DIR/src"

# main repo I'm working on
KERO_RUSH="$KERO_DIR/src/automation/rush"

# source for Claude's slash commands
KERO_AGENTIC="$KERO_DIR/docs/agentic"

# my docs on KERO_RUSH
KERO_ENG="$KERO_DIR/docs/eng"
```

## codebase

This is *my* organization of the various repos in our BitBucket org on my machine. There is no one place I can look in the company to verify how all this hangs together. This is just *my* first impression.

```sh
$ ks

├──  automation
│   ├──  automation_market
│   ├──  automation_pricing_formation
│   ├──  automation_resolve
│   ├──  rush  # I primarily work here, on basketball (basketball_betradar) and soccer (soccer_opta, soccer_rmg)
│   ├──  rush-event-stat
│   └──  rush-stat-receiver
├──  messaging
│   ├──  api-partner-bet-mq-processing
│   ├──  betradar-monitor
│   ├──  cron-jobs
│   ├──  kero-feed-sdk-java
│   ├──  kero-simulations
│   ├──  market-creating-service
│   ├──  market-publisher
│   ├──  optic-stat
│   ├──  parlay-service
│   ├──  partner-bet-mapping
│   ├──  partner-bet-processing
│   ├──  props-market-abelson
│   ├──  props-market-optic-odds
│   ├──  sportradar-service
│   └──  stat_saver
└──  pricing
    ├──  andres-metabase-dashboard
    ├──  api_gateway
    ├──  baseball
    ├──  basketball
    ├──  basketball-ncaa
    ├──  data_manipulating
    ├──  hockey
    ├──  mlops-service
    ├──  model_research
    ├──  pricing_package
    └──  sports-variations
```

# DO AND DON'T

* Read the docs before we start.
* Deployment is (almost) never the problem. Do not suggest "check if the code was actually deployed to $ENV".
