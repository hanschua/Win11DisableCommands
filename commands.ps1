# Disable WSAIFabricSvc
sc.exe config WSAIFabricSvc start= disabled
Set-Service -Name "WSAIFabricSvc" -StartupType Disabled

# Disable the Registry settings for AI Search Box Suggestions in File Explorer
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Explorer" -Force | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableSearchBoxSuggestions" -Value 1 -PropertyType DWORD -Force

# Disable the Windows AI Settings Agent policy
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "WindowsAI" -Force | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" -Name "DisableSettingsAgent" -Value 1 -PropertyType DWORD -Force

# Restart File Explorer to apply the changes immediately
Stop-Process -Name explorer -Force

