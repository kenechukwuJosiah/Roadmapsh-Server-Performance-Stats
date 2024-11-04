#!/bin/bash

total_space=$(df -h --total | awk '/^total/ {print $2}')
used_space=$(df -h --total | awk '/^total/ {print $3}')
free_space=$(df -h --total | awk '/^total/ {print $4}')

echo "Total Disk Space: $total_space"
echo "Used Disk Space: $used_space"
echo "Free Disk Space: $free_space"

