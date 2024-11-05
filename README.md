# System Monitoring Script

This is a bash script designed to execute various system monitoring commands, including CPU usage, memory usage, and disk statistics. The script accepts arguments to specify which monitoring commands to run, such as `cpu-stat`, `memory-stat`, `disk-stat`, `top-five-cpu-ps`, and `top-five-memory-ps`.

## Prerequisites

Ensure the following scripts are in the same directory as this script:

- `cpu_usage.sh` - Fetches CPU usage statistics
- `total_memory_usage.sh` - Retrieves memory usage statistics
- `total_disk_usage.sh` - Shows disk usage statistics
- `top_five_cpu_process.sh` - Lists the top 5 CPU-intensive processes
- `top_five_memory_usage.sh` - Lists the top 5 memory-intensive processes

## Usage

To run the script, provide one or more `--run` arguments specifying the system stat commands you want to execute.

### Syntax

```bash
./server-stats.sh --run=<command> | --run <command>
```
