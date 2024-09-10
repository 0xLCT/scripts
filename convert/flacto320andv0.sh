#!/bin/sh

# Function to convert FLAC to MP3
convert_flac_to_mp3() {
    input_file="$1"
    output_file="${input_file%.flac}.mp3"
    bitrate="$2"

    ffmpeg -i "$input_file" -c:a libmp3lame -b:a "$bitrate" "$output_file"
}

# Prompt user for conversion option
printf "Select conversion option:\n"
printf "1. Convert to MP3 V0\n"
printf "2. Convert to MP3 320kbps\n"
printf "Enter your choice (1 or 2): "
read choice

# Set bitrate based on user choice
case $choice in
    1) bitrate="V0";;
    2) bitrate="320k";;
    *) printf "Invalid choice. Exiting.\n"; exit 1;;
esac

# Loop through all files in the current directory
for file in *.flac; do
    # Check if file exists and is a regular file
    if [ -f "$file" ]; then
        printf "Converting %s to MP3...\n" "$file"
        convert_flac_to_mp3 "$file" "$bitrate"
    fi
done

printf "Conversion complete!\n"
