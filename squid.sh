#!/bin/sh

cache_dir=$(grep '^cache_dir' /etc/squid/squid.conf | awk '{ print $3 }')

if [ ! -z $cache_dir ]; then
  mkdir -p $cache_dir
  owner set squid $cache_dir || exit 1
  if [ ! -d $cache_dir/00 ]; then
    /usr/sbin/squid -z
  fi
fi

exec /usr/sbin/squid -N $@
