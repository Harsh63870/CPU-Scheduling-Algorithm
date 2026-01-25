#!/bin/bash
INPUT_STRING=hello
while [ "$INPUT_STRING" != "bye" ]
do
echo "please type something in (bye to quit)"
read INPUT_STRING
echo "$INPUT_STRING"
done
