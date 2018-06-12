#Colocar na variável $URI o endereço correto do tfs
$URI = "http://localhost:8080/tfs/DefaultCollection"

$project_requestUri = $URI + '/_apis/distributedtask/pools'
$jsonResponse_queues = Invoke-RestMethod  -Uri $project_requestUri -Method Get -ContentType 'application/json' -UseDefaultCredentials

foreach($projectQueue in $jsonResponse_queues.value) 
{
    Write-Host "Pool: " + $projectQueue.name
	#https://[localhost]/tfs/DefaultCollection/_apis/distributedtask/pools/[id do pool]/agents
	$projectQueueIdsUri = $URI + '/_apis/distributedtask/pools/' + $projectQueue.id + '/agents'    
	$jsonResponse_QueueIds = Invoke-RestMethod -Uri $projectQueueIdsUri -Method Get -ContentType 'application/json' -UseDefaultCredentials        
	foreach ($queueIds in $jsonResponse_QueueIds.value)
	{       
		#https://localhost/tfs/DefaultCollection/_apis/distributedtask/pools/[id do pool]/agents/[id do agent criado]?includeCapabilities=true
		$AgentCapabilitiesUri = $URI + '/_apis/distributedtask/pools/' + $projectQueue.id + '/agents/' + $queueIds.id + '?includeCapabilities=true'            
		$jsonResponse_capabilities = Invoke-RestMethod -Uri $AgentCapabilitiesUri -Method Get -ContentType 'application/json' -UseDefaultCredentials		    
        Write-Host "`t Máquina: " $jsonResponse_capabilities.systemCapabilities.'Agent.ComputerName'                      
	}       
    Write-Host "`n"
}