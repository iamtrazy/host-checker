#!/bin/sh

while IFS= read -r LINE; do
	HOST=$(printf $LINE)
	jq '.outbounds[0].streamSettings.xtlsSettings.serverName = "'"$HOST"'"' config.json > config.tmp.json
	xray -c config.tmp.json >/dev/null 2>&1 & PIDX=$(printf $!)
	sleep 1
	timeout -s KILL 3 httping -c 1 -s -x localhost:2080 -5 -l -G -g https://1.1.1.1:443 | grep "200 OK" && printf "$HOST\tWorking Host\n" >> log.txt || printf "$HOST\tFuck !!\n" >> log.txt
	kill $PIDX
done < "$1"
