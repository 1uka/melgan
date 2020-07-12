# MP4Box -version
cd "musdb"

subsets=( "test" "train" )

for t in "${subsets[@]}"
do
  # encode to AAC
  cd $t;
  mkdir -p "mixture" "drums" "bass" "other" "vocals" 
  for stem in *.stem.mp4;
    do name=`echo $stem | awk -F".stem.mp4" '{$0=$1}1'`;
    echo "$stem";

    ffmpeg -loglevel panic -i "${stem}" -map 0:0 -vn "mixture/${name}_mixture.wav"
    ffmpeg -loglevel panic -i "${stem}" -map 0:1 -vn "drums/${name}_drums.wav"
    ffmpeg -loglevel panic -i "${stem}" -map 0:2 -vn "bass/${name}_bass.wav"
    ffmpeg -loglevel panic -i "${stem}" -map 0:3 -vn "other/${name}_other.wav"
    ffmpeg -loglevel panic -i "${stem}" -map 0:4 -vn "vocals/${name}_vocals.wav"
  done
  cd ..;
done