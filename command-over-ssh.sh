#!/bin/bash
# Author - Graham McMillan
# Date - 13/01/2020
# Usage ./command-over-ssh.sh <serverlist> <user> <password> <command>

pass="$3"
user="$2"
command="$4"

# Read serverlist file and run expect script
for server in $(cat $1);
do
  expect <<- END
  log_user 1
  set timeout 30
  spawn ssh -t $user@$server "$command"
  sleep 2
  expect "*?assword:"
  send "$pass\r"
  sleep 2
  expect "$"
  sleep 2
END
done
