param (
 [string]$Message,
 [string]$DiscordWebhook,
 [switch]$Verbose
)

try
{
 $ErrorActionPreference = 'Stop';
 $Error.Clear();

 if ($Verbose.IsPresent)
 {
  Write-Host "DEBUG: Post2Discord"
  Write-Host "Message        : $($Message)"
  Write-Host "DiscordWebhook : $($DiscordWebhook)"
 }

 # Validate DiscordWebhook URL
 if (-not $DiscordWebhook -or -not $DiscordWebhook -match '^https?://')
 {
  throw "Invalid DiscordWebhook URL."
 }

 $DiscordMessage = @{
  content = $Message
 }

 Invoke-RestMethod -Uri $DiscordWebhook -Body ($DiscordMessage | ConvertTo-Json -Compress) -Method Post -ContentType 'application/json; charset=UTF-8'

 if ($Verbose.IsPresent)
 {
  Write-Host "DEBUG: Message successfully sent to Discord."
 }
}
catch
{
 Write-Error "An error occurred: $($_.Exception.Message)"
 Write-Error "Details: $($_.InvocationInfo | Out-String)"
 throw
}
