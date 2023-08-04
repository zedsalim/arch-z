
#!/bin/bash

# Function to extract images from a merged PDF file
extract_images_from_pdf() {
    merged_pdf="$1"
    output_dir=$(dirname "$merged_pdf")

    # Convert the merged PDF back to original JPEG images
    echo "Converting $merged_pdf to JPEG images..."
    pdfimages -j "$merged_pdf" "$output_dir/image"

    echo "Image extraction complete."
}

# Main script

# Check if pdfimages is installed
if ! command -v pdfimages &>/dev/null; then
    echo "pdfimages not found. Please install poppler-utils package first."
    exit 1
fi

# Check if the merged PDF file is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <merged_pdf>"
    exit 1
fi

merged_pdf="$1"

# Check if the provided merged PDF file exists
if [ ! -f "$merged_pdf" ]; then
    echo "Merged PDF file not found. Please provide a valid file path."
    exit 1
fi

# Call the function to extract images from the merged PDF
extract_images_from_pdf "$merged_pdf"
