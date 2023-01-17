#!/bin/bash

function print_help_check_advice() {
    echo "Try \"$0 --help\" for more information."
}

function print_help() {
    echo "Usage: 
    $0 [options] [-f FILE]  
Options:
    -h, --help                    Print this help message
    -a, --a_parameters            Use \"a\" option
    -b, --b_parameters            Use \"b\" option
    -c, --c_parameters            Use \"c\" option
    -f, --file {FILENAME}         Filename of a file to process"
}

if [ $# -eq 0 ]; then
    print_help_check_advice
fi

while [ $# -gt 0 ]; do
    case "$1" in
        -a|--a_parameter )
            echo "Using a parameter."
            shift
            ;;
        -b|--b_parameter )
            echo "Using b parameter."
            shift
            ;;
        -c|--c_parameter )
            echo "Using c parameter."
            shift
            ;;
        -h|--help )
            print_help
            exit 0
            ;;
        -f|--file )
            FILENAME="$2"
            if ! [ -f "$FILENAME" ]; then
                echo "ERROR: File \"$FILENAME\" does not exist."
                exit 2
            fi
            echo "File \"$FILENAME\" will be used for processing."
            shift 2
            ;;
        * )
            echo "ERROR: Unknown parameter \"$1\" used."
            print_help_check_advice
            exit 1
            ;;
    esac
done
