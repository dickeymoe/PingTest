# PingTest
This is a simple Powershell script to ping machines using a list of machine names

# DESCRIPTION
The script loop through the list supplied and return a false value if machine is unreachable

# USAGE
PingTest.ps1 [-MachineList] <string[]>

# EXAMPLE
./PingTest.ps1 C:\scripts\machine_list.txt
