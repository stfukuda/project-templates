#!/bin/sh

# Git
add-apt-repository ppa:git-core/ppa
apt-get update
apt-get upgrade
apt-get install -y git

# Curl
apt-get install -y curl

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# Nodejs
nvm install --lts
nvm use --lts

# Commitizen
npm i -g npm git-cz
