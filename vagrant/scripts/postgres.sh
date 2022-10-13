#!/bin/bash

# Install postgres 14

apt-get update

apt-get install -y wget curl nano tree git net-tools ncdu htop zip

sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list';

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

apt-get -y update

apt-get install -y postgresql-14

apt-get install -y pgcli
