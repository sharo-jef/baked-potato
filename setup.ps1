Param(
    [parameter(Mandatory=$true)][string]$Namespace,
    [string]$Description = ''
)

if (!$Namespace) {
    Write-Error 'Invalid namespace.'
    exit 1
}

Write-Output ((Get-Content -Raw .\pack.mcmeta) -replace 'Description here', $Description) | Out-File -NoNewline .\pack.mcmeta
Write-Output ((Get-Content -Raw .\data\minecraft\tags\functions\load.json) -replace 'namespace', $Namespace) | Out-File -NoNewline .\data\minecraft\tags\functions\load.json
Write-Output ((Get-Content -Raw .\data\minecraft\tags\functions\tick.json) -replace 'namespace', $Namespace) | Out-File -NoNewline .\data\minecraft\tags\functions\tick.json
Write-Output ((Get-Content -Raw .\data\namespace\functions\load\.mcfunction) -replace 'namespace', $Namespace) | Out-File -NoNewline .\data\namespace\functions\load\.mcfunction
Write-Output ((Get-Content -Raw .\data\namespace\functions\tick\.mcfunction) -replace 'namespace', $Namespace) | Out-File -NoNewline .\data\namespace\functions\tick\.mcfunction
Write-Output ((Get-Content -Raw .\data\namespace\functions\uninstall\.mcfunction) -replace 'namespace', $Namespace) | Out-File -NoNewline .\data\namespace\functions\uninstall\.mcfunction
Move-Item -Path .\data\namespace -Destination .\data\$Namespace
