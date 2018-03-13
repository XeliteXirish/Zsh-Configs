#!/bin/bash
sudo apt-key list | \
grep "expired: " | \
sed -ne 's|pub .*/\([^ ]*\) .*|\1|gp' | \
xargs -n1 sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys
