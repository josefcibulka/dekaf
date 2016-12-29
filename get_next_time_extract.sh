#!/bin/bash
# The time in the database is UTC.
BASEDIR=/home/pepa/TV/dekaf
source $BASEDIR/environment.sh
echo "Recording times in UTC"
echo "select \"Begin\",\"Name\" from RecordingSchedule ORDER BY \"Begin\" asc;" | sqlite3 $KAFFEINEDBFILENAME
PLANTIMES=`echo "select \"Begin\",\"Repeat\" from RecordingSchedule ORDER BY \"Begin\" asc;"| sqlite3 $KAFFEINEDBFILENAME`
echo $PLANTIMES
$BASEDIR/get_next_time.py $NEXTRECTIMEFILENAME $PLANTIMES
RECTIME=`cat $NEXTRECTIMEFILENAME`
rm $NEXTRECTIMEFILENAME`
echo $RECTIME
echo "That is, in local time: `date "+%d.%m.%Y %H:%M:%S" -d @$RECTIME`"
