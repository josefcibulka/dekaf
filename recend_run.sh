#!/bin/bash
# Run "sudo visudo" and add at the end "username  ALL = NOPASSWD: /usr/sbin/pm-suspend"
# Alternatively, see comments near the line sudo pm-suspend
BASEDIR=/home/pepa/TV/dekaf
date
whoami
sleep 2
$BASEDIR/update_cron.sh
sleep 1
echo "Recording has finished. TV will be shut down."
/usr/bin/pkill kaffeine
RC=$?
if [ $RC -eq 0 ]; then echo "TV shutdown successful."; else echo "Warning: TV shutdown unsuccessful."; fi
$BASEDIR/countdown.py 60 "Nahrávání TV skončilo" "Nahrávání TV skončilo. Počítač se uspí za " " sekund. Cancel nechá počítač vzhůru a OK ho uspí hned."
RC=$?
date
if [ $RC -eq 1 ]; then 
  echo "Sleep cancelled by the user."
else 
  echo "Going to sleep"
  sudo pm-suspend
#  Another possibilities that do not require running "sudo visudo":
#  a) Write here the actual password (not recommended).
#  echo password | sudo -S pm-suspend
#  b) The following should work without any password.
#  dbus-send --system --print-reply   --dest="org.freedesktop.login1"   /org/freedesktop/login1   org.freedesktop.login1.Manager.Suspend boolean:true
  RC=$?
  if [ $RC -eq 0 ]; then echo "Sleep successful."; else echo "Warning: Sleep unsuccessful."; fi
fi
