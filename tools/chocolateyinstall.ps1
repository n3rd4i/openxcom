$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$url = 'https://openxcom.org/git_builds/openxcom_git_master_2020_02_10_0926.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Join-Path $ENV:LocalAppData Programs)"
  url           = $url
  softwareName  = 'xcom*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '4D239A38AC3C3BC8A1A0569E3A700E80C426D103F6FFE5D5F87BD1EBC99616D9'
  checksumType    = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir $GameName).lnk" `
  -TargetPath "$(Join-Path $installLocation $GameNameLow).exe" `
  -WorkingDirectory "$installLocation"
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir ReadMe.lnk)" `
  -TargetPath "$(Join-Path $installLocation README.md)"
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir 'Release Notes.lnk')" `
  -TargetPath "$(Join-Path $installLocation CHANGELOG.txt)"

## Desktop
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutPath" `
  -TargetPath "$(Join-Path $installLocation $GameNameLow).exe" `
  -WorkingDirectory "$installLocation"
