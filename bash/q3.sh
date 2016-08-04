#!/bin/bash

before=$(ls x*.txt)
echo "Files starting with x before renaming: $before" >> assignment.log

rename 's/\.txt$/_rename.txt/' x*.txt

after=$(ls x*.txt)
echo "Files after  renaming: $after" >> assignment.log
echo "" >> assignment.log

date=$(date)
echo "Date and time $date" >> assignment.log