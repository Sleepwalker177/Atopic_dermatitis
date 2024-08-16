# Build shrunk LD matrix for chromosome 'chr'
# Use the Japanese effective population size
# Use the genetic map sample size
#!/bin/bash

chr=1
start=1
end=5000
increment=5000

# Loop to generate snp ranges and run gctb
while [ $start -le 600000 ]; do
    end=$((start + increment - 1))
    snp_range="$start-$end"

    gctb --bfile ../1000G_ldsc/1000G_ldsc_jpt_chr/raw.jpt.$chr \
         --ne 11847 \
         --snp $snp_range \
         --genmap-n 150 \
         --make-shrunk-ldm \
         --gen-map ../ldmatrix/genetic_map_jpt/genetic_map_tommo_GRCh37_rsID_chr_cleaned/genetic_map_tommo_GRCh37_rsID_cleaned_chr$chr.tsv \
         --out ../ldmatrix/jpt_hm3_shrunk_sparse/1000G_jpt_shrunk_chr$chr

    start=$((end + 1))
done
