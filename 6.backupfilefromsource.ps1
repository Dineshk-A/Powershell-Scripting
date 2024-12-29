param(
    [string]$sourceFile
)

#check if file exists
if(Test-Path $sourceFile) {
    #create backup using current date
    $backupFile = "$sourceFile" + '_' + (Get-Date -Format "yyyy-MM-dd_HH-mm-ss") + ".bak"
    try {
        Copy-Item "$sourceFile" -Destination "$backupFile"
        Write-Host "Backup created at: $backupFile"
    } catch {
        Write-Host "Error creating backup: $_"
    }
} else {
    Write-Host "Source file does not exist."
}
