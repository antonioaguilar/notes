#!/bin/bash

export NATS_CLI_VERSION="0.0.35"

apt-get update
apt-get install -y curl unzip

curl -sfL https://github.com/nats-io/natscli/releases/download/v$NATS_CLI_VERSION/nats-$NATS_CLI_VERSION-linux-amd64.zip -o nats-cli.zip | sh -

unzip nats-cli.zip -d nats-cli

rm -rf nats-cli.zip

mv -if nats-cli/nats-$NATS_CLI_VERSION-linux-amd64/nats /usr/bin

rm -rf /home/vagrant/nats-cli
