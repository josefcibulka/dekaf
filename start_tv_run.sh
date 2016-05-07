#!/bin/bash
date
echo "Starting TV"
export XAUTHORITY="/home/pepa/.Xauthority"
export DISPLAY=":0"
/usr/local/bin/kaffeine --lastchannel 
