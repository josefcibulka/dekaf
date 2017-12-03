#!/bin/bash
BASEDIR=/home/pepa/TV/dekaf
source $BASEDIR/environment.sh
date
echo "Computer is going to sleep. We will close TV (if running) and plan the next wakeup."

/usr/bin/pkill kaffeine
source $BASEDIR/get_next_time_extract.sh

$BASEDIR/update_cron.sh

# Wake up 60 seconds before the planned recording.
NEXTWAKETIME=`expr $RECTIME - 60`

# Set RTC wakeup time
echo Wake up planned at $NEXTWAKETIME
rtcwake -u -m no -t $NEXTWAKETIME
RC=$?
if [[ $RC != 0 ]]; then echo "Sleep planning unsuccessful."; else echo "Sleep planning successful."; fi

