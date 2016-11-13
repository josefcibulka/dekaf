#!/bin/bash
# sudo vim /etc/pm/sleep.d/66_dekaf
BASEDIR=/home/pepa/TV/dekaf
source $BASEDIR/environment.sh
$BASEDIR/sleep_run.sh >> $LOGTVFILENAME 2>&1 
exit 0
