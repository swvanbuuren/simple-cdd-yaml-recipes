#!/bin/sh
USER="{{username}}"
DEFGROUPS="{{ groups if groups is string else ",".join(groups) }}"
for group in $(echo $DEFGROUPS | tr ',' ' '); do
    if ! /bin/egrep  -i "^$group" /etc/group ; then
       groupadd $group
    fi
done
usermod -a -G ${DEFGROUPS} ${USER}
