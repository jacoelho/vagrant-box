#!/bin/bash -eux

echo deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main > /etc/apt/sources.list.d/pgdg.list

curl -s  https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

apt-get update -qq

apt-get install postgresql-9.4

pg_createcluster 9.4 main --encoding=UTF-8

sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'postgres';"

cat > /etc/postgresql/9.4/main/pg_hba.conf <<PG_HBA
#type  database    user    address     auth-method
host   all         all     all         trust
PG_HBA
