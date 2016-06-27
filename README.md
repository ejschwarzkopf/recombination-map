# Recombination Map using LDhat and LDhot
A set of scripts and tips that assist in creating a recombination map using LDhat and LDhot. Originally developed for *Theobroma cacao* data.

# vcftoldhat.sh

The initial data used in this project was .vcf files containing phased SNPs for 10 varieties of *cacao*. The first step in the process is to convert these files to a format compatible with LDhat. Fortunately, vcftools can do this for us; we only need to select a few parameters. For this we created the **vcftoldhat.sh** script, which calculates the necessary parameters required by vcftools (vcf, chr, keep, maf, out). The **vcftoldhat.sh** scripts runs in a folder with all the .vcf files containing the phased SNP data and the .ids files containing the identifiers for the populations. While in that folder, the usage is as simple as running the script

```sh
  $ ./vcftoldhat.sh
```

# locscut.sh

This script takes the full .locs files obtained with vcftoldhat and cuts them into 2000 SNP long files with 500 SNP overlaps between successive windows.
