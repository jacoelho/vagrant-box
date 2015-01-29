#!/bin/bash -eux

echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main > /etc/apt/sources.list.d/brightbox.list

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6

apt-get update -qq

echo "gem: --no-ri --no-rdoc --bindir /usr/local/bin" > /etc/gemrc

apt-get install -y --no-install-recommends ruby2.1 ruby2.1-dev

gem2.1 install rake bundler

apt-get install -y --no-install-recommends \
  libxml2-dev \
  libxslt1-dev \
  imagemagick \
  libmagickwand-dev \
  libmysqlclient-dev \
  libsqlite3-dev \
  libpq-dev \
  libcurl4-openssl-dev \
  zlib1g-dev \
