# Recombination Map using LDhat and LDhot
A set of scripts and tips that assist in creating a recombination map using LDhat and LDhot. Originally developed for *Theobroma cacao* data.

The initial data used in this project was .vcf files containing phased snips for 10 varieties of *cacao*. The first step in the process is to convert these files to a format compatible with LDhat. Fortunately, vcftools can do this for us; we only need to select a few parameters.

```sh
  $ vcftools -something
```
