#!/bin/bash

consul agent \
-data-dir=/home/vagrant/.consul \
-node=vm-11 \
-bind=$(hostname -i) \
-client=$(hostname -i) \
-enable-script-checks=true \
-config-dir=/home/vagrant/share/consul-client.json
