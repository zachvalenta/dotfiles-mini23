alias jc="clear; jiancha"
alias menu="vim /Users/zach/Documents/zv/materials/art/cooking/menu-planning.md"
# alias fu="clear; cat $PER_DIR/logs/schedule.md | glow -"
# alias fu="clear; rg -A 100 'evening star' $PER_DIR/logs/schedule.md | glow -"
# alias fu="clear; rg -A 100 'dawn path' $PER_DIR/logs/schedule.md | glow -"
alias fu="clear; rg -A 100 'evening' $PER_DIR/logs/schedule.md | glow -"

alias bpy="bpython -q"
alias ipy="ipython"
alias cppath='pwd | pbcopy'
alias ic="imgcat"
alias jl="jless -r"
alias lg="lazygit"
alias lh="l | head"
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias o="open"
alias oo="open ."
alias rm="qing"
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

###
# AGENTS
###

alias cc="claude"
alias oa="codex"
alias oc="opencode"

###
# WORKFLOW
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