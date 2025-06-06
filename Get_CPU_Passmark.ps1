if (-not (Get-Module -ErrorAction Ignore -ListAvailable PowerHTML))
{
    Install-Module PowerHTML -Scope CurrentUser -ErrorAction Stop -Force
}

Import-Module -ErrorAction Stop PowerHTML


#Get the CPU name and scrape the benchmark score from cpubenchmark.net

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main" -Name "DisableFirstRunCustomize" -Value 2
$CPU = Get-WMIObject win32_Processor | select name
$url ='https://www.cpubenchmark.net/cpu.php?cpu='+$CPU.Name

$webClient = New-Object Net.WebClient
$webClient.Headers.Add('user-agent', [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox)
$result = $webClient.DownloadString($url)
$html = ConvertFrom-Html -Content $result

$PassmarkText = $html.selectNodes("/html/body/div[3]/div[1]/div/div[3]/div[2]/div[2]/div[1]/div/div[2]/div[3]")

write-output $PassmarkText.InnerText.Trim()
