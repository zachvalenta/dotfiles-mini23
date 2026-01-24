echo -n "$(tput setaf 5) sourcing ~/.zshrc at$(tput sgr0): "; date

###
# 🎛️ SHELL OPTIONS
###

set -o vi  # vi mode for command line editing

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

# LS_COLORS for eza
# regen cache: rm ~/.cache/vivid-ls-colors && source ~/.zshrc
if [[ ! -f ~/.cache/vivid-ls-colors ]]; then
    mkdir -p ~/.cache
    vivid generate catppuccin-mocha > ~/.cache/vivid-ls-colors
fi
export LS_COLORS="$(cat ~/.cache/vivid-ls-colors)"

# BROOT - file navigator
source /Users/zach/.config/broot/launcher/bash/br

# ZOXIDE - smart cd
eval "$(zoxide init zsh)"

# eval "$(nodenv init -)"

# NVM - takes 500ms so using placeholder func for lazy loading
export NVM_DIR="$HOME/.config/nvm"
nvm() {
    unset -f nvm node npm  # rm placeholders
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # load the real nvm
    nvm "$@"  # run actual nvm cmd w/ args
}
node() {
    unset -f nvm node npm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    node "$@"
}
npm() {
    unset -f nvm node npm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npm "$@"
}

###
# 🏔 WORKFLOW
###

alias qt="clear; glow $MAT_DIR/sw/lang/html-css/myblog/content/quotes.md"
# alias plan="clear; rg -UNI '## 05' -A 12 $PER_DIR/logs/25.md | glow -; rg -UNI 'BIG PLAN' -A 5 -B 2 $DOMAINS_DIR | glow -"
# alias rj="\cd $PER_DIR/journal; vim journal.txt"
alias com="vim +/commits $SW_DIR/za/work.md"
alias gr="\cd $PER_DIR/tracking/26; gds"
alias gz="vim $PER_DIR/tracking/26/za.dat; \cd $PER_DIR/tracking; ga; cd -"

function agg(){
    # prefer this approach: partitions arts, one file instead of three
    timer;
    YEAR=${1:-25}
    DANCE="$(cat $TRACK_DIR/$YEAR/dance.dat | awk 'NF>1{print $NF}' | awk '{sum+=$1;}END{print sum/4;}')"
    SKATE="$(cat $TRACK_DIR/$YEAR/skate.dat | awk 'NF>1{print $NF}' | awk '{sum+=$1;}END{print sum/4;}')"
    GUITAR="$(cat $TRACK_DIR/$YEAR/guitar.dat | awk 'NF>1{print $NF}' | awk '{sum+=$1;}END{print sum/4;}')"
    PIANO="$(cat $TRACK_DIR/$YEAR/piano.dat | awk 'NF>1{print $NF}' | awk '{sum+=$1;}END{print sum/4;}')"
    TRAIN="$(cat $TRACK_DIR/$YEAR/train.dat | awk 'NF>1{print $NF}' | awk '{sum+=$1;}END{print sum;}')"
    DRAW="$(cat $TRACK_DIR/$YEAR/draw.dat | awk 'NF>1{print $NF}' | awk '{sum+=$1;}END{print sum/4;}')"
    echo "jeeta,${GUITAR},100" | termgraph --color {green,blue}
    echo "piano,${PIANO},100" | termgraph --color {green,blue}
    echo "dance,${DANCE},100" | termgraph --color {green,blue}
    echo "skate,${SKATE},100" | termgraph --color {green,blue}
    echo "train,${TRAIN},100" | termgraph --color {green,blue}
    echo "draw,${DRAW},100" | termgraph --color {green,blue}
}
function hm(){
    # TODO: branch on arg (two-digit int, string)
    # replace with python + bullet: subprocess.run("termgraph --calendar --start-dt 2024-01-01 ~/Documents/zv/personal/tracking/24/guitar.dat", shell=True, check=True)
    if [ $# -eq 0 ]; then
        label "deeppink" "GUITAR"
        termgraph --calendar --start-dt 2025-01-01 $TRACK_DIR/25/guitar.dat
        label "darkmagenta" "PIANO"
        termgraph --calendar --start-dt 2025-01-01 $TRACK_DIR/25/piano.dat
        label "gold" "DANCE"
        termgraph --calendar --start-dt 2025-01-01 $TRACK_DIR/25/dance.dat
        label "darkorange" "SKATE"
        termgraph --calendar --start-dt 2025-01-01 $TRACK_DIR/25/skate.dat
        label "peru" "TRAIN"
        termgraph --calendar --start-dt 2025-01-01 $TRACK_DIR/25/train.dat
        label "saddlebrown" "DRAW"
        termgraph --calendar --start-dt 2025-01-01 $TRACK_DIR/25/draw.dat
    else
        fname="$1.dat";
        vim '+normal G$' $PER_DIR/tracking/25/"$fname";
        \cd $PER_DIR/tracking;
        git add -A;
        cd -;
    fi
}
function tz(){
    clear;
    label "orangered" "WEIGHT"
    YEAR=${1:-26}
    cat $TRACK_DIR/"$YEAR"/weight.dat | asciigraph -h 10 -w 120 red 2>/dev/null
}

###
# 🚁 NAVIGATION
###

# ROOT
alias f="z"
alias home="cd $HOME; ll"
alias desk="cd $HOME/Desktop"
alias zv="cd $ZV_DIR"

# PROJECTS
alias xm="\cd $ZV_DIR/projects; t -d 3"
alias blog="\cd $ZV_DIR/projects/design/ux/myblog; t -d"
alias cm="\cd $ZV_DIR/projects/design/app/ceemuz; t"
alias doc="\cd $ZV_DIR/projects/design/architecture/documentation; t"
alias jc="jiancha"
alias sgt="\cd $ZV_DIR/projects/design/system/sgt; t"
alias wq="\cd $ZV_DIR/projects/design/system/tennis-weekend; t"

# KERO
alias kero="\cd $ZV_DIR/work/kero; t -d 2 docs src"
alias kenv="\cd $KERO_DIR/denv; t 2"
alias sim="\cd $KERO_DIR/denv/sims; t"
alias ks="\cd $KERO_DIR/src; t 2"
alias ji="\cd $KERO_RUSH; t 2 ml_app"
alias kd="\cd $KERO_DIR/docs; t 2"
alias ka="\cd $KERO_AGENTIC; t commands; t impl"
alias ke="\cd $KERO_DIR/docs/eng; t"
alias kt="\cd $KERO_DIR/docs/tickets; t 2"
alias kl="\cd $KERO_DIR/docs/worklogs; t"

# DENV
alias denv="cd $DENV_DIR"
alias bin="cd $DENV_DIR/bin"
alias dot="\cd $DOT_DIR; t -d"
alias ccc="\cd $DOT_DIR/ai/claude; t"

# NOTES
alias jbj="\cd $ZV_DIR/notes"
alias dom="clear; \cd $DOMAINS_DIR; t -d; jb"
alias sw="clear; \cd $SW_DIR; t -d; jb"
alias shu="cd $ZV_DIR/notes/bookcase; t -d"

# PERSONAL
alias per="cd $PER_DIR"
alias logs="cd $PER_DIR/logs"
alias falu="\cd $PER_DIR/.falu; t"
# alias ren="cd $PER_DIR/people"
# alias fu="\cd $PER_DIR/.photos/25/11; ic scorecard.png; ic 复仇.png"
# alias fu="clear; rg -UNI '## routine' -A 15 $PER_DIR/logs/big-picture.md | glow -; rg -UNI '## arc' -A 5 $PER_DIR/logs/big-picture.md | glow -"
alias fu="clear; ic /Users/zach/Documents/zv/personal/.photos/20-21\ wilm/20/john-flea-monk.png; rg -UNI '## arc' -A 5 $PER_DIR/logs/big-picture.md | glow -"

# NEOVIM
# alias vc="cd $HOME/.config/nvim/lua/zv"
# alias plug="cd $HOME/.local/share/nvim/plugged"
# alias ws="cd $TELESCOPE_WORKSPACE_DIR; nv"
alias nv="nvim"

# PKGS
alias brewfr="brew ls --versions > $DENV_DIR/logs/brew/brew-pkgs.txt"
alias pipfr="python -m pip freeze > $DENV_DIR/logs/pyenv/pip/pip-pkgs.txt"
alias pipxfr="python -m pipx list --short > $DENV_DIR/logs/pyenv/pipx/pipx-pkgs.txt"
alias rustfr="cargo install --list > $DENV_DIR/logs/rust/#meta/rust-pkgs.txt"
alias vscfr="ls ~/.vscode/extensions/ > $DOT_DIR/vs-code/pkg-vsc.txt"
alias vsdir="cd $HOME/Library/Application\ Support/Code/User"

# ZA
alias mat="cd $MAT_DIR; t 2"
alias ml="cd $MAT_DIR/music/za/music-library"
alias ms="cd $MAT_DIR/sw/za/profile; t -d"
alias snip="cd /Users/zach/Library/Application\ Support/Code/User"
alias sk8="\cd $MAT_DIR/art/skate; t -d"
alias yin="\cd $ZV_DIR/AV/yin; eza -al"

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
# 🚢 DOCKER
###

alias mt="docker"
alias docker_stat="docker ps --format 'table {{.Names}}\t{{.State}}\t{{.Status}}'"  #  https://docs.docker.com/engine/reference/commandline/ps/#formatting
function mtl(){  # list all
    echo -e "\n";

    echo "🚢 containers";
    printf %"$COLUMNS"s | tr " " "-"
    echo -e "\n";
    docker ps -a;
    echo -e "\n";

    echo "💾 images";
    printf %"$COLUMNS"s | tr " " "-"
    echo -e "\n";
    docker images;
    echo -e "\n";

    echo "🗄  volumes";
    printf %"$COLUMNS"s | tr " " "-"
    echo -e "\n";
    docker volume ls;
    echo -e "\n";
}
# stop containers, rm (stopped containers, unused volumes, dangling images), rm unused images
alias mtp="docker ps -qa | xargs docker stop; docker system prune --volumes -f; docker image prune -af; mtl"
alias mtpc="docker ps -qa | xargs docker stop; docker system prune --volumes -f"
alias dstop="docker ps -qa | xargs docker stop"

###
# 🛠 UTILS
###

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
alias m="make"
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
alias ytd='yt-dlp "$1"'
alias ytdv='yt-dlp --format mp4 "$1"'
alias upzr="source $HOME/.zshrc"
alias zr="vsc $HOME/.zshrc"

###
# EZA
###

# default
function sl(){
    if [ "$1" ]; then
        eza --icons --no-quotes --no-user --no-time --no-filesize --no-permissions --git --git-ignore -I "$EZA_IGNORE" "$1"
    else
        eza --icons --no-quotes --no-user --no-time --no-filesize --no-permissions --git --git-ignore -I "$EZA_IGNORE"
    fi
}
# dir/file sizes
function l(){
    if [ "$1" ]; then
        eza -al --icons --total-size --no-quotes --no-user --no-time --no-permissions --git --git-ignore -I "$EZA_IGNORE" "$1"
    else
        eza -al --icons --total-size --no-quotes --no-user --no-time --no-permissions --git --git-ignore -I "$EZA_IGNORE"
    fi
}
# perms / user / timestamp + show gitignore
function ll(){
    if [ "$1" ]; then
        eza -alo --icons --no-quotes --git --git-ignore -I "$EZA_IGNORE" "$1"
    else
        eza -alo --icons --no-quotes --git --git-ignore -I "$EZA_IGNORE"
    fi
}

# SHOW GITIGNORE
function ti(){
    eza -al --icons --tree --no-quotes --no-user --no-time -I "$EZA_IGNORE"
}

function t() {
    local DIRS_ONLY=""
    local LEVEL=""

    # Check for -d flag
    if [[ "$1" == "-d" ]]; then
        DIRS_ONLY="-D"
        shift
    fi

    # Check if first remaining arg is a number (level)
    if [ $# -ge 1 ] && [[ "$1" =~ ^-?[0-9]+[.,]?[0-9]*$ ]]; then
        LEVEL="--level=$1"
        shift
    fi

    # All remaining args are directories (or none for current dir)
    if [ $# -eq 0 ]; then
        eza -al $DIRS_ONLY "${EZA_TREE_FLAGS[@]}" $LEVEL
    else
        eza -al $DIRS_ONLY "${EZA_TREE_FLAGS[@]}" $LEVEL "$@"
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
}

function timer(){
    year_past="$(python -c 'from datetime import datetime as dt; days_past = float(abs((dt.strptime("2025-01-01", "%Y-%m-%d") - dt.today()).days)); year_past = round(days_past / 365 * 100, 2); print(year_past)')"
    target_hours="$(python -c 'from datetime import datetime as dt; days_past = float(abs((dt.strptime("2025-01-01", "%Y-%m-%d") - dt.today()).days)); target_hours = round((days_past / 365) * 100, 1); print(target_hours)')"
    days_left="$(python -c 'from datetime import datetime as dt; days_past = float(abs((dt.strptime("2025-01-01", "%Y-%m-%d") - dt.today()).days)); days_left = int(365 - days_past); print(days_left)')"
    label "red" "YEAR PAST: ${year_past}% ||| TARGET HOURS: ${target_hours} ||| DAYS LEFT: ${days_left}"
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

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

###
# 💾  GIT
###

# LOGS
alias gl="git log --pretty=format:'%C(black #c0c0c0 ul) %<|(10) %cd %C(auto) %d %s' --date=short"
alias gshow="git log --format=%B -n 1"  # show msg description for commit

# COMMIT
alias gc="git c"                        # commit
alias gca="git c --amend"               # commit amend
alias gcne="git c --amend --no-edit"    # commit amend no edit
function gp() {
    git add -A

    # Show staged changes in pager (q to exit, ESC aborts)
    # git diff --cached --color=always | less -R -+F -K --quit-on-intr || {
    #     gum style --foreground 9 "❌ Aborted."
    #     return 1
    # }

    echo ""
    gum style --border double --padding "1 2" "📝 Files staged:"
    git status --short

    echo ""
    gum style --border double --padding "1 2" "📋 Current commit message:"
    git log -1 --pretty=%B

    if gum confirm "⚠️  Amend current commit and force push?"; then
        gum spin --spinner dot --title "Amending commit..." -- \
            git c --amend --no-edit
        gum spin --spinner dot --title "Force pushing..." -- \
            git push -f
        gum style --foreground 10 --bold "✅ Done!"
    else
        gum style --foreground 9 "❌ Aborted. Changes staged but not committed/pushed."
    fi
}

# ZA
alias gb="git b"                        # show current branch
alias gs="clear; git s"                 # show status
alias gd="git d"                        # diff working directory and repo
alias gds="git ds"                      # diff staging area and repo
alias ga="git add -A"                   # stage all
alias gai="git ai"                      # stage interactive
alias gt="git tag"                      # list tags
