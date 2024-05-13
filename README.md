## This repo has a pipeline to make taxon mapping/conversion between different GTDB versions. NOTE: this script only find taxon with name/format change (eg, p\_\_Proteobacteria -> p\_\_Pseudomonadota)but does NOT consider a genome (assid) assigned to a different existing taxon due classification errors.

## software dependency
```
conda install -c conda-forege -c bioconda python>=3.6 csvtk taxonkit parallel
```

## run
```
# see output in "R202_to_R214.change.taxon_map.tsv"
make
```
