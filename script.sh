#!/usr/bin/env bash

date_str=$(date +"%m%d%Y")
time_str=$(date +"%T")
hour=$(echo ${time_str%%:*})
min=$(echo ${time_str%:*})
min=$(echo ${min#*:})
sec=$(echo ${time_str##*:})
filename=$hour$min$sec".jpg"

dir=$PWD"/"$date_str
if [ ! -d "$dir" ]; then
   mkdir $dir
fi

touch $dir"/"$filename


