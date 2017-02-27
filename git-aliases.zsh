# Custom / Overridden git aliases

alias gcm='git commit -m'
alias gp='git pull --prune'
alias gps='git push'
alias gs='git status -s'
alias gaa="git add .; echo -e '\nAdded all changes\n'; git status -s"
alias gun="git undo; echo -e '\nUndid last commit\n'; git status -s"
alias gl="git log --pretty=oneline -n 20 --graph --abbrev-commit"
alias gh="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen | %ad (%cr) | %C(bold blue)<%an>%Creset' --abbrev-commit --date=short"

# Commit with branch name in title
gcwb () { git commit -m "$(git rev-parse --abbrev-ref HEAD): $1"; }
