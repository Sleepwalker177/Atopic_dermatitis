# Merge the LD matrix chunks into a single file
chr=1
gctb --mldm ../ldmatrix/jpt_hm3_shrunk/1000G_jpt_shrunk_sparse_chr$chr.mldmlist \
     --make-sparse-ldm \
     --out ../ldmatrix/jpt_hm3_shrunk_sparse/1000G_jpt_shrunk_sparse_chr$chr
