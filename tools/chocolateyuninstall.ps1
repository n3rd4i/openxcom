$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

Remove-Item "$startMenuDir" -recurse -force
Remove-Item "$installLocation" -exclude TFTD, UFO -recurse -force
