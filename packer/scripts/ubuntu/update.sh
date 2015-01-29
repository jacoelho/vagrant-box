#!/bin/bash -eux

UBUNTU_VERSION=`lsb_release -r | awk '{print $2}'`

# update package index on boot
cat <<EOF > /etc/init/refresh-apt.conf
description "update package index"
start on networking
task
exec /usr/bin/apt-get update
EOF

printf 'APT::Get::Assume-Yes "true";\nAPT::Install-Recommends "false";\n' > /etc/apt/apt.conf.d/99-defaults

cat <<EOF > /etc/locale.gen
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
EOF

cat <<EOF > /etc/environment
export DEBIAN_FRONTEND=noninteractive
export UBUNTU_VERSION=$UBUNTU_VERSION
EOF

locale-gen en_US.UTF-8
dpkg-reconfigure locales

# Update the package list
apt-get update

# Upgrade all installed packages incl. kernel and kernel headers
apt-get upgrade linux-server linux-headers-server

# ensure the correct kernel headers are installed
apt-get install linux-headers-$(uname -r)
