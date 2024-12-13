# Handle $0 according to the standard:
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Get the directory where the script is located
PLUGIN_DIR=${0:A:h}

function split-vpn() {
    sudo python3 "$PLUGIN_DIR/vpn_split.py"
}

function list-vpn-routes() {
    echo "\nCurrent VPN routes:"
    netstat -rn | grep utun
}
