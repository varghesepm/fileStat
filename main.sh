#!/bin/bash

# colorize output heading
RED='\033[0;31m'
NC='\033[0m' # No Color

# get file details and print
statPrinter() {
	STAT=`stat -c "\t\t|%U:%G \t\t|%.19z \t|%n" $1`
	DU=`du -h $1 | awk {'print $1'}`
	printf "$DU $STAT\n"
}

# find files with mtime -15 and write its result into a file
find ./ -type f -mtime -15  > /tmp/file20.txt

# read file
while read f; do
	awk 'BEGIN{ printf "'${RED}'%s\t\t'${NC}'| '${RED}'%s\t\t\t'${NC}'| '${RED}'%s\t\t\t'${NC}'| '${RED}'%s'${NC}'","Size", "Owner","mtime","Filename"} END { print "" }'
        statPrinter $f
done < /tmp/file20.txt
