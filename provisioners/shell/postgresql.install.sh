#!/bin/bash

postgresql_version=9.4

# Postgresql
if ! command -v psql; then
    # Update package list to be able to install Postgresql 9.4 
    # Resource: http://www.unixmen.com/install-postgresql-9-4-phppgadmin-ubuntu-14-10/
    echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' > /etc/apt/sources.list.d/pgdg.list
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
    apt-get update

    apt-get install -y postgresql-client-$postgresql_version \
                       postgresql-$postgresql_version \
                       postgresql-contrib-$postgresql_version \
                       libpq-dev;
fi