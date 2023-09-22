alias java_ls='/usr/libexec/java_home -V 2>&1 | awk '\''/[0-9]+\.[0-9]+\.[0-9]+/{print $1}'\'' | grep -v Home'

function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
    export PATH=$JAVA_HOME/bin:$PATH
    java -version
}
