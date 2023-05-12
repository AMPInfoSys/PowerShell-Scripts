<#
    Run a Windows 10 Update directly from PowerShell
#>
param
(
    # Silent, or Verbose
   [Parameter]
   [ValidateSet("Yes","No")]
   $ShowGUI
)

$webClient = New-Object System.Net.WebClient 
$url = 'https://go.microsoft.com/fwlink/?LinkID=799445' 
$file = "c:\windows\temp\Win10Upgrade.exe" 
$webClient.DownloadFile($url,$file) 
Start-Process -FilePath $file -ArgumentList '/skipeula /auto upgrade /copylogs $dir'

if ( $ShowGUI -eq "yes" )
{
    Start-Process -FilePath $file -ArgumentList '/skipeula /auto upgrade /copylogs $dir'  
}
else
{
    Start-Process -FilePath $file -ArgumentList '/quietinstall /skipeula /auto upgrade /copylogs $dir'
}
