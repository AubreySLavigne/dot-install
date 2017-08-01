#!/bin/bash

hasProgram() {
    NAME=$1
    WHICH=`which $NAME`
    PAD_LENGTH=7

    if [ -n "$WHICH" ]; then
        EXISTS=True
    else
        EXISTS=False
    fi

    printf '%s' $NAME 
    for ((i = 0; i < ($((PAD_LENGTH - ${#NAME})) ); i++)){ printf "%s" ' '; }
    printf ': %s\n' $EXISTS
}

case $1 in
    'install')
        echo 'Running Install'
        ;;
    'check')
        echo 'Running Check'
        hasProgram git
        hasProgram php
        hasProgram python
        hasProgram vim
        ;;
    *)
        echo 'Usage:'
        echo './dot-install check'
        echo './dot-install install'
        ;;
esac

