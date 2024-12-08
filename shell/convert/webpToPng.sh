#!/bin/sh

# Check if dwebp is installed
if ! command -v dwebp >/dev/null 2>&1; then
    echo "Error: dwebp is not installed. Please install WebP tools." >&2
    exit 1
fi

# Loop through all WebP files in the current directory
for webp_file in *.webp; do
    # Check if there are any matching files
    if [ -e "$webp_file" ]; then
        # Get the filename without extension
        base_name=$(basename "$webp_file" .webp)
        
        # Convert WebP to PNG
        if dwebp "$webp_file" -o "${base_name}.png"; then
            echo "Converted: $webp_file -> ${base_name}.png"
        else
            echo "Error converting: $webp_file" >&2
        fi
    else
        echo "No WebP files found in the current directory."
        exit 0
    fi
done

echo "Conversion complete."
