# Had to be done
alias fucking='sudo'
alias reload='echo "Reloading ZSH file now..." && source $ZDOTDIR/.zshrc'

# General
alias ping='ping -c 5'
alias drives='df -h'
alias c='clear'

# Custom Vim
alias vimInstall='echo "Installing custom vim config" && sh -c "$(curl -fsSL https://raw.githubusercontent.com/realshaunoneill/Vim-Configs/master/install.sh)"'
alias vimUpdate='echo "Updating custom Vim Config" && cd $HOME/.vim && git pull'

# Create and move into a new directory
cdm() {
    mkdir "$@" && cd "$@" 
}

# Nginx
alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'

# Resume wget
alias wget='wget -c'

alias tn='tmux new-session -s'                                # tmux new session
alias ta='tmux attach -t'                                     # tmux attach
alias tl='tmux ls'                                            # list
alias tk='tmux kill-session -s'                               # kill session

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1    ;;
      *.tar.gz) tar xzf $1    ;;
      *.bz2)    bunzip2 $1    ;;
      *.rar)    rar x $1    ;;
      *.gz)   gunzip $1   ;;
      *.tar)    tar xf $1   ;;
      *.tbz2)   tar xjf $1    ;;
      *.tgz)    tar xzf $1    ;;
      *.zip)    unzip $1    ;;
      *.Z)    uncompress $1 ;;
      *)      echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Git 
alias gadd='git add .'
alias gpush='git push'
gcomp() {
    git add . && git commit -m "$@" && git push
}

# Open ports
alias ports-o='sudo lsof -i -P -n | grep LISTEN'

# Transmission (Assuming username and password = transmission
alias tlist='transmission-remote -n "transmission:transmission" -l'
alias tstats='transmission-remote -n "transmission:transmission" -st'
alias tfullstats='transmission-remote -n "transmission:transmission" -si'
alias tstopall='transmission-remote -n "transmission:transmission" -S'
alias tstartall='transmission-remote -n "transmission:transmission" -s'
alias tadd='transmission-remote -n "transmission:transmission" -a'

# Ngrok
alias ngrok-h='$ZDOTDIR/bin/ngrok http'
alias ngrok-sh='$ZDOTDIR/bin/ngrok http -auth "admin:admin"'
alias ngrok-tcp='$ZDOTDIR/bin/ngrok tcp'

# Tmux session
alias tm-save='echo "Saving.." && $ZDOTDIR/bin/tmux-session save'
alias tm-restore='echo "Restoring.." && $ZDOTDIR/bin/tmux-session restore'

# Imgur Uploader
alias upload='$ZDOTDIR/bin/imgur.sh'

# YT Downloader
alias ytdl='$ZDOTDIR/bin/youtube-dl --external-downloader axel --external-downloader-args "-n 10 -a" --add-metadata --geo-bypass'