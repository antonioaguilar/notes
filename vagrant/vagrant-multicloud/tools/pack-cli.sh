#!/bin/bash

add-apt-repository -y ppa:cncf-buildpacks/pack-cli
apt-get update
apt-get install pack-cli
