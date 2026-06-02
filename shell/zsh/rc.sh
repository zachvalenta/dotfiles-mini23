echo -n "$(tput setaf 5) sourcing ~/.zshrc at$(tput sgr0): "; date
carl --year-progress

export XDG_CONFIG_HOME="$HOME/.config"

###
# 🚀 LOAD MODULES
###

source "$ZSH_CONF_DIR/modules/broot.sh"
source "$ZSH_CONF_DIR/modules/corkboard.sh"
source "$ZSH_CONF_DIR/modules/docker.sh"
source "$ZSH_CONF_DIR/modules/file-list.sh"
source "$ZSH_CONF_DIR/modules/git-aliases.sh"
source "$ZSH_CONF_DIR/modules/integrations.sh"
source "$ZSH_CONF_DIR/modules/just.sh"
# source "$ZSH_CONF_DIR/modules/music.sh"
source "$ZSH_CONF_DIR/modules/nav.sh"
source "$ZSH_CONF_DIR/modules/neovim.sh"
source "$ZSH_CONF_DIR/modules/nvm.sh"
source "$ZSH_CONF_DIR/modules/pkgs.sh"
source "$ZSH_CONF_DIR/modules/readline.sh"
# source "$ZSH_CONF_DIR/modules/task-warrior.sh"
# source "$ZSH_CONF_DIR/modules/tracking.sh"
source "$ZSH_CONF_DIR/modules/util.sh"
source "$ZSH_CONF_DIR/modules/yazi.sh"
