#!/bin/bash

source_directory="$1"
destination_file="$2"

# Make output file
> "$destination_file"


#Edit this depending on what you want to copy and skip
find "$source_directory" \( -type d -name '.venv' -o -type d -name '.VSCodeCounter' \) -prune -o -type f \( -name "*.php" -o -name "*.html" -o -name "*.js" -o -name "*.css" \) | while read source_file; do
    file_path="$(realpath "$source_file")"
    file_name="$(basename "$source_file")"
    file_contents="$(cat "$source_file")"

    echo "File Name: $file_name" >> "$destination_file"
    echo "File Path: $file_path" >> "$destination_file"
    echo "$file_contents" >> "$destination_file"
    echo "------------------------------------------" >> "$destination_file"
done

echo "Copied to'$destination_file'"


# To run
# Give permissions: chmod +x copyCode.sh
# Run: sudo sh copyCode.sh <Folder to copy the code from> <Output file>
