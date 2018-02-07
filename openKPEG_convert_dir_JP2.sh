#!/bin/bash
#
# 1. generate a list of image files in dir
# 2. make a file extension variable
# 3. make a file prefix variable
# 4. generate a jp2 file from each image file
#    keeping the same file prefix
# 5. Output indicators of progress in std out
# 6. Delete list of files
#
# TO DO
# force extensions to lowercase
#
inFILE="fileList.txt"
ls -1 | grep --ignore-case --extended-regexp '(tif$|tiff$|jpg$|jpeg$|png$)' > $inFILE
#
while read line
      do
      EXT=$(echo $line |  grep -o --ignore-case --extended-regexp '[a-z]{3,4}$')
      PRE=$(echo $line | sed --regexp-extended 's/\.'$EXT'//g')
      # do opj_compress -i $line -o $PRE".jp2" -p RLCP -t 1024,1024 -EPH -SOP -OutFor jp2
      opj_compress -i $line -o $PRE".jp2" -p RLCP -t 1024,1024 -EPH -SOP -OutFor jp2 -I -q 42
      echo "Extension = "$EXT
      echo "Prefix = "$PRE
      echo "Line = "$line
done < $inFILE
rm -f $inFILE
