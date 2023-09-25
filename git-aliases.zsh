### 🐙 Custom / Overridden git aliases

alias gs='git status -s'
alias gcm='git commit -m'

alias gp='git pull --prune'

# Fetch latest from master AND rebase on top of those changes
# Better than `grbm` which does not automatically fetch lastest.
alias gupm="git pull --rebase origin $(git_main_branch)"

alias gps='git push'
alias gpsf='gps -f'

# Push to stash with name
alias gstam='git stash push -m'

# Add all changes and show status
alias gaa="git add .; echo -e '\nAdded all changes\n'; git status -s"

# Undo / redo last local commit and show status
alias gun="git undo; echo -e '\nUndid last commit\n'; git status -s"
alias gre="git redo; echo -e '\nRedid previously undid commit\n'; git status -s"

# Logs
alias gl="git log --pretty=oneline -n 20 --graph --abbrev-commit"
alias gh="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen | %ad (%cr) | %C(bold blue)<%an>%Creset' --abbrev-commit --date=short"

# Check out main or master
alias gcom="git co $(git_main_branch)"

# Reset all commits in branch so that they can be squashed
alias gsq="git reset --soft HEAD~$(git rev-list --count HEAD ^$(git_main_branch))"

# Delete remote branch
alias gbdo='git push origin --delete'

# Create new branch and set upstream
unalias gcb
gcb () { gco -b $1 && gps --set-upstream origin $(git_current_branch); }

# Commit with branch name in title
gcwb () { git commit -m "$(git rev-parse --abbrev-ref HEAD): $1"; }

# Open Bitbucket pull request for current branch
unalias gpr
gpr () {
    repo=${PWD##*/}
    branch=$(git_current_branch)
    echo "Creating pull request for $branch"
    open "https://bitbucket.org/enturas/$repo/pull-requests/new?source=$branch&t=1"
}

# Delete all merged local branches (with prompt)
gbdm () {
    if [[ "$(git_current_branch)" != "$(git_main_branch)" ]]; then
        gcom
        git pull --prune --quiet
    fi

    merged=$(git branch --no-color --merged| egrep -v "(^\*|$(git_main_branch))")

    if [[ ${#merged[@]} -eq 0 ]]; then
        echo "✨ $(tput setaf 2)No merged local branches found$(tput sgr 0)"
        return
    fi

    tput bold; echo "The following local branches are merged:"; tput sgr0
    echo $merged

    ## Use for bash `read`
    #read -p "Delete all (y/n)?" choice

    ## Use for zsh `read`
    read "choice?$(tput setaf 1)Delete all (y/n)?$(tput sgr 0) "

    case "$choice" in
        y|Y ) tput setaf 2; echo $merged | xargs git branch -d;;
        * ) echo "Did not delete any branches";;
    esac
}
