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
    # Check if the current branch is not the main branch
    if [[ "$(git_current_branch)" != "$(git_main_branch)" ]]; then
        gcom
        git pull --prune --quiet
    fi

    # Get all branches
    all_branches=$(git branch --no-color | egrep -v "(^\*|$(git_main_branch))")

    # Get all merged branches and squash-merged branches
    merged_branches=""
    for branch in $all_branches; do
        # Check if the branch is merged or squash-merged
        if git branch --merged | grep -q "$branch" || git --no-pager log --grep="$branch" --oneline; then
            merged_branches+="$branch "
        fi
    done

    # Exit if there are no merged branches
    if [[ -z "$merged_branches" ]]; then
        printf "✨ %sNo merged local branches found%s\n" "$(tput setaf 2)" "$(tput sgr 0)"
        return
    fi

    # Print the merged branches
    printf "%sThe following local branches are merged:%s\n" "$(tput bold)" "$(tput sgr0)"
    printf "%s\n" "$merged_branches"

    # Delete all merged branches? y/n
    read "choice?$(tput setaf 1)Delete all (y/n)?$(tput sgr 0) "

    case "$choice" in
        y|Y ) printf "%s\n" "$merged_branches" | xargs git branch -D;;
        * ) printf "Did not delete any branches\n";;
    esac
}
