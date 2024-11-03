#!/bin/bash
scripts=()

echo "Number of arguments: $#"

# Get and push all arguments value to scripts and return error when invalid arguments are entered
while [[ $# -gt 0 ]]; 
do
  case "$1" in
    --run=*)
      scripts+=("${1#*=}")
      echo "Added script: ${1#*=}"
      ;;
    --run)
      shift
      if [[ $# -gt 0 ]]; then
        scripts+=("$1")
        echo "Added script: $1"
      else
        echo "No script specified after --run"
        exit 1
      fi
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: $0 --run={total-usage|total-memory-usage|total-disk-usage|top-five-cpu-ps|top-five-memory-ps} ..."
      exit 1
      ;;
  esac
  shift
done

# Check if there's an argument
if [ ${#scripts[@]} -eq 0 ]; then
  echo "No scripts specified to run. Please use --run={total-usage|total-memory-usage|total-disk-usage|top-five-cpu-ps|top-five-memory-ps} ...}"
  exit 1
fi


# Example usage: ./cpu_usage.sh "${scripts[@]}"
echo "Scripts to run: ${scripts[@]}"

for script in ${scripts[@]}
do
  case $script in
    total-usage)
      echo "Getting total cpu usage. pls wait..."
      ./cpu_usage.sh
      ;;

    total_memory_usage)
      echo "Getting total memory usage. Pls wait..."
      ./total_memory_usage.sh
      ;;
    
    *)
      echo "Invalid input. Accepted values are {total-usage|total-memory-usage|total-disk-usage|top-five-cpu-ps|top-five-memory-ps}"
      exit 1
  esac
done
