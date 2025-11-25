#!/bin/sh
USERNAME={{username}}
python3 -m pip completion --bash >> /home/${USERNAME}/.profile
