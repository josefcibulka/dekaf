#!/bin/bash
BASEDIR=/home/pepa/TV/dekaf
source $BASEDIR/environment.sh
date
echo "Starting TV"
echo $USERHOME
export XAUTHORITY=$USERHOME/.Xauthority
echo $XAUTHORITY
export DISPLAY=":0"
$KAFFEINEEXECUTABLE --lastchannel 
