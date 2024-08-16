#!/bin/bash
awk -F'\t' '{print $3}' annot_baseline2.2.tsv > origin.tsv
awk -F'\t' '{print $3}' annot_baseline2.2_21main.tsv > new.tsv
diff origin.tsv new.tsv
awk -F'\t' '{print $5}' annot_baseline2.2.tsv > origin.tsv
awk -F'\t' '{print $4}' annot_baseline2.2_21main.tsv > new.tsv
diff origin.tsv new.tsv
rm origin.tsv new.tsv
