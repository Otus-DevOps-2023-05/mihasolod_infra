#!/bin/bash
export PATH=$PATH:/home/yc-user/bin:/home/yc-user/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

exit 0
