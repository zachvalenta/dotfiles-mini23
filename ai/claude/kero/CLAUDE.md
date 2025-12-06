# FILESYSTEM

Available zsh env var:

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

# TICKETS

I have a repo just for tickets. I find this faster than writing everything in Jira.

```sh
├── fmt.md    # template for new tickets
├── next      # things to work on next
├── now       # things I'm working on now
├── wancheng  # things I'm finished working on
```

# DO AND DON'T

* Read the docs before we start.
* Deployment is (almost) never the problem. Do not suggest "check if the code was actually deployed to $ENV".
