#!/bin/bash -eux

apt-get install \
  kernel-package \
  fakeroot \
  libncurses5-dev \
  linux-headers-$(uname -r)
