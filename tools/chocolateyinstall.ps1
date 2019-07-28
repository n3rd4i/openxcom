$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url = 'https://openxcom.org/git_builds/openxcom_git_master_2019_07_28_0403.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$ENV:LocalAppData\Programs"
  url           = $url
  softwareName  = 'xcom*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '8154D5B1BF11CCAADE0FEC46DC27A728F0E0FD3E9E04F9097009D5BEAF86BB41'
  checksumType    = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\$GameName.lnk" `
  -TargetPath "$installLocation\openxcom.exe" `
  -WorkingDirectory "$installLocation"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\ReadMe.lnk" `
  -TargetPath "$installLocation\README.md"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\Release Notes.lnk" `
  -TargetPath "$installLocation\CHANGELOG.txt"

## Desktop
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutPath" `
  -TargetPath "$installLocation\openxcom.exe" `
  -WorkingDirectory "$installLocation"
