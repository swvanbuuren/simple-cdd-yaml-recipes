#!/bin/sh
git config --global user.name "{{user_fullname}}"
git config --global user.email "{{user_email}}"
git config --global core.editor {{editor}}
git config --global pull.ff only
