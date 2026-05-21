###
# LOGS
###

alias gl="git log --pretty=format:'%C(black #c0c0c0 ul) %<|(10) %cd %C(auto) %d %s' --date=short"
alias gshow="git log --format=%B -n 1"  # show msg description for commit

###
# COMMIT
###
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

    # echo ""
    # gum style --border double --padding "1 2" "📝 Files staged:"
    # git status --short

    # echo ""
    # gum style --border double --padding "1 2" "📋 Current commit message:"
    # git log -1 --pretty=%B

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

###
# ZA
###
alias gb="git b"                        # show current branch
alias gs="clear; git s"                 # show status
alias gd="git d"                        # diff working directory and repo
alias gds="git ds"                      # diff staging area and repo
alias ga="git add -A"                   # stage all
alias gai="git ai"                      # stage interactive
alias gt="git tag"                      # list tags
