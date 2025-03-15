#!/bin/bash

# Function to get CPU usage
get_cpu_usage() {
  top -bn1 | grep "Cpu(s)" | \
  sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
  awk '{print 100 - $1}'
}

# Function to get memory usage
get_memory_usage() {
  free | grep Mem | awk '{print $3/$2 * 100.0}'
}

# Function to get disk space usage
get_disk_usage() {
  df / | grep / | awk '{print $5}' | sed 's/%//g'
}

# Get the usage values
cpu_usage=$(get_cpu_usage)
memory_usage=$(get_memory_usage)
disk_usage=$(get_disk_usage)

# Determine the health status
if (( $(echo "$cpu_usage < 60" | bc -l) )) && (( $(echo "$memory_usage < 60" | bc -l) )) && (( $(echo "$disk_usage < 60" | bc -l) )); then
  health_status="healthy"
else
  health_status="not healthy"
fi

# Print the health status
echo "Health status: $health_status"

# Explain the reason for health status if "explain" argument is passed
if [ "$1" == "explain" ]; then
  echo "CPU usage: $cpu_usage%"
  echo "Memory usage: $memory_usage%"
  echo "Disk usage: $disk_usage%"
fi
