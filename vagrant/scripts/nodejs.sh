#!/bin/bash

export NVM_VERSION="v0.39.3"

# install NVM
curl -s -k -o- https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash

source /home/vagrant/.bashrc

nvm install --lts && nvm use --lts && nvm alias default $(node -v)
