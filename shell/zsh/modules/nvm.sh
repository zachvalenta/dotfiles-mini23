# lazy load NVM to avoid 500ms lag on shell startup
_load_nvm() {
    local NVM_DIR="$HOME/.config/nvm"
    # rm placeholders
    unset -f nvm node npm gemini claude codex _load_nvm
    # load nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

nvm() {
    _load_nvm
    nvm "$@"  # run cmd w/ args
}
node() {
    _load_nvm
    node "$@"
}
npm() {
    _load_nvm
    npm "$@"
}
gemini() {
    _load_nvm
    gemini "$@"
}
claude() {
    _load_nvm
    claude "$@"
}
codex() {
    _load_nvm
    codex "$@"
}
