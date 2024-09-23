echo -n "$(tput setaf 5) sourcing ~/.zshenv at$(tput sgr0): "; date

# ZELLIG WORKAROUND
source /Users/zach/.zprofile
# OH-MY-POSH
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/multiverse-neon.omp.json)"
# ATUIN
eval "$(atuin init zsh)"
# LS_COLORS FOR EZA
export LS_COLORS="$(vivid generate catppuccin-mocha)"
