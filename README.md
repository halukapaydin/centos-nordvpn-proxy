# centos-nordvpn-proxy
This is a NordVPN client and Squid proxy (no cache) and centos 7 docker container.

## Building image
```
> git clone https://github.com/halukapaydin/centos-nordvpn-proxy.git
> cd centos-nordvpn-proxy
> docker build -t "halukapaydin/centos-nordvpn-proxy" .
```
## Starting an instance
```
> docker run --privileged -tid --device=/dev/net/tun --dns=8.8.8.8 
    -p 3128:3128 -p 1022:22 
    -e VPN_USERNAME=abc@xyz.com 
    -e VPN_PASSWORD=password 
    -e VPN_COUNTRY=Turkey 
    -e ROOT_PASSWORD=12345 
    -d halukapaydin/centos-nordvpn-proxy`
```
## Environment variables
  * `VPN_USERNAME`     - User for NordVPN account.
  * `VPN_PASSWORD`     - Password for NordVPN account.
  * `VPN_COUNTRY`     - Use servers from an specific country [full list] (https://api.nordvpn.com/v1/servers/countries)
  * `ROOT_PASSWORD`     - Password for root.  

## Testing
```
> curl -L "http://iplocation.com" -x "http://127.0.0.1:3128"
```

## Connection to container
```
> ssh root@127.0.0.1 -p 1022
```


