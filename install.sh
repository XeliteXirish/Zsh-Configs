#!/usr/bin/env bash
sudo apt install zsh archey
touch $HOME/.zsh && touch $HOME/.zcompdump
rm -rf $HOME/.zsh* && rm -rf $HOME/.zcompdump*
git clone https://github.com/XeliteXirish/Zsh-Configs.git $HOME/.zsh
echo "export ZDOTDIR=\$HOME/.zsh" > $HOME/.zshenv
echo "source \$ZDOTDIR/.zshenv" >> $HOME/.zshenv
chsh -s $(which zsh)
zsh
