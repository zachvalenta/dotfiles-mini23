# prompt
eval "$(oh-my-posh init zsh --config $HOME/Documents/denv/dotfiles/shell/prompt/catty.json)"
# completions
[ -s "/Users/zach/.bun/_bun" ] && source "/Users/zach/.bun/_bun"
# history
eval "$(atuin init zsh)"
# jump dir
eval "$(zoxide init zsh)"
