Write-Output "===== Installing Common Applications with Chocolatey ====="

# Check if Chocolatey is installed
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Output "Chocolatey is not installed. Please install Chocolatey before running this script."
    exit
}

# List of applications to install
$apps = @(
    "googlechrome",
    "7zip",
    "notepadplusplus",
    "vlc",
    "firefox"
)

foreach ($app in $apps) {
    Write-Output "Installing $app..."
    choco install $app -y --no-progress
}

Write-Output "All selected applications have been installed."
