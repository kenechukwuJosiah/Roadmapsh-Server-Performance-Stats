#!/bin/bash
echo "Processing..."

while true; do
  date=$(date '+%Y-%m-%d %H:%M:%S')
  echo "======================================= $date ============================================"

  usage=$(ps -A -o %cpu | awk '{s+=$1} END {print s "%"}')
  echo -e "\033[42mCPU Usage: $usage\033[m"


  sleep 10
done