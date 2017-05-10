#/bin/bash
#This script runs LDhat for a sequence of windows corresponding to a designated population and chromsome.
#It was written for a particular file and folder structure, but this version has been modified to be customizable to anyone's needs.
#The "infile" and "outfile" need to be replaced with the file name of your choosing for input and output respectively 

n=$1#highest window number to be run
pop=$2#population
chr=$3#chromosome
k=$4#lowest window number to be run
ipath=$5#input path, remember to end it with a /
opath=$6#output path
lkpath=$7#lookup table path

for i in `seq $k $n`; do#run over sequence of windows
  interval -seq ${ipath}filename.${pop}.${chr}.${i}.sites -loc ${ipath}infilename.${pop}.${chr}.${i}.locs -lk ${lkpath}lk_${pop} -its 100000000 -bpen 5 -samp 10000 #run interval for 100 million iterations, block penalty of 5 and sampling every 10 thousand iterations
  mv bounds.txt ${opath}outfilename.${pop}.${chr}.${i}.bounds.txt#move the bounds.txt output file to it's destination
  mv new_lk.txt ${opath}outfilename.${pop}.${chr}.${i}.new_lk.txt#move the new_lk.txt output file to it's destination
  mv rates.txt ${opath}outfilename.${pop}.${chr}.${i}.rates.txt#move the rates.txt output file to it's destination
  mv type_table.txt ${opath}outfilename.${pop}.${chr}.${i}.type_table.txt#move the type_table.txt output file to it's destination
done
