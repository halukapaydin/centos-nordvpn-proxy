#!/bin/bash

touch log.txt

SSH_ROOTPASS=${ROOT_PASSWORD}
echo -e "$SSH_ROOTPASS\n$SSH_ROOTPASS" | (passwd --stdin root)
echo ssh root password: $SSH_ROOTPASS

mkdir /scripts/vpn-config

touch /scripts/vpn-config/username.conf
echo ${VPN_USERNAME} > /scripts/vpn-config/username.conf

touch /scripts/vpn-config/password.conf
echo ${VPN_PASSWORD} > /scripts/vpn-config/password.conf

touch /scripts/vpn-config/country.conf
echo ${VPN_COUNTRY} > /scripts/vpn-config/country.conf

exec "$@"
