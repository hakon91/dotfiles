function Get-IsInstalled
{
    param (
        [string]$ProgramName
    )

    if(Get-Command $ProgramName -ErrorAction SilentlyContinue)
    {
        return $true
    } else
    {
        return $false
    }
}

# Check if nvim is installed
if (-not (Get-IsInstalled "nvim"))
{
    throw "nvim is not installed";
}

New-Item -Path  "$env:LOCALAPPDATA\nvim" -ItemType Junction -Target "$PSScriptRoot\.config\nvim\"
