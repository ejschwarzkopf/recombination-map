#/bin/bash
#Script that adds 0.0001 to all the locations in the file for a window .locs file
#LDhat needs the input .locs file to start a 0.something (can't start at 0.0000)

file=$1
file_new=$(head -n 1 $file) #take the header to start the new file
for i in `seq 2 2001`; do #runs over all the locations in the file
  n=$(head -n $i $file | tail -n 1) #find the location on the current SNP
  if [ $(echo "${n%.*}" | bc -l) -eq 0 ]; then #if the current SNP is less than one kb from the first SNP
    n=$(echo "0$n+0.0001" | bc -l) #add 0.0001 to the location of the current SNP
    n=0$n #add a 0 to the beggining of the new location (this is so LDhat will recognize it)
    file_new="$file_new\n$n" #add the current location to the new file
  else #if the current SNP is at least one kb away from the first SNP
    n=$(echo "0$n+0.0001" | bc -l) #add 0.0001 to the location of the current SNP
    file_new="$file_new\n$n" #add the current location to the new file
  fi
done
echo -e $file_new > $file #save the new file to the original file
echo $file #announce which file has last been adjusted
