$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Join-Path $ENV:LocalAppData Programs)"
  url           = 'https://openxcom.org/git_builds/openxcom_git_master_2020_11_18_0956.zip'
  checksum      = 'a159e6560c4eb81859b5619866008a03309df31d5996a1ceb60a49dfe2755d47'
  checksumType    = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir $GameName).lnk" `
  -TargetPath "$(Join-Path $installLocation $GameName.toLower()).exe" `
  -WorkingDirectory "$installLocation"

## Docs
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir ReadMe.lnk)" `
  -TargetPath "$(Join-Path $installLocation README.md)"
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir 'Release Notes.lnk')" `
  -TargetPath "$(Join-Path $installLocation CHANGELOG.txt)"
