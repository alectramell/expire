#!/bin/bash

clear

ACTIVE="true"

clear

green=$(tput setaf 2)
red=$(tput setaf 1)
reset=$(tput sgr0)

clear

STATUS=$(curl -s https://raw.githubusercontent.com/alectramell/expire/master/status.txt)

clear

EXPIRATION() {

	if [ $STATUS != 1 ]
	then
		echo "..${red}EXPIRED${reset}.." | pv -qL 10
		sleep 10
		clear
		bash $(pwd)/expire.sh
	else
		echo "..${green}ACTIVE${reset}.." | pv -qL 10
		sleep 10
		clear
		bash $(pwd)/expire.sh
	fi	
}

while [ $ACTIVE = "true" ]
do
	EXPIRATION
done
