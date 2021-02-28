$ipAddress = wsl ip addr show dev eth0 | wsl sed -u -n 3p | wsl awk '{print \$2}' | wsl cut -d / -f1
# $ports = 22,3000
$ports = 22
$ports_string = $ports -join ','
$arg=$args[0]

# If elevation needed, start new process
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # Relaunch as an elevated process:
    Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path),"$Args runas" -Verb RunAs
    exit
}

if (!$arg) {
    foreach ($port in $ports) {
        netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=$port connectaddress=$ipAddress connectport=$port | Out-Null
    }
    iex "New-NetFirewallRule -DisplayName `"Open Ports $ports_string`" -Direction Inbound -LocalPort $ports_string -Protocol TCP -Action Allow | Out-Null"
    netsh interface portproxy show v4tov4
    # Get-NetAdapterBinding -ComponentID ms_tcpip6 | foreach { Disable-NetAdapterBinding $_.Name -ComponentID ms_tcpip6 }
}

if ($arg -eq "show") {
    netsh interface portproxy show v4tov4
}

if ($arg -eq "reset") {
    netsh int portproxy reset all | Out-Null
    Remove-NetFirewallRule -DisplayName "Open Ports $ports_string" | Out-Null
}
