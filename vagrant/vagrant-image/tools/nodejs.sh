#!/bin/bash

# install NVM
curl -s -k -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

nvm install --lts
nvm use --lts
nvm alias default $(node -v)
