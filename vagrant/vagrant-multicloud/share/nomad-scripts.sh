#!/bin/bash

export NOMAD_ADDR=http://vm-10.io:4646

nomad status -address=http://vm-10.io:4646

nomad node status

nomad server members

nomad agent-info
