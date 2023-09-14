#!/bin/bash

# Network interface to monitor (e.g., eno1)
INTERFACE="eno1"

# Get the initial received bytes count
init=$(cat "/sys/class/net/$INTERFACE/statistics/rx_bytes")

echo "Recording bandwidth usage. Press Enter to stop."

# Wait for user input to stop recording
read -r

# Get the final received bytes count
fin=$(cat "/sys/class/net/$INTERFACE/statistics/rx_bytes")

# Calculate the difference
usage_bytes=$((fin - init))

# Convert bytes to human-readable format
usage_human=$(numfmt --to=iec $usage_bytes)

printf "%s of bandwidth used.\n" "$usage_human"
