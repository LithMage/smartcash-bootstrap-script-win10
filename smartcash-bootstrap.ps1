#generate random user and pass
$RandUser = -join ([char[]](65..90+97..122)*100 | Get-Random -Count 5)
$RandPass = -join ([char[]](65..90+97..122)*100 | Get-Random -Count 32)

echo "Checking if SmartCash folder exists..."

$Path = Test-Path $Env:AppData/SmartCash -PathType Container

If ($Path) {
	echo "SmartCash folder located"
} else {
	echo "No SmartCash folder in AppData creating one"
	md $Env:AppData/SmartCash
}

cd $Env:AppData/SmartCash

if ($Path) {
	if (Test-Path ./blocks -PathType Container) {
		echo "Removing old Blocks folder..."
		Remove-Item -path ./blocks -recurse
		echo "Done"
	}
	if (Test-Path ./chainstate -PathType Container) {
		echo "Removing old Chainstate folder..."
		Remove-Item -path ./chainstate -recurse
		echo "Done"
	}
}

if (Test-Path ./smartcash.conf -PathType Leaf) {
	echo "Removing old smartcash.conf file"
	Remove-Item ./smartcash.conf
	echo "Done"
}

echo "Applying txindexstrap..."
if (Test-Path ./txindexstrap.zip -PathType Leaf) {
	$BFound = Read-Host -Prompt 'txindexstrap.zip found. Redownload (Y/N)?'
} else {
	$BFound = 'y'
}
	
if ($BFound -eq 'y') {
	Invoke-WebRequest http://proteanx.com/txindexstrap.zip -OutFile txindexstrap.zip
}

Expand-Archive -Path txindexstrap.zip -DestinationPath ./

$Keep = Read-Host -Prompt 'Keep txindexstrap.zip (Y/N)?'
if (-not $Keep -eq 'y') {
	Remove-Item txindexstrap.zip
}
echo "Done"

echo "Creating smartcash.conf file..."
$RPCUser = Read-Host -Prompt 'RPCUser (ENTER for random)'
if (-not $RPCUser) {
	$RPCUser = $RandUser
}
$RPCPass = Read-Host -Prompt 'RPCPassword (ENTER for random)'
if (-not $RPCPass) {
	$RPCPass = $RandPass
}

echo "rpcuser=$RPCUser
rpcpassword=$RPCPass
txindex=1">>smartcash.conf
echo "Done"

echo "You are now ready to start SmartCash Wallet. Enjoy."

pause