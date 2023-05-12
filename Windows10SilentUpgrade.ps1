<#
    Run a Windows 10 Update directly from PowerShell
#>
$webClient = New-Object System.Net.WebClient 
$url = 'https://go.microsoft.com/fwlink/?LinkID=799445' 
$file = "c:\windows\temp\Win10Upgrade.exe" 
$webClient.DownloadFile($url,$file) 
Start-Process -FilePath $file -ArgumentList '/skipeula /auto upgrade /copylogs $dir'

Start-Process -FilePath $file -ArgumentList '/quietinstall /skipeula /auto upgrade /copylogs $dir'
