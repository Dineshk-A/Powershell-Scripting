1. What is PowerShell Scripting?
PowerShell scripting refers to writing a series of commands and scripts in the PowerShell language to automate tasks, manage systems, and perform operations in a Windows environment. PowerShell is a task automation framework consisting of a command-line shell and scripting language, designed for system administration. It uses cmdlets (small .NET-based commands) and can interact with system components like the file system, registry, event logs, and even remote systems.

PowerShell is often used to:

Automate system administration tasks.
Manage configurations.
Perform repetitive tasks.
Monitor and collect system information.
Interact with applications and services (e.g., Active Directory, Azure, SQL Server).

2. What is Scripting?
Scripting is the process of writing scripts to automate tasks that would otherwise require manual intervention. A script is essentially a series of instructions or commands written in a scripting language (like PowerShell, Python, Bash, etc.) that are executed sequentially by a script interpreter. Scripting allows for repetitive tasks to be automated, making processes more efficient, reducing human error, and enabling system administration to be done at scale.

We use scripting for:

Automation: Replacing manual operations with automated ones.
Efficiency: Reducing the amount of time spent on repetitive tasks.
Consistency: Ensuring tasks are performed the same way each time.
Remote administration: Managing multiple machines from a single script.

param(
    [string]$sourceFile
)
powershell -ExecutionPolicy Bypass -File "loc" -sourceFile "loc"

1. Run PowerShell Script with powershell Command (for Windows PowerShell)

Syntax:

powershell -ExecutionPolicy Bypass -File "C:\path\to\your\script.ps1"

Explanation:

powershell: This invokes the Windows PowerShell executable.

-ExecutionPolicy Bypass: This bypasses the script execution policy temporarily to allow the script to run (useful if the policy is restrictive). Note: It's important to use this only when you trust the script.

-File "C:\path\to\your\script.ps1": This specifies the path to the PowerShell script you want to run.

2. Run PowerShell Script with pwsh Command (for PowerShell Core)

If you are using PowerShell Core (cross-platform, pwsh), the command is slightly different, but the principle is the same:

Syntax:

pwsh -ExecutionPolicy Bypass -File "C:\path\to\your\script.ps1"
Example:

pwsh -ExecutionPolicy Bypass -File "C:\Scripts\myscript.ps1"

3. Run PowerShell Command in CMD without a Script
If you want to run a one-liner PowerShell command from CMD, you can do it like this:

Syntax:

powershell -Command "Your-PowerShell-Command"

Example:

powershell -Command "Get-Process"
This runs the Get-Process PowerShell command directly from the CMD prompt.

4. Run PowerShell Script with Full Path
If you want to run the script without using the -File option, you can provide the full path of the PowerShell script:

Example:

powershell "C:\Scripts\myscript.ps1"

This runs the myscript.ps1 directly.

****
In PowerShell, $_ is a special variable used within script blocks (like those passed to Where-Object, ForEach-Object, etc.) to refer to the current object in the pipeline. It represents the item being processed at that point in the loop or filter.

Here's the breakdown of how $_ works:
Common Usage:
Where-Object { $_.Property }:
The Where-Object cmdlet is used to filter objects in the pipeline based on a condition.
Inside the script block {}, $_ represents the current object being processed from the pipeline.
$_ allows you to reference the properties or methods of the current object.

Consider this example with a list of files:

Get-ChildItem -Path C:\Logs | Where-Object { $_.Extension -eq ".log" }

Get-ChildItem gets all files and directories from the path C:\Logs.

The output (the collection of files) is passed to Where-Object.

Inside the Where-Object block:
$_ refers to the current file being evaluated.
$_.Extension retrieves the extension of the current file (.log, .txt, etc.).
The condition $_ .Extension -eq ".log" filters the files to keep only those with the .log extension.
****

***
In PowerShell, the use of $() (known as subexpression operator) allows you to evaluate an expression inside a string or other expressions. The reason why you see two $ signs in Write-Host $($log.FullName) is because of this mechanism.

Let's break down the expression:

1. $log.FullName:
$log: This is a variable that refers to an object (in this case, probably a file or directory object).
.FullName: This accesses the FullName property of the $log object, which returns the full path of the file or directory.
So, $log.FullName would give you the full path of the file or folder, like C:\Logs\logfile.log.

2. The $() subexpression operator:
The $() operator allows you to evaluate an expression inside a string, and the result of that evaluation is inserted into the string.
In other words, it’s a way of embedding a dynamic expression within a string.
***

