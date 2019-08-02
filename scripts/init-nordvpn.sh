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

ERROR=$(nordvpn login -u $VPN_USERNAME -p $VPN_PASSWORD 2>&1 > /dev/null)

if [[ ! -z "$ERROR" ]]
then
      echo "$ERROR"
      exit 0
fi

ERROR=$(nordvpn connect $VPN_COUNTRY 2>&1 > /dev/null)

if [[ ! -z "$ERROR" ]]
then
      echo "$ERROR"
      exit 0
fi

squid &

$@