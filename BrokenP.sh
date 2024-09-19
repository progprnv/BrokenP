#!/bin/bash

# Function to check if a URL is reachable
check_url() {
    local url=$1
    local http_code

    # Perform a HEAD request and get the HTTP status code
    http_code=$(curl -o /dev/null -s -w "%{http_code}" "$url")

    echo "$http_code"
}

# Check if the URL is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

url=$1
status_code=$(check_url "$url")

if [ "$status_code" -ge 200 ] && [ "$status_code" -lt 400 ]; then
    echo "URL $url is reachable (HTTP status code: $status_code)"
else
    echo "URL $url is not reachable (HTTP status code: $status_code)"
fi
