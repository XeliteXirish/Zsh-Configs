#!/usr/bin/env zsh
zmodload zsh/datetime

#Initial Checks
whence git > /dev/null || return 0
[[ -w $ZDOTDIR ]] || return 0
target_days=$UPDATE_ZSH_DAYS
if [[ -z "$target_days" ]]; then
    target_days=10
fi

function _current_time() {
    echo $(( $EPOCHSECONDS / 60 / 60 / 24 ))
}

function _update_time() {
    echo "LAST_TIME=$(_current_time)" > $ZDOTDIR/.zshupdate
}

function upgrade_zsh() {
    cd $ZDOTDIR
    git pull origin master
    cd $OLDPWD
    _update_time
}

if [ -f $ZDOTDIR/.zshupdate ]; then
    source $ZDOTDIR/.zshupdate
    if [ -z "$LAST_TIME" ]; then
        _update_time && return 0
    fi
    _diff=$(($(_current_time) - $LAST_TIME))
    if [ $_diff -gt $target_days ]; then
        upgrade_zsh
    fi
else
    _update_time
fi
