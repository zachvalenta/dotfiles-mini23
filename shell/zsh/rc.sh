echo -n "$(tput setaf 5) sourcing ~/.zshrc at$(tput sgr0): "; date

export XDG_CONFIG_HOME="$HOME/.config"

###
# 🚀 LOAD MODULES
###

source "$ZSH_CONF_DIR/modules/broot.sh"
source "$ZSH_CONF_DIR/modules/corkboard.sh"
source "$ZSH_CONF_DIR/modules/cursor.sh"
source "$ZSH_CONF_DIR/modules/docker.sh"
source "$ZSH_CONF_DIR/modules/file-list.sh"
source "$ZSH_CONF_DIR/modules/git-aliases.sh"
source "$ZSH_CONF_DIR/modules/just.sh"
# source "$ZSH_CONF_DIR/modules/music.sh"
source "$ZSH_CONF_DIR/modules/nav.sh"
source "$ZSH_CONF_DIR/modules/neovim.sh"
source "$ZSH_CONF_DIR/modules/nvm.sh"
source "$ZSH_CONF_DIR/modules/path.sh"
# source "$ZSH_CONF_DIR/modules/task-warrior.sh"
# source "$ZSH_CONF_DIR/modules/tracking.sh"
source "$ZSH_CONF_DIR/modules/util.sh"
source "$ZSH_CONF_DIR/modules/yazi.sh"

###
# ZA
###

eval "$(oh-my-posh init zsh --config $HOME/Documents/denv/dotfiles/shell/prompt/catty.json)"
[ -s "/Users/zach/.bun/_bun" ] && source "/Users/zach/.bun/_bun" # completions
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"

# in background shell, using sl hangs, which was tripping up Claude Code
# -o interactive -> didn't fix
# alias cd='function cdl(){ builtin cd "$1"; [[ -o interactive ]] && sl;}; cdl'
alias cd='function cdl(){builtin cd "$1"; ls;}; cdl'
