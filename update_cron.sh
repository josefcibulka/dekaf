#!/bin/bash
BASEDIR=/home/pepa/TV/dekaf
source $BASEDIR/environment.sh
# Make sure to run as the user (KAFFEINEUSER), not root.
sudo -u $KAFFEINEUSER $BASEDIR/update_cron_run.sh >> $LOGCRONFILENAME 2>&1 &
