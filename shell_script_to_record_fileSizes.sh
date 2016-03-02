ls -l -h -S -R -G * | awk '{if ($3 == "comstock")
print $4 "\t" $8;
else if(print $0):}'
