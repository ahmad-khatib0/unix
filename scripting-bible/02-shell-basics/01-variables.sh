#!/bin/bash
# e: Exit immediately on error 
# u: Treat unset variables as an error 
# o: -o pipefail (Fail on errors in pipelines) . By default, Bash only returns the exit 
#    status of the last command in a pipeline. This option ensures that the entire pipeline 
#    fails if any command in the pipeline fails. Without this option, a pipeline like 
#    command1 | command2 would only fail if command2 fails, even if command1 fails.
# 
set -euo pipeline

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


