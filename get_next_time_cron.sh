#!/bin/bash
BASEDIR=/home/pepa/TV/dekaf
source $BASEDIR/get_next_time_extract.sh
set -f # forbid bash expansion of the asterisk
RECTIMEONLY=`date "+%M %H %d %m *" -d @$RECTIME`
RECTIMECRON="$RECTIMEONLY $BASEDIR/start_tv.sh"
set +f
