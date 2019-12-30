 $ErrorActionPreference= 'silentlycontinue'
 Clear-Host
 $GLU = Get-LocalUser -Name "Administrator"
 $error[0].Exception
 if ($_ -ne $True) {Write-Host "
                    Quitting now..."; pause; quit}
      else {$Password = Read-Host -AsSecureString -Prompt "Type a new Password here "; $UserAccount = Get-LocalUser -Name "Administrator"; $UserAccount | Set-localUser -Password $Password}
 if ($_ -eq $True) {write-host -ForegroundColor Green ' 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                !!!!!!!!  Administrator Password Now Set  !!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'}
                else {Write-Host "Administrator password not set... this will exit"}