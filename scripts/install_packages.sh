#!/bin/sh
apt-get -y update
apt-get install --no-install-recommends -y {{packages}}
