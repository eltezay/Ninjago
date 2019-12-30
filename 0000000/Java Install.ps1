Clear-Host
Write-Host "   (((((¯`'·.¸°_«¤´¯`¤»°*************************_°«¤´¯`¤»_°¸.·'´¯)))))
   ||                                                             || 
 __||               __         .__  .__         ____.             ||       
|__||____   _______/  |______  |  | |  |       |    |____ ___  ___||__   
|  |/    \ /  ___/\   __\__  \ |  | |  |       |    \__  \\  \/ /\__  \  
|  |   |  \\___ \  |  |  / __ \|  |_|  |__ /\__|    |/ __ \\   /  / __ \_
|__|___|  /____  > |__| (____  /____/____/ \________(____  /\_/  (____  /
   ||   \/     \/            \/                          \/       ||  \/ 
   ||-------------------------------------------------------------||
   ||            install Java Runtime Environement                ||"

# working directory path
$workd = "c:\temp"

# Check if work directory exists if not create it
Write-Host "   ||=============================================================||
   ||+               Creating working directory...               +||
   ||=============================================================|| "
If (!(Test-Path -Path $workd -PathType Container))
{ 
New-Item -Path $workd  -ItemType directory 
}

#create config file for silent install
$text = '
INSTALL_SILENT=Disable
AUTO_UPDATE=Enable
SPONSORS=Disable
REMOVEOUTOFDATEJRES=1
'
$text | Set-Content "$workd\jreinstall.cfg"
    
#download executable, this is the small online installer
Write-Host "   ||+ Downloading Java now... Please wait for process to finish +||
   =================================================================="
$source = "http://javadl.oracle.com/webapps/download/AutoDL?BundleId=230511_2f38c3b165be4555a1fa6e98c45e0808"
$destination = "$workd\jreInstall.exe"
$client = New-Object System.Net.WebClient
$client.DownloadFile($source, $destination)

#install silently
Write-Host "   ||+ Installing Java now... Please wait for process to finish  +||
   ================================================================="
Start-Process -FilePath "$workd\jreInstall.exe" -ArgumentList INSTALLCFG="$workd\jreinstall.cfg"

# Wait 120 Seconds for the installation to finish
#Write-Host "   ||+        Waiting for you to finish installing java...       +||
#   ================================================================== "
#Start-Sleep -s 90
#Write-Host "   ||+        Press Enter after install...                       +||
#   ================================================================== "
# Remove the installer
Write-Host "   ||+        Press Enter to remove working files...             +||
   ================================================================== "
Write-Host "   |((((¯`'·.¸°_«¤´¯`¤»°************************_°«¤´¯`¤»_°¸.·'´¯))))||
   __________________________________________________________________ "
pause
rm -Force $workd\jre*



