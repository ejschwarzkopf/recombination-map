#/bin/bash
#Script that substracts the whole part of the location of the first SNP from all the locations in the file for each window .locs file in a folder
#LDhat needs the input .locs file to start a 0.something

for file in *.locs.*; do #apply on all the window .locs files in the folder
  file_new=$(head -n 1 $file) #take the header to start the new file
  k=$(head -n 2 $file | tail -n 1) #find the location of the first SNP
  for i in `seq 2 2001`; do #runs over all the locations in the file
    n=$(head -n $i $file | tail -n 1) #find the location on the current SNP
    if [ $(echo "${n%.*}-${k%.*}" | bc -l) -eq 0 ]; then #if the current SNP is less than one kb from the first SNP
      n=$(echo "0$n-${k%.*}" | bc -l) #find the difference between the current SNP and the  whole part of the first location
      n=0$n #add a 0 to the beggining of the new location (this is so LDhat will recognize it)
      file_new="$file_new\n$n" #add the current location to the new file
    else #if the current SNP is at least one kb away from the first SNP
      n=$(echo "0$n-${k%.*}" | bc -l) #find the difference between the current SNP and the  whole part of the first location
      file_new="$file_new\n$n" #add the current location to the new file
    fi
  done
  echo -e $file_new > $file #save the new file to the original file
  echo $file #announce which file has last been adjusted
done
