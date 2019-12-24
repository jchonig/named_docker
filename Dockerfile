FROM ubuntu:latest

MAINTAINER Jeffrey Honig <jch@honig.net>

RUN rm -rf /etc/apt/apt.conf.d/docker-gzip-indexes \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \ 
 && DEBIAN_FRONTEND=noninteractive apt-get install -y bind9 bind9-host dnsutils dumb-init \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 53/udp 53/tcp

VOLUME /etc/bind/data

ADD scripts/entrypoint.sh /

CMD /entrypoint.sh
