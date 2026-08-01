#!/bin/bash

function calculate_bytes(){
    echo "logic to calculate bytes";
}

function calculate_number_of_lines(){

    local file_name="test.txt"
    local line_count=0;
    while read -r line;
    do
        line_count=$(( line_count + 1 ));
    done < $file_name

    echo "Number of lines in ${file_name}: ${line_count}"
}

function calculate_number_of_words(){
    echo "logic to calculate number of words";
}

flag=${1}

case $flag in
    "-h")echo "help function is called";;
    "-c")calculate_bytes;;
    "-l")calculate_number_of_lines;;
    "-w")calculate_number_of_words;;
    *)echo "command not found";;
esac