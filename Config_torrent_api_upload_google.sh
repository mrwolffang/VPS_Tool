#!/bin/bash
apt-get install unzip
apt-get install -y apache2
wget http://download-new.utorrent.com/endpoint/utserver/os/linux-x64-ubuntu-13-04/track/beta/ -O utorrent.tar.g
tar -zxvf utorrent.tar.gz -C /opt/
chmod 777 /opt/utorrent-server-alpha-v3_3/
ln -s /opt/utorrent-server-alpha-v3_3/utserver /usr/bin/utserver
utserver -settingspath /opt/utorrent-server-alpha-v3_3/ &
mkdir /var/www/html/complete
chown -R mrwolffang:mwolffang mrwolffang
chown -R mrwolffang:mwolffang /var/www/html/complete
chmod -R 777 /var/www/html/complete
ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
printf "%b" $ip ":8080/gui/web/index.html\n"