#!/bin/sh
USERNAME={{username}}
apt-get update
apt-get install --no-install-recommends -y docker.io docker-cli
groupadd docker
usermod -aG docker $USERNAME
