$GameName = 'OpenXCOM'

$installLocation = [IO.Path]::Combine($ENV:LocalAppData, 'Programs', $GameName.toLower())
$shortcutPath = [IO.Path]::Combine($ENV:UserProfile, 'Desktop', "$GameName.lnk")
$startMenuDir = [IO.Path]::Combine($ENV:AppData, 'Microsoft\Windows\Start Menu\Programs', "$GameName")
