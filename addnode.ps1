$Label = Read-Host -Prompt 'Node Label'
$IP = Read-Host -Prompt 'VPS IP'
$genkey = Read-Host -Prompt 'GenKey (SmartnodePrivKey)'
$outputH = Read-Host -Prompt 'Output hash'
$index = Read-Host -Prompt 'Output Index'

$Settings = ("
$Label {0}:9678 $genkey $outputH $index" -f $IP)
$Settings | Out-File -FilePath $Env:AppData/Smartcash/smartnode.conf -NoNewline -Encoding utf8 -Append