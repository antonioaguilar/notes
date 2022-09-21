#!/bin/bash

export NOMAD_ADDR=http://$(hostname -i):4646

nomad agent -bind=$(hostname -i) -config=./server.hcl
