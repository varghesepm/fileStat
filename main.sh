#!/bin/bash

fParser() {
	STAT=`stat -c "%U:%G %y %n" $1`
	DU=`du -h $1 | awk {'print $1'}`
	echo "$DU $STAT"
}

find ./ -type f -mtime -2  > /tmp/file20.txt


while read f; do
	fParser $f
done < /tmp/file20.txt
