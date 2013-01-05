Set-Alias setalias Set-Alias

Set-Alias s4 "~/s4.ps1"

Set-Alias summer "~/summer.ps1"

function prompt
{
    Write-Host ("" + $(get-location) + ">") -nonewline -foregroundcolor Yellow
    return " "
}
