#!/usr/bin/env python

import sys
import os

def main():
    if len(sys.argv) != 3:
        mes = '[INFO] Usage: python {} <old_lineage_to_new_lineage.tsv> <lineage_not_changed.list>\n'
        sys.stderr.write(mes.format(os.path.basename(sys.argv[0])))
        sys.exit(1)

    tab_f = sys.argv[1]
    no_change_f = sys.argv[2]
    d = {}
    with open(tab_f) as fh, open(no_change_f) as fh2:
        no_change_taxon_st = set()
        for line in fh2:
            # this file does not have header
            lineage = line.rstrip()
            taxons = set([ taxon.strip() for taxon in lineage.split(';') ])
            no_change_taxon_st = no_change_taxon_st | taxons
        for n, line in enumerate(fh):
            if n == 0:
                continue
            old, new = line.rstrip().split('\t')
            for i, j in zip(old.split(';'), new.split(';')):
                if i in no_change_taxon_st:
                    continue
                if i == j:
                    continue
                if i in d:
                    if j != d[i]:
                        mes = f'[WARN] the old taxon {i} matched to different new taxon {j} and {d[i]}\n'
                    continue
                d[i] = j
                mes = f'{i}\t{j}\n'
                sys.stdout.write(mes)


if __name__ == '__main__':
    main()
