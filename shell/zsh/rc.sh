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
source "$ZSH_CONF_DIR/modules/nav.sh"
source "$ZSH_CONF_DIR/modules/nvm.sh"
source "$ZSH_CONF_DIR/modules/path.sh"
# source "$ZSH_CONF_DIR/modules/tracking.sh"
source "$ZSH_CONF_DIR/modules/yazi.sh"

###
# 🎨 INTERACTIVE TOOLS
###

# OH-MY-POSH - prompt
eval "$(oh-my-posh init zsh --config $HOME/Documents/denv/dotfiles/shell/prompt/catty.json)"

# Bun completions
[ -s "/Users/zach/.bun/_bun" ] && source "/Users/zach/.bun/_bun"

# ATUIN - history
eval "$(atuin init zsh)"

# LS_COLORS for eza
# regen cache: rm ~/.cache/vivid-ls-colors && source ~/.zshrc
if [[ ! -f ~/.cache/vivid-ls-colors ]]; then
    mkdir -p ~/.cache
    vivid generate catppuccin-mocha > ~/.cache/vivid-ls-colors
fi
export LS_COLORS="$(cat ~/.cache/vivid-ls-colors)"

# ZOXIDE - smart cd
eval "$(zoxide init zsh)"

###
# 🏔 WORKFLOW
###

alias gr="\cd $PER_DIR/tracking/26; gds"
alias gz="vim $PER_DIR/tracking/26/za.dat; \cd $PER_DIR/tracking; ga; cd -"

function tz(){
    clear;
    YEAR=${1:-26}
    txy $TRACK_DIR/"$YEAR"/weight.csv --x date --y weight \
    --cols 120 --rows 14 \
    --y-min 174 --y-max 182 \
    --x-ticks 5 --y-ticks 6
}

###
# 🎹 MUSIC
###

alias mh="rg -UA 11 'alias mh' $DOT_DIR/shell/zsh/rc.sh"
alias int="rg -UNI '## intervals' -A 15 -B 1 $DOMAINS_DIR/art/music | glow -"
alias hx="clear; rg -A 17 -B 1 '## chords' $DOMAINS_DIR/art/music/theory.md | glow -"
alias yj="rg -UNI '## scales' -A 7 -B 1 $DOMAINS_DIR/art/music | glow -"
alias clef="imgcat $MAT_DIR/music/theory/clef.png"
alias keys="imgcat $MAT_DIR/music/theory/30-keys.jpg; imgcat $MAT_DIR/music/theory/circle-of-fifths.png"
alias modes="rg -UNI '## modes\n' -A 6 -B 1 $DOMAINS_DIR/art/music | glow -"
alias rhy="imgcat $MAT_DIR/music/theory/note-divisions.jpg"

# alias caged="ic $MAT_DIR/music/guitar/scale-systems/caged.png; echo 'https://songnotes.net/tools/fret-monster'"
# alias jt="\cd $MAT_DIR/music/guitar; t 2"
# alias gq="cd $MAT_DIR/music/piano/harrison\ -\ pop/02-applied"
# alias ge="cd $MAT_DIR/art/songwriting"

###
# 🛠 UTILS
###

# AGENTS
alias cc="claude"
alias oa="codex"
alias oc="opencode"

alias jc="clear; jiancha"
alias menu="vim /Users/zach/Documents/zv/cooking/menu-planning.md"
alias fu="clear; rg -UNI 'DAYTIME' -A 100 $PER_DIR/logs/schedule.md | glow -"

# NEOVIM
# alias vc="cd $HOME/.config/nvim/lua/zv"
# alias plug="cd $HOME/.local/share/nvim/plugged"
# alias ws="cd $TELESCOPE_WORKSPACE_DIR; nv"
alias nv="nvim"
alias nnv="NVIM_APPNAME=neo nvim"  # new config    @ ~/.config/neo
alias neo="cd ~/.config/neo; t"

# TASK WARRIOR: tw for urgency, summary for big picture, twt for tree + rn/quan
alias tw="task"
alias rn="task pend"
alias quan="task full"
alias twfr="sqlite3 ~/.task/taskchampion.sqlite3 .dump > $DOT_DIR/task-warrior/db.sql"
alias kbtfr="sqlite3 ~/Library/Application\ Support/kanban-tui/database.db .dump > $DOT_DIR/tui/kanban-tui.sql"

alias bpy="bpython -q"
alias ipy="ipython"
# in background shell, using sl hangs, which was tripping up Claude Code
# -o interactive -> didn't fix
# alias cd='function cdl(){ builtin cd "$1"; [[ -o interactive ]] && sl;}; cdl'
alias cd='function cdl(){builtin cd "$1"; ls;}; cdl'
alias cppath='pwd | pbcopy'
alias ic="imgcat"
alias hq="harlequin"
alias jl="jless -r"
alias ld="lazydocker"
alias lg="lazygit"
alias lh="l | head"
alias j="just"
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias o="open"
alias oo="open ."
alias rm="qing"
alias sqlu="sqlite-utils"
alias v="vimv"
alias vd="visidata"
alias vsc="open -a 'Visual Studio Code'"
alias vsconf="cd $HOME/Library/Application\ Support/Code/User"
alias wy='bash -c "tv text | while read -r line; do code -g \"\$line\"; done"'
alias ytd='yt-dlp -x --audio-format m4a'
alias ytdv='yt-dlp -S "vcodec:h264" --merge-output-format mp4'
alias upzr="source $HOME/.zshrc"
alias zr="vsc $HOME/.zshrc"

function kai(){
    fname="$1.md";
    cwd="$(pwd)";
    touch "$cwd/$fname";
    open "$cwd/$fname";
}
