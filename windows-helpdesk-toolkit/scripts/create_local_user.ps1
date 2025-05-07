param (
    [Parameter(Mandatory=$true)]
    [string]$Username,

    [Parameter(Mandatory=$true)]
    [string]$Password
)

# Convert password to SecureString
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force

# Create local user
Try {
    New-LocalUser -Name $Username -Password $SecurePassword -FullName $Username -Description "Created via PowerShell script"
    Add-LocalGroupMember -Group "Users" -Member $Username
    Write-Output "User '$Username' created successfully."
} Catch {
    Write-Output "Error: $($_.Exception.Message)"
}
