# smartcash-win10-scripts
Various Smartcash PowerShell scripts for Windows 10

## `deleteSCDB.ps1`
Deletes smartcash database thus forcing wallet to resync from 0.

To run:
- Right-Click it and choose `Run with PowerShell`

## `win10exclusion.ps1`
Excludes Database and Node Clients directories from Windows Defender.
Adds inbound rule "Allow Smartcash 9678" to windows firewall

To run:
- Right-Click Start button -> select `Windows Powershell (Admin)`
- use cd command to switch into directory where win10exclusion.ps1 is located. Ex: C:\Users\MyUser\Downloads
- write `win10exclusion.ps1` to start script.

# Scripts bellow are DEPRECATED

## `smartcash-bootstrap.ps1`
Downloads and bootstraps smartcash database as well creates smartcash.conf

To run:
- Right-Click it and choose `Run with PowerShell`
- Follow prompts to keep or not downloaded bootstrap file,
- rpcuser and rpcpassword if presset ENTER will be generated automatically.

## `addnode.ps1`
Adds node information to the smartnode.conf file

To run:
- Right-Click it and choose `Run with PowerShell`
- Follow prompts to enter required node iformation

## `createconf.ps1`
Creates smartcash.conf file

To run:
- Right-Click it and choose `Run with PowerShell`
- RPC user and pass will be set random
