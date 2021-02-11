<#
.SYNOPSIS
Use script to turn BypassConsent on and off
.DESCRIPTION
When a new user accesses a Power App, they recieve a prompt asking them to consent to the various connections being used in the Power App. 
Sometimes this is not wanted and can hinder user experience. This script allows you to turn this setting on and off quickly.

BypassConsent = False is default position
Bypassconsent = True will turn this setting off.

.INPUTS
App ID and whether you want to bypass consent
.OUTPUTS
    None - potential for you to add error log output
.NOTES
    Version:        1.0
    Author:         Kyle Anderson
    Creation Date:  26 Sep 2020
    Required Module: Microsoft.PowerApps.PowerShell, Microsoft.PowerApps.Administration.PowerShell

    Important: This classes as an edit, and as such normal Power Apps rules apply. 
                The app must not be locked for editing by anyone else and the account must be an owner of the app when the edit takes place.
#>

#Get values from Power Automate
param
(   
    [Parameter(Mandatory = $true)]
    [string]$AppID,
    [Parameter(Mandatory = $true)]
    [string]$RemoveConsent
)

#Get the credentials stored in Azure - 'AdminCred'
$credentials = Get-AutomationPSCredential -Name 'AdminCred'
$AdminAcc = $credentials.UserName
$AdminPassword = $credentials.Password

Add-PowerAppsAccount -Username $AdminAcc -Password $AdminPassword 

Switch ($RemoveConsent ) {
    #Remove consent
    $true { Set-AdminPowerAppApisToBypassConsent -AppName $AppID -ApiVersion 2017-05-01 }
    #Restore consent
    $false { Clear-AdminPowerAppApisToBypassConsent -AppName $AppID -ApiVersion 2017-05-01 }
}