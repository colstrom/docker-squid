#!/bin/sh

track() {
  log=$1
  if [ ! -z $log ]; then
    touch $log
    owner set squid $log || exit 1
    tail -F $log &
  fi
}

cache_dir=$(grep '^cache_dir' /etc/squid/squid.conf | awk '{ print $3 }')

if [ ! -z $cache_dir ]; then
  mkdir -p $cache_dir
  owner set squid $cache_dir || exit 1
  if [ ! -d $cache_dir/00 ]; then
    /usr/sbin/squid -z
  fi
fi

track $(grep '^cache_log' /etc/squid/squid.conf | awk '{ print $2 }')
track $(grep '^access_log' /etc/squid/squid.conf | awk '{ print $2 }' | cut -d : -f 2)

exec /usr/sbin/squid -N $@
