# Recombination Map using LDhat and LDhot
A set of scripts and tips that assist in creating a recombination map using LDhat and LDhot. Originally developed for *Theobroma cacao* data.

# vcftoldhat.sh

The initial data used in this project was .vcf files containing phased SNPs for 10 varieties of *cacao*. The first step in the process is to convert these files to a format compatible with LDhat. Fortunately, vcftools can do this for us; we only need to select a few parameters. For this we created the **vcftoldhat.sh** script, which calculates the necessary parameters required by vcftools (vcf, chr, keep, maf, out). The **vcftoldhat.sh** scripts runs in a folder with all the .vcf files containing the phased SNP data and the .ids files containing the identifiers for the populations. While in that folder, the usage is as simple as running the script inside the proper folder.

```sh
  $ ./vcftoldhat.sh
```

# locscut.sh

This script takes the full .locs files obtained with vcftoldhat.sh and cuts them into 2000 SNP long files with 500 SNP overlaps between successive windows. These window and overlap sizes are the preset, but can be changed with the **-n** and **-k** options (**-n** for the window size and **-k** for the overlap).

```sh
  $ ./locscut.sh -n 2000 -k 500
```

# sitescut.sh

This script takes the full .sites files obtained with vcftoldhat.sh and cuts them into 2000 SNP long files with 500 SNP overlaps between successive windows. These window and overlap sizes are preset, but can be changed with the **-n** and **-k** options (**-n** for the window size and **-k** for the overlap).

```sh
  $ ./sitescut.sh -n 2000 -k 500
```

# StartLocsAtZero.sh

Since LDhat doesn't run files where the first location doesn't start with a whole part of zero, this script subtracts the whole part of the location of the first SNP from all the locations in the file for each .locs window file in a folder. It takes no arguments.

```sh
  $ ./StartLocsAtZero.sh
```
