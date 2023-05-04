#!/bin/bash

if [ "$#" == "0" ]; then
    echo "You need tu supply at least one argument!"
    exit 1
fi

DOMAINS=( '.com' '.io' '.app' '.dev' )

ELEMENTS=${#DOMAINS[@]}

while (( "$#" )); do

  for (( i=0;i<$ELEMENTS;i++)); do
      whois $1${DOMAINS[${i}]} | egrep -q \
      '^No match|^NOT FOUND|^Not fo|AVAILABLE|^No Data Fou|has not been regi|No entri|Domain not found'
	  if [ $? -eq 0 ]; then
	    echo -e "$1${DOMAINS[${i}]}\t available"
	  else
      echo -e "$1${DOMAINS[${i}]}\t not available"
    fi
  done

shift

done
