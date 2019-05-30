$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installLocation = "$ENV:LocalAppData\Programs\openxcom"
$shortcutPath = "$ENV:UserProfile\Desktop\OpenXCOM.lnk"
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$ENV:LocalAppData\Programs"
  url           = 'https://openxcom.org/git_builds/openxcom_git_master_2019_05_28_2230.zip'
  softwareName  = 'xcom*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = 'DC286B0468617177CEBE0331B7F498D9'
  checksumType    = 'md5'
}
Install-ChocolateyZipPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-zip-package

Install-ChocolateyShortcut `
  -ShortcutFilePath "$shortcutPath" `
  -TargetPath "$installLocation\openxcom.exe" `
  -IconLocation "$installLocation\openxcom.exe" `
  -WorkingDirectory "$installLocation"

$XCOM_url = 'https://gamesnostalgia.com/en/download/x-com-ufo-defense/1906'
Write-Host ""
Write-Host "XCOM game files needs to be [manually] downloaded from:"
Write-Host "$XCOM_url"
Write-Host ""

$TFTD_url = 'https://gamesnostalgia.com/en/download/x-com-terror-from-the-deep/1913'
Write-Host "TFTD game files for TFTD needs to be [manually] downloaded from:"
Write-Host "$TFTD_url"
Write-Host ""
