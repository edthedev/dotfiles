
## Setup

1. LOL. It defaults to `bash`. Change that.

2. Probably one-time install

    ```powershell
    Install-Module -Name PSWSMan -AcceptLicense -Confirm
    Install-WSMan   # Web services for management
    Import-Module ExchangeOnlineManagement
    ```

3. Probably per session:

    ```powershell
    Import-Module ExchangeOnlineManagement
    Connect-ExchangeOnline
    ```

## Tasks

### Distribution Group

Seems like this is an older way to do it.

1. Create distribution group

    ```powershell
    $groupname = 'loves_tacos'
    new-distributiongroup $groupname
    ```

2. Add some folks to it

    ```powershell
    Add-DistributionGroupMember -Identity $groupname -Member bob
    Add-DistributionGroupMember -Identity $groupname -Member larry
    ```

3. Verify the list is as desired


    ```powershell
    get-distributiongroupmember -identity $groupname
    ```

4. Add an email alias

    ```powershell
    $domain = 'tacos.net'
    set-distributiongroup -identity $groupname -EmailAddresses @{add="$groupname@$domain"}
    get-distributiongroup $groupname | Select Alias, EmailAddresses, ManagedBy, DistinguishedName | Format-List
    ```



### Or create an entire shared mailbox

1. Create a shared mailbox

    ```powershell
    $groupname = 'tacos'
    $displayname = 'Loves Tacos'
    New-Mailbox -Shared -Name "$groupname" -DisplayName $displayname
    ```

2. Decide who to add.

    You can review your mailbox users with `Get-Mailbox`

3. Add people

    ```powershell
    Add-MailboxPermission -Identity $groupname -AccessRights FullAccess -User <user>
    ```

4. Review

    ```powershell
    Get-MailboxPermission $groupname
    ```
