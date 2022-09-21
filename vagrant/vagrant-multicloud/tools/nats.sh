#!/bin/bash

# THIS SCRIPT CAN RUN BEST ONCE THE VAGRANT VM IS LOADED

apt-get update
apt-get install -y curl unzip

curl -sfL https://github.com/nats-io/nats-server/releases/download/v2.8.4/nats-server-v2.8.4-linux-amd64.zip -o nats-server.zip | sh -

unzip nats-server.zip -d nats-server

rm -rf nats-server.zip

mv -if nats-server/nats-server-v2.8.4-linux-amd64/nats-server /usr/bin
