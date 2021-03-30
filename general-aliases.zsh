### 🐚 ZSH
alias zshconfig="code ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias reload="echo -e 'Running: source ~/.zshrc\n...'; zshsource"
# Oh my...
alias ohmyzsh="cd ~/.oh-my-zsh"
alias ohmyzshconfig="code ~/.oh-my-zsh"


### 🗂 Frequently used folders
alias custom="~/.oh-my-zsh/custom"
alias entur="cd ~/src/entur-clients/"
alias bff="cd ~/src/entur-bff/"


### 🌡️ Check the CPU temperature
alias temp="sudo powermetrics --samplers smc |grep -i 'CPU die temperature'"


### 🧶 Yarn laziness
alias ts="yarn ts && yarn lint && yarn test"
alias tsr="yarn eslint stop && ts"


### 🍱 Misc
alias sshconfig="code ~/.ssh/config"
alias gw="./gradlew"


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
