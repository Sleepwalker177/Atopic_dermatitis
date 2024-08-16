# Rsq can be 0.90, 0.95
input_file="Riken_maf0.05.tsv"
thresholds=("0.90" "0.95")

for threshold in "${thresholds[@]}"; do
	output_file="Riken_maf0.05_rsq${threshold}.tsv"
	awk -F'\t' -v thresh="$threshold" '$19 >= thresh' "$input_file" > "$output_file"
	echo "Filtered file created: $output_file with threshold $threshold"
	sort -k19,19n $output_file | head -n 10
done
