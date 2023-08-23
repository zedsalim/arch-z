#!/bin/bash

# Check if pdftk is installed
if ! command -v pdftk &>/dev/null; then
    echo "pdftk not found. Please install it first."
    exit 1
fi

# Function to combine all PDF files into a single PDF
combine_pdfs() {
    output_file="$1"
    shift
    pdftk "$@" cat output "$output_file"
    echo "PDFs combined into: $output_file"
}

# Main script

# Check if at least three arguments are provided (output file and two or more input PDFs)
if [ $# -lt 3 ]; then
    echo "Usage: $0 <output_filename> <input_pdf1> <input_pdf2> ... <input_pdfN>"
    exit 1
fi

output_file="$1"
shift

# Call the function to combine PDFs
combine_pdfs "$output_file" "$@"
