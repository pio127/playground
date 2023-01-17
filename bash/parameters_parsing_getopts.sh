#!/bin/bash

# It provides an easy way for parsing short positional parameters.
# However it doesn't work for long positional parameters form.

while getopts abcf: parameter; do
    case $parameter in
        a) echo "Using a parameter."
            ;;
        b) echo "Using b parameter."
            ;;
        c) echo "Using c parameter."
            ;;
        f)  FILENAME="$OPTARG"
            if ! [ -f "$FILENAME" ]; then
                echo "ERROR: File \"$FILENAME\" does not exist."
                exit 2
            fi
            echo "File \"$FILENAME\" will be used for processing."
            ;;
    esac
done
