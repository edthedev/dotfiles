<#
.SYNOPSIS
    Converts a Microsoft Teams Project Board Excel export into Markdown.

.PARAMETER Path
    The path to an Excel file exported from a Microsoft Teams project.

.PARAMETER StartRow
    The first row of data in the Teams project Excel export.
    Defaults to 5.

.EXAMPLE

> ./Teams2Markdown.ps1 -Path C:\tmp\TeamsExport.xlsx | Out-File c:\tmp\TeamsMarkdown.md

.NOTES

This script requires the Import-Excel module, available in PowerShell gallery.

> Install-Module Import-Excel

#>
param(
  [string]$Path,
  [int]$StartRow = 5
)

$xlData = Import-Excel -Path $Path -StartRow $StartRow

  # $xlData | Select-Object -First 2 | Format-List

$xlData | Sort-Object { $_."Bucket" } | ForEach-Object {
  if(!$_."Task Name" -eq "") {
    ""
    "## $($_."Task Name") - $($_."Bucket Name")"
    ""

    if(!$_."Description" -eq "") {
      "$($_."Description")"
    }

    if(!$_."Checklist Items" -eq "") {
      $_."Checklist Items".split(';') | ForEach-Object {
        "+ $($_)"
      }
    }
  }
}