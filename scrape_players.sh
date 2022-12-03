#!/bin/bash

#delete previous results
rm player_results.csv

wget https://www.premierleague.com/players
grep -o -P "players\/[0-9]+\/[a-zA-Z\-]+\/overview" players >  urls.txt
sed -i "s/players/https:\/\/www\.premierleague\.com\/players/" urls.txt
t=`grep -c ".*" urls.txt`

echo "Total Players: $t,," >> player_results.csv
for i in `cat urls.txt`
do
	wget -O player_source.txt $i
	t=`grep -c -i "midfielder" player_source.txt`
	if [[ $t -gt 0 ]]
	then
		echo "$i, midfielder, $t" >> player_results.csv
	fi
done

#delete temporary files
rm urls*
rm players*
rm player_source*
