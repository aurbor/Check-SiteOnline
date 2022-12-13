## Set the URL for testing below:

$url = "https://www.google.com"

## Test HTTP Response code based on URL above and return 'True' if connection is successful, and 'False' if the connection is not and log an error.

$response = Invoke-WebRequest -Uri $url -UseBasicParsing
if ($response.StatusCode -eq 200) {
    return $true
} else {
    return $false
}
