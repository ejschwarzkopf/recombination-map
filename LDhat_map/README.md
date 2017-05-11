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

# add0.0001toloc.sh

Since LDhat doesn't run files where the first location is exactly zero, this script adds 0.0001 to the first location. It takes a single argument, which is the file to which the 0.0001 will be added.

```sh
  $ ./add0.0001toloc.sh filename
```

# LDhatter.sh

This script runs interval from LDhat on all the windows in a folder. It's written to fit a naming structure where windows are identified by their population name, chromosome name, and number. It moves the output to files structured in a similar fashion. It takes seven arguments:

-n: highest window number to be run
-k: lowest window number to be run
--pop: population
--chr: chromosome
--ipath: input path, remember to end it with a /
--opath: output path
--lk: lookup table file
--its: number of iterations
--bpen: block penalty
--samp: sample every samp iterations

```sh
  $ ./LDhatter.sh -n 143 -k 0 --pop Amelonado --chr 2 --ipath path_to_input --opath path_to_output --lk lookup_table_file --its 100000000 --bpen 5 --samp 10000
```

# LDstatser.sh

This script runs stat from LDhat on a series of windows for an indicated population and chromosome. It was written for a particular file and folder structure, but this version has been modified to be customizable to anyone's needs. The "infile" and "outfile" need to be replaced with the file name of your choosing for input and output respectively.

-m: highest window number to be run
-k: lowest window number to be run
--pop: population
--chr: chromosome
--ipath: input path, remember to end it with a /
--opath: output path, remember to end it with a /
-b: burn-in for analysis


```sh
  $ ./LDstatser.sh -m 143 -k 0 --pop Amelonado --chr 2 --ipath path_to_input --opath path_to_output -b 5000
```
