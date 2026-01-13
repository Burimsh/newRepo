#!/bin/bash

DURATION=30   # duration in seconds

echo "Starting CPU stress test for $DURATION seconds..."
echo "Monitoring system performance..."

timeout "$DURATION" bash -c '
while true
do
  :
done
'

echo "CPU stress test completed."

