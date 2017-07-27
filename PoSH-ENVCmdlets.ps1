# TITLE:    PoSH-ENVCmdlets.ps1
# PLATFORM: Windows 2012 Server R2
# AUTHOR:   Bobbi Trehan-Young
# CREATED:  11/07/2017 10:56
# VERSION:  0.1
# COPYRIGHT (c) eTFLConsultancy. All rights reserved.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PURPOSE: This script sets environment variables
#          
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# RUN ONCE TO ESTABLISH CONNECTION TO CONFIGMGR CONSOLE
{<# 
# ~~~~~~~~~~~~~~~~~ IMPORT CONFIGMGR PoSH MODULE ~~~~~~~~~~~~~~~~~ 
    Import-Module $env:SMS_ADMIN_UI_PATH.Replace("\bin\i386","\bin\configurationmanager.psd1")

    # ~~~~ RETIREVE CM SITECODE ~~~~
    $SiteCode = Get-PSDrive -PSProvider CMSITE

    # ~~~~ SET CONNECTION CONTEXT ~~~~
    Set-Location "$($SiteCode.Name):\"
#>}
    
# ~~~~~~~~~~~~~~~~~ DISABLE PoSH CMDLET UPDATE CHECK ~~~~~~~~~~~~~~~~~ 
{<# 
#   Get-CMCmdletUpdateCheck #if enabled disable
    Set-CMCmdletUpdateCheck -CurrentUser -IsUpdateCheckEnabled 0
#>}   
# ~~~~~~~~~~~~~~~~~ GET CM PoSH MODULE VERISON ~~~~~~~~~~~~~~~~~ 
{<# 
    Get-Module -Name ConfigurationManager | Select-Object -Property Name,Version
#>}  
