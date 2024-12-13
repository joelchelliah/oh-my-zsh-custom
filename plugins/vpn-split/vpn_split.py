#!/usr/bin/env python
import os
import re
import subprocess
import sys

WIRELESS_INTERFACE = 'en0'    # could be different on other systems
TUNNEL_INTERFACE = 'utun2'

VPN_NETS = [
]

VPN_HOSTS = [
    '10.94.36.24',  # ocp.test.domstol.no
    '10.94.36.25',  # ocp.at.domstol.no
]


def get_tunnel_interface():
    # Get last utun interface.
    for line in reversed(subprocess.check_output(["ifconfig"]).decode("utf-8").splitlines()):
        match = re.match(r"(utun\d)", line)
        if match:
            return match.groups(1)[0]


def split_vpn_traffic():
    if os.getuid() != 0:
        sys.exit("Please, run this command with sudo.")

    gateway = None
    tunnel_interface = get_tunnel_interface()
    out = subprocess.check_output(("netstat", "-nrf", "inet"))
    routes = out.decode("utf-8").split("\n")[3:]

    for route in routes:
        route = route.split()
        interface = route[3]
        if interface == WIRELESS_INTERFACE:
            gateway = route[1]
            break

    if gateway is None:
        sys.exit("Unable to determine VPN default gateway.")

    print("Resetting routes with gateway " + gateway)
    subprocess.call(
        ("route", "-n", "delete", "default", "-ifscope", WIRELESS_INTERFACE)
    )
    subprocess.call(
        ("route", "-n", "delete", "-net", "default", "-iface", tunnel_interface)
    )
    subprocess.call(("route", "-n", "add", "-net", "default", gateway))

    print("\nAdding routes for addresses which should go through VPN.")
    for addr in VPN_NETS:
        subprocess.call(
            ("route", "-n", "add", "-net", addr, "-iface", tunnel_interface)
        )
    for addr in VPN_HOSTS:
        subprocess.call(
            ("route", "-n", "add", "-host", addr, "-iface", tunnel_interface)
        )


if __name__ == "__main__":
    split_vpn_traffic()
