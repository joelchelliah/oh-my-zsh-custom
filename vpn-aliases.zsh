#!/bin/zsh

# Kommandoen er kjørt inni en subshell `()` for å kunne detache fra terminal sesjonen.
# Dette er nødvendig i noen terminaler for at `--background` optionen ikke skal lukke tabben.
function vpn-up() {
  (set -eo pipefail

  onepassword_secret="DAEK - TEST"
  username=daekjch

  echo "\n⏳Starting VPN...\n"

  # Ta bort `>/dev/null 2>&1` for å debugge feil
  printf "%s\n%s" "$(op item get $onepassword_secret --fields password)" "$(op item get $onepassword_secret --otp)" \
    | sudo openconnect --passwd-on-stdin --background --user=$username https://domstol-user.vpn.eon.no/utv/ >/dev/null 2>&1

  while ! netstat -rn | grep 10.242 &> /dev/null; do
    sleep 1
  done

  netstat -rn \
    | grep 10.242 \
    | tr -s " " \
    | cut -f 2 -d " " \
    | head -n 1 \
    | xargs sudo route add 10.242.0.0/16

  echo "\n🛰️  VPN is up!")
  return
}

function vpn-down() {
  # Ta bort `>/dev/null 2>&1` for å debugge feil
  sudo pkill -2 openconnect >/dev/null 2>&1
  # Fjerner dns
  sudo networksetup -setdnsservers Wi-Fi "Empty" >/dev/null 2>&1
  # Fjerner route for domstol-user.vpn.eon.no
  sudo route delete 62.148.32.252 >/dev/null 2>&1

  echo "🔪 VPN is down!"
  return
}
