function Set-DefaultBrowser
{
    <# 
    .SYNOPSIS 
        Changes the Default browser to the given Parmater
    .DESCRIPTION
        Useful switch default browsers quickly
    .PARAMETER  Browser
        Vaild Options are Chrome, Firefox, IE
    .EXAMPLE 
        Set-DefaultBrowser -Browser Firefox
    .Notes 
        https://stackoverflow.com/questions/17536405/cant-set-chrome-as-default-browser-from-powershell
        # Set-DefaultBrowser cr
    #>
	[CmdletBinding(ConfirmImpact = 'None')]
	param
	(
		[Parameter(Mandatory = $true,
				   HelpMessage = 'What standar app are you packaging?')]
		[string][ValidateSet('Chrome', 'Firefox', 'IE', IgnoreCase = $true)]
		$Browser
	)
	
	$regKey = "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\{0}\UserChoice"
	$regKeyFtp = $regKey -f 'ftp'
	$regKeyHttp = $regKey -f 'http'
	$regKeyHttps = $regKey -f 'https'
	
	switch -Regex ($Browser.ToLower())
	{
		# Internet Explorer
		'ie' {
			Set-RegProperty -RegPath "$regKeyFtp" -name "ProgId" -value "IE.FTP"
			Set-RegProperty -RegPath "$regKeyHttp" -name "ProgId" -value "IE.HTTP"
			Set-RegProperty -RegPath "$regKeyHttps" -name "ProgId" -value "IE.HTTPS"
			break
		}
		# Firefox
		'firefox' {
			Set-RegProperty -RegPath "$regKeyFtp" -name "ProgId" -value "FirefoxURL"
			Set-RegProperty -RegPath "$regKeyHttp" -name "ProgId" -value "FirefoxURL"
			Set-RegProperty -RegPath "$regKeyHttps" -name "ProgId" -value "FirefoxURL"
			break
		}
		# Google Chrome
		'chrome' {
			Set-RegProperty -RegPath "$regKeyFtp" -name "ProgId" -value "ChromeHTML"
			Set-RegProperty -RegPath "$regKeyHttp" -name "ProgId" -value "ChromeHTML"
			Set-RegProperty -RegPath "$regKeyHttps" -name "ProgId" -value "ChromeHTML"
			break
		}
	}
	
}

function Set-RegProperty
{
    <# 
    .SYNOPSIS 
        
    .DESCRIPTION
        
    .PARAMETER  Browser
        
    .EXAMPLE 
        
    .Notes 
        https://blogs.technet.microsoft.com/heyscriptingguy/2015/04/02/update-or-add-registry-key-value-with-powershell/
    #>
	[CmdletBinding(ConfirmImpact = 'None')]
	param
	(
		[Parameter(Mandatory = $true,
				   HelpMessage = 'Path to reg: HKCU:\windows')]
		[string]$RegPath,
		[Parameter(Mandatory = $true,
				   HelpMessage = 'Name of reg key')]
		[string]$Name,
		[Parameter(Mandatory = $true,
				   HelpMessage = 'Value of reg key')]
		[string]$Value
		
	)
	
	
	
	IF (!(Test-Path $RegPath))
	{
		New-Item -Path $RegPath -Force | Out-Null
		New-ItemProperty -Path $RegPath -Name $name -Value $value -PropertyType String -Force | Out-Null
	}
	
	ELSE
	{
		New-ItemProperty -Path $RegPath -Name $name -Value $value -PropertyType String -Force | Out-Null
	}
}