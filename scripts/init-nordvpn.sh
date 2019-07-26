#!/bin/bash

touch log.txt

sysctl -w net.ipv6.conf.all.disable_ipv6=1 >> log.txt
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >> log.txt
sysctl -w net.ipv6.conf.tun0.disable_ipv6=1 >> log.txt

nordvpn set protocol tcp >> log.txt
nordvpn set obfuscate on  >> log.txt

VPN_USERNAME=$(cat /scripts/vpn-config/username.conf)
VPN_PASSWORD=$(cat /scripts/vpn-config/password.conf)
VPN_COUNTRY=$(cat /scripts/vpn-config/country.conf)

#nordvpn login -u ${VPN_USERNAME} -p ${VPN_PASSWORD}  >> log.txt

#nordvpn connect ${VPN_COUNTRY} >> log.txt


