#!/bin/bash
BASEDIR=/home/pepa/TV/dekaf
date
echo "Computer is going to sleep. We will close TV (if running) and plan the next wakeup."
#DESIRED=$((`date +%s -d '2016-01-09 15:17:30'`))

/usr/bin/pkill kaffeine
source $BASEDIR/get_next_time_extract.sh

# Wake up 60 seconds before the planned recording.
NEXTWAKETIME=`expr $RECTIME - 60`

# Set RTC wakeup time
echo Wake up planned at $NEXTWAKETIME
rtcwake -u -m no -t $NEXTWAKETIME
RC=$?
if [[ $RC != 0 ]]; then echo "Sleep planning unsuccessful."; else echo "Sleep planning successful."; fi

