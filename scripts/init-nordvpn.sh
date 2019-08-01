#!/bin/bash

nordvpn set protocol tcp
nordvpn set obfuscate on
nordvpn whitelist add port 22
nordvpn whitelist add port 3128

export $(xargs --null --max-args=1 echo < /proc/1/environ | grep "VPN_")

echo "username : $VPN_USERNAME , password : $VPN_PASSWORD, country : $VPN_COUNTRY"
nordvpn login -u $VPN_USERNAME -p $VPN_PASSWORD
nordvpn connect $VPN_COUNTRY


