<#
.SYNOPSIS
Generate machine-readable one year calendar.

.PARAMETER Path
Output calendar file name.

.INPUTS
None.

.OUTPUTS
None.

.EXAMPLE
C:\PS> .\mrcal.ps1 -Path calendar.xml
#>

param(
    [parameter(Mandatory=$true)]
    [string] $Path
)

Set-StrictMode -Version Latest

. "$(Split-Path -Parent $script:MyInvocation.MyCommand.Path)\mrcal_cfg.ps1"

function Get-DaysInYear(
    [ValidatePattern('\d{3,}')]
    [int] $year = (Get-Date).Year,
    [ValidateRange(1, 12)]
    [int] $month = 1,
    [ValidateScript({$_ -ge 1})]
    [int] $nmonths = 12)
{
    $begin = [DateTime] "$year/$month/01"
    $end = $begin.AddMonths($nmonths).AddDays(-1)
    for ($day = $begin; $day -le $end; $day = $day.AddDays(1)) {
        $day
    }
}

filter Add-Property
{
    Add-Member -InputObject $_ NoteProperty Holiday $false
    Add-Member -InputObject $_ NoteProperty PaidTimeOff $false
    $_
}

filter With-RegularHoliday
{
    $day = $_
    switch ($_.DayOfWeek) {
        'Saturday' { $day.Holiday = $true; break }
        'Sunday'   { $day.Holiday = $true; break }
    }
    $day
}

filter With-NationalHoliday
{
    if ($NATIONAL_HOLIDAY -contains $_) {
        $_.Holiday = $true
    }
    $_
}

filter With-AdditionalHoliday
{
    if ($ADDITIONAL_HOLIDAY -contains $_) {
        $_.Holiday = $true
    }
    $_
}

filter With-NotHoliday
{
    if ($NOT_HOLIDAY -contains $_) {
        $_.Holiday = $false
    }
    $_
}

filter With-PaidTimeOffDay
{
    if ($PAID_TIME_OFF_DAY -contains $_) {
        $_.Holiday = $true
        $_.PaidTimeOff = $true
    }
    $_
}

# main routine
Get-DaysInYear -year $BEGIN_YEAR -month $BEGIN_MONTH -nmonths $NUM_MONTHS |
Add-Property            |
With-RegularHoliday     |
With-NationalHoliday    |
With-AdditionalHoliday  |
With-NotHoliday         |
With-PaidTimeOffDay     |
Export-Clixml $Path
