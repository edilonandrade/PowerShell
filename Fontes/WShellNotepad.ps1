#Alguns comandos utilizando WScript.shell
$wshell = New-Object -com WScript.shell
$wshell.Run("Notepad")
$wshell.AppActivate("Notepad")
Start-Sleep 1
$wshell.SendKeys("Interessante!!!")