#!/bin/bash

export HOME=/home/vagrant
export USER=vagrant

curl -fsSL https://get.pulumi.com | sh

rm -rf ~/pulumi*

echo 'export PATH=$PATH:$HOME/.pulumi/bin' >> /home/vagrant/.bashrc
