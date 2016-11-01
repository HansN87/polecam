#!/usr/bin/env bash

# set job details

# frequency of capture. [freq=1 means capture image every 1 minutes] 
freq=2

# time of daily data transfer to SPADE. [hour=17 (0-23), min=0 (0-59) means transfer happens 5pm]
hour=18
min=33

# fraction of images to be transferred. [frac=3 means every third image gets transferred to SPADE]
frac=3

# basedir of image storage
basedir="/root/polecam/images"

# spadedir
spadedir="/root/polecam/tarfiles"



# do not change below 

if [ ! -d "$basedir" ]; then
   echo "*** file error: directory "$basedir" does not exist. No jobs scheduled!"
   exit 1
fi

if [ ! -d "$spadedir" ]; then
   echo "*** file error: directory "$spadedir" does not exist. No jobs scheduled!"
   exit 1
fi

echo "MAILTO=\"\"" > .contab
echo "*/$freq * * * * /bin/sh $PWD/capture_frame.sh $basedir > /dev/null 2>&1" >> .crontab
echo "MAILTO=\"\"" >> .contab
echo "$min $hour * * * /bin/sh $PWD/transfer.sh $basedir $spadedir $frac /dev/null 2>&1" >> .crontab
crontab .crontab







