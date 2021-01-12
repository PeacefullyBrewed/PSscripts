# Monitors directory/sub-directories for new files & creates popup for user

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.IncludeSubdirectories = $true
$watcher.Path = 'C:\Users\Skylar\Desktop\testing'
$watcher.EnableRaisingEvents = $true

$action = { 
$path = $event.SourceEventArgs.FullPath
$changetype = $event.SourceEventArgs.ChangeType
# Must change "USERNAME" to actual username
msg USERNAME "$path was $changetype at $(get-date)"
}

Register-ObjectEvent $watcher 'Created' -Action $action