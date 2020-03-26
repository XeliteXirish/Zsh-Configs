# This fixes oh-my-zsh
ZSH_DISABLE_COMPFIX=true

# This sets the users umask
umask 0027

# set PATH so it includes user's private bin directories
export PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.zsh/bin
