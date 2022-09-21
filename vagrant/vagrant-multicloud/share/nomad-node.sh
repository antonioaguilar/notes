#!/bin/bash

# export NOMAD_IP="$(hostname -i)"
# export NOMAD_ADDR="http://$(hostname -i):4646"

sudo nomad agent -dev -bind=$(hostname -i) -config=./nomad-node.hcl
