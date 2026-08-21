function java_ls() {
    /usr/libexec/java_home -V 2>&1 | awk '/[0-9]+\.[0-9]+\.[0-9]+/ && !/^\// {print}' | while IFS= read -r line; do
        local jvm_path="${line##* }"
        if [[ "$jvm_path" == "$JAVA_HOME" ]]; then
            print -P "%F{green}➤ ${line# }%f"
        else
            print "  ${line# }"
        fi
    done
}

function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
    export PATH=$JAVA_HOME/bin:$PATH
    java -version
}
