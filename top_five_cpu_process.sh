#!/bin/bash
echo "Processing..."

top -b -n 1 | head -n 12  | tail -n 5
