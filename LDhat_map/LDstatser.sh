#!/bin/bash


pop=$1
chr=$2
k=$3
m=$4

echo $pop

#################################################################################

cd /data/cornejo/projects/e.jimenezschwarzkop/Cacao/results/$pop

#################################################################################

for chr in `seq $chr $chr`; do
  cd chr$chr
  echo $chr
  n=$(ls | wc -l)
  n=$((($n/8)-1))
  echo $n
  for i in `seq $k $m`; do
    echo $i
    ~/LDhat-master/stat -input /data/cornejo/projects/e.jimenezschwarzkop/Cacao/results/$pop/chr$chr/cacao.phased.chr${chr}.vcf.${pop}.ids.ldhat.ldhat.${i}.rates.txt -burn 5000
    mv /data/cornejo/projects/e.jimenezschwarzkop/Cacao/results/$pop/chr$chr/res.txt /data/cornejo/projects/e.jimenezschwarzkop/Cacao/results/$pop/chr$chr/cacao.phased.chr${chr}.vcf.${pop}.ids.ldhat.ldhat.${i}.res.txt
  done
  cd ..
done
