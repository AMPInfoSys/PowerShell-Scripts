#Get the CPU name and scrape the benchmark score from cpubenchmark.net

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main" -Name "DisableFirstRunCustomize" -Value 2
$CPU = Get-WMIObject win32_Processor | select name
$url ='https://www.cpubenchmark.net/cpu.php?cpu='+$CPU.Name
$response = Invoke-WebRequest -Uri $url
$classname ='right-desc'
$PassmarkText = $response.ParsedHtml.body.getElementsByClassName($classname) | select -expand innertext
$PassmarkText = $PassmarkText -split "\n"
write-host $PassmarkText[2]
