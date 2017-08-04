#!/bin/bash

hasProgram() {

    # EXISTS = $1
    WHICH=$2

    eval $1="0"
    if [ -n "$WHICH" ]; then
        eval $1="1"
    fi
}

echoHasProgram() {
    local NAME=$1
    local WHICH=`which $NAME`
    local PAD_LENGTH=7

    # EXISTS = hasProgram WHICH
    hasProgram EXISTS $WHICH

    printf '%s' $NAME 
    for ((i = 0; i < ($((PAD_LENGTH - ${#NAME})) ); i++)){ printf "%s" ' '; }
    printf ': %s\n' $EXISTS
}


# Run the Requested Command
case $1 in
    'install')
        echo 'Running Install'

        # Pull personal vimrc
        git clone https://github.com/AubreySLavigne/vim-config ~/.vim
        cd ~/.vim
        git submodule update --init

        # Local Configurations
        touch ~/.vimrc
        echo 'so ~/.vim/vimrc' > ~/.vimrc

        ;;
    'check')
        echo 'Running Check'
        echoHasProgram ctags
        echoHasProgram git
        echoHasProgram php
        echoHasProgram python
        echoHasProgram vim
        ;;
    *)
        echo 'Usage:'
        echo './dot-install check'
        echo './dot-install install'
        ;;
esac

