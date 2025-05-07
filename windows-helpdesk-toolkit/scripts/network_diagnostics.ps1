Write-Output "===== NETWORK DIAGNOSTIC TOOL ====="

# Get IP configuration
Write-Output "`n--- IP Configuration ---"
Get-NetIPAddress | Where-Object {$_.AddressFamily -eq "IPv4"} | Format-Table -AutoSize

# Default Gateway
Write-Output "`n--- Default Gateway ---"
$gateway = (Get-NetRoute -DestinationPrefix "0.0.0.0/0").NextHop
Write-Output "Default Gateway: $gateway"

# Ping Gateway
Write-Output "`n--- Pinging Gateway ---"
Test-Connection -ComputerName $gateway -Count 4

# Ping DNS (Google)
Write-Output "`n--- Pinging DNS (8.8.8.8) ---"
Test-Connection -ComputerName 8.8.8.8 -Count 4

# Ping External Site
Write-Output "`n--- Pinging External Site (google.com) ---"
Test-Connection -ComputerName google.com -Count 4

# Check DNS resolution
Write-Output "`n--- DNS Resolution Test ---"
try {
    Resolve-DnsName google.com
} catch {
    Write-Output "DNS Resolution Failed: $($_.Exception.Message)"
}

Write-Output "`nDiagnostics complete."
