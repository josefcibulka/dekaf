#!/bin/bash
BASEDIR=/home/pepa/TV/dekaf
source $BASEDIR/environment.sh
/home/pepa/TV/dekaf/update_cron_run.sh >> /home/pepa/TV/dekaf/cronupdatelog.txt 2>&1 &
