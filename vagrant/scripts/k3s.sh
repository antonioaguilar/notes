#!/bin/bash

# THIS SCRIPT CAN RUN BEST ONCE THE VAGRANT VM IS LOADED

curl -sfL https://get.k3s.io | sh -

service k3s stop

chown -R vagrant:vagrant /var/lib/rancher/k3s
