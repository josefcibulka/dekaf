#!/bin/bash
USERNAME=pepa
BASEDIR=/home/pepa/TV/timerec
date
echo "Computer is going to sleep. We will close TV (if running) and plan the next wakeup."
#DESIRED=$((`date +%s -d '2016-01-09 15:17:30'`))

/usr/bin/pkill kaffeine
source $BASEDIR/get_next_time.sh

# Set RTC wakeup time
echo Wake up planned at $RECTIME
rtcwake -u -m no -t $RECTIME 
RC=$?
if [[ $RC != 0 ]]; then echo "Sleep planning unsuccessful."; else echo "Sleep planning successful."; fi

