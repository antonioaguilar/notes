#!/bin/bash

# install Docker CE
curl -fsSL get.docker.com -o /tmp/get-docker.sh
sudo sh /tmp/get-docker.sh

sudo usermod -aG docker vagrant
