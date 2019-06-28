$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url = 'https://openxcom.org/git_builds/openxcom_git_master_2019_06_28_0441.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$ENV:LocalAppData\Programs"
  url           = $url
  softwareName  = 'xcom*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = 'B9A17995F45221BFC77617A8753DADA59EDBDE9FFB8909542B56A3CCE6FECCD1'
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
