#!/bin/bash

# install openshift CLI tool

wget -q https://github.com/openshift/origin/releases/download/v3.9.0/openshift-origin-client-tools-v3.9.0-191fece-linux-64bit.tar.gz

tar zxvf ./openshift-origin-client-tools-v3.9.0-191fece-linux-64bit.tar.gz

cp ./openshift-origin-client-tools-v3.9.0-191fece-linux-64bit/oc /usr/local/bin

rm -rf ./openshift-origin-client-tools-v3.9.0-191fece-linux-64bit*
