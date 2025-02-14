#!/usr/bin/env python
import os
import re
import subprocess
import sys
from datetime import datetime

WIRELESS_INTERFACE = 'en0'    # could be different on other systems
TUNNEL_INTERFACE = 'utun2'

VPN_NETS = [
    "10.94.36",
    "10.242.133"
]

VPN_HOSTS = [
#     '10.94.36.24',    # ocp.test.domstol.no
#     '10.94.36.25',    # ocp.at.domstol.no
#     '10.242.133.104', # domstolatsql107.at.domstol.no
]


def get_tunnel_interface():
    # Get last utun interface.
    for line in reversed(subprocess.check_output(["ifconfig"]).decode("utf-8").splitlines()):
        match = re.match(r"(utun\d)", line)
        if match:
            interface = match.groups(1)[0]

            if get_protocols(interface) == ["inet"]:
                return interface

def get_protocols(interface):
    lines = subprocess.check_output(["ifconfig", interface]).decode("utf-8").splitlines()

    protocols = [line.strip().split(" ")[0] for line in lines[1:]]

    return protocols

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

    print("\nResetting routes with gateway " + gateway + "\n")
    subprocess.call(
        ("route", "-n", "delete", "default", "-ifscope", WIRELESS_INTERFACE)
    )
    subprocess.call(
        ("route", "-n", "delete", "-net", "default", "-iface", tunnel_interface)
    )
    subprocess.call(("route", "-n", "add", "-net", "default", gateway))

    current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"\n[{current_time}] Adding routes for addresses which should go through VPN:\n")

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
