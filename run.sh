#!/bin/bash
docker run --hostname vpn-proxy --privileged -tid --device=/dev/net/tun --dns=8.8.8.8 -p $1:3128 --env-file=.env halukapaydin/centos-nordvpn-proxy bash