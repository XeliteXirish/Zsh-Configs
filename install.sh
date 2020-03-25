#!/usr/bin/env bash

# Check the OS version
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ $machine = "Linux" ]; then 
echo "Running installation for Linux...."

    sudo apt install zsh screenfetch
    touch $HOME/.zsh && touch $HOME/.zcompdump
    rm -rf $HOME/.zsh* && rm -rf $HOME/.zcompdump*
    git clone https://github.com/realshaunoneill/Zsh-Configs.git $HOME/.zsh
    echo "export ZDOTDIR=\$HOME/.zsh" > $HOME/.zshenv
    echo "source \$ZDOTDIR/.zshenv" >> $HOME/.zshenv
    chsh -s $(which zsh)
    zsh

elif [ $machine = "Mac" ]; then 
echo "Running installation for Mac...."

    brew install zsh screenfetch
    touch $HOME/.zsh && touch $HOME/.zcompdump
    rm -rf $HOME/.zsh* && rm -rf $HOME/.zcompdump*
    git clone https://github.com/realshaunoneill/Zsh-Configs.git $HOME/.zsh
    echo "export ZDOTDIR=\$HOME/.zsh" > $HOME/.zshenv
    echo "source \$ZDOTDIR/.zshenv" >> $HOME/.zshenv
    chsh -s $(which zsh)
    zsh

else echo "Exiting install... Unsupported OS: ${machine}"
fi