$servico = Get-Service -Name "AdobeARMservice" #-ComputerName "SRV01" #Nome do serviço, da coluna Name do servidor SRV01

if ($servico.Status -eq "Running") {
   Write-Host "Parando o serviço."
   $servico.Stop()

   Write-Host "Startando o serviço."
   $servico.Start()

} else {
    echo "Serviço não estava executando!"
}