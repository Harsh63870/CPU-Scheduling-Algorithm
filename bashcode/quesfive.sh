#!/bin/bash
echo "Enter date:"
read date
if [[ $date =~ ^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[0-9]{4}$ ]]
then
echo "Valid Date"
else
echo "Invalid Date"
fi

