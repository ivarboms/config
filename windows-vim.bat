echo Vim setup start.

echo Symlink vimrc.
if exist "C:\Program Files (x86)\Vim\_vimrc" del "C:\Program Files (x86)\Vim\_vimrc"
mklink /H "C:\Program Files (x86)\Vim\_vimrc" .vimrc

rem Vim likes to default to English, regardless of settings in vimrc.
rem Deleting the 'lang' folder seems to force it to English.
echo Remove lang folder.
rmdir /S /Q "C:\Program Files (x86)\Vim\vim74\lang"

echo Delete vimfiles folder.
rmdir /S /Q "C:\Program Files (x86)\Vim\vimfiles"
echo Symlink vimfiles folder.
mklink /J "C:\Program Files (x86)\Vim\vimfiles" vimfiles

echo Vim setup done.
