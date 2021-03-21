$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Join-Path $ENV:LocalAppData Programs)"
  url           = 'https://openxcom.org/git_builds/openxcom_git_master_2021_03_08_2004.zip'
  checksum      = 'd15630380ff48a8281996b1223405c6919e47bbda657fcecb877b20ae0053deb'
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
