$moduleName = "oh-my-posh"
Write-Host -NoNewline "Loading $moduleName..."
if (Get-Module -ListAvailable -Name $moduleName) {
    Import-Module $moduleName
	Write-Host -NoNewline "`rConfiguring $moduleName... "
	Set-PoshPrompt -Theme "C:\Users\Mark.Sinclair\My Drive\Software\MSPowerShell.omp.json"
    Write-Host  "Done!"
} else {
    Write-Host -NoNewline "... "
	$OMPAlternateConfig = "D:\My Drive\Software\Customization\MSPowerShell.omp.json"
	if (Test-Path($OMPAlternateConfig)) {
		oh-my-posh init pwsh --config $OMPAlternateConfig | Invoke-Expression
		Write-Host  "Done!"
	} else {
		Write-Host "Failed!" -ForegroundColor Red
	}
}

$moduleName = "Terminal-Icons"
Write-Host -NoNewline "Loading $moduleName... "
if (Get-Module -ListAvailable -Name $moduleName) {
    Import-Module $moduleName
	Write-Host  "Done!"
} else {
	Write-Host "Failed" -ForegroundColor Red
}

Write-Host -NoNewline "Loading PSReadLine... "
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Write-Host "Done!"
Write-Host -NoNewline "Setting Aliases... "
Set-Alias -Name "Trace" "tracert -d -w 500"
$nanoPath = "C:\Program Files\Notepad++\notepad++.exe"
if (Test-Path($nanoPath)) {
	Set-Alias -Name "Nano" "$nanoPath"
} else {
	Write-Host "`rThe target for the alias nano was not found! " -ForegroundColor Red
}
Write-Host "Done!"


Write-Host -NoNewLine "Importing WinGetCommandNotFound... "
$CNF = "C:\Users\marks\AppData\Local\PowerToys\WinUI3Apps\..\WinGetCommandNotFound.psd1"
if (Test-Path($CNF)) {
	Import-Module "C:\Users\marks\AppData\Local\PowerToys\WinUI3Apps\..\WinGetCommandNotFound.psd1"
	Write-Host  "Done!"
} else {
	Write-Host "Failed" -ForegroundColor Red
}

Write-Host  -NoNewline "Loading Chocolatey... "
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
  Write-Host  "Done!"
} else {
	Write-Host  -NoNewline "Failed!" -ForegroundColor Red
}
Write-Host  -NoNewline "`n Nano" -ForegroundColor Yellow
Write-Host  -NoNewline " open's Notepad++ `n "
Write-Host  -NoNewline "Trace " -ForegroundColor Yellow
Write-Host "is Tracert -d -w 500`n"