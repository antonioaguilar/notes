#!/bin/bash

apt-get update
apt-get remove liblivemedia-dev
apt-get install -y make cmake gcc g++ libssl-dev libpthread-stubs0-dev build-essential 
