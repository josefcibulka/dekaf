#!/bin/bash
# The time in the database is UTC.
# We first subtract 60 seconds to get RECTIMEUTC.
# The python script below transforms it to RECTIME in local time.
FILENAME=/home/pepa/.kde/share/apps/kaffeine/sqlite.db
echo "Recording times in UTC"
echo "select \"Begin\" \"Name\" from RecordingSchedule ORDER BY \"Begin\" asc;" | sqlite3 $FILENAME
NEXTTIME=`echo "select \"Begin\" from RecordingSchedule ORDER BY \"Begin\" asc limit 1;"| sqlite3 $FILENAME`
TIME=`echo $NEXTTIME | sed 's/T/ / ; s/ZZ//'`
echo "Using $TIME"
TIMENUM=`date "+%s" -d "$TIME"`
RECTIMEUTC=`expr $TIMENUM - 60`
RECTIME=$(python <<END
import time, calendar; print calendar.timegm(time.localtime($RECTIMEUTC))
END
)
#echo $TIME $TIMENUM $RECTIMEUTC $RECTIME
echo "That is, in local time: `date "+%d.%m.%Y %H:%M:%S" -d @$RECTIME`"
echo $RECTIME
