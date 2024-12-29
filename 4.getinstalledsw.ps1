# This script retrieves a list of installed software on the system
Get-WmiObject -Class Win32_Product | Select-Object Name, Version


#understand commands , class , win32 , 
#try to check recently installed , or outdated version or not used .. and how commaand works 