# implemented in bash

##### for the neale lab files 

# create header
echo -e "CHR\tPOS\tREF\tALT\tchr\tpos\tref\talt\trsid\tvarid\tconsequence\tconsequence_category\tinfo\tcall_rate\tAC\tAF\tminor_allele\tminor_AF\tp_hwe\tn_called\tn_not_called\tn_hom_ref\tn_het\tn_hom_var\tn_non_ref\tr_heterozygosity\tr_het_hom_var\tr_expected_het_frequency" >> variants_bp.tsv

# replace : with tab
tail -n +2 variants.tsv | sed 's/:/\t/g' >> variants_bp.tsv 

# check the two files have same number of lines 

wc -l variants_bp.tsv variants.tsv

# check the file looks like how you want

head -n 2 variants_bp.tsv
tail -n 2 variants_bp.tsv

