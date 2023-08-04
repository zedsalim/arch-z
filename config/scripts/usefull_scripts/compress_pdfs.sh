
#!/bin/bash

# Function to compress a single PDF file using Ghostscript
compress_pdf() {
    input_file="$1"
    output_file="$input_file.compressed.pdf"
    echo "Compressing $input_file..."
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dBATCH -dQUIET -sOutputFile="$output_file" "$input_file"
    mv "$output_file" "$input_file"
}

# Function to process all PDF files in a folder and its subfolders
process_folder() {
    find "$1" -type f -iname "*.pdf" | while read -r file; do
        compress_pdf "$file"
    done
}

# Main script

# Check if Ghostscript is installed
if ! command -v gs &>/dev/null; then
    echo "Ghostscript not found. Please install it first."
    exit 1
fi

# Check if the folder path is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <folder_path>"
    exit 1
fi

folder_path="$1"

# Check if the provided folder path is valid
if [ ! -d "$folder_path" ]; then
    echo "Invalid folder path. Please provide a valid directory path."
    exit 1
fi

# Process all PDF files in the provided folder and its subfolders
process_folder "$folder_path"
