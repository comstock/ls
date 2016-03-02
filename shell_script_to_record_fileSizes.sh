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
if($8 ~ /\".*[.\.\s{1,3}].*\"/)
print $4 "\t" $8;
#else if($3 == "comstock")
#print $4 "\t" $8;
else
print $0;}'
# uncomment to save output to file# > directory_listing.txt
