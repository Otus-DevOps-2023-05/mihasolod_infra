#!/bin/bash
export PATH=$PATH:/home/yc-user/bin:/home/yc-user/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

sudo apt install -y git

cd /home/yc-user

git clone -b monolith https://github.com/express42/reddit.git

cd reddit

bundle install

puma -d

exit 0
