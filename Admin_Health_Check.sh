#!/bin/bash
# Get IP address as input parameter
ip_address="$1"
endpoint="https://instant-admin.bigbasket.com/internal/v1/health?details=true"
# Validate IP address parameter as input
if [ -z "$ip_address" ]; then
  echo "Please provide an IP address as an parameter."
  exit 1
fi
response=$(curl -sSL "$endpoint")
# To check response of the endpoint
if echo "$response" | grep -q "status\":\"UP\""; then
  echo "Service at $endpoint is healthy."
else
  echo "Service at $endpoint is not healthy."
fi