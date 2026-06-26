# Disable WSAIFabricSvc
sc.exe config WSAIFabricSvc start= disabled
Set-Service -Name "WSAIFabricSvc" -StartupType Disabled

# Disable the Registry settings for AI Search Box Suggestions in File Explorer
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Explorer" -Force | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableSearchBoxSuggestions" -Value 1 -PropertyType DWORD -Force

# Disable the Windows AI Settings Agent policy
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "WindowsAI" -Force | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" -Name "DisableSettingsAgent" -Value 1 -PropertyType DWORD -Force

# Disable Paint AI
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Paint" /v DisableCocreator /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Paint" /v DisableGenerativeFill /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Paint" /v DisableImageCreator /t REG_DWORD /d 1 /f

# Disable Notepad AI
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\systemAIModels" /v Value /t REG_SZ /d Deny /f

# Disable Edge AI
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v HubsSidebarEnabled /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v DiscoverPageContextEnabled /t REG_DWORD /d 0 /f

# Restart File Explorer to apply the changes immediately
Stop-Process -Name explorer -Force

