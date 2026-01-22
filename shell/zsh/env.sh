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

# ZELLIJ WORKAROUND - Zellij doesn't launch login shells, so manually source .zprofile
# Only do this for interactive non-login shells to prevent double-sourcing in login shells
# https://github.com/zellij-org/zellij/issues/1434#issuecomment-2185020449
if [[ ! -o login && -o interactive ]]; then
    source /Users/zach/.zprofile
fi

# OH-MY-POSH
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/multiverse-neon.omp.json)"
# ATUIN
eval "$(atuin init zsh)"
# LS_COLORS FOR EZA
export LS_COLORS="$(vivid generate catppuccin-mocha)"
