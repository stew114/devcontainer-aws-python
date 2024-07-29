#!/bin/bash

# Check if a directory parameter is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <root-directory>"
    exit 1
fi

# Assign the parameter to a variable
root_dir="$1"

# Loop through all files in the specified root directory and its subdirectories, excluding directories that start with a dot
find "$root_dir" -type f -not -path '*/.git*' | while read -r file; do
    echo "Filename: $file"
    echo "Contents:"
    cat "$file"
    echo "-----------------------------"
done