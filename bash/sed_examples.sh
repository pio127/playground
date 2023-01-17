#!/bin/bash

ROW1=(1 2 3 4 5 6 a b c d)
ROW2=(dasdsad 1  2 sdsad3 4 5 6 a b c d)
ROW3=(1 2a 3dd 4 5 6 a b c d)


table="${ROW1[*]}\n${ROW2[*]}\n${ROW3[*]}"

echo -e $table
echo "---------------------------------"
echo -e $table | sed 's/a/*/g'
