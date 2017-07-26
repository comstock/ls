#!/bin/bash
# unpack RAR archives
ls -1 *rar > list.txt
while read line
do unrar x $line
done < list.txt
