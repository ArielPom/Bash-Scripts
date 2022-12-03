#!/usr/bin/env bash

if [ ! -f "symbols.txt" ]; then
	echo "symbols.txt file was not found"
	exit
fi

if [ -f "email.txt" ]; then
	rm email*
fi

yahoo_api="https://query1.finance.yahoo.com/v7/finance/quote?lang=en-US&region=US&corsDomain=finance.yahoo.com"

<< comment
***not in use on this version***

modules=(symbol marketState regularMarketPrice regularMarketChange / 
	regularMarketChangePercent preMarketPrice preMarketChange preMarketChangePercent / 
	postMarketPrice postMarketChange postMarketChangePercent)

	symbols=$@
comment
	
fields=regularMarketChangePercent

echo "program is now looking for :"
for i in `cat symbols.txt`
do
	echo "                            ** $i" 
done 

while true; do

	for i in `cat symbols.txt`
	do
		result=`curl -s "$yahoo_api&fields=$fields&symbols=$i"`
    	result=$(echo $result | grep -o -P "$fields\":[-]*[0-9]+.[0-9]+")
    	old="regularMarketChangePercent\":"
    	new=""
    	result=$(echo $result | sed "s/$old/$new/")
    	
    	echo -n "$i $result "
    	
    	if (( $(echo "$result > 5" |bc -l) )); then
    		message="New Alert , Stock $i is now up $result %"
    		echo $message > email.txt
    		echo "sending mail"
    		sendmail basharipomer@gmail.com < email.txt
    	fi
    	
    	if (( $(echo "$result < -5" |bc -l) )); then
    		message="New Alert , Stock $i is now down $result %"
    		echo $message > email.txt
    		echo -n "sending mail"
    		sendmail basharipomer@gmail.com < email.txt
    	fi
    done
   
    echo 
    echo "sleeping 60 seconds"
    echo 
	
    sleep 10
done 
