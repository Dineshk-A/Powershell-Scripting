# This script creates a directory and writes a simple text file in it
New-Item -ItemType Directory -Path "D:\PY-leetcode\powershell\temp"
Set-Content -Path "D:\PY-leetcode\powershell\temp\dup.txt" -Value "Hello, Powershell !"