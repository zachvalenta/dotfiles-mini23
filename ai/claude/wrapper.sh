#!/usr/bin/env bash
set -euo pipefail

# Simple "config picker" using gum choose only.
# - Multi-select enabled
# - Modal-ish UI via height, header, prefixes
# - Navigation: ↑/↓ or j/k, Space/Tab to (de)select, Enter to confirm.

# 1) Define all possible config options
OPTIONS=(
  debug
  verbose
  color
  ascii
  "dry-run"
  force
  "log-json"
  "log-file"
)

# 2) Run gum choose in multi-select "modal"
#    --no-limit     : allow any number of selections
#    --height 10    : fits nicely, feels like a modal dialog
#    --cursor       : the current-row indicator
#    --selected/unselected-prefix: checkbox-ish UI
SELECTED=$(
  printf '%s\n' "${OPTIONS[@]}" \
  | gum choose \
      --no-limit \
      --height 10 \
      --header "Select config options (↑/↓ or j/k, Space/Tab to toggle, Enter to confirm)" \
      --cursor "› " \
      --selected-prefix "[x] " \
      --unselected-prefix "[ ] "
) || exit 1

# User hit ESC / Ctrl+C
[ -n "${SELECTED:-}" ] || {
  echo "No options selected."
  exit 0
}

# 3) Turn selections into CLI flags, e.g. "debug" -> "--debug"
FLAGS=$(
  printf '%s\n' $SELECTED \
  | sed 's/^/--/' \
  | xargs
)

echo "Running: my-cli $FLAGS"
my-cli $FLAGS
