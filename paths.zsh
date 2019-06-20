## ---------------------------- BIN ---------------------------
export BIN=$HOME/bin

export PATH=$BIN:$PATH


## --------------------------- JAVA ---------------------------
# export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME="`/usr/libexec/java_home -v '1.8*'`"


## --------------------------- SCALA --------------------------
export SCALA_HOME=$BIN/scala-2.11.2

export PATH=$SCALA_HOME/bin:$PATH


## ------------------------- HASKELL --------------------------
export HASKELL_HOME=$HOME/Library/Haskell

export PATH=$HASKELL_HOME/bin:$PATH


## --------------------------- STACK --------------------------
export STACK_INSTALL_PATH=$HOME/.local/bin

export PATH=$BIN/stack-1.0.4-osx-x86_64:$STACK_INSTALL_PATH:$PATH


## ---------------------------- GO ----------------------------
export GOPATH=$HOME/src

## -------------------------- GCLOUD --------------------------
export GCLOUD_HOME=$BIN/google-cloud-sdk
export GCLOUD_BIN=$GCLOUD_HOME/bin
export PATH=$GCLOUD_HOME:$GCLOUD_BIN:$PATH

## ---------------------------- RVM ---------------------------
export PATH="$PATH:$HOME/.rvm/bin"

## -------------------------- VSCODE --------------------------
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

## ---------------------- ITERM2 SCRIPTS ----------------------
export PATH=$PATH:$HOME/Library/Application\ Support/iTerm2/Scripts
