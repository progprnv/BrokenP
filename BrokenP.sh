#!/bin/bash

# Function to check if a URL is reachable
check_url() {
    local url=$1
    local http_code

    # Perform a HEAD request and get the HTTP status code
    http_code=$(curl -o /dev/null -s -w "%{http_code}" "$url")

    echo "$http_code"
}

# Function to check URLs from a file
check_urls_from_file() {
    local file=$1

    while IFS= read -r url; do
        if [ -n "$url" ]; then
            status_code=$(check_url "$url")
            if [ "$status_code" -ge 200 ] && [ "$status_code" -lt 400 ]; then
                echo "URL $url is reachable (HTTP status code: $status_code)"
            else
                echo "URL $url is not reachable (HTTP status code: $status_code)"
            fi
        fi
    done < "$file"
}

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <URL|subdomains_file>"
    exit 1
fi

# Check if the argument is a file or a single URL
if [ -f "$1" ]; then
    check_urls_from_file "$1"
else
    url=$1
    status_code=$(check_url "$url")
    if [ "$status_code" -ge 200 ] && [ "$status_code" -lt 400 ]; then
        echo "URL $url is reachable (HTTP status code: $status_code)"
    else
        echo "URL $url is not reachable (HTTP status code: $status_code)"
    fi
fi
