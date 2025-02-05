echo -n "$(tput setaf 5) sourcing ~/.zshrc at$(tput sgr0): "; date

export PATH="$PATH:/Users/zach/.local/bin"  # pipx
export XDG_CONFIG_HOME="$HOME/.config"

source /Users/zach/.config/broot/launcher/bash/br
# eval "$(nodenv init -)"
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
