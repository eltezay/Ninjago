                $Password = Read-Host -AsSecureString -Prompt "Type a new Password here "
                $UserAccount = Get-LocalUser -Name "Administrator"; $UserAccount | Set-localUser -Password $Password
                $error[0].Exception
                if ($_ -ne $True) {write-host -ForegroundColor Green ' 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                !!!!!!!!  Administrator Password Now Set  !!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'}
                else {Write-Host "Something went wrong..."}




$ErrorActionPreference= 'silentlycontinue'
Get-LocalUser -Name "Administrator"; Set-LocalUser -Name "Administrator"
    if ($_ -ne $true) {Write-Host $error[0].Exception} 
    else {Write-Host "Reseting Administrator Password..."} 
pause
        $Password = Read-Host -AsSecureString 
        $UserAccount = Get-LocalUser -Name "Administrator" 
        $UserAccount | Set-localUser -Password $Password
        "!!!!!!!!!!Administrator Password Now Set!!!!!!!!!!!"

############################################################################


  Clear-host
  $GLU = Get-LocalUser -Name "Administrator"
  $GLUCMD= $Password = Read-Host -Prompt "Type a new Password now"; $UserAccount = Get-LocalUser -Name "Administrator"; $UserAccount | Set-localUser -Password $Password; Write-Host $GLU has set the password to $Password
   If ($true) {$GLUCMD} 
            Else {Write-Host $GLU has set the password to $Password
                    }





###############################################################################



                $Password = Read-Host -AsSecureString -Prompt "                         Type a new Password now!"
                $error[0].Exception

                $UserAccount = Get-LocalUser -Name "Administrator" 
                $error[0].Exception

                $UserAccount | Set-localUser -Password $Password
                $error[0].Exception

                write-host -ForegroundColor Green '                                     !!!!!!!!!!Administrator Password Now Set!!!!!!!!!!!'



################################################################################333
 Clear-Host
 $GLU = Get-LocalUser -Name "Administrator"
 $error[0].Exception
 if ($_ -ne $True) {Write-Host "Quitting now..."; pause; quit}
      else {$Password = Read-Host -AsSecureString -Prompt "Type a new Password here "; $UserAccount = Get-LocalUser -Name "Administrator"; $UserAccount | Set-localUser -Password $Password}
      else if ($_ -eq $True) {write-host -ForegroundColor Green ' 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                !!!!!!!!  Administrator Password Now Set  !!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'}
                else {Write-Host "Something went wrong..."}