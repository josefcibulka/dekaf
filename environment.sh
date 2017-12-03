BASEDIR=/home/pepa/TV/dekaf
# Do not use USERHOME=$HOME, because some of the scripts are run by cron, not the current user.
USERHOME=/home/pepa
KAFFEINEEXECUTABLE=/usr/local/bin/kaffeine
KAFFEINEUSER=pepa
CRONTMPFILENAME=$BASEDIR/cron_new.txt
CRONORIGFILENAME=$BASEDIR/cron_orig.txt
export KAFFEINEDBFILENAME=/home/pepa/.kde/share/apps/kaffeine/sqlite.db
NEXTRECTIMEFILENAME=/tmp/nextrec.txt
# Use /dev/null if not interested in logs.
LOGTVFILENAME=$BASEDIR/tvlog.txt
LOGCRONFILENAME=$BASEDIR/cronupdatelog.txt
sudo -u $KAFFEINEUSER touch $LOGTVFILENAME $LOGCRONFILENAME
# Change owner and group in case the files were created earlier by root.
chown $KAFFEINEUSER $LOGTVFILENAME $LOGCRONFILENAME
chgrp $KAFFEINEUSER $LOGTVFILENAME $LOGCRONFILENAME
