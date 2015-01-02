#!/bin/bash -eux

apt-get update -qq
 
apt-get install -y git build-essential kernel-package fakeroot libncurses5-dev linux-headers-$(uname -r)
