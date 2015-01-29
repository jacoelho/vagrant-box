#!/bin/bash -eux

curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -

echo "deb https://deb.nodesource.com/node $(lsb_release -cs) main" > /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/node $(lsb_release -cs) main" >> /etc/apt/sources.list.d/nodesource.list

apt-get update -qq

apt-get install nodejs

npm install -g yo
npm install -g bower
npm install -g grunt-cli
npm install -g generator-angular