$archiveUrl = 'https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.exe'
$archiveName = Split-Path $archiveUrl -Leaf
$archivePath = "$env:TEMP\$archiveName"
Write-Output 'Downloading Unity Hub...'
(New-Object Net.WebClient).DownloadFile($archiveUrl, $archivePath)
Write-Output 'Installing Unity Hub...'
&$archivePath /S | Out-String -Stream

Write-Output 'Installing Unity Editor...'
choco install -y unity --version 2019.1.0.20190417

Write-Output 'Unity is installed, but You still need to manually activate it using the Unity Hub. See the README.md file.'
