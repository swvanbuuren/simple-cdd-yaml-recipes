#!/bin/sh
apt-get -y update
apt-get remove -y {{ packages if packages is string else " ".join(packages) }}
