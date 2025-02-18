# deploy.ps1
param (
    [string]$webAppName,
    [string]$resourceGroupName,
    [string]$packagePath,
    [string]$virtualApplication
)

# Ensure only the Az module is loaded
Import-Module Az -Force

# Check if the package file exists
if (!(Test-Path -Path $packagePath)) {
    Write-Error "The path '$packagePath' either does not exist or is not a valid file system path."
    exit 1
}

$webApp = Get-AzWebApp -ResourceGroupName $resourceGroupName -Name $webAppName
$destinationPath = "$($webApp.RepositorySiteName)\site\wwwroot\$virtualApplication"

# Ensure the virtual application directory exists
New-Item -ItemType Directory -Path $destinationPath -Force

# Deploy the package
Write-Output "Deploying package to $destinationPath..."
Expand-Archive -Path $packagePath -DestinationPath $destinationPath -Force

Write-Output "Deployment completed successfully."
