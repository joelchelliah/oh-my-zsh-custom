# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew command-not-found alias-tips)

fpath=($ZSH/custom/completions $fpath)


# Skip the verification of insecure directories
ZSH_DISABLE_COMPFIX="true"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export PASSWORD_STORE_DIR=~/src/entur/.password-store


# # # # # # # # # # # # # # # #
#  APPLLICATION BASED THINGS  #
# # # # # # # # # # # # # # # #

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

### ITERM2
export PATH=$PATH:$HOME/Library/Application\ Support/iTerm2/Scripts

### JAVA
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
#export JAVA_HOME="`/usr/libexec/java_home -v '1.8*'`"

### VSCODE
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

### YARN
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NODE
export NODE_OPTIONS=--max_old_space_size=4096

## RUBY ENV
export PATH="$PATH:$HOME/.rvm/bin"
