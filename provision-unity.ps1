choco install -y ruby

# update $env:PATH with the recently installed Chocolatey packages.
Import-Module C:\ProgramData\chocolatey\helpers\chocolateyInstaller.psm1
Update-SessionEnvironment

gem install u3d

# list available stable releases.
# NB pass -p to see the available packages.
u3d available -o win -r stable #-p

# install.
u3d install 2017.4.1f1 -p Unity
u3d list

# write activation instructions.
Write-Output 'Unity is installed, but You still need to manually activate it.'
