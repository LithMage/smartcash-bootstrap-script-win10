# smartcash-win10-scripts
Various Smartcash PowerShell scripts for Windows 10

This script will automatically locate SmartCash folder (if needed create it) in AppData, delete existing blocks and chainstate folders, download txindex bootstrap and finally create smartcash.conf file with required settings.

## `deleteSCDB.ps1`
Deletes smartcash database thus forcing wallet to resync from 0.
To run:
- Right-Click it and choose `Run with PowerShell`

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
