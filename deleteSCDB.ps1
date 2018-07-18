$DefPath = Get-ItemPropertyValue 'HKCU:\SOFTWARE\Smartcash\Smartcash-Qt' 'strDataDir'

$smartcash = Get-Process smartcash-qt -ErrorAction SilentlyContinue

if ($smartcash) {
    echo "Smartcash Wallet is open please close it down and restart this script!"
    pause
    exit
}

if ($DefPath) {
    echo "SmartCash folder located at $DefPath"
    cd $DefPath
	if (Test-Path ./blocks -PathType Container) {
		echo "Removing Blocks folder..."
		Remove-Item -path ./blocks -recurse
		echo "Done"
	}
	if (Test-Path ./chainstate -PathType Container) {
		echo "Removing Chainstate folder..."
		Remove-Item -path ./chainstate -recurse
		echo "Done"
	}
    if (Test-Path ./database -PathType Container) {
		echo "Removing Database folder..."
		Remove-Item -path ./database -recurse
		echo "Done"
	}
    if (Test-Path ./rewards -PathType Container) {
		echo "Removing Rewards folder..."
		Remove-Item -path ./rewards -recurse
		echo "Done"
	}
    if (Test-Path ./version.dat -PathType Leaf) {
	    echo "Removing version.dat file..."
	    Remove-Item ./version.dat
	    echo "Done"
    }
    echo "File removal done. You now may open Smartcash Wallet."
    pause
    exit
} else {
	echo "No SmartCash folder detected at registered place. Please contact support."
    pause
    exit
}