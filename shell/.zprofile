###
# 🗂 FS
###

# MACHINE-SPECIFIC
DOC_DIR="$HOME/Documents"
DENV_DIR="$DOC_DIR/denv"
DOT_DIR="$DENV_DIR/dotfiles"
# TELESCOPE_WORKSPACE_DIR="$HOME/Documents/telescope-workspace"

# ME
ZV_DIR="$HOME/Documents/zv"
MAT_DIR="$ZV_DIR/materials"
DOMAINS_DIR="$ZV_DIR/notes/domains"
SW_DIR="$ZV_DIR/notes/sw"
PER_DIR="$ZV_DIR/personal"
TRACK_DIR="$ZV_DIR/personal/tracking"
KB_REGEX_NOW="## now\n\n[\w|\*]"
KB_REGEX_NEXT="## next\n\n[\w|\*]"

###
# 🌇  PROFILE
###

echo -n "$(tput setaf 5) updating ~/.zprofile at$(tput sgr0): "; date
set -o emacs
alias zp="vsc $HOME/.zprofile"
alias upzp="source $HOME/.zprofile"
export MANPAGER=bat
export EDITOR=vim
export PYTHONDONTWRITEBYTECODE=1
export CLICOLOR=1
export EXA_COLORS="ga=38;5;213:gm=32:*.py=38;5;114:Dockerfile=38;5;074;1:docker-compose.*=38;5;074;1:*.pdf=38;5;208:*.txt=38;5;244:*.html=38;5;137;1:*.env*=31;0;01:*.sql*=38;5;28"
export LSCOLORS=gxfxcxdxbxegedabaggagx
export RIPGREP_CONFIG_PATH="$DOT_DIR/cli/.ripgreprc"
export EXA_IGNORE=".git|.DS_Store|.localized"

# POWERLINE-SHELL
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}
function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}
if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

###
# 🏔 WORKFLOW
# 🎵 Mary https://www.youtube.com/watch?v=gIH-Yptxf54 Tyler https://www.youtube.com/watch?v=o7PEnj-8NHw
# 💃🏻 Bouboo https://www.youtube.com/watch?v=uz-SYAY-cfg Tony https://www.youtube.com/watch?v=ukHvM6npEOw
# ⛸ Sparkles https://www.youtube.com/watch?v=sO8k77AxxXA
###

alias wf="clear; rg 'WF' $HOME/.zprofile -A3 -B8"
alias sch="clear; bat $PER_DIR/people/schedule.md"
alias kb="clear; rg -UA 1 '$KB_REGEX_NOW' $DOMAINS_DIR; rg -UA 1 '$KB_REGEX_NOW' $SW_DIR; rg -UA 1 '$KB_REGEX_NOW' $PER_DIR/people"

alias kbn="clear; rg -UA 2 '$KB_REGEX_NEXT' $DOMAINS_DIR; rg -UA 1 '$KB_REGEX_NEXT' $SW_DIR; rg -UA 1 '$KB_REGEX_NEXT' $PER_DIR/people"
alias wen="rg -A 5 KATA $DOMAINS_DIR/art/aesthetics.md"
alias qt="clear; bat $MAT_DIR/sw/lang/html-css/content/about/quotes.md"

alias gr="\cd $PER_DIR/tracking; gds"
alias gz="vim $PER_DIR/tracking/24/02.dat; \cd $PER_DIR/tracking; ga; cd -"
alias mb="vim $PER_DIR/tracking/24/goals.dat"
function hm(){
    fname="$1.dat";
    vim $PER_DIR/tracking/24/heatmap/"$fname";
    \cd $PER_DIR/tracking;
    git add -A;
    cd -;
}
function tz(){
    clear;
    label "orangered" "WEIGHT"
    YEAR=${1:-24}
    cat $TRACK_DIR/"$YEAR"/weight.dat | asciigraph -h 10 -w 120 red 2>/dev/null
}
function fz(){
    # TODO: idky cant variablize termgraph args
    # TODO: rewrite in Textual; components incl: Python, fs, output (Rich), graph (terminalplotlib, uniplot); not sure what I'd use for grep; maybe the better move is just redoing this with Golang framework
    YEAR=${1:-24}
    dir="24/heatmap"
    timer;
    termgraph $TRACK_DIR/"$YEAR"/goals.dat --color {green,blue};
    label "darkmagenta" "GUITAR"
    termgraph --calendar --start-dt 2024-01-01 $TRACK_DIR/"$dir"/guitar.dat
    label "deeppink" "PIANO"
    termgraph --calendar --start-dt 2024-01-01 $TRACK_DIR/"$dir"/piano.dat
    # label "gold" "DANCE"
    # termgraph --calendar --start-dt 2024-01-01 $TRACK_DIR/"$dir"/dance.dat
    # label "darkorange" "SKATE"
    # termgraph --calendar --start-dt 2024-01-01 $TRACK_DIR/"$dir"/skate.dat
    label "peru" "TRAIN"
    termgraph --calendar --start-dt 2024-01-01 $TRACK_DIR/"$dir"/train.dat
}
function agg(){
    # components: totals, goals, expected, headers
    YEAR=${1:-24}
    label "skyblue" "TOTALS"
    rg -IN "^(guitar|piano|dance|skate)" $TRACK_DIR/"$YEAR"/??.dat | awk "NF" | awk '{a[$1]+=$2;}END{for(i in a)print i", "a[i]/4;}' | sort | termgraph --color green
}

###
# 🚁 NAVIGATION
###

# ROOT
alias home="cd $HOME"
alias desk="cd $HOME/Desktop"
alias zv="cd $ZV_DIR"

# DENV
alias denv="cd $DENV_DIR"
alias bin="cd $DENV_DIR/bin"
alias dot="cd $DOT_DIR"

# NOTES
alias dom="clear; \cd $DOMAINS_DIR; jbdom"
alias sw="clear; \cd $SW_DIR; jbsw"
alias shu="cd $ZV_DIR/notes/bookcase"

# PERSONAL
alias per="cd $PER_DIR"
alias logs="cd $PER_DIR/logs"
alias ren="cd $PER_DIR/people"

# NEOVIM
# alias vc="cd $HOME/.config/nvim/lua/zv"
# alias plug="cd $HOME/.local/share/nvim/plugged"
# alias ws="cd $TELESCOPE_WORKSPACE_DIR; nv"

# PKGS
alias brewfr="brew ls --versions > $DENV_DIR/logs/brew/brew-pkgs.txt"
alias pipfr="python -m pip freeze > $DENV_DIR/logs/pyenv/pip/pip-pkgs.txt"
alias pipxfr="python -m pipx list > $DENV_DIR/logs/pyenv/pipx/pipx-pkgs.txt"
alias vsdir="cd $HOME/Library/Application\ Support/Code/User"

# ZA
alias mat="cd $MAT_DIR; t 2"
alias ml="cd $MAT_DIR/music/za/music-library; vim README.md"
alias ms="cd $MAT_DIR/sw/db/shujuku/hiring"
alias sk8="\cd $MAT_DIR/art/skate; t 2"
alias tw="\cd $MAT_DIR/art/dance; t 2"
alias yin="cd $ZV_DIR/AV/yin"

###
# 🎹 MUSIC
###

alias mh="rg -UA 7 'alias mh' $DOT_DIR/shell/.zprofile"
alias clef="imgcat $MAT_DIR/music/theory/clef.png"
alias keys="imgcat $MAT_DIR/music/theory/30-keys.jpg; imgcat $MAT_DIR/music/theory/circle-of-fifths.png; rg -UA 6 '## key' $DOMAINS_DIR/music/theory.md"
alias modes="rg -U '## modes\n' -A 15 -B 1 $DOMAINS_DIR/music"
alias chords="rg -A 37 -B 1 '## chords' $DOMAINS_DIR/music/theory.md"
alias rhy="imgcat $MAT_DIR/music/theory/note-divisions.jpg"
alias gq="cd $MAT_DIR/music/piano/harrison\ -\ pop/01\ theory"
alias jt="cd $MAT_DIR/music/guitar"
alias ge="cd $MAT_DIR/art/songwriting"

###
# 🛠 UTILS
###

alias bpy="export PYTHONSTARTUP='$DOT_DIR/cli/python_startup.py'; bpython"
alias cd='function cdl(){ cd "$1"; pwd; l;}; cdl'
alias cppath='pwd | pbcopy'
alias ic="imgcat"
alias m="make"
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias nv="nvim"
alias o="open"
alias oo="open ."
alias v="vimv"
alias vsc="open -a 'Visual Studio Code'"
alias vsconf="cd $HOME/Library/Application\ Support/Code/User"
alias vscfr="ls ~/.vscode/extensions/ > $DOT_DIR/vs-code/pkg-vsc.txt"
alias ytd='yt-dlp "$1"'

# EXA
alias lh="l | head"
function l(){
    if [ "$1" ]; then
        exa -al --icons --classify --git --git-ignore -I $EXA_IGNORE "$1" 
    else
        exa -al --icons --classify --git --git-ignore -I $EXA_IGNORE
    fi
}
function ll(){
    if [ "$1" ]; then
        exa --icons --classify --git -I $EXA_IGNORE "$1"
    else
        exa --icons --classify --git -I $EXA_IGNORE
    fi
}
function t(){
    # t <depth> <dir>
    if [ $# -eq 2 ]; then
        exa -al --icons --tree --level="$1" --git-ignore -I $EXA_IGNORE "$2"
    # t <depth>
    elif [ $# -eq 1 ]
    then
        # break on dir prepended w/ digits e.g. logs/2019
        if [[ "$1" =~ ^-?[0-9]+[.,]?[0-9]*$ ]]; then  # break on dir prepended w/ digits e.g. `logs/2019`
            exa -al --icons --tree --level="$1" --git-ignore -I $EXA_IGNORE
        else
            exa -al --icons --tree --git-ignore -I $EXA_IGNORE "$1"
        fi
    # t
    else
        exa -al --icons --tree --git-ignore -I $EXA_IGNORE
    fi
}

function kai(){
    fname="$1.md";
    cwd="$(pwd)";
    touch "$cwd/$fname";
    open "$cwd/$fname";
}

function label(){
    update_bg="$1"
    update_fg="$(pastel textcolor "$update_bg")"
    echo -en "\n"
    pastel paint "$update_fg" --on "$update_bg" "$2"
    echo -en "\n"
}

function timer(){
    year_past="$(python -c 'from datetime import datetime as dt; days_past = float(abs((dt.strptime("2024-01-01", "%Y-%m-%d") - dt.today()).days)); year_past = round(days_past / 365 * 100, 2); print(year_past)')"
    target_hours="$(python -c 'from datetime import datetime as dt; days_past = float(abs((dt.strptime("2024-01-01", "%Y-%m-%d") - dt.today()).days)); target_hours = round((days_past / 365) * 150); print(target_hours)')"
    label "red" "YEAR PAST: ${year_past}% ||| TARGET HOURS: ${target_hours}"
}

function br {
    local cmd cmd_file code
    cmd_file=$(mktemp)
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(<"$cmd_file")
        command rm -f "$cmd_file"
        eval "$cmd"
    else
        code=$?
        command rm -f "$cmd_file"
        return "$code"
    fi
}
alias b="br"

###
# 💾  GIT
###

alias gb="git b"                        # show current branch
alias gs="clear; git s"                 # show status
alias gl="git l"                        # show prettified log of previous 10 commits
alias gshow="git log --format=%B -n 1"  # show msg description for commit
alias gd="git d"                        # diff working directory and repo
alias gds="git ds"                      # diff staging area and repo
alias ga="git add -A"                   # stage all
alias gai="git ai"                      # stage interactive
alias gc="git c"                        # commit
alias gca="git c --amend"               # commit amend
alias gcne="git c --amend --no-edit"    # commit amend no edit

###
# 🛣 PATH
###

# Homebrew - set path/manpath
eval "$(/opt/homebrew/bin/brew shellenv)"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

export PATH="$PATH:/Users/zach/.local/bin"  # pipx
export PATH="$DENV_DIR/bin:${PATH}"         # my bin
export PATH=$PATH:$HOME/go/bin              # golang
