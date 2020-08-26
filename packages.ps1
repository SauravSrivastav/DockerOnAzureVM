#Enable Containers
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Containers -All -NoRestart

#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'docker-for-windows',`
            'visualstudiocode',`
            'git'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Add Demo User to docker group
Add-LocalGroupMember -Member stormtrooperio -Group docker-users

#Reboot
Restart-Computer
