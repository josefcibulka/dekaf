#!/bin/bash
# The time in the database is UTC.
BASEDIR=/home/pepa/TV/dekaf
FILENAME=/home/pepa/.kde/share/apps/kaffeine/sqlite.db
FILENAMENEXTREC=/tmp/nextrec.txt
echo "Recording times in UTC"
echo "select \"Begin\",\"Name\" from RecordingSchedule ORDER BY \"Begin\" asc;" | sqlite3 $FILENAME
PLANTIMES=`echo "select \"Begin\",\"Repeat\" from RecordingSchedule ORDER BY \"Begin\" asc;"| sqlite3 $FILENAME`
echo $PLANTIMES
$BASEDIR/get_next_time.py $FILENAMENEXTREC $PLANTIMES
RECTIME=`cat $FILENAMENEXTREC`
echo $RECTIME
echo "That is, in local time: `date "+%d.%m.%Y %H:%M:%S" -d @$RECTIME`"
