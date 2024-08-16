# Build sparse LD matrix
for chr in {11..16}; do
gctb --bfile ../1000G_ldsc/1000G_ldsc_eas_chr/raw.eas.$chr \
     --make-sparse-ldm \
     --chisq 10 \
     --out ../ldmatrix/eas_hm3_sparse/1000G_eas_sparse_chr$chr
done
