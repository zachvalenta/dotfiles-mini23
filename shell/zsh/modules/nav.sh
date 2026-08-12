alias f="z"
alias home="cd_quiet $HOME; ll"
alias desk="cd $HOME/Desktop"
alias zv="cd $ZV_DIR"

###
# DENV
###

alias denv="cd $DENV_DIR"
alias bin="cd_quiet $DENV_DIR/bin; t"
alias logs="cd $DENV_DIR/logs"
alias dot="cd_quiet $DOT_DIR; t -d"
alias ccc="cd_quiet $DOT_DIR/ai/claude; t"
alias pic="cd_quiet /Users/zach/.pi/agent; t 2"

###
# NOTES
###

alias dom="clear; cd_quiet $DOMAINS_DIR; t -d; jb"
alias sw="clear; cd_quiet $SW_DIR; t -d; jb"
alias shu="cd_quiet $ZV_DIR/notes/bookcase; eza -al"

###
# PROJECTS
###

alias xm="cd_quiet $ZV_DIR/projects; t 2"
alias blog="cd_quiet $ZV_DIR/projects/design/ux/myblog; t -d"
alias cv="cd_quiet $ZV_DIR/projects/tools/resume; t content; t -d employers; t src; t static"
alias kd="cd_quiet /Users/zach/Documents/zv/projects/data/rdd; t"
alias dk="clear; cd_quiet /Users/zach/Documents/zv/projects/data/rdd/context; t"
alias emo="cd_quiet /Users/zach/Documents/zv/projects/ml/emopic; t"

###
# PROJECTS
###

alias ligo="cd_quiet /Users/zach/Documents/zv/work/colligo; t 2"
alias cl="cd_quiet /Users/zach/Documents/zv/work/colligo/docs/worklogs; t 2"
alias mob="cd_quiet /Users/zach/Documents/zv/work/colligo/src/mobile; eza -l"
alias ce="cd_quiet /Users/zach/Documents/zv/work/colligo/docs/eng; t 2"
alias org="cd_quiet /Users/zach/Documents/zv/work/colligo/docs/org; t 2"

###
# PERSONAL
###

alias per="cd_quiet $PER_DIR; eza -l"
alias rb="cd $PER_DIR/logs"
alias wl="cd_quiet $WORKLOGS_DIR; t"
alias falu="cd_quiet $PER_DIR/.falu; ti"

###
# ZA
###

alias mat="cd_quiet $MAT_DIR; t 2"
# alias ml="cd_quiet $MAT_DIR/music/za/music-library; t"
alias ml="cd_quiet /Users/zach/Documents/zv/notes/sw/ml; t 2"
alias snip="cd /Users/zach/Library/Application\ Support/Code/User"
alias yin="cd_quiet $ZV_DIR/AV/yin; eza -al"
