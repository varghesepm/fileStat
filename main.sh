#!/bin/bash

# colorize output heading
RED='\033[0;31m'
NC='\033[0m' # No Color

# print file stats
statPrinter() {
	STAT=`stat -c "\t\t|%U:%G \t\t|%.19z \t|%n" $1`
	DU=`du -h $1 | awk {'print $1'}`
	printf "$DU $STAT\n"
}

# find files with mtime -15 and write its result into a file
find ./ -type f -mtime -15  > /tmp/file20.txt

#heading
printf "${RED}%s\t\t${NC}|${RED}%s\t\t\t${NC}|${RED}%s\t\t\t${NC}|${RED}%s${NC}\n" "Size" "Owner" "mtime" "Filename"
#awk 'BEGIN{ printf "'${RED}'%s\t\t'${NC}'| '${RED}'%s\t\t\t'${NC}'| '${RED}'%s\t\t\t'${NC}'| '${RED}'%s'${NC}'\n","Size", "Owner","mtime","Filename"'}

# read file
while read f; do
        statPrinter $f
done < /tmp/file20.txt
