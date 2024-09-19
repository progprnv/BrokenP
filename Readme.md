# Broken Link Detector

This script checks if a given URL or URLs listed in a file are reachable or not by using `curl` to perform an HTTP HEAD request and retrieve the HTTP status code.

## Usage

1. **Clone or download the repository** to your local machine.

2. **Make the script executable**:
    ```bash
    chmod +x broken_link_detector.sh
    ```

3. **Run the script** with a single URL or a file containing URLs:
    - **Single URL**:
      ```bash
      ./broken_link_detector.sh http://example.com
      ```

    - **File with URLs** (one URL per line):
      ```bash
      ./broken_link_detector.sh subdomains.txt
      ```

## Script Details

- **File**: `broken_link_detector.sh`
- **Language**: Bash
- **Dependencies**: `curl`

### Functionality

- The script can check:
  - A single URL provided as a command-line argument.
  - Multiple URLs listed in a file where each URL is on a new line.
- It outputs whether each URL is reachable based on the HTTP status code.
- HTTP status codes in the range 200-399 are considered reachable.
- Other status codes indicate that the URL is not reachable.

### Example Output

**For a single URL:**

```bash
$ ./broken_link_detector.sh http://example.com
URL http://example.com is reachable (HTTP status code: 200)
