#!/bin/bash

apt-get install -y wget zip

# install consul
wget -q https://releases.hashicorp.com/consul/1.1.0/consul_1.1.0_linux_amd64.zip
unzip consul_1.1.0_linux_amd64.zip
mv ./consul /usr/local/bin
rm -rf consul_1.1.0_linux_amd64.zip
