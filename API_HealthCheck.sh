#!/bin/sh
#Get IP address as input parameter
ip_address="$1"
endpoints="
  https://${ip_address}/auth/internal/v1/health?details=true
  https://${ip_address}/kwikanalytics/internal/v1/health?details=true
  https://${ip_address}/kwik24jobs/internal/v1/health?details=true
  https://${ip_address}/kwik24paymentgateway/internal/v1/health?details=true
  https://${ip_address}/kwik24/internal/v1/health?details=true
  https://${ip_address}/kwiksocket/internal/v1/health?details=true
  https://${ip_address}/kwik24repman/internal/v1/health?details=true
  https://${ip_address}/kwik24stackerws/internal/v1/health?details=true
"
#Validate IP address parameter as input
if [ -z "$ip_address" ]; then
  echo "Please provide an IP address as an argument."
  exit 1
fi
for endpoint in $endpoints; do
  response=$(curl -sSL "$endpoint")
    #To check response of endpoint links
    if echo "$response" | grep -q "status\":\"UP\""; then
    echo "Service at $endpoint is healthy."
          
  else
    echo "Service at $endpoint is not healthy."
         
  fi
done