#!/bin/bash

before=$(ls *.txt)
echo "Files before renaming: $before" >> assignment.log

rename 's/\.txt$/_rename.txt/' *.txt

after=$(ls *.txt) 
echo "Files after renaming: $after" >> assignment.log
echo "" >> assignment.log

date=$(date)
echo "Date and time $date" >> assignment.log
