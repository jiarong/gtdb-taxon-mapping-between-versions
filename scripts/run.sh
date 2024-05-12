
### NOTE: this script only find taxon with name/format change; does not consider a genome (assid) assigned to a different existing taxon due classification errors.

# NOTE: deleted ones are included since we need negate this list to get unchanged list to get taxons that does NOT change for sure
csvtk filter2 -f '($version=="R207" || $version=="R214") && ($change=="CHANGE_LIN_TAX" || $change=="DELETE")' gtdb-taxid-changelog.csv.gz | csvtk sort -k1 -k2:r | awk -v FS=',' -v OFS=',' '!seen[$1]++' | csvtk cut -f"taxid" | tail -n+2 > R202_to_R214.change.taxid.list

grep -Fw -f R202_to_R214.change.taxid.list gtdb-taxdump/R214/taxid.map | csvtk join -t -L -H --na NA -f"1;1" - <(zcat taxonomy/R214/*.tsv.gz | sed 's/GB_//; s/RS_//') > R202_to_R214.change.R214.assid2taxid2lineage.tsv
grep -Fw -f R202_to_R214.change.taxid.list gtdb-taxdump/R202/taxid.map | csvtk join -t -L -H --na NA -f"1;1" - <(zcat taxonomy/R202/*tsv.gz | sed 's/GB_//; s/RS_//') > R202_to_R214.change.R202.assid2taxid2lineage.tsv
csvtk join -t -f"2;2" R202_to_R214.change.R202.assid2taxid2lineage.tsv R202_to_R214.change.R214.assid2taxid2lineage.tsv | sed '1i old_assid\ttaxid\told_lineage\tnew_assid\tnew_lineage' > R202_to_R214.change.lineage_map.tsv

grep -v -Fw -f R202_to_R214.change.taxid.list gtdb-taxdump/R202/taxid.map | csvtk join -t -L -H --na NA -f"1;1" - <(zcat taxonomy/R202/*tsv.gz | sed 's/GB_//; s/RS_//') > R202_to_R214.keep.R202.assid2taxid2lineage.tsv

python scripts/make-taxon-conversion-map.py <(cut -f3,5 R202_to_R214.change.lineage_map.tsv | csvtk sort -t -k1 -k2) <(cut -f3 R202_to_R214.keep.R202.assid2taxid2lineage.tsv | sort | uniq) | sed '1i old\tnew' > R202_to_R214.change.taxon_map.tsv
