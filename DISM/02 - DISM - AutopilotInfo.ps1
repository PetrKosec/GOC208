# =================================================================
# WinPE - Přidání PowerShellu a Get-WindowsAutopilotInfo.ps1
# =================================================================

# Cesta k WinPE WIM souboru
$WimFile = "D:\WinPE\media\sources\boot.wim"

# Mount adresář
$MountDir = "D:\WinPE\Mount"

# Cesta k WinPE Optional Components
$WinPEOCPath = "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs"

# Cesta ke skriptu Autopilot
$AutopilotScript = "D:\Scripts\Get-WindowsAutopilotInfo.ps1"

# -----------------------------------------------------------------
# Mount WIM
# -----------------------------------------------------------------

Write-Host "Mounting WIM..."

dism /Mount-Image `
    /ImageFile:$WimFile `
    /Index:1 `
    /MountDir:$MountDir

# -----------------------------------------------------------------
# Přidání WinPE komponent
# -----------------------------------------------------------------

$Packages = @(
    "WinPE-WMI.cab",
    "WinPE-NetFX.cab",
    "WinPE-Scripting.cab",
    "WinPE-PowerShell.cab",
    "WinPE-DismCmdlets.cab"
)

foreach ($Package in $Packages)
{
    Write-Host "Adding $Package"

    dism /Image:$MountDir `
         /Add-Package `
         /PackagePath:"$WinPEOCPath\$Package"
}

# -----------------------------------------------------------------
# Přidání jazykových balíčků (cs-CZ nebo en-US)
# -----------------------------------------------------------------

$Lang = "en-us"

$LangPackages = @(
    "WinPE-WMI_$Lang.cab",
    "WinPE-NetFX_$Lang.cab",
    "WinPE-Scripting_$Lang.cab",
    "WinPE-PowerShell_$Lang.cab",
    "WinPE-DismCmdlets_$Lang.cab"
)

foreach ($Package in $LangPackages)
{
    $FullPath = Join-Path "$WinPEOCPath\$Lang" $Package

    if (Test-Path $FullPath)
    {
        Write-Host "Adding language package $Package"

        dism /Image:$MountDir `
             /Add-Package `
             /PackagePath:$FullPath
    }
}

# -----------------------------------------------------------------
# Kopie Get-WindowsAutopilotInfo.ps1
# -----------------------------------------------------------------

$ScriptFolder = "$MountDir\Scripts"

New-Item -ItemType Directory `
         -Path $ScriptFolder `
         -Force | Out-Null

Copy-Item $AutopilotScript `
          "$ScriptFolder\Get-WindowsAutopilotInfo.ps1" `
          -Force

# -----------------------------------------------------------------
# Vytvoření Startnet.cmd
# -----------------------------------------------------------------

$Startnet = @'
wpeinit

powershell.exe -ExecutionPolicy Bypass
'@

Set-Content `
    -Path "$MountDir\Windows\System32\startnet.cmd" `
    -Value $Startnet `
    -Encoding ASCII

# -----------------------------------------------------------------
# Commit + Unmount
# -----------------------------------------------------------------

Write-Host "Saving image..."

dism /Unmount-Image `
    /MountDir:$MountDir `
    /Commit

Write-Host "Hotovo."
