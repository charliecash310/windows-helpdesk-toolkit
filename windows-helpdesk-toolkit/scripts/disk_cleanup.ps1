# Clear Temp Files and Recycle Bin
Write-Output "Starting Disk Cleanup..."

# Clear Temp folders
$TempFolders = @("$env:TEMP", "$env:WINDIR\Temp")
foreach ($folder in $TempFolders) {
    Write-Output "Cleaning $folder..."
    Remove-Item "$folder\*" -Recurse -Force -ErrorAction SilentlyContinue
}

# Clear Recycle Bin
Write-Output "Emptying Recycle Bin..."
$(New-Object -ComObject Shell.Application).NameSpace(0xA).Items() | ForEach-Object { Remove-Item $_.Path -Recurse -Force -ErrorAction SilentlyContinue }

Write-Output "Disk Cleanup Completed."
