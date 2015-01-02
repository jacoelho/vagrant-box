#!/bin/bash -eux

apt-get install -q -y curl 

curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-Linux-x86_64 > /usr/local/bin/fig

chmod +x /usr/local/bin/fig

