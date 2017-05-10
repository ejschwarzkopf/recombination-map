#/bin/bash
#This script runs LDhat for a sequence of windows corresponding to a designated population and chromsome.
#It was written for a particular file and folder structure, but this version has been modified to be customizable to anyone's needs.
#The "infile" and "outfile" need to be replaced with the file name of your choosing for input and output respectively 

#n: highest window number to be run
#k: lowest window number to be run
#pop: population
#chr: chromosome
#ipath: input path, remember to end it with a /
#opath: output path
#lk: lookup table file
#its: number of iterations
#bpen: block penalty
#samp: sample every samp iterations

while getopts “n:k:pop:chr:ipath:opath:lk:” OPTION
do
  case $OPTION in
    n)
      n=$OPTARG
      ;;
    k)
      k=$OPTARG
      ;;
    pop)
      pop=$OPTARG
      ;;
    chr)
      chr=$OPTARG
      ;;
    ipath)
      ipath=$OPTARG
      ;;
    opath)
      opath=$OPTARG
      ;;
    lk)
      lk=$OPTARG
      ;;
    its)
      its=$OPTARG
      ;;
    bpen)
      bpen=$OPTARG
      ;;
    samp)
      samp=$OPTARG
      ;;
  esac
done


for i in `seq $k $n`; do#run over sequence of windows
  interval -seq ${ipath}filename.${pop}.${chr}.${i}.sites -loc ${ipath}infilename.${pop}.${chr}.${i}.locs -lk $lk -its $its -bpen $bpen -samp $samp #run interval for $its iterations, block penalty of $bpen and sampling every $samp iterations
  mv bounds.txt ${opath}outfilename.${pop}.${chr}.${i}.bounds.txt#move the bounds.txt output file to it's destination
  mv new_lk.txt ${opath}outfilename.${pop}.${chr}.${i}.new_lk.txt#move the new_lk.txt output file to it's destination
  mv rates.txt ${opath}outfilename.${pop}.${chr}.${i}.rates.txt#move the rates.txt output file to it's destination
  mv type_table.txt ${opath}outfilename.${pop}.${chr}.${i}.type_table.txt#move the type_table.txt output file to it's destination
done
