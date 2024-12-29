param(
    [string]$sourceFile
)

#check if file exists
if(Test-Path $sourceFile) {
    #create backup using current date
    $backupFile = "$sourceFile" + '_' + (Get-Date -Format "yyyy-MM-dd_HH-mm-ss") + ".bak"
    Copy-Item $sourceFile -Destination $backupFile
    Write-Host "back up is created at: $backupFile"
}else{
    Write-Host "back up isnt created "
}
