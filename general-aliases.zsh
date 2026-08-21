### 🐚 ZSH
alias zshconfig="code ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias p10source="source ~/.p10k.zsh"
alias reload="echo -e '🛠️   Running: source ~/.zshrc\n...'; zshsource"
# Oh my...
alias ohmyzsh="cd ~/.oh-my-zsh"
alias ohmyzshconfig="code ~/.oh-my-zsh"

### 📆 Date stuff
alias week='date +%V'
alias isodate='date +'\''%Y-%m-%dT%H:%M:%SZ'\'


### 🍱 Misc
alias sshconfig="code ~/.ssh/config"
alias vsc="code ."

# To avoid using any system wide Gradle distribution
alias gradle=gw
# unalias gw

### 🛰️ IP address
alias ip="echo -e 'WiFi IP address:'; ipconfig getifaddr en0"
alias ipc="echo -n $(ipconfig getifaddr en0) | pbcopy; echo -e 'WiFi IP address copied to clipboard!'"

## 🐘 Gradle
alias gwDeps='gw dependencies $(gw -q projects \
    | grep -Fe ---\ Project \
    | sed -Ee "s/^.+--- Project '"'([^']+)'/\1:dependencies/"'")'


## Colima
alias cols="colima start --cpu 4 --memory 16 --disk 100 --vm-type=vz --vz-rosetta"
