# centos-nordvpn-proxy
This is a NordVPN client, Squid proxy server(no cache) and Centos 7 docker image.

## Building image
```
> git clone https://github.com/halukapaydin/centos-nordvpn-proxy.git
> cd centos-nordvpn-proxy
> docker build -t "halukapaydin/centos-nordvpn-proxy" .
```
## Starting an instance

```
> cat .env
VPN_USERNAME=test@test.com
VPN_PASSWORD=password
VPN_COUNTRY=Turkey
```

```
> docker run 
    -tid 
    --privileged 
    --device=/dev/net/tun 
    --dns=8.8.8.8 
    -p 3128:3128 -p 1022:22 
    --env-file=.env 
    halukapaydin/centos-nordvpn-proxy bash` 
```
## Environment variables
  * `VPN_USERNAME`     - User for NordVPN account.
  * `VPN_PASSWORD`     - Password for NordVPN account.
  * `VPN_COUNTRY`     - Use servers from an specific country [full list] (https://api.nordvpn.com/v1/servers/countries)

## Testing
```
> curl -L "http://iplocation.com" -x "http://127.0.0.1:3128"
```


