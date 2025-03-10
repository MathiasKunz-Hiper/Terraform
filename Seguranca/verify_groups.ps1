$jsonpayload = [Console]::In.ReadLine()

# Convert JSON to a string
$json = ConvertFrom-Json $jsonpayload
$group_name = $json.group_name


$result = Get-MgGroup -Filter "DisplayName eq '$group_name'" 

if($null -eq $result){
    $exists="false"
}else{
    $exists="true"
}

$result = @{
    'exists' = $exists
    'object_id' = $result.Id
} | ConvertTo-Json


Write-Output $result