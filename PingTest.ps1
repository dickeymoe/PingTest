
<#

.SYNOPSIS
This is a simple Powershell script to ping machines using a list of machine names

.DESCRIPTION
The script loop through the list supplied and return a false value if machine is unreachable

.EXAMPLE
./PingTest.ps1 C:\scripts\machine_list.txt


#>

 param (
    [Parameter(Mandatory=$true)] [string] $MachineList
 )

# Add list of machines to variable
$computers = get-content $MachineList


# Ping test
$computers | foreach-object {
    if (Test-Connection -ComputerName $_ -Quiet) {
      write-host $_ -NoNewline; Write-host " : True" 
    }
    else {
      Write-Host ""; Write-Host $_ "is offline" -foregroundcolor red;
      $did_fail = "True"
    }
}

if ($did_fail -eq "True"){
    write-host "Please check your machine list.";
    throw "Machines are offline";
}else{write-host "Ping Successful" -ForegroundColor Green;}

