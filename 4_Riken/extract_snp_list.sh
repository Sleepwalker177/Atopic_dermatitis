input=Riken_maf0.05_rsq0.95.tsv
output=Riken_snp_list_filter.tsv
temp_output=temp_output.tsv

# Extract the SNP column
awk -F'\t' '{print $21}' $input > $output

# Remove the first line
tail -n +2 $output > $temp_output

# Move temp_output to output
mv $temp_output $output

# Check the files
head -n 5 $output
tail -n 5 $output
wc -l $input
wc -l $output
