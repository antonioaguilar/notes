#!/bin/bash

VERSION="1.15.6"
OS="linux"
ARCH="amd64"
wget -q https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz

tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

chown -R vagrant:vagrant /usr/local/go

mkdir ~/.go

rm -rf ./go$VERSION.$OS-$ARCH*
