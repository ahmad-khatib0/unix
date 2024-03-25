#!/bin/bash

# display user information from the system.
echo "user info for the user id: $USER"

echo UID: $UID

echo Home $HOME

echo "The cost of the item is $15"  # ->> will print 5 , because $1 is undefined and 5 will be string
$ echo "The cost of the item is \$15"

days=10
guest="Katie"
echo "$guest checked in $days days ago"
days=5
guest="Jessica"

echo "$guest checked in $days days ago"

# Command substitution
testing=$(date +%y-%m-%d)
echo "The date and time are: " $testing


