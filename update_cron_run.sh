#!/bin/bash
date
echo "Updating cron."
BASEDIR=/home/pepa/TV/dekaf
TMPFILENAME=$BASEDIR/cron_new.txt
ORIGCRONFILENAME=$BASEDIR/cron_orig.txt
crontab -l > $ORIGCRONFILENAME
crontab -l | grep -v "$BASEDIR/start_tv.sh" > $TMPFILENAME
source $BASEDIR/get_next_time_cron.sh
set -f # forbid bash expansion of the asterisk
echo $RECTIMECRON >> $TMPFILENAME
set +f
if diff $TMPFILENAME $ORIGCRONFILENAME >/dev/null ; then 
 echo "No change in crontab"
else
  echo "New crontab is different. Updating crontab."
  crontab $TMPFILENAME
fi
rm $ORIGCRONFILENAME $TMPFILENAME
