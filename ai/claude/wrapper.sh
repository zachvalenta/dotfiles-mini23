#!/usr/bin/env bash
set -euo pipefail

# Claude Code startup wrapper with slash command selection
# Usage: wrapper.sh
#
# Select slash commands via Gum, feed them to claude-code on startup,
# then enter the normal interactive TUI

# Define common Claude Code slash commands (without the leading /)
COMMANDS=(
  "compact"
  "cost"
  "context"
  "model"
  "todos"
  "status"
  "permissions"
  "sandbox"
  "agents"
  "mcp"
  "bashes"
  "memory"
)

# Run gum choose in multi-select mode
SELECTED=$(
  printf '%s\n' "${COMMANDS[@]}" \
  | gum choose \
      --no-limit \
      --height 14 \
      --header "Select startup commands (↑/↓ or j/k, Space/Tab to toggle, Enter to confirm)" \
      --cursor "› " \
      --selected-prefix "[x] " \
      --unselected-prefix "[ ] "
) || {
  # User hit ESC / Ctrl+C - it's ok to start without commands
  SELECTED=""
}

# Send selected commands to claude using expect, then enter interactive TUI
if [ -n "${SELECTED:-}" ]; then
  echo "Starting claude with: $(echo $SELECTED | xargs)"

  # Build expect commands to send each slash command
  SEND_CMDS=$(printf '%s\n' $SELECTED | sed 's/^/\//' | sed 's/.*/send "&\\r"\nsleep 0.3/')

  expect <<EOF
set timeout -1
log_user 1
spawn claude
sleep 1
$SEND_CMDS
interact
EOF
else
  echo "Starting claude..."
  claude
fi
