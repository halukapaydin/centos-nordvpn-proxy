#!/bin/bash
docker run --privileged -tid  -v /sys/fs/cgroup:/sys/fs/cgroup:ro --cap-add=SYS_ADMIN --device=/dev/net/tun --dns=8.8.8.8 -p 3128:3128 -p 1022:22 -e VPN_USERNAME=vpn@agmlab.com -e VPN_PASSWORD=vpnagm135 -e VPN_COUNTRY=Germany -e ROOT_PASSWORD=12345 -d halukapaydin/centos-nordvpn-proxy