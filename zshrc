# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git command-not-found docker-compose vpn-split zsh-autosuggestions)

# Skip the verification of insecure directories
ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

fpath=($ZSH/custom/completions $fpath)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export PASSWORD_STORE_DIR=~/src/entur/.password-store


# # # # # # # # # # # # # # # # # # # # # # # #
# #        APPLLICATION BASED THINGS        # #
# # # # # # # # # # # # # # # # # # # # # # # #

### BIN
export BIN=$HOME/bin
export PATH=$BIN:$PATH

### ANDROID
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

### GCLOUD
export GCLOUD_HOME=$BIN/google-cloud-sdk
export GCLOUD_BIN=$GCLOUD_HOME/bin
export PATH=$GCLOUD_HOME:$GCLOUD_BIN:$PATH
# Update PATH for the Google Cloud SDK.
if [ -f '/Users/joelchelliah/bin/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/joelchelliah/bin/google-cloud-sdk/path.zsh.inc'; fi
# Enable shell command completion for gcloud.
if [ -f '/Users/joelchelliah/bin/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/joelchelliah/bin/google-cloud-sdk/completion.zsh.inc'; fi

### JAVA
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-25.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

### GRADLE
GRADLE_PROPS="$HOME/.gradle/gradle.properties"

### VSCODE
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

### YARN
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

### NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### NODE
export NODE_OPTIONS=--max_old_space_size=4096

### DOCKER / COLIMA
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export TESTCONTAINERS_RYUK_DISABLED=true
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

### PYENV
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joelchelliah/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joelchelliah/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joelchelliah/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joelchelliah/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### PNPM
export PNPM_HOME="/Users/joelchelliah/Library/pnpm"

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

### CURL
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

### HOMEBREW
PATH="/opt/homebrew/bin:$PATH"


### Compinit (needed for command completion)
autoload -Uz compinit && compinit -i

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/joelchelliah/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

export PATH="$HOME/.local/bin:$PATH"

### AUTOSUGGEST CONFIG
# Change what triggers suggestions (history is default, can add completion)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Accept suggestion with Tab instead of right-arrow (optional — some prefer this)
bindkey '^I' autosuggest-accept

## ## ## ## ## ## ## ## ## ##

### TRAFIKKDATA
if [[ -f "$GRADLE_PROPS" ]]; then
  export TRAFIKKDATA_GH_PKG_TOKEN=$(sed -n 's/^GITHUB_TOKEN=//p' "$GRADLE_PROPS")
  export FONTAWESOME_PACKAGE_TOKEN=$(sed -n 's/^FONTAWESOME_TOKEN=//p' "$GRADLE_PROPS")
fi

## ## ## ## ## ## ## ## ## ##

### Key bindings
# Shift+Left / Shift+Right — word jump
bindkey "^[[1;2D" backward-word
bindkey "^[[1;2C" forward-word

# Shift+Cmd+Left / Shift+Cmd+Right — kill word backward/forward
bindkey "^[[1;10D" backward-kill-word
bindkey "^[[1;10C" kill-word

## ## ## ## ## ## ## ## ## ##
