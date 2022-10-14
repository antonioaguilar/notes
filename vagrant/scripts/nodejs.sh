#!/bin/bash

export NVM_VERSION="v0.39.1"

# install NVM
curl -s -k -o- https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash

nvm install --lts && nvm use --lts && nvm alias default $(node -v)
