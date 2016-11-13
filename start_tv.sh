#!/bin/bash
BASEDIR=/home/pepa/TV/dekaf
source $BASEDIR/environment.sh
$BASEDIR/start_tv_run.sh >> $LOGTVFILENAME 2>&1 &
