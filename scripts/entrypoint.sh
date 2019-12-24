#!/usr/bin/dumb-init /bin/sh

set -x

PATH=/sbin:/bin:/usr/sbin:/usr/bin

PIDFILE=/run/named/named.pid

mkdir -p /run/named
chmod 775 /run/named
chown root:bind /run/named >/dev/null 2>&1 || true

cd /etc/bind
rm named.conf
ln -s data/named.conf .
chown root.root rndc.key

exec /usr/sbin/named -g
