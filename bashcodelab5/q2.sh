#!/bin/bash
count_vowels_length() {
 str=$1
 vowels=$(echo "$str" | grep -o -i "[aeiou]" | wc -l)
 length=${#str}
 echo "Number of vowels: $vowels"
 echo "Length of string: $length"
}
read -p "Enter a string: " s
count_vowels_length "$s"
