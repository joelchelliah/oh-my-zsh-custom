## ---------------------------- BIN ---------------------------
export BIN=$HOME/bin

export PATH=$BIN:$PATH


## --------------------------- JAVA ---------------------------
export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_HOME="`/usr/libexec/java_home -v '1.7*'`"


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


# ---------------------------- RVM ----------------------------
export PATH="$PATH:$HOME/.rvm/bin"
