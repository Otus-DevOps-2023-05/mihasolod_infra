#!/bin/bash
yc compute instance create \
  --name reddit-full \
  --hostname reddit-full \
  --create-boot-disk name=reddit-full-1690220528,image-id=fd85f2si5a0vaoqhot5q \
  --ssh-key ~/.ssh/appuser.pub \
  --public-ip
