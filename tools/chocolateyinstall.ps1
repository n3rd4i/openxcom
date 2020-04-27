$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$url = 'https://openxcom.org/git_builds/openxcom_git_master_2020_04_26_0030.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Join-Path $ENV:LocalAppData Programs)"
  url           = $url
  softwareName  = 'xcom*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '01A3F5B8EFE0915AE2B560E56A7446F3BB3F0718F126DD69C10108358C44D7D7'
  checksumType    = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir $GameName).lnk" `
  -TargetPath "$(Join-Path $installLocation $GameName.toLower()).exe" `
  -WorkingDirectory "$installLocation"
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir ReadMe.lnk)" `
  -TargetPath "$(Join-Path $installLocation README.md)"
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir 'Release Notes.lnk')" `
  -TargetPath "$(Join-Path $installLocation CHANGELOG.txt)"
