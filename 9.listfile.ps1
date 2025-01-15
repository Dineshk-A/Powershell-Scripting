#define directory path 
$Directory = "D:\PY-leetcode\powershell"

$Files = Get-ChildItem -Path $Directory -File 

foreach ($File in $Files) {
    Write-Host "File: $($File.name), SizeL $($File.Length / 100MB)MB"
}