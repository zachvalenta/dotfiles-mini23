echo -n "$(tput setaf 5) sourcing ~/.zshenv at$(tput sgr0): "; date

# HOMEBREW - SET PATH/MANPATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# PYENV
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

###
# 🛣 PATH
###

export PATH="$PATH:/Users/zach/.local/bin"                    # pipx
export PATH="$HOME/Documents/denv/bin:${PATH}"                # my bin
export PATH="$PATH:$HOME/go/bin"                              # golang
. "$HOME/.cargo/env"                                          # cargo
export LLM_USER_PATH="$HOME/.config/llm"                      # llm

###
# 🗂 DIRECTORY VARIABLES
###

# 🖥️ MACHINE-SPECIFIC
DOC_DIR="$HOME/Documents"
DENV_DIR="$DOC_DIR/denv"
DOT_DIR="$DENV_DIR/dotfiles"
# TELESCOPE_WORKSPACE_DIR="$HOME/Documents/telescope-workspace"

# 🙈 ME
ZV_DIR="$HOME/Documents/zv"
MAT_DIR="$ZV_DIR/materials"
DOMAINS_DIR="$ZV_DIR/notes/domains"
SW_DIR="$ZV_DIR/notes/sw"
PER_DIR="$ZV_DIR/personal"
TRACK_DIR="$ZV_DIR/personal/tracking"

# 🟧 KERO
KERO_DIR="$ZV_DIR/work/kero"
KERO_RUSH="$KERO_DIR/src/automation/rush"
KERO_SRC="$KERO_DIR/src"
KERO_AGENTIC="$KERO_DIR/docs/agentic"
KERO_ENG="$KERO_DIR/docs/eng"

###
# 🌐 ENVIRONMENT VARIABLES
###

export EDITOR=vim
export MANPAGER=bat
export HOMEBREW_NO_AUTO_UPDATE=1
export PYTHONDONTWRITEBYTECODE=1
export PYTHONSTARTUP="$DOT_DIR/python/python_startup.py"

# CONFIG PATHS
export RIPGREP_CONFIG_PATH="$DOT_DIR/cli/.ripgreprc"
export ZELLIJ_CONFIG_DIR="~/.config/zellij"
export PLS_CONFIG="$DOT_DIR/shell/pls.yml"

# EZA SETTINGS (used by functions in zshrc)
EZA_IGNORE=".DS_Store|.git|.localized|.venv|*.code-workspace|.ruff_cache"
EZA_TREE_FLAGS=(--icons --tree --no-quotes --no-user --no-time --git-ignore -I "$EZA_IGNORE")
