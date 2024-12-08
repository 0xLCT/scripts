#!/bin/sh

# Function to convert FLAC to MP3
convert_flac_to_mp3() {
    input_file="$1"
    output_file="${input_file%.flac}.mp3"
    quality="$2"

    if [ "$quality" = "V0" ]; then
        ffmpeg -i "$input_file" -c:a libmp3lame -q:a 0 "$output_file"
    else
        ffmpeg -i "$input_file" -c:a libmp3lame -b:a "$quality" "$output_file"
    fi
}

# Prompt user for conversion option
printf "Select conversion option:\n"
printf "1. Convert to MP3 V0\n"
printf "2. Convert to MP3 320kbps\n"
printf "Enter your choice (1 or 2): "
read choice

# Set quality based on user choice
case $choice in
    1) quality="V0";;
    2) quality="320k";;
    *) printf "Invalid choice. Exiting.\n"; exit 1;;
esac

# Prompt user for deletion option
printf "Do you want to delete the original FLAC files after conversion? (y/n): "
read delete_option

# Loop through all files in the current directory
for file in *.flac; do
    # Check if file exists and is a regular file
    if [ -f "$file" ]; then
        printf "Converting %s to MP3...\n" "$file"
        convert_flac_to_mp3 "$file" "$quality"
        
        # Delete original FLAC file if user chose to do so
        if [ "$delete_option" = "y" ] || [ "$delete_option" = "Y" ]; then
            rm "$file"
            printf "Deleted original file: %s\n" "$file"
        fi
    fi
done

printf "Conversion complete!\n"
