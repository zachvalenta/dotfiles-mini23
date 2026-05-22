###
# LS_COLORS
###

# regen cache: rm ~/.cache/vivid-ls-colors && source ~/.zshrc
if [[ ! -f ~/.cache/vivid-ls-colors ]]; then
    mkdir -p ~/.cache
    vivid generate catppuccin-mocha > ~/.cache/vivid-ls-colors
fi
export LS_COLORS="$(cat ~/.cache/vivid-ls-colors)"

###
# default
###

function sl(){
    if [ "$1" ]; then
        eza --icons --no-quotes --no-user --no-time --no-filesize --no-permissions --git --git-ignore -I "$EZA_IGNORE" "$1"
    else
        eza --icons --no-quotes --no-user --no-time --no-filesize --no-permissions --git --git-ignore -I "$EZA_IGNORE"
    fi
}

###
# dir/file sizes
###

function l(){
    if [ "$1" ]; then
        eza -al --icons --total-size --no-quotes --no-user --no-time --no-permissions --git --git-ignore -I "$EZA_IGNORE" "$1"
    else
        eza -al --icons --total-size --no-quotes --no-user --no-time --no-permissions --git --git-ignore -I "$EZA_IGNORE"
    fi
}

###
# perms / user / timestamp + show gitignore
###

function ll(){
    if [ "$1" ]; then
        eza -alo --icons --no-quotes --git --git-ignore -I "$EZA_IGNORE" "$1"
    else
        eza -alo --icons --no-quotes --git --git-ignore -I "$EZA_IGNORE"
    fi
}

###
# tree
###

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

###
# tree + show gitignore
###

function ti(){
    eza -al --icons --tree --no-quotes --no-user --no-time -I "$EZA_IGNORE"
}

###
# run ll after cd
###

autoload -Uz add-zsh-hook

function cd_quiet() {
    # suppress the automatic chpwd listing once so callers can print their own view
    _LIST_AFTER_CD_SKIP=1
    if ! builtin cd "$@"; then
        unset _LIST_AFTER_CD_SKIP
        return 1
    fi
}

function _list_after_cd() {
    [[ -o interactive && -t 1 ]] || return
    # cd_quiet still triggers chpwd, so consume its one-shot skip flag here
    if [[ -n "$_LIST_AFTER_CD_SKIP" ]]; then
        unset _LIST_AFTER_CD_SKIP
        return
    fi
    ll
}

add-zsh-hook chpwd _list_after_cd
