set regpath=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced

echo Show hidden files in explorer.
reg add %regpath% /v Hidden /t REG_DWORD /d 1 /f
reg add %regpath% /v SuperHidden /t REG_DWORD /d 1 /f
reg add %regpath% /v ShowSuperHidden /t REG_DWORD /d 1 /f

echo Hide useless buttons in start menu.
reg add %regpath% /v Start_ShowHelp /t REG_DWORD /d 0 /f
reg add %regpath% /v Start_ShowMyMusic /t REG_DWORD /d 0 /f
reg add %regpath% /v Start_ShowMyGames /t REG_DWORD /d 0 /f
reg add %regpath% /v Start_ShowMyPics /t REG_DWORD /d 0 /f
reg add %regpath% /v Start_ShowPrinters /t REG_DWORD /d 0 /f
reg add %regpath% /v Start_ShowHelp /t REG_DWORD /d 0 /f

echo Make taskbar icons small.
reg add %regpath% /v TaskbarSmallIcons /t REG_DWORD /d 0 /f
