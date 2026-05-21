set -o vi

# cursor shape: beam in insert, block in normal
function zle-keymap-select {
  case $KEYMAP in
    vicmd)      print -n '\e[2 q' ;;  # block
    viins|main) print -n '\e[6 q' ;;  # beam
  esac
}
zle -N zle-keymap-select

# set beam on new prompt (pane open starts in insert mode but keymap-select never fires)
function zle-line-init { print -n '\e[6 q'; }
zle -N zle-line-init

# reset cursor to terminal default before any command runs (so vim starts clean)
function preexec { print -n '\e[0 q'; }
