#!/bin/bash

input_dir="$HOME/Atopic_dermatitis/ldmatrix/genetic_map_jpt/genetic_map_tommo_GRCh37_rsID_chr"
output_dir="$HOME/Atopic_dermatitis/ldmatrix/genetic_map_jpt/genetic_map_tommo_GRCh37_rsID_chr_cleaned"

mkdir -p $output_dir

for chr in {1..22}; do
  input_file="$input_dir/genetic_map_tommo_GRCh37_rsID_chr${chr}.tsv"
  output_file="$output_dir/genetic_map_tommo_GRCh37_rsID_cleaned_chr${chr}.tsv"

  if [ ! -f "$input_file" ]; then
    echo "Error: $input_file not found."
    continue
  fi

  awk -F'\t' '$1 != "NA"' "$input_file" > "$output_file"

  # check the number of NA
  na_count_before=$(cut -f 1 "$input_file" | grep -o 'NA' | wc -l)
  na_count_after=$(cut -f 1 "$output_file" | grep -o 'NA' | wc -l)

  # check the number of row
  line_count_before=$(wc -l < "$input_file")
  line_count_after=$(wc -l < "$output_file")

  # output
  echo "Chromosome $chr:"
  echo "NA count before: $na_count_before"
  echo "NA count after:  $na_count_after"
  echo "Line count before: $line_count_before"
  echo "Line count after:  $line_count_after"
  echo ""
done
