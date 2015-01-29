#!/bin/bash -eux

echo deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main > /etc/apt/sources.list.d/pgdg.list

wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

apt-get update -qq

apt-get install -y postgresql-9.4
