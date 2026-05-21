alias cork="\cd $ZV_DIR/projects/tools/corkboard; t 2"
alias fj="corkboard"
alias jf="\cd $PER_DIR/corkboard-tasks; t -d"
function mrw(){
    # make corkboard task
    fname="$1.md";
    cwd="$(pwd)";
    cp "$DOT_DIR/task-mgmt/corkboard/template.md" "$cwd/$fname";
    NVIM_APPNAME=neo nvim "$cwd/$fname";
}

