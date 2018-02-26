#!/bin/bash
#This script simulates segments of a genome that match an existing set, runs them through RepeatMasker, and extracts the percentage of sequence that are retroelements, DNA transposons, and total interspersed repeats. It repeats this 1000 times and exports the results to a table

for i in $(seq 1 1000); do
#Shuffle the hotspots
bedtools shuffle -i HS8.bed -g Genome.bed > tmp1.bed

#Modify bed file so that fastahack can read it
cut tmp1.bed -f 1 > tmp2.txt
cut tmp1.bed -f 2 > tmp3.txt
cut tmp1.bed -f 3 > tmp4.txt
paste -d ":" tmp2.txt tmp3.txt > tmp5.txt
paste -d "-" tmp5.txt tmp4.txt > tmp1.hackready.txt

#Run fastahack to generate fasta file for RepeatMasker
for i in $(cat tmp1.hackready.txt); do echo ">$i" >> tmp1.fasta; fastahack -r $i ../../work_ref/matina_v1.1.fasta >> tmp1.fasta; done

#Run RepeatMasker. files created are: "tmp1.fasta.cat.gz", "tmp1.fasta.masked", "tmp1.fasta.out", "tmp1.fasta.tbl"
/usr/local/RepeatMasker/RepeatMasker -species "Theobroma cacao" tmp1.fasta

#Extract values of interest
grep "Retroelements" tmp1.fasta.tbl | tr -s ' ' | cut -d " " -f 5 > tmp1.RE.txt
grep "DNA transposon" tmp1.fasta.tbl | tr -s ' ' | cut -d " " -f 6 > tmp1.TE.txt
grep "Total interspersed repeats" tmp.fasta.tbl | tr -s ' ' | cut -d " " -f 6 > tmp1.IR.txt

#Add values to table for R import
paste tmp1.RE.txt tmp1.TE.txt tmp1.IR.txt >> RepMaskSim.tbl

#remove all temporary files
rm tmp*
done
