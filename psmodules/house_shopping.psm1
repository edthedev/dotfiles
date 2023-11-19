
function Add-Address(){
    Param(
        [string]$addressFile = "Addresses.csv"
        [string]$outFile= "Address_Details.csv"
    )
    $addressList = Get-Content $addressFile | ConvertFrom-Csv
    $details = Get-Content $outFile| ConvertFrom-Csv

    $addressList | ForEach-Object {
        if($details -NotContains $_.Address)
        {
            $details.Address = $_.Address
            $details.SqFt = $_.SqFt
            $details.Cost = $_.Cost
        }
    }
    $details | Export-Csv -NoTypeInformation -Path $outFile
    Write-Host "Updated $outFile"
}


function Add-AddressLocations(){
    Param(
        [string]$outFile= "Address_Details.csv"
    )
    $details = Get-Content $outFile| ConvertFrom-Csv

    $details | ForEach-Object {
        if($_.Lat -eq '')
        {
            $posit = Get-MapCoords -Address $_.Address
            $_.Lat = $posit.Lat
            $_.Lon = $posit.Lon
        }
    }
    $details | Export-Csv -NoTypeInformation -Path $outFile
    Write-Host "Updated $outFile"
}


function Add-TravelTimes() {
    Param(
        [string]$outFile= "Address_Details.csv"
    )
    $details = Get-Content $outFile| ConvertFrom-Csv

}

$fuzzyUrl = "https://atlas.microsoft.com/search/fuzzy/json?&api-version=1.0&subscription-key={Your-Azure-Maps-Subscription-key}&language=en-US&query=pizza"

function Get-MapAddress() {
    param(
        [string]$address
    )
    $subKey = $env:AzMapsSubKey
    $addyUrl = "https://atlas.microsoft.com/search/address/json?&subscription-key=$subKey&api-version=1.0&language=en-US&query=$address"
    $result = Invoke-WebRequest $addyUrl
    if($result.StatusCode -Eq 200){
        return $result.Content | ConvertFrom-Json
    }
    return $result.StatusDescription
}

function Get-MapCoords() {
    param(
        [string]$address
    )
    $subKey = $env:AzMapsSubKey
    $result = Get-MapAddress -Address $address
    return $result.results.entryPoints[0].position
}

function Get-MapTravelPlan() {
    param(
        [string]$from_address,
        [string]$to_address
    )
    $subKey = $env:AzMapsSubKey
    $pos1 = Get-MapCoords -Address $from_address
    $lat1 = $pos1.lat
    $lon1 = $pos1.lon

    $pos2 = Get-MapCoords -Address $to_address
    $lat2 = $pos2.lat
    $lon2 = $pos2.lon

    $query = "$lat1,$($lon1):$lat2,$lon2"
    # Write-Host $query
    $travelUrl = "https://atlas.microsoft.com/route/directions/json?subscription-key=$subKey&api-version=1.0&query=$query&travelMode=car&traffic=true&departAt=2025-03-29T08:00:20&computeTravelTimeFor=all"
    $result = Invoke-WebRequest $travelUrl
    if($result.StatusCode -Eq 200){
        $content = $result.Content | ConvertFrom-Json
        if($content.formatVersion -Ne "0.0.12"){
            Write-Warning "BEWARE Format has updated! BEWARE"
        }
        return $content.routes
    }
    return $result.StatusDescription
}


function Get-MapTravelMinutes() {
    param(
        [string]$from_address,
        [string]$to_address
    )
    $routes = Get-MapTravelPlan -from_address $from_address -to_address $to_address
    $seconds = $routes.summary.travelTimeInSeconds
    return $seconds/60
}