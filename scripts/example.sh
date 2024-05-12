# find taxid by assemblyid
grep GCA_905234495.1 gtdb-taxdump/R220/taxid.map

echo Escherichia coli | taxonkit name2taxid

echo 599451526 | taxonkit lineage -nrR
echo 599451526 | taxonkit reformat -I1 -P --prefix-k d__
