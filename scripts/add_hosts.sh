#!/bin/sh
ALIASES="{{aliases}}"
for item in $ALIASES; do
    IFS='|' read -r ip_address hostname <<-_EOF_
$item
_EOF_
    echo "$ip_address    $hostname" >> /etc/hosts
done
