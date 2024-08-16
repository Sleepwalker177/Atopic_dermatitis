# implemented in bash

##### for the neale lab files 

# first unzip the file
gunzip -c 6152_9.gwas.imputed_v3.both_sexes.tsv.bgz > 6152_9.gwas.imputed_v3.both_sexes.tsv 

# create header

echo -e "CHR\tPOS\tREF\tALT\tminor_allele\tminor_AF\texpected_case_minor_AC\tlow_confidence_variant\tn_complete_samples\tAC\tytx\tbeta\tse\ttstat\tpval" >> 6152_9.tsv

# replace : with tab
tail -n +2 6152_9.gwas.imputed_v3.both_sexes.tsv | sed 's/:/\t/g' >> 6152_9.tsv 

# check the two files have same number of lines 

wc -l 6152_9.tsv 6152_9.gwas.imputed_v3.both_sexes.tsv

# check the file looks like how you want

head -n 2 6152_9.tsv
tail -n 2 6152_9.tsv

# zip file 

zip 6152_9.tsv.zip 6152_9.tsv
