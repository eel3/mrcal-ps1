<#
.SYNOPSIS
Count workdays.

.PARAMETER Calendar
Input calendar file name.

.PARAMETER Year
Year to count.

.PARAMETER FirstMonth
First month to count.

.PARAMETER LastMonth
Last month to count.

.INPUTS
None.

.OUTPUTS
Workdays.

.EXAMPLE
C:\PS> Get-Date -UFormat '%Y/%m/%d'
2015/05/28
C:\PS> .\workdays.ps1 -Calendar calendar.xml
18
C:\PS> .\workdays.ps1 -Calendar calendar.xml -FirstMonth 5
18
C:\PS> .\workdays.ps1 -Calendar calendar.xml -FirstMonth 5 -LastMonth 5
18
C:\PS> .\workdays.ps1 -Calendar calendar.xml -FirstMonth 5 -LastMonth 6
40
C:\PS> .\workdays.ps1 -Calendar calendar.xml -FirstMonth 6
22
C:\PS> .\workdays.ps1 -Calendar calendar.xml -FirstMonth 2 -LastMonth 3
41
C:\PS> .\workdays.ps1 -Calendar calendar.xml -Year 2015 -FirstMonth 2 -LastMonth 3
41
C:\PS> .\workdays.ps1 -Calendar calendar.xml -Year 2016 -FirstMonth 2 -LastMonth 3
42
#>

param(
    [parameter(Mandatory=$true)]
    [ValidateScript({ Test-Path -LiteralPath $_ -PathType Leaf })]
    [string] $Calendar,
    [ValidateScript({ $_ -ge 2015 })]
    [int] $Year = (Get-Date).Year,
    [ValidateRange(1, 12)]
    [int] $FirstMonth = (Get-Date).Month,
    [ValidateRange(1, 12)]
    [ValidateScript({ $_ -ge $FirstMonth })]
    [int] $LastMonth = $FirstMonth
)

Set-StrictMode -Version Latest

# main routine
(Import-Clixml $Calendar |
 ?{ ($_.Year -eq $Year) `
        -and ($_.Month -ge $FirstMonth) `
        -and ($_.Month -le $LastMonth) `
        -and (-not $_.Holiday) } |
 Measure-Object).Count
