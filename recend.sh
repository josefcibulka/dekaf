#!/bin/bash
BASEDIR=/home/pepa/TV/dekaf
source $BASEDIR/environment.sh
$BASEDIR/recend_run.sh >> $LOGTVFILENAME 2>&1 &
