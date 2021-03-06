<#
.SYNPOSIS

Fetch closed GitHub issues that were updated in the last 14 days.

#>
function Get-GHClosed {
  param(
    [int]$days = -14
  )
  $repos = @('SecOps-Tools', 'secdev-job-aids', 'awscli-login')
  $issueSearchParams = @{ State = 'closed'; OwnerName = 'techservicesillinois' }
  $closed = @()
  $repos | ForEach-Object { 
    $closed += Get-GitHubIssue -RepositoryName $_ @issueSearchParams
  }

  # Limit to past two weeks
  $issues = $closed | Where-Object { $_.updated_at -gt (Get-Date).AddDays($days) }
  return $issues
}


<#
.SYNOPSIS

Show closed GitHub issues that were updated in the last 14 days.

#>
function Show-GHClosed() {
  param(
    [int]$days = -14
  )
  Get-GHClosed -days $days | ForEach-Object {
    # Markdown output
    " + [" + $_.Title + " (" + $_.Number + ")](" + $_.html_url + ")"
  }
  # Format-Table -Property Number, Title, Url

}

<#
.SYNPOSIS

Fetch GitHub issues I am working on.

#>
function Get-GHMine() {
  $repos = @('SecOps-Tools', 'secdev-job-aids', 'awscli-login')
  $issueSearchParams = @{ Assignee = 'edthedev'; State = 'open'; OwnerName = 'techservicesillinois' }
  $issues = @()
  $repos | ForEach-Object { 
    $issues += Get-GitHubIssue -RepositoryName $_ @issueSearchParams
  }

  return $issues
}

<#
.SYNOPSIS

Show GitHub issues I am working on.

#>
function Show-GHMine() {
  Get-GHMine | ForEach-Object {
    # Markdown output
    " + [" + $_.Title + " (" + $_.Number + ")](" + $_.html_url + ")"
  }
}


Export-ModuleMember -Function Get-GHClosed
Export-ModuleMember -Function Show-GHClosed
Export-ModuleMember -Function Get-GHMine
Export-ModuleMember -Function Show-GHMine