#!/bin/bash
kaffeine --nofork --lastchannel
#/usr/bin/pgrep kaffeine
#KAFFRUNNING=$?
#while [ $KAFFRUNNING -eq 0 ]; do
#  sleep 5
#  /usr/bin/pgrep kaffeine
#  KAFFRUNNING=$?
#done
/home/pepa/TV/dekaf/update_cron.sh
#kaffeine %U --lastchannel
