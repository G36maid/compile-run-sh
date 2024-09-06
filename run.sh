#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <cpp_file> [input_file] [output_file]"
    exit 1
fi

cpp_file=$1
input_file=$2
output_file=$3

if [ -z "$input_file" ]; then
    input_file="in.txt"
fi

if [ -z "$output_file" ]; then
    output_file="out.txt"
fi

g++ -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c++11 "$cpp_file" -o "${cpp_file%.*}"

if [ $? -eq 0 ]; then
    echo "Compilation successful. Running program..."
    ./"${cpp_file%.*}" < "$input_file" > "$output_file"
    echo "Program execution completed."
    rm "${cpp_file%.*}"
    echo "Executable file deleted."
else
    echo "Compilation failed."
fi

