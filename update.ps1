import-module au

$domain   = 'https://openxcom.org'
$releases = "$domain/git-builds"

function global:au_SearchReplace {
  @{ 
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   	= "`$1'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing #1
  $regex   = '.zip$'
  $url     = $download_page.links | ? href -match $regex | select -First 1 -expand href #2
  $token = $url -split 'openxcom_git_master_' | select -First 1 -Skip 1 #3
  $raw_version = $token -split '.zip' | select -Last 1 -Skip 1 #3
  $version = $raw_version -replace '_','.'
  return @{ Version = $version; URL32 = $url }
}

update -ChecksumFor 32

# Reference:
# https://github.com/majkinetor/au/blob/master/README.md#creating-the-package-updater-script
