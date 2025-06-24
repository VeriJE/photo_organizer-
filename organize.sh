#!/bin/bash

command -v identify >/dev/null || { echo "ImageMagick (identify) is not installed."; exit 1; }

SOURCE_DIR="$PWD"
months=( "january" "february" "march" "april" "may" "june" "july" "august" "september" "october" "november" "december" )

#months=( "enero" "febrero" "marzo" "abril" "mayo" "junio" "julio" "agosto" "septiembre" "octubre" "noviembre" "diciembre" )

mkdir -p "$DEST_DIR"

find "$SOURCE_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while IFS= read -r image; do
    echo "Processing: $image"

    date_taken=$(identify -verbose "$image" 2>/dev/null | grep -m1 "date:modify" | awk '{print $2}')
    [[ -z "$date_taken" ]] && echo "No metadata found, skipping $image" && continue

    year=$(echo "$date_taken" | cut -d'-' -f1)
    month_num=$(echo "$date_taken" | cut -d'-' -f2)
    month_name=${months[$((10#$month_num - 1))]}

    target_dir="$SOURCE_DIR/$year/$month_name"
    mkdir -p "$target_dir"
    mv "$image" "$target_dir/"
done

echo "Sorting complete."

