#nohup parallel --jobs 8 < download.sh &
cd taxonomy
parallel --jobs 8 < ../scripts/download.sh
