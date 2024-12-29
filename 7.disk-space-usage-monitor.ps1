#This script checks the disk space usage for all drives and alerts if any drive exceeds a set threshold (80%).
#naming best practices 
#understand Get-PSDrive command and $drive.Used , $drive.mac

# Set the threshold for disk usage (hardcoded)
$threshold = 80

# Get disk space usage for all drives
$drives = Get-PSDrive -PSProvider FileSystem

foreach ($drive in $drives) {
    $usedPercent = [math]::round(($drive.Used / $drive.Maximum) * 100, 2)
    if ($usedPercent -gt $threshold) {
        Write-Host "Warning: $($drive.Name) is at $usedPercent% usage."
    } else {
        Write-Host "$($drive.Name) is at $usedPercent% usage."
    }
}
