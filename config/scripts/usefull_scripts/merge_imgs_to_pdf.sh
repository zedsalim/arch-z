#!/bin/bash

# Function to combine all images into a single PDF
combine_images_to_pdf() {
    output_pdf="$1"
    if ! [[ "$output_pdf" == *.pdf ]]; then
        output_pdf="$output_pdf.pdf"
    fi
    shift
    convert "$@" "$output_pdf"
    echo "PDF file created successfully: $output_pdf"
}

# Main script

# Check if ImageMagick's convert is installed
if ! command -v convert &>/dev/null; then
    echo "ImageMagick (convert) not found. Please install it first."
    exit 1
fi

# Check if at least two arguments are provided (output PDF and one or more input images)
if [ $# -lt 2 ]; then
    echo "Usage: $0 <output_pdf> <input_image1> <input_image2> ... <input_imageN>"
    exit 1
fi

output_pdf="$1"
shift

# Call the function to combine images into a PDF
combine_images_to_pdf "$output_pdf" "$@"
