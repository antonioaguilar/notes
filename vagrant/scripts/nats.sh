#!/bin/bash

export NATS_VERSION="v2.9.3"

apt-get update
apt-get install -y curl unzip

curl -sfL https://github.com/nats-io/nats-server/releases/download/$NATS_VERSION/nats-server-$NATS_VERSION-linux-amd64.zip -o nats-server.zip | sh -

unzip nats-server.zip -d nats-server

rm -rf nats-server.zip

mv -if nats-server/nats-server-$NATS_VERSION-linux-amd64/nats-server /usr/bin
