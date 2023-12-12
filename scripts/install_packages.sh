#!/bin/sh
apt-get -y update
apt-get install --no-install-recommends -y {{ packages if packages is string else " ".join(packages) }}
