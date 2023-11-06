
function Get-TravelTimes() {


}

$fuzzyUrl = "https://atlas.microsoft.com/search/fuzzy/json?&api-version=1.0&subscription-key={Your-Azure-Maps-Subscription-key}&language=en-US&query=pizza"

function Get-MapAddress() {
    param(
        [string]$address
    )
    $subKey = $env:AzMapsSubKey
    $addyUrl = "https://atlas.microsoft.com/search/address/json?&subscription-key=$subKey&api-version=1.0&language=en-US&query=$address"
    $result = Invoke-WebRequest $addyUrl
    return $result
}