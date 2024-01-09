param (
 [string]$Source,
 [string]$ProjectName,
 [string]$DiscordWebhook
)
try
{
 $ErrorActionPreference = 'Stop';
 $Error.Clear();

 $SourcePath = Get-Item -Path $Source;
 $GitHubRepoUrl = "https://github.com/$($env:GITHUB_REPOSITORY)"

 if (Test-Path -Path $SourcePath)
 {
  switch ($SourcePath.Extension)
  {
   ".psd1"
   {
    $Module = Import-PowerShellDataFile -Path $SourcePath
    $Version = $Module.ModuleVersion
    $PowerShellGalleryUrl = "https://www.powershellgallery.com/packages/$($ProjectName)"
    $DiscordMessage = @{
     content = "Version $Version of $($ProjectName) released. Please visit Github ($($GitHubRepoUrl)) or PowerShellGallery.com ($($PowerShellGalleryUrl)) to download."
    }
   }
   ".csproj"
   {
    $Project = [xml](Get-Content -Path $SourcePath);
    $Version = $Project.Project.PropertyGroup.Version.ToString();
    $PackageId = $Project.Project.PropertyGroup.PackageId;
    $NugetUrl = "https://nuget.org/packages/$PackageId"
    $DiscordMessage = @{
     content = "Version $Version of $($ProjectName) released. Please visit Github ($($GitHubRepoUrl)) or Nuget.org ($($NugetUrl)) to download."
    }
   }
  }
  Invoke-RestMethod -Uri $DiscordWebhook -Body ($DiscordMessage | ConvertTo-Json -Compress) -Method Post -ContentType 'application/json; charset=UTF-8'
 }
}
catch
{
 Write-Host "Error occurred: $($_.Exception.Message)"
}