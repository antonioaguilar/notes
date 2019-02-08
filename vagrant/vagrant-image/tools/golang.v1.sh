#!/bin/bash

export GOLANG="1.10.2"

sudo apt-get update
sudo apt-get -y install curl git make binutils bison gcc build-essential

bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

source /home/vagrant/.gvm/scripts/gvm

gvm install go1.4 -B;

gvm use "go1.4" --default;

export GOROOT_BOOTSTRAP=$GOROOT;

gvm install go$GOLANG -B;

gvm use "go$GOLANG" --default;
