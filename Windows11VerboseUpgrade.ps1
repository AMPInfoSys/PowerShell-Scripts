<#
    Run a Windows 11 Update directly from PowerShell
#>
$webClient = New-Object System.Net.WebClient 
$url = 'https://go.microsoft.com/fwlink/?linkid=2171764' 
$file = "c:\windows\temp\Win11Upgrade.exe" 
$webClient.DownloadFile($url,$file) 
Start-Process -FilePath $file -ArgumentList '/skipeula /auto upgrade /copylogs $dir'
