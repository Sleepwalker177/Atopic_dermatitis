# MAF can be 0.001, 0.01, 0.05
input_file="NealeLab_rsID_2.tsv"
thresholds=("0.001" "0.01" "0.05")

for threshold in "${thresholds[@]}"; do
	output_file="NealeLab_maf${threshold}.tsv"
	awk -F'\t' -v thresh="$threshold" '$6 >= thresh' "$input_file" > "$output_file"
	echo "Filtered file created: $output_file with threshold $threshold"
	awk -F'\t' '{print $6}' $output_file | sort -n | head -n 10
done
