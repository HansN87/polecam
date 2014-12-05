# do not change. set parameters in schedule.sh

basedir=$1

date_str=$(date +"%m%d%Y")
time_str=$(date +"%T")
hour=$(echo ${time_str%%:*})
min=$(echo ${time_str%:*})
min=$(echo ${min#*:})

filename=$hour$min".jpg"
dir=$basedir"/"$date_str

if [ ! -d "$dir" ]; then
   mkdir $dir
fi

mplayer tv:// -tv driver=v4l2:device=/dev/video0:norm=NTSC:width=720:height=480:fps=1 -vo jpeg:outdir=$dir -frames 1
#ffmpeg -f v4l2 -video_size 720x480 -i /dev/video0 -vframes 1 $dir"/00000001.jpg"

mv $dir"/00000001.jpg" "$dir/$filename"

exit 0

