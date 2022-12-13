## Set the URL for testing below:

$url = "https://www.google.com"

## Check if using HTTP or HTTPS

$protocol = $url.split('://')[0]

If ($protocol -eq "http") {
    $port = 80
} ElseIf ($protocol -eq "https") {
    $port = 443
} Else {
    Throw "There's an issue with the URL. Please check that you've included https:// or http:// in the address and try again."
}

## Test HTTP Response code based on chosen port and return 'True' if connection is successful, and 'False' if the connection is not.

if (-not (Test-NetConnection -ComputerName $hostname -Port $port -WarningAction SilentlyContinue -ErrorAction SilentlyContinue).TcpTestSucceeded) { 
    Write-Host "There's an issue connecting on the chosen port. Please verify that you're using the correct protocol in the URL (http:// or https://) and try again."
    $false
} else {
    $response = Invoke-WebRequest -Uri $url -UseBasicParsing
    if ($response.StatusCode -ne 200) {
        return $false
    } else {
        return $true
    }
}
