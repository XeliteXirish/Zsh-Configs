
#NVM Installer
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.9/install.sh | bash
nvm install node
nvm use node

# NPM Global Packages

packages="pm2 pageres-cli"

npm i -g $packages
