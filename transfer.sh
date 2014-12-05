# do not change. adjust parameters in schedule.sh

basedir=$1
spadedir=$2
frac=$3

date_str=$(date +"%m%d%Y")
dir=$basedir"/"$date_str

currentdir=$PWD
cd $dir

counter=0
imagelist=""

for f in *.jpg
do
   let counter=$counter+1
   if [ $(($counter%$frac)) == 0 ] 
   then
      imagelist="$imagelist $f" 
   fi
done

tar -cvf "$date_str.tar" $imagelist
cd $PWD
mv "$dir/$date_str.tar" "$spadedir/$date_str.tar"


