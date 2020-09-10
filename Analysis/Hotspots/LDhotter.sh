#!/bin/bash

k=0
n=$1
pop=$2
chr=$3
filename=$4
lk_filename=$5
k=$6

for i in `seq $k $n`; do
  ldhot --seq ${filename}.${pop}.${chr}.${i}.sites --loc ${filename}.${pop}.${chr}.${i}.locs --lk ${lk_filename}_${pop} --res ${filename}.${pop}.${chr}.${i}.
res.txt --nsim 1000 --out ${filename}.${pop}.${chr}.${i}.ldhot
done