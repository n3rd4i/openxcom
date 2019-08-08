$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url = 'https://openxcom.org/git_builds/openxcom_git_master_2019_08_03_0017.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$ENV:LocalAppData\Programs"
  url           = $url
  softwareName  = 'xcom*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = 'A10320007CFE7752A75AEB00BC2D6F7EF4F2AF292BA07FD56891576A2E23B56C'
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
