#!/bin/sh
BASHRC=$HOME/.bashrc;
VENV=$HOME/.venv;
mkdir -p $VENV;
echo "\nexport WORKON_HOME=$VENV\n" >> $BASHRC;
echo ". /usr/share/virtualenvwrapper/virtualenvwrapper.sh\n" >> $BASHRC;
