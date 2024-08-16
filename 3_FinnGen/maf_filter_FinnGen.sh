# MAF can be 0.001, 0.01, 0.05
input_file="FinnGen_maf_beta.tsv"
thresholds=("0.001" "0.01" "0.05")

for threshold in "${thresholds[@]}"; do
	output_file="FinnGen_maf${threshold}_beta.tsv"
	awk -F'\t' -v thresh="$threshold" '$15 >= thresh' "$input_file" > "$output_file"
	echo "Filtered file created: $output_file with threshold $threshold"
	sort -k15,15n $output_file | head -n 10
done
