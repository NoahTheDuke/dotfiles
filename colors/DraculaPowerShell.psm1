function New-DraculaPowerShell {
    param (
        [string]$Name = $(throw "Name required.")
    )
    $shortcutPath = Join-Path $home "Desktop\$Name.lnk"
    $registryItemPath = Join-Path HKCU:\Console $Name
    # Remove existing shortcut and registry item.
    if (Test-Path $shortcutPath) {
        Remove-Item $shortcutPath
    }
    if (Test-Path $registryItemPath) {
        Remove-Item $registryItemPath
    }
    # Create new shortcut and registry item.
    New-Shortcut $shortcutPath
    New-RegistryItem $registryItemPath
    # Remember the registry item path.
    if (-not $script:registryItemPaths) {
        $script:registryItemPaths = @()
    }
    $script:registryItemPaths += $registryItemPath
    # Instructions for the final steps.
    "Change properties on `"$Name`" to internalise the registry values."
    "Then call Reset-Registry to perform the final cleanup."
}

function Reset-Registry {
    foreach ($registryItemPath in $script:registryItemPaths) {
        if (Test-Path $registryItemPath) {
            Remove-Item $registryItemPath
            "Removed `"$registryItemPath`""
        }
    }
}

function New-Shortcut {
    param (
        [string]$Path
    )
    $ws = New-Object -ComObject wscript.shell
    $shortcut = $ws.CreateShortcut($Path)
    $shortcut.TargetPath = Join-Path $Env:windir System32\WindowsPowerShell\v1.0\powershell.exe
    $shortcut.WorkingDirectory = "%HOMEDRIVE%%HOMEPATH%"
    $shortcut.Save()
    "Created `"$Path`""
}

function New-RegistryItem {
    param (
        [string]$Path
    )
    $x = New-Item $Path
    # http://twinside.free.fr/dotProject/?p=125
    $colors = @(
        0x00362a28, 0x00a47262, 0x007bfa50, 0x00fde98b,
        0x005555ff, 0x00c679ff, 0x008cfaf1, 0x005a4744,
        0x005a4744, 0x00a47262, 0x007bfa50, 0x00fde98b,
        0x005555ff, 0x00c679ff, 0x008cfaf1, 0x00f2f8f8
    )
    for ($index = 0; $index -lt $colors.Length; $index++) {
        $x = New-ItemProperty $Path -Name ("ColorTable" + $index.ToString("00")) -PropertyType DWORD -Value $colors[$index]
    }
    "Created `"$Path`""
}

Export-ModuleMember New-DraculaPowerShell, Reset-Registry