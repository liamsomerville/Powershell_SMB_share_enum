# Powershell_SMB_share_enum
lists shares and their contents for one or more machines - perfect for pentests


This Script is designed to read in a list of computers - see $Computers
It Then reviews all shares on all machines and prints a recursive directory listing for all shares
that are not the $admin or $IPC shares

It writes a seperate file for each share

# Usage
edit the path or file for $Computers, enter a list of machines you wish to test, one per line

# Kudos
This script was written for me by a coworker Graham Hope 
