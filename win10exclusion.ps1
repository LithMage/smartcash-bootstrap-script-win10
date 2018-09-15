$isAdmin = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")

if (!$isAdmin) {
    echo "Powershell must be started as administrator!"
    pause
    exit
}

$DefPath = Get-ItemPropertyValue 'HKCU:\SOFTWARE\Smartcash\Smartcash-Qt' 'strDataDir'

$smartcash = (Get-Process smartcash-qt -ErrorAction SilentlyContinue).Path

if (!$smartcash) {
    echo "Smartcash Node Wallet must be running in order to determine file location!"
    echo "Please open Smartcash Node Wallet and restart this script."
    pause
    exit
}

if ($DefPath) {
    $smcartcashPath = $smartcash | Split-Path

    echo "These directories has been found and will be added to Windows Defender Exclusion list."
    echo "Wallet directory: $smcartcashPath"
    echo "Database directory: $DefPath"
    
    Add-MpPreference -ExclusionPath $smcartcashPath
    Add-MpPreference -ExclusionPath $DefPath
    echo "Windows Defender: paths excluded"

    New-NetFirewallRule -DisplayName "Allow Smartcash 9678" -Direction Inbound -Protocol TCP -LocalPort 9678 -Program $smartcash -Action Allow
    #netsh advfirewall firewall add rule name="SmartCash Port 9678" dir=in action=allow protocol=TCP localport=9678
    echo "Windows Firewall: SmartCash Port 9678 opened as Rule: Allow Smartcash 9678"
}
else {
    echo "No database folder detected. Please contact support."
    pause
    exit
}