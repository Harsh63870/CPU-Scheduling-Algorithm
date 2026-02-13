#!/bin/bash
read -p "Enter coefficient a: " a
read -p "Enter coefficient b: " b
read -p "Enter coefficient c: " c

if [ "$a" -eq 0 ]; then
    echo "Not a quadratic equation (a cannot be 0)."
    exit 1
fi

D=$(echo "$b^2 - 4*$a*$c" | bc)

echo "Discriminant (D) = $D"

if [ "$D" -gt 0 ]; then
    # Two real and distinct roots
    sqrtD=$(echo "scale=4; sqrt($D)" | bc)
    root1=$(echo "scale=4; (-$b + $sqrtD) / (2*$a)" | bc)
    root2=$(echo "scale=4; (-$b - $sqrtD) / (2*$a)" | bc)
    echo "Roots are real and distinct:"
    echo "Root 1 = $root1"
    echo "Root 2 = $root2"

elif [ "$D" -eq 0 ]; then
    root=$(echo "scale=4; -$b / (2*$a)" | bc)
    echo "Roots are real and equal:"
    echo "Root = $root"

else
    absD=$(echo "-1 * $D" | bc)
    sqrtD=$(echo "scale=4; sqrt($absD)" | bc)
    real=$(echo "scale=4; -$b / (2*$a)" | bc)
    imag=$(echo "scale=4; $sqrtD / (2*$a)" | bc)
    echo "Roots are complex:"
    echo "Root 1 = $real + ${imag}i"
    echo "Root 2 = $real - ${imag}i"
fi
