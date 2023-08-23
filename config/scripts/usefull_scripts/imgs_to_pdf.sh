#!/bin/bash

# Check if ImageMagick is installed
if ! command -v convert &>/dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

# Function to convert an image file to PDF
convert_image_to_pdf() {
    image_file="$1"

    if [ ! -f "$image_file" ]; then
        echo "Invalid image file path: $image_file"
        return
    fi

    # Get the filename without extension
    filename=$(basename -- "$image_file")
    filename_no_ext="${filename%.*}"
    pdf_file="${image_file%.*}.pdf"

    # Convert the image to PDF
    convert "$image_file" "$pdf_file"
    echo "Converted $filename to PDF: $pdf_file"
}

# Main script

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <image_file1> <image_file2> ... <image_fileN>"
    exit 1
fi

# Loop through all image files provided as arguments and convert them to PDFs
for image_file in "$@"; do
    convert_image_to_pdf "$image_file"
done

echo "Conversion completed."
