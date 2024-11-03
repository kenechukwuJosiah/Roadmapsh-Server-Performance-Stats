#!/bin/bash

echo "Display CPU Usage"
echo "Processing..."

while true; do
  date=$(date '+%Y-%m-%d %H:%M:%S')
  echo "======================================= $date ============================================"

  usage=$(top -l 1 | grep "CPU usage")
  echo -e "\033[42mCPU Usage: $usage\033[m"


  sleep 0
done