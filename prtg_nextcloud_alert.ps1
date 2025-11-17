param(
    [string]$alertMessage
)

$webhookUrl = "https://NEXTCLOUDURL:PORT/ocs/v2.php/apps/spreed/api/v1/chat/4dt2cq6f"
$username = "USERNAME"
$appPassword = "APP_PASSWORD"

$headers = @{
    "Content-Type" = "application/json"
    "OCS-APIRequest" = "true"
}

$credential = "${username}:${appPassword}"
$base64 = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($credential))
$headers["Authorization"] = "Basic $base64"

$messageBody = @{
    message = " $alertMessage"
} | ConvertTo-Json

try {
    Invoke-RestMethod -Uri $webhookUrl -Method Post -Headers $headers -Body $messageBody
    exit 0
} catch {
    Write-Error "Failed: $($_.Exception.Message)"
    exit 1
}
