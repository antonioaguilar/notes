#!/bin/bash

nomad agent -bind=$(hostname -i) -config=./client.hcl
