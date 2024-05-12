.PHONY: all
all: R202_to_R214.change.taxon_map.tsv

R202_to_R214.change.taxon_map.tsv: taxonomy/Done gtdb-taxdump/Done
	bash scripts/run.sh

taxonomy/Done:
	mkdir -p taxonomy && bash scripts/run-download.sh
gtdb-taxdump/Done:
	mkdir -p gtdb-taxdump && bash scripts/run-build.sh

.PHONY: clean
clean:
	R202_to_R214.change.lineage_map.tsv
	R202_to_R214.change.R202.assid2taxid2lineage.tsv
	R202_to_R214.change.R214.assid2taxid2lineage.tsv
	R202_to_R214.change.taxid.list
	R202_to_R214.keep.R202.assid2taxid2lineage.tsv
