<#
.SYNOPSIS

This Script is designed to provide a recursive directry listing of a shares on one or more machines

.DESCRIPTION

This Script is designed to read in a list of computers - see $Computers
It Then reviews all shares on all machines and prints a recursive directory listing for all shares
that are not the $admin or $IPC shares

It writes a seperate file for each share

.NOTES
Script was written for me by a co-worker Graham Hope, so big thanks and all kudos to him!

#>


$Computers = Get-Content c:\Temp\MyList.txt
$ExportDir = "C:\Test"

Foreach  ($Computer in $Computers)
    {
    Get-WmiObject -Query "SELECT * FROM Win32_Share WHERE Name != 'ADMIN$'`
    AND Name != 'IPC$' AND Name != 'B$' AND Name != 'C$'" -ComputerName $Computer |
    Foreach {Robocopy \\$($_.PSComputername)\$($_.name) NULL /L /S /NJH /NJS /FP /NC /NDL /XJ /TS /R:0 /W:0 /LOG:$ExportDir\$($_.PSComputername)_$($_.name)_$(get-date -f yyyy-MM-dd).csv}
    # /LOG:"$ExportDir\$($_.PSComputername)" + "_" + "$($_.name)" + "$(get-date -f yyyy-MM-dd).csv"}
} 


