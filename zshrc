# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git brew command-not-found alias-tips vscode)

fpath=($ZSH/custom/completions $fpath)

# Skip the verification of insecure directories
ZSH_DISABLE_COMPFIX="true"

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
eval "$(rbenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/Joel/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/Joel/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/Joel/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/Joel/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# PYENV
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Joel/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/Joel/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Joel/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/Joel/google-cloud-sdk/completion.zsh.inc'; fi
