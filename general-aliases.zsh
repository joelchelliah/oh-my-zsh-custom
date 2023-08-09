### 🐚 ZSH
alias zshconfig="code ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias reload="echo -e 'Running: source ~/.zshrc\n...'; zshsource"
# Oh my...
alias ohmyzsh="cd ~/.oh-my-zsh"
alias custom="cd ~/.oh-my-zsh/custom"
alias ohmyzshconfig="code ~/.oh-my-zsh"


### 🗂 Frequently used folders
alias entur="cd ~/src/entur-clients/"
alias bff="cd ~/src/entur-bff/"


### 🌡️ Check the CPU temperature
alias temp="sudo powermetrics --samplers smc |grep -i 'CPU die temperature'"


### 🧶 Yarn laziness
alias ts="yarn ts && yarn lint && yarn test"
alias tsr="yarn eslint stop && ts"


### 📆 Date stuff
alias week='date +%V'
alias isodate='date +'\''%Y-%m-%dT%H:%M:%SZ'\'

### 🍱 Misc
alias sshconfig="code ~/.ssh/config"
alias gw="./gradlew"
alias vsc="code ."

### 🛰️ IP address
alias ip="echo -e 'WiFi IP address:'; ipconfig getifaddr en0"
alias ipc="echo -n $(ipconfig getifaddr en0) | pbcopy; echo -e 'WiFi IP address copied to clipboard!'"


### 🎨 Set the tab color
tabColor () {
  case $1 in
  red)
  tabColorRBG 204 89 89
  ;;
  orange)
  tabColorRBG 216 125 75
  ;;
  yellow)
  tabColorRBG 224 219 74
  ;;
  green)
  tabColorRBG 98 196 143
  ;;
  blue)
  tabColorRBG 70 190 206
  ;;
  purple)
  tabColorRBG 151 92 214
  ;;
  pink)
  tabColorRBG 198 71 188
  ;;
  esac
}
# Set tab color by RBG value
tabColorRBG () {
  echo -e "\033]6;1;bg;red;brightness;$1\a"
  echo -e "\033]6;1;bg;green;brightness;$2\a"
  echo -e "\033]6;1;bg;blue;brightness;$3\a"
}
