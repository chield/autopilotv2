$tempdir = "c:\temp"
New-Item $tempdir -ItemType Directory -Force

#Grab the action script
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/chield/autopilotv2/refs/heads/main/Post-ESP-Reboot.ps1" -OutFile .\Post-ESP-Reboot.ps1

#Grab the ScheduledTask XML
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/chield/autopilotv2/refs/heads/main/Post-ESP-Reboot.xml" -OutFile .\Post-ESP-Reboot.xml

#Move the action scripts and register the tasks
Copy-Item ".\Post-ESP-Reboot.ps1" -Destination $tempdir -Force
Register-ScheduledTask -xml (Get-Content '.\Post-ESP-Reboot.xml' | Out-String) -TaskName "Post-ESP-Reboot" -Force
