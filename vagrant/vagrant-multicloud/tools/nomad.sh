#!/bin/bash

apt-get install -y wget zip

# install nomad
wget -q https://releases.hashicorp.com/nomad/0.8.3/nomad_0.8.3_linux_amd64.zip
unzip nomad_0.8.3_linux_amd64.zip
mv ./nomad /usr/local/bin
rm -rf nomad_0.8.3_linux_amd64.zip
nomad -autocomplete-install
