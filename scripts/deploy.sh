#!/bin/bash
export PATH=$PATH:/home/yc-user/bin:/home/yc-user/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

apt install -y git

cd /home/ubuntu

git clone -b monolith https://github.com/express42/reddit.git

cd reddit

bundle install

mv /tmp/puma.service /etc/systemd/system/puma.service

systemctl start puma

systemctl enable puma

exit 0
