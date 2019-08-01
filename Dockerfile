FROM centos:7
MAINTAINER halukapaydin@gmail.com
LABEL Remarks="Centos 7 nordvpn proxy"
#RUN yum -y install epel-release
#RUN yum -y update
RUN yum -y install openvpn squid iproute
RUN yum -y install https://repo.nordvpn.com/yum/nordvpn/centos/noarch/Packages/n/nordvpn-release-1.0.0-1.noarch.rpm
RUN rpm -v --import https://repo.nordvpn.com/gpg/nordvpn_public.asc
RUN yum -y install nordvpn

#ADD ./scripts/init-nordvpn.service /usr/lib/systemd/system/init-nordvpn.service

#RUN systemctl enable nordvpnd.service
#RUN systemctl enable init-nordvpn.service
#RUN systemctl enable squid

ADD ./scripts/init-nordvpn.sh /scripts/init-nordvpn.sh
RUN chmod 755 /scripts/init-nordvpn.sh
RUN chmod +x /scripts/init-nordvpn.sh

RUN echo "cache deny all" >> /etc/squid/squid.conf

EXPOSE 3128

ENTRYPOINT ["/scripts/init-nordvpn.sh"]

