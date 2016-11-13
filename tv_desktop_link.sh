#!/bin/bash
BASEDIR=/home/pepa/TV/dekaf
source $BASEDIR/environment.sh
kaffeine --nofork --lastchannel
/home/pepa/TV/dekaf/update_cron.sh
