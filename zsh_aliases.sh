# Had to be done
alias fucking='sudo'
alias reload='echo "Reloading ZSH file now..." && source $ZDOTDIR/.zshrc'
alias zsh-update='upgrade_zsh' // Updates zsh from github
alias sudo='sudo ' // So can run aliases with sudo

# General
alias ping='ping -c 5'
alias drives='df -h'
alias c='clear'

# Custom Vim
alias vimInstall='echo "Installing custom vim config" && sh -c "$(curl -fsSL https://raw.githubusercontent.com/XeliteXirish/Vim-Configs/master/install.sh)"'
alias vimUpdate='echo "Updating custom Vim Config" && cd $HOME/.vim && git pull'

alias ports='netstat -tulanp'
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'

cdm() {
    mkdir "$@" && cd "$@" 
}

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -i'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# update on one command
alias update='sudo apt-get update && sudo apt-get upgrade'

# Nginx
alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'

# Proc Info
## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias service-status='sudo services --status-all'

## Get server cpu info ##
alias cpuinfo='lscpu'

## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

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
alias ngrok-h='$ZDOTDIR/scripts/ngrok http'
alias ngrok-sh='$ZDOTDIR/scripts/ngrok http -auth "admin:admin"'
alias ngrok-tcp='$ZDOTDIR/scripts/ngrok tcp'

# Git Leaks
alias gitleaks='$ZDOTDIR/scripts/gitleaks'
alias gitleaks-u='$ZDOTDIR/scripts/gitleaks -u'
alias gitleaks-org='$ZDOTDIR/scripts/gitleaks -o'

# Quick Scan
alias quick-scan='$ZDOTDIR/scripts/quick-scan.sh'

# Tmux session
alias tm-save='echo "Saving.." && $ZDOTDIR/scripts/tmux-session save'
alias tm-restore='echo "Restoring.." && $ZDOTDIR/scripts/tmux-session restore'

# Update all apt keys
alias update-keys='$ZDOTDIR/scripts/updateKeys.sh'

# Plex Bot
alias plexbot='sudo $ZDOTDIR/scripts/plexbot.sh'

# Imgur Uploader
alias upload='$ZDOTDIR/scripts/imgur.sh'

# Speed Test
alias speedtest='$ZDOTDIR/scripts/speedtest-cli'

# Asciinema
alias asciinema='python3 -m asciinema'
alias record='python3 -m asciinema rec'
alias play='python3 -m asciinema play'

# YT Downloader
alias ytdl='$ZDOTDIR/scripts/youtube-dl --external-downloader axel --external-downloader-args "-n 10 -a" --add-metadata --geo-bypass'

