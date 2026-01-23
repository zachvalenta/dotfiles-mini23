echo -n "$(tput setaf 5) sourcing ~/.zshrc at$(tput sgr0): "; date

###
# 🌐 ENVIRONMENT
###

export XDG_CONFIG_HOME="$HOME/.config"

###
# 🎨 INTERACTIVE TOOLS
###

# OH-MY-POSH - prompt
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/multiverse-neon.omp.json)"

# ATUIN - history
eval "$(atuin init zsh)"

# LS_COLORS - colors for eza
export LS_COLORS="$(vivid generate catppuccin-mocha)"

# BROOT - file navigator
source /Users/zach/.config/broot/launcher/bash/br

# ZOXIDE - smart cd
eval "$(zoxide init zsh)"

# NVM - node version manager
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# NODENV (commented out)
# eval "$(nodenv init -)"
