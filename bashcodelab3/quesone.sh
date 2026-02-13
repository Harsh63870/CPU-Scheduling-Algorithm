#!/bin/bash
echo "Enter a Number"
read a
echo "Enter the position : "
read pos
result=$((a>>pos))
echo "Result : $result"

