# HA-Hass-Sensor
Contains the PowerShell scripts I use to get some extra info from HASS windows hosts.
## DiskAndSwap.ps1:
### Issues:
- When using sensors from the HASS.Agent in order to view windows host information in HA, I was missing the % disk usage and % swap usage

### Solution:
- Get the thru the PowerShellScript Sensor in HASS.Agent

## Parameters:
> $Machine=@{VmUUID="`f05c746c-a545-4329-8252-bc3b42907131`";
