#!/bin/bash

apt-get update

apt-get install -y zip

curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip -q awscliv2.zip

chown -R vagrant:vagrant ./aws

./aws/install --update

rm -rf ./aws ./awscliv2.zip
