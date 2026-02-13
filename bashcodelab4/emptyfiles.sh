#!/bin/bash
for i in {1..10}
do
    touch "file${i}.txt"
done

echo "10 files created successfully."
