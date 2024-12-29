# This script retrieves basic system information
Get-ComputerInfo | Select-Object CsName, OsArchitecture, WindowsVersion, WindowsBuildLabEx

#try to understand , how it works behind the scenes