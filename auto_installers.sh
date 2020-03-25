
#NVM Installer
if ! type "nvm" > /dev/null; then
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.9/install.sh | bash
    nvm install node
    nvm use node
fi

# NPM Global Packages
packages="pm2 pageres-cli trash-cli"

npm i -g $packages