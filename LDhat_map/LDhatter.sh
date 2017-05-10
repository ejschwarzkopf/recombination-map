#/bin/bash
#This script runs LDhat for a sequence of windows corresponding to a designated population and chromsome.
#It was written for a particular file and folder structure, but this version has been modified to be customizable to anyone's needs.

n=$1#highest window number to be run
pop=$2#population
chr=$3#chromosome
k=$4#lowest window number to be run
ipath=$5#input path
opath=$6#output path
lkpath=$7#lookup table path

for i in `seq $k $n`; do#run over sequence of windows
  interval -seq ${ipath}filename.${pop}.${chr}.${i}.sites -loc ${ipath}filename.${pop}.${chr}.${i}.locs -lk ${lkpath}lk_${pop} -its 100000000 -bpen 5 -samp 10000 #run interval for 100 million iterations, block penalty of 5 and sampling every 10 thousand iterations
  mv bounds.txt /data/cornejo/projects/e.jimenezschwarzkop/Cacao/data/$pop/chr$chr/cacao.phased.chr$chr.vcf.$pop.ids.ldhat.ldhat.$i.bounds.txt
  mv new_lk.txt /data/cornejo/projects/e.jimenezschwarzkop/Cacao/data/$pop/chr$chr/cacao.phased.chr$chr.vcf.$pop.ids.ldhat.ldhat.$i.new_lk.txt
  mv rates.txt /data/cornejo/projects/e.jimenezschwarzkop/Cacao/data/$pop/chr$chr/cacao.phased.chr$chr.vcf.$pop.ids.ldhat.ldhat.$i.rates.txt
  mv type_table.txt /data/cornejo/projects/e.jimenezschwarzkop/Cacao/data/$pop/chr$chr/cacao.phased.chr$chr.vcf.$pop.ids.ldhat.ldhat.$i.type_table.txt
done
