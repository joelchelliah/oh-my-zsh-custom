# Custom / Overridden git aliases

alias gcm='git commit -m'
alias gp='git pull --prune'
alias gps='git push'
alias gs='git status -s'

# Add all changes and show status
alias gaa="git add .; echo -e '\nAdded all changes\n'; git status -s"

# Undo last local commit and show status
alias gun="git undo; echo -e '\nUndid last commit\n'; git status -s"

# Logs
alias gl="git log --pretty=oneline -n 20 --graph --abbrev-commit"
alias gh="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen | %ad (%cr) | %C(bold blue)<%an>%Creset' --abbrev-commit --date=short"

# Check out master
alias gcom="gco master"

# Create new branch and set upstream
unalias gcb
gcb () { gco -b $1 && gps --set-upstream origin $(git_current_branch); }

# Commit with branch name in title
gcwb () { git commit -m "$(git rev-parse --abbrev-ref HEAD): $1"; }

# Open Bitbucket pull request for current branch
gpr () {
    repo=${PWD##*/}
    branch=$(git_current_branch)
    echo "Creating pull request for $branch"
    open "https://bitbucket.org/enturas/$repo/pull-requests/new?source=$branch&t=1"
}

# Delete all merged local branches (with prompt)
gbdm () {
    if [[ "$(git_current_branch)" != "master" ]]; then
        gco master
        git pull --prune --quiet
    fi

    merged=$(git branch --no-color --merged| egrep -v "(^\*|master)")

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
