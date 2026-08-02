#!/bin/bash

function calculate_bytes(){

    local file_name="test.txt"
    local byte_count=0;

    while IFS='' read -r line;
    do
        echo "${line}";
    done < $file_name
    echo "logic to calculate bytes";    
}

function calculate_number_of_lines(){

    local file_name="test.txt"
    local line_count=0;
    while  read -r line;
    do
        line_count=$(( line_count + 1 ));
    done < $file_name

    echo "${line_count} ${file_name}"
}

function calculate_number_of_words(){
    local file_name="test.txt";
    local word_count=0;
    local -a words;

    while read -r line;
    do
        read -r -a words <<< $line;
        echo "${#words[@]}";
        (( word_count=word_count + ${#words[@]} ))
    done < $file_name

    echo "${word_count} ${file_name}";
}

function calculate_number_of_characters(){
    local file_name="test.txt";
    local char_count=0;

    while read line; do
        (( char_count += "${#line}" + 1)) # +1 is added because of the new line character \n
    done < $file_name

   echo "${char_count} ${file_name}"; 
}

flag=${1}

case $flag in
    "-h")echo "help function is called";;
    "-c")calculate_bytes;;
    "-l")calculate_number_of_lines;;
    "-w")calculate_number_of_words;;
    "-m")calculate_number_of_characters;;
    *)echo "command not found";;
esac