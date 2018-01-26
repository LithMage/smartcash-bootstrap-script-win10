# smartcash-bootstrap-script-win10
SmartCash TX Index Bootstrap PowerShell script for Windows 10

This script will automatically locate SmartCash folder (if needed create it) in AppData, delete existing blocks and chainstate folders, download txindex bootstrap and finally create smartcash.conf file with required settings.

## How to use
- Download `smartcash-bootstrap.ps1`
- Right-Click it and choose `Run with PowerShell`
- Follow prompts to keep or not downloaded bootstrap file,
- rpcuser and rpcpassword if presset ENTER will be generated automatically.
