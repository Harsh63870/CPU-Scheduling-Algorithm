#!/bin/bash

echo "===== DEADLOCK SIMULATION ====="

echo "Process 1 requesting Resource A"
sleep 1
echo "Process 1: Acquired Resource A"

echo "Process 2 requesting Resource B"
sleep 1
echo "Process 2: Acquired Resource B"

sleep 1
echo "Process 1 requesting Resource B..."
sleep 1
echo "Process 1: Waiting for Resource B (Deadlock occurs)"

sleep 1
echo "Process 2 requesting Resource A..."
sleep 1
echo "Process 2: Waiting for Resource A"

echo ""
echo "Deadlock occurred due to the following conditions:"
echo "1. Mutual Exclusion"
echo "2. Hold and Wait"
echo "3. No Preemption"
echo "4. Circular Wait"
