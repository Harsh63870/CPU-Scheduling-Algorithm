#!/bin/bash
x=10
y=3
let "z=$((x*y))"
echo $z
let z=$((x*y))
echo $z
let "m=$((x/y))"
echo $m
let m=$((x/y))
echo $m

