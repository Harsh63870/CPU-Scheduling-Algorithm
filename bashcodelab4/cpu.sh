#!/bin/bash
THRESHOLD=75

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | \
            awk '{print 100 - $8}')

CPU_USAGE_INT=${CPU_USAGE%.*}

echo "Current CPU Usage: $CPU_USAGE_INT%"

if [ "$CPU_USAGE_INT" -gt "$THRESHOLD" ]; then
    echo "ALERT! CPU usage exceeded $THRESHOLD%."
else
    echo "CPU usage is under control."
fi
