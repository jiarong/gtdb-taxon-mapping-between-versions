taxonkit create-taxdump taxonomy/R080/*.tsv* --gtdb --out-dir gtdb-taxdump/R080 --force

taxonkit create-taxdump --gtdb -x gtdb-taxdump/R080/ \
    taxonomy/R083/*.tsv*  --out-dir gtdb-taxdump/R083  --force

taxonkit create-taxdump --gtdb -x gtdb-taxdump/R083/ \
    taxonomy/R086/*.tsv*  --out-dir gtdb-taxdump/R086  --force

taxonkit create-taxdump --gtdb -x gtdb-taxdump/R086/ \
    taxonomy/R089/*.tsv*  --out-dir gtdb-taxdump/R089  --force

taxonkit create-taxdump --gtdb -x gtdb-taxdump/R089/ \
    taxonomy/R095/*.tsv*  --out-dir gtdb-taxdump/R095  --force

taxonkit create-taxdump --gtdb -x gtdb-taxdump/R095/ \
    taxonomy/R202/*.tsv*  --out-dir gtdb-taxdump/R202  --force

taxonkit create-taxdump --gtdb -x gtdb-taxdump/R202/ \
    taxonomy/R207/*.tsv*  --out-dir gtdb-taxdump/R207  --force

taxonkit create-taxdump --gtdb -x gtdb-taxdump/R207/ \
    taxonomy/R214/*.tsv*  --out-dir gtdb-taxdump/R214  --force

taxonkit create-taxdump --gtdb -x gtdb-taxdump/R214/ \
     taxonomy/R220/*.tsv*  --out-dir gtdb-taxdump/R220  --force
