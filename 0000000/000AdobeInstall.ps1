$ErrorActionPreference= 'silentlycontinue'
Write-Host -ForegroundColor Blue "
    (((((¯`'·.¸°_«¤´¯`¤»°*******************_°«¤´¯`¤»_°¸.·'´¯)))))	
    ||   _____       .___    ___.              ________  _______||   
    ||  /  _  \    __| _/____\_ |__   ____     \______ \ \_   ___ \  
    || /  /_\  \  / __ |/  _ \| __ \_/ __ \     |    |  \/    \ |\/  
    ||/    |    \/ /_/ (  <_> ) \_\ \  ___/     |    `   \     \||__ 
    ||\____|__  /\____ |\____/|___  /\___  >   /_______  /\______  / 
    ||        \/      \/          \/     \/            \/       |\/  
    ||   ___   __________                   .___              __||    
    ||  /  /   \______   \ ____ _____     __| _/___________   \  \     
    || /  /     |       _// __ \\__  \   / __ |/ __ \_  __ \   \  \     
    ||(  (      |    |   \  ___/ / __ \_/ /_/ \  ___/|  | \/    )  )    
    || \  \     |____|_  /\___  >____  /\____ |\___  >__|      /  /     
    ||  \__\         \/     \/     \/      \/    \/           /__/         
    ||----------------------------------------------------------||    
    ||.-=-._.-=-._.-=-._.-=-._.-=-..-=-._.-=-._.-=-._.-=-._.-=-.||
    ||.-.---   ---     --     ---   -----   - --       ----  .-.||"
Write-Host -ForegroundColor Cyan "        ==============================================================
    ||+      Creating working directory...                     +||
    =============================================================="
# Path for the workdir
$workdir = "c:\installer\"
Test-Path "c:\installer" | Out-Null
if ($_ -ne $True) {New-Item -Path $workdir  -ItemType directory}
    Else: {del "C:\installer"; New-Item -Path $workdir  -ItemType directory}



# Download the installer
Write-Host -ForegroundColor DarkMagenta "    ==============================================================
	||+      Downloading Adobe now...                          +||
    =============================================================="
$source = "http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/1502320053/AcroRdrDC1502320053_en_US.exe"
$destination = "$workdir\ReaderDC.exe"

# Check if Invoke-Webrequest exists otherwise execute WebClient

if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}
Write-Host -foregroundcolor Yellow "    ==============================================================
	||+      Start installation!?!?!?                          +||
	=============================================================="
        pause
# Start the installation

Start-Process -FilePath "$workdir\ReaderDC.exe" -ArgumentList "/sPB /rs"
Write-Host -foregroundcolor Green "    ==============================================================
	||+      Starting Adobe install...                         +||
	=============================================================="


# Wait XX Seconds for the installation to finish
#Start-Sleep -s 35
WriteHost "Wait until you finish installing Adobe and press Enter"
        pause 
# Remove the installer

rm -Force $workdir\adobe*
Write-Host -foregroundColor Green "        |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||      
        ###################################################################################
        #       ___________.__       .__       .__               .___                     # 
        #       \_   _____/|__| ____ |__| _____|  |__   ____   __| _/                     # 
        #        |    __)  |  |/    \|  |/  ___/  |  \_/ __ \ / __ |                      # 
        #        |     \   |  |   |  \  |\___ \|   Y  \  ___// /_/ |                      # 
        #        \___  /   |__|___|  /__/____  >___|  /\___  >____ |                      # 
        #            \/            \/        \/     \/     \/     \/                      # 
        ###################################################################################"