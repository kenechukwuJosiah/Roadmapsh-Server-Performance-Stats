#!/bin/bash

OS=$(uname)

if [[ "$OS" == "Linux" ]]; then
    total_mem=$(free -m | awk '/^Mem:/ {print $2}')
    used_mem=$(free -m | awk '/^Mem:/ {print $3}')
    free_mem=$(free -m | awk '/^Mem:/ {print $4}')
    
    echo "Operating System: Linux"
    echo "Total Memory: ${total_mem} MB"
    echo "Used Memory: ${used_mem} MB"
    echo "Free Memory: ${free_mem} MB"

elif [[ "$OS" == "Darwin" ]]; then
    page_size=$(vm_stat | grep "page size of" | awk '{print $8}' | tr -d '.')
    free_pages=$(vm_stat | grep "Pages free" | awk '{print $3}' | tr -d '.')
    active_pages=$(vm_stat | grep "Pages active" | awk '{print $3}' | tr -d '.')
    inactive_pages=$(vm_stat | grep "Pages inactive" | awk '{print $3}' | tr -d '.')
    speculative_pages=$(vm_stat | grep "Pages speculative" | awk '{print $3}' | tr -d '.')
    wired_pages=$(vm_stat | grep "Pages wired down" | awk '{print $4}' | tr -d '.')

    free_mem=$(( (free_pages + speculative_pages) * page_size / 1024 / 1024 ))
    used_mem=$(( (active_pages + inactive_pages + wired_pages) * page_size / 1024 / 1024 ))
    total_mem=$(( free_mem + used_mem ))

    echo "Operating System: macOS"
    echo "Total Memory: ${total_mem} MB"
    echo "Used Memory: ${used_mem} MB"
    echo "Free Memory: ${free_mem} MB"
else
    echo "Unsupported Operating System: $OS"
    exit 1
fi
