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

# show gitignore
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
