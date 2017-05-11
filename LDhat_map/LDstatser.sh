#!/bin/bash
#this script runs stat from LDhat on a series of windows for an indicated population and chromosome
#It was written for a particular file and folder structure, but this version has been modified to be customizable to anyone's needs.
#The "infile" and "outfile" need to be replaced with the file name of your choosing for input and output respectively 

#m: highest window number to be run
#k: lowest window number to be run
#pop: population
#chr: chromosome
#ipath: input path, remember to end it with a /
#opath: output path, remember to end it with a /
#b: burn-in for analysis

k=0

while getopts “pop:chr:k:m:” OPTION
do
  case $OPTION in
    pop)
      pop=$OPTARG
      ;;
    chr)
      chr=$OPTARG
      ;;
    k)
      k=$OPTARG
      ;;
    m)
      m=$OPTARG
      ;;
    ipath)
      ipath=$OPTARG
      ;;
    opath)
      opath=$OPTARG
      ;;
    b)
      opath=$OPTARG
      ;;
  esac
done


cd ${ipath}#move to the folder where the window files are


for i in `seq $k $m`; do#run over the indicated window numbers
  stat -input ${ipath}filename.${pop}.${chr}.${i}.rates.txt -burn ${b}#runs stats on the $i-eth window with a $b burn-in
  mv res.txt ${opath}outfilename.${pop}.${chr}${i}.res.txt#moves res.txt to its destination
done
cd ..

