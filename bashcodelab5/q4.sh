#!/bin/bash
unique_chars() {
 str=$1
 echo "$str" | fold -w1 | sort | uniq
}
read -p "Enter a string: " s
echo "Unique characters:"
unique_chars "$s"
