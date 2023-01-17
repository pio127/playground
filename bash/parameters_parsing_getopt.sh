#!/bin/bash

# It works similar to manual parameters parsing, but it does a parameters preprocessing.
# Advantages over manual and getopts method are:
#   + no need to manual shift parameters vector
#   + handles parameters packing (like "-abc" as "-a -b -c")
#   + handles parameters options with and without space, and = for long form.

echo "Parameters: $@"

opts=`getopt --options abcf --longoptions file: -- "$@"`

echo "Parameters proccesed by getopt: $opts"
