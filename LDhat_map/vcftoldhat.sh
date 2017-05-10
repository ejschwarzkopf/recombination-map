#!/bin/bash
#Script applies vcftools to all the cacao populations in the folder
#The folder must contain the "cacao.phased.chr#.vcf" type files and the .ids files (list of identifiers) for the different populations
#Run from the folder with said files

for file in *.ids; do #runs over all the .ids files in the folder
  MAFN=$(cat $file | wc -l) #counts the ammount of lines in the .ids file (this is the number of individuals that will be retrieved from the .vcf file to form the .loc and .sites files)
  MAF=$(echo "2/$MAFN+0.0001" | bc -l) #MAF is set so that none of the SNPs have only one or two of the rare allele
  for chrom in *.vcf; do #runs over all of the .vcf files (one per chromosome)
    SCAF=$(tail -n 1 $chrom | cut -f 1) #obtains the scaffold value for vcftools
    vcftools --vcf $chrom --chr $SCAF --phased --ldhat --keep $file --maf $MAF --out "$chrom.$file.ldhat" #runs vcftools with the parameters collected and outputs into files type (cacao.phased.chr#.vcf.(PopName).ids.ldhat.ldhat.(locs or sites)
  done
done
