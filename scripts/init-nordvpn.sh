#!/bin/bash

nordvpnd &

nordvpn set protocol tcp
nordvpn set obfuscate on
nordvpn whitelist add port 22
nordvpn whitelist add port 3128

if [[ -z "$VPN_USERNAME" ]]
then
      echo "\$VPN_USERNAME is empty"
      exit 0
fi

if [[ -z "$VPN_PASSWORD" ]]
then
      echo "\$VPN_PASSWORD is empty"
      exit 0
fi

if [[ -z "$VPN_COUNTRY" ]]
then
      echo "\$VPN_COUNTRY is empty"
      exit 0
fi

echo "username : $VPN_USERNAME , password : $VPN_PASSWORD, country : $VPN_COUNTRY"
nordvpn login -u $VPN_USERNAME -p $VPN_PASSWORD
nordvpn connect $VPN_COUNTRY

squid &

$@