<#
.SYNOPSIS
Convert from calendar (System.DateTime+ CliXML) to TSV.

.PARAMETER Path
Input calendar file name.

.INPUTS
None.

.OUTPUTS
TSV style strings.

.EXAMPLE
C:\PS> .\to_tsv.ps1 -Path calendar.xml
# Year	Month	Day	DayOfWeek	Holiday	PaidTimeOff
2015	1	1	Thursday	True	False
2015	1	2	Friday	True	False
2015	1	3	Saturday	True	False
2015	1	4	Sunday	True	False
2015	1	5	Monday	False	False
2015	1	6	Tuesday	False	False
...
#>

param(
    [parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -LiteralPath $_ -PathType Leaf})]
    [string] $Path
)

Set-StrictMode -Version Latest

Import-Clixml $Path | %{
    "# Year`tMonth`tDay`tDayOfWeek`tHoliday`tPaidTimeOff"
}{
    "$($_.Year)`t$($_.Month)`t$($_.Day)`t$($_.DayOfWeek)`t$($_.Holiday)`t$($_.PaidTimeOff)"
}
