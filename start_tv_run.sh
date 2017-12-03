#!/bin/bash
BASEDIR=/home/pepa/TV/dekaf
source $BASEDIR/environment.sh
date
echo "Starting TV as" $USERNAME
echo $USERHOME
export XAUTHORITY=$USERHOME/.Xauthority
echo $XAUTHORITY
export DISPLAY=":0"
$KAFFEINEEXECUTABLE --lastchannel 
