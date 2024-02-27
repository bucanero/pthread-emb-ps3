#!/bin/bash

# Function to rename files with .c extension to .cpp recursively
rename_files_recursive() {
    local dir="$1"
    for file in "$dir"/*.c; do
        if [[ -f "$file" ]]; then
            new_name="${file%.c}.cpp"
            mv "$file" "$new_name"
            echo "Renamed $file to $new_name"
        elif [[ -d "$file" ]]; then
            rename_files_recursive "$file"
        fi
    done
}

# Check if the folder path is provided as an argument
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <folder_path>"
    exit 1
fi

# Start the recursive renaming process from the provided folder
rename_files_recursive "$1"