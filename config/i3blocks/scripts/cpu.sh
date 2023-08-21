#!/bin/bash

# Get user CPU usage as a percentage
user_cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')

echo "CPU: $user_cpu_usage%"
