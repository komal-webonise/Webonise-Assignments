#!/bin/bash

host=$(hostname)
echo "The host name of the system i am on : $host " >> assignment.log
echo "" >> assignment.log

uname=$(uname -a)
echo "The tupe and version of opearting system: $uname " >> assignment.log
echo "" >> assignment.log
 
path=$(pwd)
echo "The full path of working directory: $path" >> assignment.log
echo "" >> assignment.log

users_log=$(who)
echo "Users logged on: $users_log" >> assignment.log
echo "" >> assignment.log

group=$(groups)
echo "Groups I belong to : $group" >> assignment.log
echo "" >> assignment.log

list=$(find $HOME -type f)
echo "To list all files in the home directory : $list" >> assignment.log

echo "Date $(date)" >> assignment.log

