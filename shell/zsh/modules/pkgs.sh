alias brewfr="brew ls --versions > $DENV_DIR/logs/brew/brew-pkgs.txt"
alias pipfr="python -m pip freeze > $DENV_DIR/logs/pyenv/pip/pip-pkgs.txt"
alias pipxfr="python -m pipx list --short > $DENV_DIR/logs/pyenv/pipx/pipx-pkgs.txt"
alias rustfr="cargo install --list > $DENV_DIR/logs/rust/#meta/rust-pkgs.txt"
alias vscfr="ls ~/.vscode/extensions/ > $DOT_DIR/editors/vs-code/pkg-vsc.txt"
alias vsdir="cd $HOME/Library/Application\ Support/Code/User"

