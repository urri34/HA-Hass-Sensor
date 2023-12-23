# HA-Hass-Sensor
Contains the PowerShell scripts I use to get some extra info from HASS windows hosts.
## DiskAndSwap.ps1:
### Issues:
- When using sensors from the HASS.Agent in order to view windows host information in HA, I was missing the % disk usage and % swap usage

### Solution:
- Get the thru the PowerShellScript Sensor in HASS.Agent

### Configuration
In the OS of the machine that you want to be monitored, from admin powered powershell console:
>Set-ExecutionPolicy -ExecutionPolicy unrestricted
>
>Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
>
>Unblock-File -Path $env:APPDATA'\LAB02 Research\HASS.Agent\Sensors\DiskAndSwap.ps1' -percentatge disk

### Parameters:
Getting the % disk usage: 
> & $env:APPDATA'\LAB02 Research\HASS.Agent\Sensors\DiskAndSwap.ps1' -percentatge disk

Getting the % swap usage: 
> & $env:APPDATA'\LAB02 Research\HASS.Agent\Sensors\DiskAndSwap.ps1' -percentatge swap

### HA configuration.yaml
In order to force the incoming sensor to appear as % in HA, we need to force it with the following yaml code
>#Sensor for HASS.Agent
>homeassistant:
>    customize:
>        sensor.win_tv_diskusage:
>            unit_of_measurement: '%'
>        sensor.win_tv_swapusage:
>            unit_of_measurement: '%'
>        sensor.win_hpe_diskusage:
>            unit_of_measurement: '%'
>        sensor.win_hpe_swapusage:
>            unit_of_measurement: '%'
