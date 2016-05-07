#!/bin/bash
BASEDIR=/home/pepa/TV/timerec
source $BASEDIR/get_next_time_extract.sh
export DISPLAY=""
/usr/bin/pgrep kaffeine
KAFFRUNNING=$?
[ `expr $RECTIME + 120` -lt `date "+%s"` ]
NEEDUPDATE=$?
if [ $NEEDUPDATE -eq 0 ]; then
    date
  if [ $KAFFRUNNING -eq 0 ]; then 
    echo "WARNING: Kaffeine is running, but the next scheduled time is in the past. This is strange."
  else
    echo "Recording time is in the past." 
    export DISPLAY=":0.0"
    $BASEDIR/countdown.py 6000 "Je potřeba spustit TV" "Nahrávání TV bylo zřejmě ukončeno předčasně. Aby se počítač probudil před dalším nahráváním, je potřeba TV na chvilku zapnout v době po plánovaném konci nahrávání. Tato zpráva zmizí za " " sekund, nebo po zmačknutí Cancel nebo OK." &
# Starting kaffeine to update scheduled recording times."
#    export DISPLAY=":0.0"
#    /usr/local/bin/kaffeine --channel JustBlackScreen
#    sleep 20
#    killall kaffeine
#    date
#    echo "Kaffeine was started and killed. Rereading recording time."
#    source $BASEDIR/get_next_time_extract.sh
  fi
fi
echo $RECTIME
