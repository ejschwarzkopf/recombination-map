#!/bin/bash
#This script takes hotspot file output from LDhot and fixes the positions of the hotspots to correct for the window that it's in. It runs an entire chromosome at a time

pop=$1 #gets population from the first user input
chr=$2 #gets chromosome number from the second user input
n=$3 #gets total number of windows from the third user input
filename=$4

echo $chr
  cp ${filename}.${pop}.${chr}.0.hotspots.txt ${filename}.${pop}.${chr}.hotspots.txt #Copies window 0 straight to the output, since this window doesn't require changes in positions (also, we get the header for the output)

for i in `seq 1 $((n-1))`; do #run across all the windows
  cp ${filename}.${pop}.${chr}.${i}.hotspots.txt ${filename}.tmp.txt #copy the window to the file we're going to play with
  cut -f 1 ${filename}.tmp.txt > ${filename}.tmp1.txt #get the first column (has a position)
  cut -f 2 ${filename}.tmp.txt > ${filename}.tmp2.txt #(has a position)
  cut -f 3 ${filename}.tmp.txt > ${filename}.tmp3.txt #(is just in the way)
  cut -f 4 ${filename}.tmp.txt > ${filename}.tmp4.txt #(has a position)
  cut -f 5 ${filename}.tmp.txt > ${filename}.tmp5.txt #(has a position)
  cut -f 6-10 ${filename}.tmp.txt > ${filename}.tmp6.txt #(just has the rest of it)
  
  j=$(((1500*$i)+2))
  k=$(head -n $j ${filename}.${pop}.${chr}.locs | tail -n 1 | cut -f 1 -d .)
  echo $k  

  awk -v k="$k" '{print $0 + k}' ${filename}.tmp1.txt > ${filename}.tmp7.txt #adds
  awk -v k="$k" '{print $0 + k}' ${filename}.tmp2.txt > ${filename}.tmp8.txt # "
  awk -v k="$k" '{print $0 + k}' ${filename}.tmp4.txt > ${filename}.tmp9.txt # "
  awk -v k="$k" '{print $0 + k}' ${filename}.tmp5.txt > ${filename}.tmp10.txt # "
  
  paste ${filename}.tmp7.txt ${filename}.tmp8.txt ${filename}.tmp3.txt ${filename}.tmp9.txt ${filename}.tmp10.txt ${filename}.tmp6.txt | tail -n +2 >> ${filename}.${pop}.${chr}.hotspots.txt #copies the modified window (without the header) into the end of the output
    
  rm ${filename}.tmp1.txt ${filename}.tmp2.txt ${filename}.tmp3.txt ${filename}.tmp4.txt ${filename}.tmp5.txt ${filename}.tmp6.txt ${filename}.tmp7.txt ${filename}.tmp8.txt ${filename}.tmp9.txt ${filename}.tmp10.txt
done

cp ${filename}.${pop}.${chr}.${n}.hotspots.txt ${filename}.tmp.txt

cut -f 1 ${filename}.tmp.txt > ${filename}.tmp1.txt #get the first column (has a position)
cut -f 2 ${filename}.tmp.txt > ${filename}.tmp2.txt #(has a position)
cut -f 3 ${filename}.tmp.txt > ${filename}.tmp3.txt #(is just in the way)
cut -f 4 ${filename}.tmp.txt > ${filename}.tmp4.txt #(has a position)
cut -f 5 ${filename}.tmp.txt > ${filename}.tmp5.txt #(has a position)
cut -f 6-10 ${filename}.tmp.txt > ${filename}.tmp6.txt #(just has the rest of it)


k=$(tail -n 2000 ${filename}.${pop}.${chr}.locs | head -n 1 | cut -f 1 -d .)
echo $k

awk -v k="$k" '{print $0 + k}' ${filename}.tmp1.txt > ${filename}.tmp7.txt #adds
awk -v k="$k" '{print $0 + k}' ${filename}.tmp2.txt > ${filename}.tmp8.txt # "
awk -v k="$k" '{print $0 + k}' ${filename}.tmp4.txt > ${filename}.tmp9.txt # "
awk -v k="$k" '{print $0 + k}' ${filename}.tmp5.txt > ${filename}.tmp10.txt # "

paste ${filename}.tmp7.txt ${filename}.tmp8.txt ${filename}.tmp3.txt ${filename}.tmp9.txt ${filename}.tmp10.txt ${filename}.tmp6.txt | tail -n +2 >> ${filename}.${pop}.${chr}.hotspots.txt #copies the modified window (without the header) into the end of the output

rm ${filename}.tmp1.txt ${filename}.tmp2.txt ${filename}.tmp3.txt ${filename}.tmp4.txt ${filename}.tmp5.txt ${filename}.tmp6.txt ${filename}.tmp7.txt ${filename}.tmp8.txt ${filename}.tmp9.txt ${filename}.tmp10.txt