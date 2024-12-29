# This script removes .log files older than 30 days from a hardcoded directory.

# Hardcoded directory and age in days
$logDirectory = "C:\path\to\logs"  # Modify with your directory
$daysOld = 30  # Modify with your desired number of days

# Check if the directory exists
if (Test-Path $logDirectory) {
    # Get all log files older than the specified number of days
    $oldLogs = Get-ChildItem -Path $logDirectory -Filter "*.log" | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$daysOld) }
    
    # Remove the old log files
    foreach ($log in $oldLogs) {
        Remove-Item $log.FullName
        Write-Host "Deleted log file: $($log.FullName)"
    }
    
    if ($oldLogs.Count -eq 0) {
        Write-Host "No log files older than $daysOld days were found."
    }
} else {
    Write-Host "The specified directory does not exist."
}


# Get-ChildItem -Path $logDirectory -Filter "*.log":

# Get-ChildItem is a cmdlet used to retrieve the list of files and directories within a specified location.
# -Path $logDirectory specifies the path where you want to search for the files. $logDirectory is a variable, presumably containing the path to a directory where the log files are stored.
# -Filter "*.log" limits the files returned to those with a .log extension. This ensures you are only dealing with log files, not other types of files in the directory.
# The result of this command is a collection of .log files from the $logDirectory.

# | (Pipeline operator):

# The pipeline (|) takes the output of the previous command (the list of .log files) and passes it as input to the next part of the command.
# Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$daysOld) }:

# Where-Object is a cmdlet used to filter objects based on a condition.
# $_ represents the current object in the pipeline (in this case, each .log file).
# $_.LastWriteTime is a property of the file object, which holds the timestamp of when the file was last modified (written to).
# Get-Date retrieves the current date and time.
# AddDays(-$daysOld) subtracts $daysOld days from the current date. For example, if $daysOld = 30, this would give the date 30 days ago.
# -lt is a comparison operator that stands for "less than". It compares the LastWriteTime of each log file with the date $daysOld days ago.
# If the LastWriteTime is less than (earlier than) the date from $daysOld days ago, the file matches the condition.
# So, this part of the command filters out the files that have not been modified in the last $daysOld days. It will keep only the log files whose LastWriteTime is older than $daysOld days.