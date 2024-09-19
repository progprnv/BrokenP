# Broken Link Detector

This script checks if a given URL is reachable or not by using `curl` to perform an HTTP HEAD request and retrieve the HTTP status code.

## Usage

1. **Clone or download the repository** to your local machine.

2. **Make the script executable**:
    ```bash
    chmod +x broken_link_detector.sh
    ```

3. **Run the script** with the URL you want to check:
    ```bash
    ./broken_link_detector.sh http://example.com
    ```

## Script Details

- **File**: `broken_link_detector.sh`
- **Language**: Bash
- **Dependencies**: `curl`

### Functionality

- The script performs a HEAD request to the specified URL.
- It outputs whether the URL is reachable based on the HTTP status code.
- HTTP status codes in the range 200-399 are considered reachable.
- Other status codes indicate that the URL is not reachable.

### Example Output

```bash
$ ./broken_link_detector.sh http://example.com
URL http://example.com is reachable (HTTP status code: 200)

$ ./broken_link_detector.sh http://nonexistenturl.example
URL http://nonexistenturl.example is not reachable (HTTP status code: 404)
