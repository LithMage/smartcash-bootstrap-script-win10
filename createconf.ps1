#generate random user and pass
$RandUser = -join ([char[]](65..90+97..122)*100 | Get-Random -Count 5)
$RandPass = -join ([char[]](65..90+97..122)*100 | Get-Random -Count 32)

$Settings = "rpcuser=$RandUser
rpcpassword=$RandPass
txindex=1"
$Settings | Out-File -FilePath $Env:AppData/Smartcash/smartcash.conf -NoNewline -Encoding utf8