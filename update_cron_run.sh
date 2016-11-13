#!/bin/bash
BASEDIR=/home/pepa/TV/dekaf
source $BASEDIR/environment.sh
date
echo "Updating cron."
source $BASEDIR/environment.sh
crontab -l > $CRONORIGFILENAME
crontab -l | grep -v "$BASEDIR/start_tv.sh" > $CRONTMPFILENAME
source $BASEDIR/get_next_time_cron.sh
set -f # forbid bash expansion of the asterisk
echo $RECTIMECRON >> $CRONTMPFILENAME
set +f
if diff $CRONTMPFILENAME $CRONORIGFILENAME >/dev/null ; then 
 echo "No change in crontab"
else
  echo "New crontab is different. Updating crontab."
  crontab $CRONTMPFILENAME
fi
rm $CRONORIGFILENAME $CRONTMPFILENAME
