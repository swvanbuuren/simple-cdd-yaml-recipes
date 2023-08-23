#!/bin/sh
apt-get update
apt-get install --no-install-recommends -y docker.io
groupadd docker
usermod -aG docker {{username}}
