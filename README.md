# HA-Hass-Sensor
Contains the PowerShell scripts I use to get some extra info from HASS windows hosts.
## DiskAndSwap.ps1:
### Issues:
- When using sensors from the HASS.Agent in order to view windows host information in HA, I was missing the % disk usage and % swap usage

### Solution:
- Get the thru the PowerShellScript Sensor in HASS.Agent

### Parameters:
Getting the % disk usage: 
> & 'C:\Users\orriolsv\AppData\Roaming\LAB02 Research\HASS.Agent\Sensors\DiskAndSwap.ps1' -percentatge disk


Getting the % swap usage: 
> & 'C:\Users\orriolsv\AppData\Roaming\LAB02 Research\HASS.Agent\Sensors\DiskAndSwap.ps1' -percentatge swap
