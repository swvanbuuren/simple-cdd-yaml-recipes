#!/bin/sh
HOME_DIR=/home/{{username}}
BASHRC=${HOME_DIR}/.bashrc
VENV=${HOME_DIR}/.venv
mkdir -p $VENV
cat >> $BASHRC << EOL

export WORKON_HOME=$VENV
. /usr/share/virtualenvwrapper/virtualenvwrapper.sh

EOL
