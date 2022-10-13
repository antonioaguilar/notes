#!/bin/bash

# install Docker CE
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh

sudo sh /tmp/get-docker.sh

usermod -aG docker vagrant

newgrp docker
