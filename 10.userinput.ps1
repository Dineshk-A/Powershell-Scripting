$userinput = Read-Host "enter some text"

$filepath = "D:\PY-leetcode\powershell\temp.txt"

$userinput | Out-File -FilePath $filepath

Write-Host "content is written on $($filepath)"