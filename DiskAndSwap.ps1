param(
    [string]$percentatge
)

function ObtindrePercentatgeDiskC {
    $diskInfo = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' }
    $percentatgeFree = 100 - ($diskInfo.FreeSpace / $diskInfo.Size) * 100
    return '{0:N2}' -f $percentatgeFree
}

function ObtindrePercentatgeSwap {
	$maxSizeStr = systeminfo | select-string "Virtual Memory: Max Size:"
	$maxSizeStr = $maxSizeStr -replace "\.","" -replace ",",""
	$maxSize = [int][regex]::Matches($maxSizeStr, '[\d.]+').Value
	$inUseStr = systeminfo | select-string "Virtual Memory: In Use:"
	$inUseStr = $inUseStr -replace "\.","" -replace ",",""
	$inUse = [int][regex]::Matches($inUseStr, '[\d.]+').Value
	$swapUsage = ($inUse / $maxSize) * 100
    return '{0:N2}' -f $swapUsage
}

if ($percentatge -eq 'disk') {
    $percentatgeDiskC = ObtindrePercentatgeDiskC
    Write-Host "$percentatgeDiskC"
}
elseif ($percentatge -eq 'swap') {
    $percentatgeSwap = ObtindrePercentatgeSwap
    Write-Host "$percentatgeSwap"
}
else {
    Write-Host "Paràmetre no vàlid. Utilitza '-percentatge disk' / '-percentatge swap'."
}
