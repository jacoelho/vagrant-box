#!/bin/bash -eux

export DEBIAN_FRONTEND=noninteractive

# enable memory and swap cgroup
perl -p -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/g'  /etc/default/grub
/usr/sbin/update-grub

curl -s https://get.docker.io/gpg | apt-key add -

echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list

apt-get update -qq

apt-get install --force-yes lxc-docker

usermod -a -G docker vagrant

ln -sf /usr/bin/docker.io /usr/local/bin/docker
