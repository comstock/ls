#!/bin/bash
# Generate a listing of files and directories
# Send the listing directly to AWK
# Generate a file that includes a listing
# for each directory, and the directory's size
# and a listing of files within the directory,
# sorted largest to smallest.
#
# BUG : When a name includes a blank space it will think the name spans multiple columns
#
ls -l --human-readable -S --quote-name --recursive --no-group * | awk '{
if($8 ~ /\".*/)
print $4 "\t" $8 " " $9 " " $10 " " $11 " " $12 " " $13 " " $14 " " $15 " " $16 " " $17 " " $18 " " $19 " " $20 " " $21 " " $22 " " $23 " " $24;
#else if($3 == "comstock")
#print $4 "\t" $8;
else
print $0;}' > directory_listing.txt;
#cat ./directory_listing.txt | less

