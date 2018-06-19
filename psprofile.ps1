Set-Alias setalias Set-Alias

Set-Alias s4 "~/s4.ps1"

Set-Alias summer "~/summer.ps1"

$env:Path += ";C:\Program Files\Python33"

function prompt
{
    Write-Host ("" + $(get-location) + ">") -nonewline -foregroundcolor Yellow
    return " "
}
