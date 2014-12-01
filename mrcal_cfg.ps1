# Configuration for mrcal.ps1
Set-StrictMode -Version Latest

# Calendar begin year
Set-Variable -Option Constant -Name BEGIN_YEAR -Value 2015

# Calendar begin month
Set-Variable -Option Constant -Name BEGIN_MONTH -Value 1

# Number of months in calendar
Set-Variable -Option Constant -Name NUM_MONTHS -Value 12

# $BEGIN_YEAR national holidays in Japan
#   from http://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html
Set-Variable -Option Constant -Name NATIONAL_HOLIDAY -Value @(
    [DateTime] "$BEGIN_YEAR/01/01",
    [DateTime] "$BEGIN_YEAR/01/12",
    [DateTime] "$BEGIN_YEAR/02/11",
    [DateTime] "$BEGIN_YEAR/03/21",
    [DateTime] "$BEGIN_YEAR/04/29",
    [DateTime] "$BEGIN_YEAR/05/03",
    [DateTime] "$BEGIN_YEAR/05/04",
    [DateTime] "$BEGIN_YEAR/05/05",
    [DateTime] "$BEGIN_YEAR/05/06",
    [DateTime] "$BEGIN_YEAR/07/20",
    [DateTime] "$BEGIN_YEAR/09/21",
    [DateTime] "$BEGIN_YEAR/09/22",
    [DateTime] "$BEGIN_YEAR/09/23",
    [DateTime] "$BEGIN_YEAR/10/12",
    [DateTime] "$BEGIN_YEAR/11/03",
    [DateTime] "$BEGIN_YEAR/11/23",
    [DateTime] "$BEGIN_YEAR/12/23"
)

# $BEGIN_YEAR additional holidays
Set-Variable -Option Constant -Name ADDITIONAL_HOLIDAY -Value @(
    [DateTime] "$BEGIN_YEAR/01/02"
)

# $BEGIN_YEAR *NOT* holidays
Set-Variable -Option Constant -Name NOT_HOLIDAY -Value @(
)

# $BEGIN_YEAR paid time off days
Set-Variable -Option Constant -Name PAID_TIME_OFF_DAY -Value @(
    [DateTime] "$BEGIN_YEAR/08/12",
    [DateTime] "$BEGIN_YEAR/08/13",
    [DateTime] "$BEGIN_YEAR/08/14"
)
