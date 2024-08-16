# MAF can be 0.001, 0.01, 0.05
input_file="UKBB_Ashley.tsv"
thresholds=("0.001" "0.01" "0.05")

for threshold in "${thresholds[@]}"; do
        output_file="UKBB_maf${threshold}.tsv"
        awk -F'\t' -v thresh="$threshold" '$20 >= thresh' "$input_file" > "$output_file"
        echo "Filtered file created: $output_file with threshold $threshold"
        awk -F'\t' '{print $20}' $output_file | sort -n | head -n 10
done
