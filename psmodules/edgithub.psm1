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
.SYNPOSIS

Fetch GitHub issues that are tagged to discuss this morning.

#>
function Get-GHToDiscuss {
  param(
    [int]$days = -14
  )
  $repos = @('SecOps-Tools', 'secdev-job-aids', 'awscli-login')
  $issueSearchParams = @{ State = 'open'; OwnerName = 'techservicesillinois' }
  $closed = @()
  $repos | ForEach-Object { 
    $closed += Get-GitHubIssue -RepositoryName $_ @issueSearchParams
  }
  $issues = $issues | Where-Object { $_.labels -Contains 'DiscussAtStandUp' }

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

  # Ignore issues that have been updated in the last day.
  $issues = $issues | Where-Object { $_.updated_at -lt (Get-Date).AddDays(-1) }

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

<#
.SYNOPSIS

Get GitHub issues that need sized.

.DESCRIPTION

Runs this GitHub search:
is:open is:issue -label:M -label:L -label:S -label:XL -label:XS 

#>
function Get-GHUnsized() {
  $repos = @('SecOps-Tools', 'secdev-job-aids', 'awscli-login')
  $issueSearchParams = @{ State = 'open'; OwnerName = 'techservicesillinois' }
  $issues = @()
  $repos | ForEach-Object { 
    $issues += Get-GitHubIssue -RepositoryName $_ @issueSearchParams
  }

  # Ignore issues that have been updated in the last day.
  $issues = $issues | Where-Object { -Not $_.labels -Contains 'XS' }
  $issues = $issues | Where-Object { -Not $_.labels -Contains 'S' }
  $issues = $issues | Where-Object { -Not $_.labels -Contains 'M' }
  $issues = $issues | Where-Object { -Not $_.labels -Contains 'L' }
  # Leave XL issues, as they need split.

  return $issues
}

function Get-GHNoMilestone() {
  $repos = @('SecOps-Tools', 'secdev-job-aids', 'awscli-login')
  $issueSearchParams = @{ State = 'open'; OwnerName = 'techservicesillinois' }
  $issues = @()
  $repos | ForEach-Object { 
    $issues += Get-GitHubIssue -RepositoryName $_ @issueSearchParams
  }

  # Get open issues with empty milestone
  $issues = $issues | Where-Object { $null -eq $_.milestone }
  return $issues
}
function Show-GHNoMilestone(){
  Get-GHNoMilestone| Show-GHIssuesAsMarkdown
}

function Show-GHUnsized() {
  Get-GHUnsized | ForEach-Object {
    # Markdown output
    " + [" + $_.Title + " (" + $_.Number + ")](" + $_.html_url + ")" + $_.labels
  }
}

function Show-GHByAssignee() {
  $repos = @('SecOps-Tools', 'secdev-job-aids', 'awscli-login')
  $issueSearchParams = @{ State = 'open'; OwnerName = 'techservicesillinois' }
  $issues = @()
  $repos | ForEach-Object { 
    $issues += Get-GitHubIssue -RepositoryName $_ @issueSearchParams
  }

  # TODO: Group output by assignee.

  return $issues
}



function Show-GHToDiscuss() {
  Get-GHToDiscuss | Show-GHIssuesAsMarkdown
}


function Show-GHIssuesAsMarkdown() {
  process
	{
    # Markdown output
    " + [" + $_.Title + " (" + $_.Number + ")](" + $_.html_url + ")" 
  }
}


Export-ModuleMember -Function Get-GHClosed
Export-ModuleMember -Function Show-GHClosed
Export-ModuleMember -Function Get-GHMine
Export-ModuleMember -Function Show-GHMine
Export-ModuleMember -Function Get-GHUnsized
Export-ModuleMember -Function Show-GHUnsized
Export-ModuleMember -Function Show-GHToDiscuss
Export-ModuleMember -Function Get-GHNoMilestone
Export-ModuleMember -Function Show-GHNoMilestone