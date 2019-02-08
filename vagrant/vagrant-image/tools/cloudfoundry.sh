#!/bin/bash

# configure registry for Cloud Foundry
wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add -

echo "deb http://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list

# update list
apt-get update

apt-get install -y apt-transport-https

# install Cloud Foundry CLI
apt-get install -y cf-cli
