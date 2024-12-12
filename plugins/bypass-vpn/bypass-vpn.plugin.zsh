# # # # # # # # # # # # # # # # # # # # #
#    Bypass ADVANIA's oppression! 🔥    #
#                                       #
# Usage:                                #
#   Load plugin via new terminal tab,   #
#   then access the urls in browser.    #
#                                       #
# Manual setup and cleanup via alias:   #
#   - bypass-vpn                        #
#   - bypass-vpn-cleanup                #
#                                       #
# # # # # # # # # # # # # # # # # # # # #

typeset -ga BYPASS_VPN_HOSTS=(
    rdp.domstol.no
    domstol-user.vpn.eon.no
    reddit.com
    gmail.com
    youtube.com
    vg.no
)

function bypass_vpn() {
  local default_gateway=$(netstat -rn -finet | grep default | grep -v 10.29 | tr -s " " | cut -d" " -f2)

  # Add routes for each host's IP addresses
  for host in "${BYPASS_VPN_HOSTS[@]}"; do
    local ips=($(dig +short "$host"))

    for ip in "${ips[@]}"; do
      if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "Adding route for $host ($ip) via $default_gateway"
        sudo route add -host "$ip" "$default_gateway" 2>/dev/null || true
      fi
    done
  done
}

function cleanup_bypass_vpn() {
    echo "Cleaning up bypass VPN routes..."

    for host in "${BYPASS_VPN_HOSTS[@]}"; do
        local ips=($(dig +short "$host"))

        for ip in "${ips[@]}"; do
            if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
                echo "Removing route for $host ($ip)"
                sudo route delete -host "$ip" 2>/dev/null || true
            fi
        done
    done

    echo "Cleanup complete"
}

alias bypass-vpn='bypass_vpn'
alias bypass-vpn-cleanup='cleanup_bypass_vpn'

bypass_vpn
