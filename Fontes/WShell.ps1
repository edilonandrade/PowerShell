#Alguns comandos utilizando WScript.shell
$wshell = New-Object -com WScript.shell
$wshell | Get-Member
#Um dos que eu mais gosto é o comando de popup: .Popup
$wshell.Popup("O power shell é muito louco mesmo")
$wshell.Run("calc")