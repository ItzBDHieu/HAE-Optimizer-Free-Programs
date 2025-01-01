@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

set adapter_name=""
for /f "tokens=1,2 delims=," %%a in ('wmic nic where "NetEnabled=true" get NetConnectionID^,NetEnabled /format:csv ^| find /i "true"') do (
    set adapter_name=%%b
)

if "%adapter_name%"=="" (
    echo No active network adapter found. Press any key to continue . . .
    pause
    goto menu
)
:--------------------------------------

:menu
cls
chcp 65001>nul                                                                                                                      
echo.                                
echo.                                
echo.                                       [33m█[33m█[97m╗  [33m█[33m█[97m╗[33m█[33m█[97m╗[33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m╗[33m█[33m█[97m╗   [33m█[33m█[97m╗
echo.                                       [33m█[33m█[97m║  [33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[97m╔[97m═[97m═[97m═[97m═[97m╝[33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[33m█[33m█[33m█[97m╗  [33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[97m╔[97m═[97m═[33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[97m╔[97m═[97m═[97m╝  [33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[97m║  [33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m╗[97m╚[33m█[33m█[33m█[33m█[33m█[33m█[97m╔[97m╝
echo.                                       [97m╚[97m═[97m╝  [97m╚[97m═[97m╝[97m╚[97m═[97m╝[97m╚[97m═[97m═[97m═[97m═[97m═[97m═[97m╝ [97m╚[97m═[97m═[97m═[97m═[97m═[97m╝ 
echo.
echo [Hieu Basic Optization] Ver:0.1 [Caution: Make sure to create a system restore point]
echo Select what you want to do
echo 1. Clear Temporary Files
echo 2. Network Tweak
echo 3. Window Tweak
echo 4. FPS Tweak
echo 5. Input Tweak
echo 6. Reset Network
echo [I do not take any responsibility of how your system perfromance after the optimization]
echo.
set /p choice="Enter your choice [1-10]: "
echo.
if "%choice%"=="1" goto clear_temp_menu
if "%choice%"=="2" goto network_tweak_menu
if "%choice%"=="3" goto window_tweak
if "%choice%"=="4" goto fps_tweak
if "%choice%"=="5" goto input_tweak
if "%choice%"=="6" goto reset_network

echo Invalid selection.
pause
goto menu
:clear_temp_menu
cls
chcp 65001>nul                                                                                                                      
echo.                                
echo.                                
echo.                                       [33m█[33m█[97m╗  [33m█[33m█[97m╗[33m█[33m█[97m╗[33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m╗[33m█[33m█[97m╗   [33m█[33m█[97m╗
echo.                                       [33m█[33m█[97m║  [33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[97m╔[97m═[97m═[97m═[97m═[97m╝[33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[33m█[33m█[33m█[97m╗  [33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[97m╔[97m═[97m═[33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[97m╔[97m═[97m═[97m╝  [33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[97m║  [33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m╗[97m╚[33m█[33m█[33m█[33m█[33m█[33m█[97m╔[97m╝
echo.                                       [97m╚[97m═[97m╝  [97m╚[97m═[97m╝[97m╚[97m═[97m╝[97m╚[97m═[97m═[97m═[97m═[97m═[97m═[97m╝ [97m╚[97m═[97m═[97m═[97m═[97m═[97m╝ 
echo.
echo Select what temp or cache file do you want to remove:
echo 1. Temporary Files
echo 2. Clear Specific Browser Cache
echo 3. Windows Update Cache
echo 4. Prefetch Files
echo 5. Windows Store Cache
echo 6. Windows Log Files
echo 7. Memory Dump Files
echo 8. Windows Delivery Optimization Files
echo 9. DirectX Shader Cache
echo 10. Back to menu
echo.
set /p choice="Enter your choice [1-10]: "
echo.

if "%choice%"=="1" goto clear_temp
if "%choice%"=="2" goto browser_cache_menu
if "%choice%"=="3" goto clear_update
if "%choice%"=="4" goto clear_prefetch
if "%choice%"=="5" goto clear_store
if "%choice%"=="6" goto clear_logfiles
if "%choice%"=="7" goto clear_memorydump
if "%choice%"=="8" goto clear_optimization
if "%choice%"=="9" goto clear_shader
if "%choice%"=="10" goto menu

echo Invalid choice
pause
goto clear_temp_menu

:clear_temp
del /q /f /s %temp%\*
echo Temporary files cleared.
pause
goto clear_temp_menu

:browser_cache_menu
cls
echo Select the browser cache to clear:
echo 1. Google Chrome
echo 2. Mozilla Firefox
echo 3. Opera GX
echo 4. Brave
echo 5. Return to Main Menu
echo.
set /p browserchoice="Enter your choice [1-5]: "
echo.

if "%browserchoice%"=="1" goto clear_chrome
if "%browserchoice%"=="2" goto clear_firefox
if "%browserchoice%"=="3" goto clear_opera
if "%browserchoice%"=="4" goto clear_brave
if "%browserchoice%"=="5" goto menu

echo Invalid choice
pause
goto browser_cache_menu

:clear_chrome
del /q /f /s "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*"
echo Google Chrome cache cleared.
pause
goto browser_cache_menu

:clear_firefox
start /wait "" "C:\Program Files\Mozilla Firefox\firefox.exe" -P "default" -no-remote -safe-mode -jsconsole -clearcache
echo Mozilla Firefox cache cleared.
pause
goto browser_cache_menu

:clear_opera
del /q /f /s "%AppData%\Opera Software\Opera GX Stable\Cache\*"
echo Opera GX cache cleared.
pause
goto browser_cache_menu

:clear_brave
del /q /f /s "%LocalAppData%\BraveSoftware\Brave-Browser\User Data\Default\Cache\*"
echo Brave cache cleared.
pause
goto browser_cache_menu

:clear_update
net stop wuauserv
del /q /f /s %windir%\SoftwareDistribution\Download\*
net start wuauserv
echo Windows Update service stopped, cache cleared, and service started.
pause
goto clear_temp_menu

:clear_prefetch
if exist %windir%\Prefetch\ (
    del /q /f /s %windir%\Prefetch\*
    echo Prefetch files cleared.
) else (
    echo Prefetch directory not found or empty.
)
pause
goto clear_temp_menu

:clear_store
wsreset
echo Windows Store cache cleared.
pause
goto clear_temp_menu

:clear_logfiles
del /q /f /s %windir%\Logs\*
echo Windows log files cleared.
pause
goto clear_temp_menu

:clear_memorydump
if exist %windir%\Minidump\ (
    del /q /f /s %windir%\Minidump\*
    echo Memory dump files cleared.
) else (
    echo Memory dump files directory not found or empty.
)
pause
goto clear_temp_menu

:clear_optimization
net stop dosvc
del /q /f /s %windir%\SoftwareDistribution\DeliveryOptimization\*
net start dosvc
echo Windows Delivery Optimization files cleared.
pause
goto clear_temp_menu

:clear_shader
del /q /f /s "%LocalAppData%\D3DSCache\*"
echo DirectX Shader Cache cleared.
pause
goto clear_temp_menu

:network_tweak_menu
cls
chcp 65001>nul                                                                                                                      
echo.                                
echo.                                
echo.                                       [33m█[33m█[97m╗  [33m█[33m█[97m╗[33m█[33m█[97m╗[33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m╗[33m█[33m█[97m╗   [33m█[33m█[97m╗
echo.                                       [33m█[33m█[97m║  [33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[97m╔[97m═[97m═[97m═[97m═[97m╝[33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[33m█[33m█[33m█[97m╗  [33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[97m╔[97m═[97m═[33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[97m╔[97m═[97m═[97m╝  [33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[97m║  [33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m╗[97m╚[33m█[33m█[33m█[33m█[33m█[33m█[97m╔[97m╝
echo.                                       [97m╚[97m═[97m╝  [97m╚[97m═[97m╝[97m╚[97m═[97m╝[97m╚[97m═[97m═[97m═[97m═[97m═[97m═[97m╝ [97m╚[97m═[97m═[97m═[97m═[97m═[97m╝ 
echo Choose what you want to tweak:
echo 1.Netsh Setting and Network Setting
echo 2.Disable Nagle Algorithm
echo 3.Optimize TcpIp
echo 4.Winsock Optimize (Optional)
echo 5.Remove Network Bandwith Limit
echo 6.Back to menu
set /p choice="Enter your choice [1-16]: "
echo.

if "%choice%"=="1" goto netsh_setting
if "%choice%"=="2" goto disable_nagle
if "%choice%"=="3" goto tcpip
if "%choice%"=="4" goto winsock
if "%choice%"=="5" goto bandwith
if "%choice%"=="6" goto menu

echo Invalid selection
pause
goto network_tweak_menu

:netsh_setting
netsh interface ip set global taskoffload=enable
netsh interface tcp set global chimney=disable
netsh interface tcp set global rss=enabled
netsh interface tcp set global autotuninglevel=normal
netsh interface tcp set global congestionprovider=ctcp
netsh interface tcp set global ecncapability=disabled
netsh interface tcp set global timestamps=disabled
netsh interface tcp set global dca=enabled
netsh interface tcp set global netdma=enabled
netsh interface tcp set global rsc=disable
netsh interface tcp set global fastopen=enabled
netsh interface tcp set global initialRto=300
netsh interface tcp set global minRto=300
netsh interface tcp set global maxsynRetransmissions=2
netsh interface tcp set global maxconnections=65535
netsh interface tcp set global dynamicport start=1025 num=64511
netsh interface tcp set global maxuserport=65534
netsh interface tcp set global sackopts=enabled
netsh interface tcp set global synattackprotect=enabled
netsh interface tcp set global initialCongestionControlLevel=1
netsh interface tcp set global initialCongestionWindow=2
netsh interface tcp set global nonlocalsource=disabled
netsh interface ipv4 set subinterface "%adapter_name%" mtu=1000 store=persistent
goto network_tweak_menu

:disable_nagle
Reg Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v TcpAckFrequency /t REG_DWORD /d "1" /f
Reg Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v TcpDelAckTicks /t REG_DWORD /d "0" /f
Reg Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v TcpNoDelay /t REG_DWORD /d "1" /f
Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSMQ\Parameters" /v TcpNoDelay /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f
goto network_tweak_menu

:tcpip
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableCMPRedirect /t REG_DWORD /d "00000001" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnablePMTUDiscovery /t REG_DWORD /d "00000001" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v Tcp1323Opts /t REG_DWORD /d "00000000" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v GlobalMaxTcpWindowSize /t REG_DWORD /d "00000001" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxConnectionsPerServer /t REG_DWORD /d "2" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpTimedWaitDelay /t REG_DWORD /d "32" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EMTUBHDetect /t REG_DWORD /d "0" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DisableTaskOffload /t REG_DWORD /d "0" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d "64" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v SackOpts /t REG_DWORD /d "00000000" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpMaxDupAcks /t REG_DWORD /d "2" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v LocalPriority /t REG_DWORD /d "4" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v HostsPriority /t REG_DWORD /d "5" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v DnsPriority /t REG_DWORD /d "6 /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v NetbtPriority /t REG_DWORD /d "7" /f
goto network_tweak_menu

:winsock
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v UseDelayedAccptance /t REG_DWORD /d "0" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v MaxSockAddrLength /t REG_DWORD /d "16" /f
Reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v MinSockAddrLength /t REG_DWORD /d "16" /f
goto network_tweak_menu

:bandwith
Reg.exe Add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "10" /f > $null 2>&1
goto network_tweak_menu

:window_tweak
cls
chcp 65001>nul                                                                                                                      
echo.                                
echo.                                
echo.                                       [33m█[33m█[97m╗  [33m█[33m█[97m╗[33m█[33m█[97m╗[33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m╗[33m█[33m█[97m╗   [33m█[33m█[97m╗
echo.                                       [33m█[33m█[97m║  [33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[97m╔[97m═[97m═[97m═[97m═[97m╝[33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[33m█[33m█[33m█[97m╗  [33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[97m╔[97m═[97m═[33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[97m╔[97m═[97m═[97m╝  [33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[97m║  [33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m╗[97m╚[33m█[33m█[33m█[33m█[33m█[33m█[97m╔[97m╝
echo.                                       [97m╚[97m═[97m╝  [97m╚[97m═[97m╝[97m╚[97m═[97m╝[97m╚[97m═[97m═[97m═[97m═[97m═[97m═[97m╝ [97m╚[97m═[97m═[97m═[97m═[97m═[97m╝ 
echo.
echo Choose what optimization you want to do
echo 1.General Optimization
echo 2.Privacy Optimization
echo 3.Gaming Optimization
echo 4.Optimize BCDEdit 
echo 5.Optimize CSRSS
echo 6.Optimize Network Congestion Provider
echo 7.Optimize Window Explorer
echo 8.Optimize Window Sche Task
echo 9.Disable Telemetry
echo 10.Disable SMBv1 and SMBv2
echo 11.Disable Services
echo 12.Disable Game Bar
echo 13.Disable Xbox
echo 14.Explorer Tweak
echo 15.Back to menu
set /p choice="Enter your choice [1-15]: "
echo.

if "%choice%"=="1" goto general_tweak
if "%choice%"=="2" goto privacy_tweak
if "%choice%"=="3" goto gaming_tweak
if "%choice%"=="4" goto bcdedit_tweak
if "%choice%"=="5" goto csrss_tweak
if "%choice%"=="6" goto congestion_provider
if "%choice%"=="7" goto window_explorer
if "%choice%"=="8" goto window_task
if "%choice%"=="9" goto disable_telemetry
if "%choice%"=="10" goto disable_smb
if "%choice%"=="11" goto disable_services
if "%choice%"=="12" goto disable_game_bar
if "%choice%"=="13" goto disable_xbox
if "%choice%"=="14" goto explorer
if "%choice%"=="15" goto menu
echo Invalid selection
pause
goto window_tweak



:general_tweak
Fsutil behavior set disablecompression 1 > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "AllowDeepCStates" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0001" /v "AllowDeepCStates" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0002" /v "AllowDeepCStates" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0003" /v "AllowDeepCStates" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\FTH" /v "Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d "2" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d "150000" /f > $null 2>&1
Reg.exe Add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1500" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillAppTimeout" /t REG_SZ /d "1500" /f > $null 2>&1
Reg.exe Add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "1500" /f > $null 2>&1
Reg.exe Add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1500" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1500" /f > $null 2>&1
Reg.exe Add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AlwaysKeepMemoryDump" /t REG_DWORD /d "0" /f > $null 2>&1
Net accounts /maxpwage:unlimited > $null 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView\AllUpView" /v "AllUpView" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView\AllUpView" /v "Remove TaskView" /t REG_DWORD /d "1" /f
goto window_tweak

:privacy_tweak
Reg.exe Add "HKCU\Software\Microsoft\Windows\Shell\Associations\AppUrlAssociations\share.microsoft.com\AppX6bvervyj4dbgfhwjaqdvcttzfgz9rvpv\UserChoice" /v "Hash" /t REG_SZ /d "hhJ5zpMlfwI=" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\Shell\Associations\AppUrlAssociations\share.microsoft.com\AppX6bvervyj4dbgfhwjaqdvcttzfgz9rvpv\UserChoice" /v "Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "restrictanonymous" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t "REG_DWORD" /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportinfectioninformation" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Experience" /v "AllowTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceAppSuggestionsEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\DusmSvc\Settings" /v "DisableSystemBucket" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "POWERSHELL_TELEMETRY_OPTOUT" /t REG_SZ /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableCloudOptimizedContent" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableAutomaticRestartSignOn" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v "AllowLinguisticDataCollection" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "SafeSearchMode" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableCdp" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableMmx" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "RSoPLogging" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging" /v "AllowMessageSync" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisableCredentialsSettingSync" /t REG_DWORD /d "2" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisableCredentialsSettingSyncUserOverride" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisableApplicationSettingSync" /t REG_DWORD /d "2" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisableApplicationSettingSyncUserOverride" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsActivateWithVoice" /t REG_DWORD /d "2" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsSyncWithDevices" /t REG_DWORD /d "2" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\FindMyDevice" /v "AllowFindMyDevice" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Settings\FindMyDevice" /v "LocationSyncEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /d "Deny" /f > $null 2>&1
Disable-ScheduledTask -TaskPath "\Microsoft\Windows\Application Experience" -TaskName "Microsoft Compatibility Appraiser" > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /v "DiagnosticErrorText" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v "DiagnosticErrorText" /t REG_SZ /d " " /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v "DiagnosticLinkText" /t REG_SZ /d " " /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{8BC668CF-7728-45BD-93F8-CF2B3B41D7AB}" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E390DF20-07DF-446D-B962-F5C953062741}" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\WMDRM" /v "DisableOnline" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "Value" /t REG_SZ /d "Deny" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Browser" /v "AllowAddressBarDropdown" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\Personalization\Settings" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationScripting" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\OneDrive" /v "PreventNetworkTrafficPreUserSignIn" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "2" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".tif" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".tiff" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".bmp" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".dib" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".gif" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jfif" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jpe" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jpeg" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jpg" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jxr" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".png" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v ContentEvaluation /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableAutomaticRestartSignOn" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_CURRENT_USER\SYSTEM\GameConfigStore\Children\fefe78e0-cf54-411d-9154-04b8f488bea2" /v "Flags" /t REG_DWORD /d "529" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\EnhancedStorageDevices" /v "TCGSecurityActivationDisabled" /t REG_DWORD /d "0" /f
goto window_tweak

:gaming_tweak
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t REG_SZ /d "True" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\\Low Latency" /v "Latency Sensitive" /t REG_SZ /d "True" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\\Low Latency" /v "Priority" /t REG_DWORD /d "8" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\\Low Latency" /v "Scheduling Category" /t REG_SZ /d "Medium" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\\Low Latency" /v "SFIO Priority" /t REG_SZ /d "High" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\\Low Latency" /v "GPU Priority" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "0" /f > $null 2>&1
goto window_tweak

:bcdedit_tweak
BCDEdit /set tscsyncpolicy enhanced > $null 2>&1
BCDEdit /timeout 0 > $null 2>&1
BCDEdit /set bootux disabled > $null 2>&1
BCDEdit /set bootmenupolicy standard > $null 2>&1
BCDEdit /set quietboot yes > $null 2>&1
BCDEdit /set nx alwaysoff > $null 2>&1
BCDEdit /set hypervisorlaunchtype off > $null 2>&1
BCDEdit /set vsmlaunchtype Off > $null 2>&1
BCDEdit /set vm No > $null 2>&1
BCDEdit /set x2apicpolicy Enable > $null 2>&1
BCDEdit /set uselegacyapicmode No > $null 2>&1
BCDEdit /set configaccesspolicy Default > $null 2>&1
BCDEdit /set usephysicaldestination No > $null 2>&1
BCDEdit /set usefirmwarepcisettings No > $null 2>&1
BCDEdit /set disabledynamictick yes > $null 2>&1
BCDEdit /deletevalue useplatformclock > $null 2>&1
goto window_tweak

:csrss_tweak
Reg Add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v CpuPriorityClass /t Reg_DWORD /d "4" /f > $null
Reg Add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v IoPriority /t Reg_DWORD /d "3" /f > $null
goto window_tweak

:congestion_provider
Netsh int tcp set supplemental internet congestionprovider=newreno > $null 2>&1
Netsh int tcp set supplemental internetc congestionprovider=newreno > $null 2>&1
Netsh int tcp set supplemental compat congestionprovider=newreno > $null 2>&1
Netsh int tcp set supplemental custom congestionprovider=newreno > $null 2>&1
Netsh int tcp set supplemental datacenter congestionprovider=newreno > $null 2>&1
Netsh int tcp set supplemental datacenterc congestionprovider=newreno > $null 2>&1
Netsh int tcp set supplemental internet congestionprovider=bbr2 > $null 2>&1
Netsh int tcp set supplemental internetc congestionprovider=bbr2 > $null 2>&1
Netsh int tcp set supplemental compat congestionprovider=bbr2 > $null 2>&1
Netsh int tcp set supplemental custom congestionprovider=bbr2 > $null 2>&1
Netsh int tcp set supplemental datacenter congestionprovider=bbr2 > $null 2>&1
Netsh int tcp set supplemental datacenterc congestionprovider=bbr2 > $null 2>&1
goto window_tweak

:window_explorer
Reg.exe Add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NoNetCrawling" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "Append Completion" /d "yes" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "AutoSuggest" /d "yes" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "10" /f > $null 2>&1
Reg.exe Add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_SZ /d "0" /f > $null 2>&1
goto window_tweak

:window_task
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "0" /f > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Application Experience\AitAgent" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\ApplicationData\CleanupTemporaryState" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\ApplicationData\DsSvcCleanup" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\AppID\SmartScreenSpecific" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyUpload" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Location\Notifications" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Location\WindowsActionDialog" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyMonitorToastTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\SettingSync\BackgroundUploadTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\HypervisorFlightingTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\DiskFootprint\Diagnostics" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Feedback\Siuf\DmClient" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Maintenance\WinSAT" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Maps\MapsToastTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Offline Files\Background Synchronization" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Offline Files\Logon Synchronization" /Disable > $null 2>&1
Schtasks /Change /TN "\Driver Easy Scheduled Scan" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyRefresh" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\SpacePort\SpaceAgentTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\SpacePort\SpaceManagerTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Speech\SpeechModelDownloadTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\User Profile Service\HiveUploadTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Wininet\CacheTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\SettingSync\BackupTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\SettingSync\NetworkStateChangeTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\File Classification Infrastructure\Property Definition Sync" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Management\Provisioning\Logon" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\NlaSvc\WiFiTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\WCM\WiFiTask" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Windows\Ras\MobilityManager" /Disable > $null 2>&1
goto window_tweak

:disable_telemetry
Reg.exe Add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupReportingEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "UserFeedbackAllowed" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DeviceMetricsReportingEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "WebWidgetAllowed" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "UserFeedbackAllowed" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SpotlightExperiencesAndRecommendationsEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Edge" /v "UserFeedbackAllowed" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Edge" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Edge" /v "SpotlightExperiencesAndRecommendationsEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /v "EnableExtendedBooksTelemetry" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /v "EnableExtendedBooksTelemetry" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Privacy" /v "EnableEncryptedMediaExtensions" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "DoNotTrack" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "OptimizeWindowsSearchResultsForScreenReaders" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\FlipAhead" /v "FPEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\User\Default\SearchScopes" /v "ShowSearchSuggestionsGlobal" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableTelemetry" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableDefaultBrowserAgent" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\15.0\Common" /v "QMEnable" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\15.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\15.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\15.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\15.0\OSM" /v "EnableLogging" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\15.0\OSM" /v "EnableUpload" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "olksolution" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "accesssolution" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "pptsolution" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "projectsolution" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "xlsolution" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "onenotesolution" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "visiosolution" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "wdsolution" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "publishersolution" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "agave" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d "1" /f > $null 2>&1
Schtasks /Change /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /Disable > $null 2>&1
Schtasks /Change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /Disable > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\NvTelemetryContainer" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID44231" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID64640" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID66610" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NvBackend" /f > $null 2>&1
Schtasks /Change /TN "NvTmRep_CrashReport1_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" /Disable > $null 2>&1
Schtasks /Change /TN "NvTmRep_CrashReport2_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" /Disable > $null 2>&1
Schtasks /Change /TN "NvTmRep_CrashReport3_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" /Disable > $null 2>&1
Schtasks /Change /TN "NvTmRep_CrashReport4_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" /Disable > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Delete "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Stickers" /v "EnableStickers" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314559Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Speech" /v "AllowSpeechModelUpdate" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "2" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Policies\Microsoft\WindowsStore" /v "AutoDownload" /t REG_DWORD /d "2" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d "3" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\VisualStudio\Telemetry" /v "TurnOffSwitch" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableFeedbackDialog" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableEmailInput" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableScreenshotCapture" /t REG_DWORD /d "1" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\SQM" /v "OptIn" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Setup" /v "ConcurrentDownloads" /t REG_DWORD /d "2" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\Software\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\WMPNetworkSvc" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\diagsvc" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\DcpSvc" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\WdiServiceHost" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f > $null 2>&1
goto window_tweak

:disable_smb
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SMB1" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SMB2" /t REG_DWORD /d "0" /f > $null 2>&1
goto window_tweak

:disable_services
Set-Service SEMgrSvc -StartupType Enable > $null 2>&1
Set-Service AxInstSV -StartupType Enable > $null 2>&1
Set-Service tzautoupdate -StartupType Enable > $null 2>&1
Set-Service lfsvc -StartupType Enable > $null 2>&1
Set-Service SharedAccess -StartupType Enable > $null 2>&1
Set-Service CscService -StartupType Enable > $null 2>&1
Set-Service PhoneSvc -StartupType Enable > $null 2>&1
Set-Service RemoteAccess -StartupType Enable > $null 2>&1
Set-Service upnphost -StartupType Enable > $null 2>&1
Set-Service UevAgentService -StartupType Enable > $null 2>&1
Set-Service WalletService -StartupType Enable > $null 2>&1
Set-Service FrameServer -StartupType Enable > $null 2>&1
goto window_tweak

:disable_game_bar
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f > $null 2>&1
Reg.exe Add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f > $null 2>&1
goto window_tweak

:disable_xbox
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /v "Start" /t REG_DWORD /d "4" /f > $null 2>&1
goto window_tweak

:explorer
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ExtendedUIHoverTime" /t REG_DWORD /d "196608" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DontPrettyPath" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /t REG_DWORD /d "1" /f
goto window_tweak

:fps_tweak
cls
chcp 65001>nul                                                                                                                      
echo.                                
echo.                                
echo.                                       [33m█[33m█[97m╗  [33m█[33m█[97m╗[33m█[33m█[97m╗[33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m╗[33m█[33m█[97m╗   [33m█[33m█[97m╗
echo.                                       [33m█[33m█[97m║  [33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[97m╔[97m═[97m═[97m═[97m═[97m╝[33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[33m█[33m█[33m█[97m╗  [33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[97m╔[97m═[97m═[33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[97m╔[97m═[97m═[97m╝  [33m█[33m█[97m║   [33m█[33m█[97m║
echo.                                       [33m█[33m█[97m║  [33m█[33m█[97m║[33m█[33m█[97m║[33m█[33m█[33m█[33m█[33m█[33m█[33m█[97m╗[97m╚[33m█[33m█[33m█[33m█[33m█[33m█[97m╔[97m╝
echo.                                       [97m╚[97m═[97m╝  [97m╚[97m═[97m╝[97m╚[97m═[97m╝[97m╚[97m═[97m═[97m═[97m═[97m═[97m═[97m╝ [97m╚[97m═[97m═[97m═[97m═[97m═[97m╝ 
echo What tweak you want to do:
echo 1.Cpu Tweak
echo 2.Intel Cpu Tweak
echo 3.AMD Cpu Tweak
echo 4.Disable C-States
echo 5.Optimize AC value
echo 6.OPtimize DC Value
echo 7.Enable Turbo Boost
echo 8.Additional Tweak
echo 9.BCDEdit setting[Optional]
echo 10.Debloat
echo 11.Ram Tweak
echo 12.Enable KBoost
echo 13.Disable Power Throttoling
echo 14.Disable Energy Gpu Driver
echo 15.DirectX Tweak
echo 16.Bios Tweak
echo 17.Back to menu
echo.
set /p choice="Enter your choice [1-22]: "
echo.


if "%choice%"=="1" goto cpu_tweak
if "%choice%"=="2" goto intel_cpu
if "%choice%"=="3" goto amd_cpu
if "%choice%"=="4" goto disable_cstates
if "%choice%"=="5" goto optimize_ac
if "%choice%"=="6" goto optimize_dc
if "%choice%"=="7" goto turbo_boost
if "%choice%"=="8" goto addi
if "%choice%"=="9" goto bcd
if "%choice%"=="10" goto wdebloat
if "%choice%"=="11" goto ram_tweak
if "%choice%"=="12" goto kboost
if "%choice%"=="13" goto throttoling
if "%choice%"=="14" goto energy_gpu
if "%choice%"=="15" goto directx
if "%choice%"=="16" goto bios_tweak
if "%choice%"=="17" goto menu

echo Invalid selection
pause
goto fps_tweak






:cpu_tweak
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "AllowPepPerfStates" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "Cstates" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "Capabilities" /t REG_DWORD /d "516198" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MinimumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Class1InitialUnparkCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InitialUnparkCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" /v "fDisablePowerManagement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\Activators\Default\VetoPolicy" /v "EA:EnergySaverEngaged" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\Activators\28\VetoPolicy" /v "EA:PowerStateDischarging" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Misc" /v "DeviceIdlePolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "PerfEnergyPreference" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "PerfEnergyPreference" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMinCores" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMaxCores" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMinCores1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMaxCores1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CpLatencyHintUnpark1" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPDistribution" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CpLatencyHintUnpark" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "MaxPerformance1" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "MaxPerformance" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPDistribution1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPHEADROOM" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\PowerCfg\GlobalPowerPolicy" /v "Policies" /t REG_BINARY /d "01000000020000000100000000000000020000000000000000000000000000002c0100003232030304000000040000000000000000000000840300002c01000000000000840300000001646464640000" /f
Reg.exe add "HKCU\Control Panel\PowerCfg\GlobalPowerPolicy" /v "Policies" /t REG_BINARY /d "01000000020000000100000000000000020000000000000000000000000000002c0100003232030304000000040000000000000000000000840300002c01000000000000840300000001646464640000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "Cstates" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "Capabilities" /t REG_DWORD /d "516198" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MinimumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Class1InitialUnparkCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InitialUnparkCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPHEADROOM" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPCONCURRENCY" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "ProccesorThrottlingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleThreshold" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdle" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuLatencyTimer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuSlowdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "DedicatedSegmentSize" /t REG_DWORD /d "1298" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "Threshold" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuDebuggingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "ProccesorLatencyThrottlingEnabled" /t REG_DWORD /d "0" /f
goto fps_tweak

:intel_cpu
bcdedit /set allowedinmemorysettings 0x0
bcdedit /set isolatedcontext No
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableTsx" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f
powercfg -setacvalueindex scheme_current sub_processor CPMINCORES 100
powercfg /setactive SCHEME_CURRENT
powercfg /setACvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setDCvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setactive SCHEME_CURRENT
goto fps_tweak

:amd_cpu
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableTsx" /t REG_DWORD /d "1" /f

for %%i in (WakeEnabled WdkSelectiveSuspendEnable) do (
	for /f "delims=" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class" /s /f "%%~i" ^| findstr "HKEY"') do (
		Reg.exe add "%%a" /v "%%~i" /t REG_DWORD /d "0" /f
	)
)

goto fps_tweak

:disable_cstates
powercfg -setacvalueindex scheme_current SUB_SLEEP AWAYMODE 0
powercfg -setacvalueindex scheme_current SUB_SLEEP ALLOWSTANDBY 0
powercfg -setacvalueindex scheme_current SUB_SLEEP HYBRIDSLEEP 0
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMIN 100
powercfg /setactive SCHEME_CURRENT
goto fps_tweak

:optimize_ac
Powercfg -setdcvalueindex scheme_current sub_processor PROCTHROTTLEMAX 100
Powercfg -setactive scheme_current
Powercfg -setdcvalueindex scheme_current sub_processor PROCTHROTTLEMIN 50
Powercfg -setactive scheme_current
goto fps_tweak

:optimize_dc
Powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMAX 100
Powercfg -setactive scheme_current
Powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMIN 100
Powercfg -setactive scheme_current
goto fps_tweak
 
:turbo_boost
powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTMODE 1
powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTPOL 100
powercfg /setactive SCHEME_CURRENT
goto fps_tweak

:addi

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > nul


powercfg -setacvalueindex scheme_current SUB_DISK dbc9e238-6de9-49e3-92cd-8c2b4946b472 1
powercfg -setacvalueindex scheme_current SUB_DISK fc95af4d-40e7-4b6d-835a-56d131dbc80e 1

timeout /t 1 /nobreak > nul

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LowLatencyScalingPercentage" /t REG_DWORD /d "100" /f
timeout /t 1 /nobreak > nul


echo.
lodctr /r

lodctr /r

timeout /t 1 /nobreak > nul

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowSleepOption" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > nul

FSUTIL behavior set disablelastaccess 1
timeout /t 1 /nobreak > nul
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v Class2InitialUnparkCount /t REG_DWORD /d 100 /f
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v EnergyEstimationDisabled /t REG_DWORD /d 1 /f
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v PerfBoostAtGuaranteed /t REG_DWORD /d 1 /f
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v PpmMfBufferingThreshold /t REG_DWORD /d 0 /f
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v MfOverridesDisabled /t REG_DWORD /d 1 /f
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v PpmMfOverridesDisabled /t REG_DWORD /d 1 /f
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v UserBatteryDischargeEstimator /t REG_DWORD /d 1 /f
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v PowerThrottlingOff /t REG_DWORD /d 1 /f
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling /v PowerThrottlingOff /t REG_DWORD /d 1 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f

goto fps_tweak



:bcd
bcdedit /set configaccesspolicy default
bcdedit /set MSI default
bcdedit /set usephysicaldestination no
bcdedit /set usefirmwarepcisettings no
bcdedit /deletevalue useplatformtick >nul 2>&1 
bcdedit /deletevalue useplatformclockJ >nul 2>&1 
bcdedit /set disabledynamictick yes
bcdedit /set tscsyncpolicy legacy
bcdedit /set x2apicpolicy enable
bcdedit /set ems no
bcdedit /set bootems no
bcdedit /set vm no
bcdedit /set sos no
bcdedit /set quietboot yes
bcdedit /set integrityservices disable
bcdedit /set bootux disabled
bcdedit /set bootlog no
bcdedit /set tpmbootentropy ForceDisable
bcdedit /set disableelamdrivers yes
bcdedit /set hypervisorlaunchtype off
bcdedit /set isolatedcontext no
bcdedit /set pae ForceDisable
bcdedit /set vsmlaunchtype off
goto fps_tweak

:wdebloat
Powershell.exe -command "& {Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling BingWeather %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling GetHelp %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling Getstarted %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling Messaging %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling Microsoft3DViewer %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling MicrosoftSolitaireCollection %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling MicrosoftStickyNotes %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling MixedReality.Portal %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling OneConnect %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.People* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling People %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling Print3D %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling SkypeApp %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage}
echo %w%- Uninstalling WindowsAlarms %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling WindowsCamera %b%
Powershell.exe -command "& {Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling windowscommunicationsapps %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling WindowsMaps %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling WindowsFeedbackHub %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling WindowsSoundRecorder %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling YourPhone %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling ZuneMusic %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.HEIFImageExtension* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling HEIFImageExtension %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling WebMediaExtensions %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WebpImageExtension* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling WebpImageExtension %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.3dBuilder* | Remove-AppxPackage}
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling 3dBuilder %b%
PowerShell -Command "Get-AppxPackage -allusers *bing* | Remove-AppxPackage"
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling bing %b%
PowerShell -Command "Get-AppxPackage -allusers *bingfinance* | Remove-AppxPackage"
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling bingfinance %b%
PowerShell -Command "Get-AppxPackage -allusers *bingsports* | Remove-AppxPackage"
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling bingsports %b%
timeout /t 1 /nobreak > NUL
PowerShell -Command "Get-AppxPackage -allusers *CommsPhone* | Remove-AppxPackage"
echo %w%- Uninstalling CommsPhone %b%
timeout /t 1 /nobreak > NUL
PowerShell -Command "Get-AppxPackage -allusers *Drawboard PDF* | Remove-AppxPackage"
echo %w%- Uninstalling Drawboard PDF %b%
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling Sway %b%
PowerShell -Command "Get-AppxPackage -allusers *Sway* | Remove-AppxPackage"
echo %w%- Uninstalling WindowsAlarms %b%
timeout /t 1 /nobreak > NUL
PowerShell -Command "Get-AppxPackage -allusers *WindowsAlarms* | Remove-AppxPackage"
echo %w%- Uninstalling WindowsPhone %b%
PowerShell -Command "Get-AppxPackage -allusers *WindowsPhone* | Remove-AppxPackage"
timeout /t 1 /nobreak > NUL
echo %w%- Uninstalling MicrosoftEdge %b%
PowerShell -Command "Get-AppxPackage Microsoft.MicrosoftEdge_41.16299.1004.0_netural__8wekyb3d8bbwe｜Remove-AppxPackage"
goto fps_tweak

:ram_tweak
Reg.exe adReg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f
d "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "96" /f
PowerShell -Command "Disable-MMAgent -MemoryCompression
PowerShell -Command "Disable-MMAgent -PageCombining
goto fps_tweak

:kboost
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PerfLevelSrc" /t REG_DWORD /d "2222" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevelAC" /t REG_DWORD /d "0" /f
goto fps_tweak

:throttoling
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
goto fps_tweak

:energy_gpu
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDr" /v "Start" /t REG_DWORD /d "4" /f
goto fps_tweak

:directx
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableAGPSupport" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "DisableAGPSupport" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "UseNonLocalVidMem" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "UseNonLocalVidMem" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "UseNonLocalVidMem" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "UseNonLocalVidMem" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableDDSCAPSInDDSD" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "DisableDDSCAPSInDDSD" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "EmulationOnly" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "EmulationOnly" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "EmulatePointSprites" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "EmulatePointSprites" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "ForceRgbRasterizer" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "ForceRgbRasterizer" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "EmulateStateBlocks" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "EmulateStateBlocks" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "EnableDebugging" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FullDebug" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableDM" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "EnableMultimonDebugging" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "LoadDebugRuntime" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumReference" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumReference" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumRamp" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumRamp" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumNullDevice" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumNullDevice" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FewVertices" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "FewVertices" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableMMX" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "DisableMMX" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableMMX" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "DisableMMX" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "MMX Fast Path" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMXFastPath" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "MMXFastPath" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "UseMMXForRGB" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "UseMMXForRGB" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "UseMMXForRGB" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "UseMMXForRGB" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceNoSysLock" /t Reg_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "ForceNoSysLock" /t Reg_DWORD /d "0" /f

Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FlipNoVsync" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchedMode" /t REG_DWORD /d "2" /f
goto fps_tweak


:bios_tweak
Reg.exe add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "CPUPriority" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "FastDRAM" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "AGPConcur" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "CPUPriority" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "FastDRAM" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "PCIConcur" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL

bcdedit /set tscsyncpolicy legacy
echo %w%- tscsyncpolicy legacy %b%
timeout /t 1 /nobreak > NUL


bcdedit /set hypervisorlaunchtype off
echo %w%- Disable Hyper-V %b%
timeout /t 1 /nobreak > NUL


bcdedit /set linearaddress57 OptOut
bcdedit /set increaseuserva 268435328
echo %w%- Linear Address 57 %b%
timeout /t 1 /nobreak > NUL


bcdedit /set isolatedcontext No
bcdedit /set allowedinmemorysettings 0x0
echo %w%- Kernel memory mitigations %b%

timeout /t 1 /nobreak > NUL

bcdedit /set vsmlaunchtype Off
bcdedit /set vm No
Reg.exe add "HKLM\Software\Policies\Microsoft\FVE" /v "DisableExternalDMAUnderLock" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired" /t REG_DWORD /d "0" /f
echo %w%- DMA memory protection and cores isolation %b%
timeout /t 1 /nobreak > NUL


bcdedit /set x2apicpolicy Enable
bcdedit /set uselegacyapicmode No
echo %w%- Enable X2Apic %b%
timeout /t 1 /nobreak > NUL


bcdedit /set configaccesspolicy Default
bcdedit /set MSI Default
bcdedit /set usephysicaldestination No
bcdedit /set usefirmwarepcisettings No
echo %w%- Enable Memory Mapping %b%
timeout /t 1 /nobreak > NUL
goto fps_tweak

:input_tweak
cls
echo Choose what tweak you want to apply
echo 1.Display Input Tweak
echo 2.Thread Priority
echo 3.Performance Low Visual
echo 4.Back to menu
echo.
set /p choice="Enter your choice [1-3]: "
echo.

if "%choice%"=="1" goto input_display
if "%choice%"=="2" goto thread_priority
if "%choice%"=="3" goto low_visual
if "%choice%"=="4" goto menu
echo Invalid choice.
pause
goto input_tweak

:input_display
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v MonitorLatencyTolerance /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v MonitorRefreshLatencyTolerance /t REG_DWORD /d 0 /f
goto input_tweak

:thread_priority
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\usbxhci\Parameters" /v ThreadPriority /t REG_DWORD /d 31 /f
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v ThreadPriority /t REG_DWORD /d 31 /f 
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v ThreadPriority /t REG_DWORD /d 31 /f
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v ThreadPriority /t REG_DWORD /d 31 /f
goto input_tweak

:low_visual
reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f 
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout" /v EnableAutoLayout /t REG_DWORD /d 0 /f 
goto input_tweak


:reset_network
netsh interface set interface "%adapter_name%" admin=disable
netsh interface set interface "%adapter_name%" admin=enable
echo Network adapter restarted.
goto menu