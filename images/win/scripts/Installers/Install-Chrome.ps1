################################################################################
##  File:  Install-Chrome.ps1
##  Team:  Automated Testing
##  Desc:  Install Google Chrome
################################################################################

Import-Module -Name ImageHelpers -Force

$temp_install_dir = 'C:\Windows\Installer'
New-Item -Path $temp_install_dir -ItemType Directory -Force

Install-MSI -MsiUrl "https://seleniumwebdrivers.blob.core.windows.net/knownchromeversion/googlechromestandaloneenterprise64.msi" -MsiName "googlechromestandaloneenterprise64.msi"

New-Item -Path "HKLM:\SOFTWARE\Policies\Google\Update" -Force
New-ItemProperty "HKLM:\SOFTWARE\Policies\Google\Update" -Name "AutoUpdateCheckPeriodMinutes" -Value 00000000 -Force
New-ItemProperty "HKLM:\SOFTWARE\Policies\Google\Update" -Name "UpdateDefault" -Value 00000000 -Force
New-ItemProperty "HKLM:\SOFTWARE\Policies\Google\Update" -Name "DisableAutoUpdateChecksCheckboxValue" -Value 00000001 -Force
New-ItemProperty "HKLM:\SOFTWARE\Policies\Google\Update" -Name "Update{8A69D345-D564-463C-AFF1-A69D9E530F96}" -Value 00000000 -Force
New-Item -Path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Force
New-ItemProperty "HKLM:\SOFTWARE\Policies\Google\Chrome" -Name "DefaultBrowserSettingEnabled" -Value 00000000 -Force