#!/bin/bash
# Author: Aziz Köksal <aziz.koeksal@gmail.com>
# History:
#   27 Nov 2008: Fixes: the script didn't actually work, some commands were
#                commented out.
#                Determine the path of wine's system32/ using winepath.
#   08 Sep 2008: First release.

NL="
"
echo "Downloading htmlhelp.exe from download.microsoft.com:$NL"
wget 'http://download.microsoft.com/download/0/a/9/0a939ef6-e31c-430f-a3df-dfae7960d564/htmlhelp.exe' -O htmlhelp.exe
echo -e "Need to get mfc40.dll, itircl.dll, itss.dll from a Windows folder or the"\\n"internet."
read -p "Download from the internet? [Y/n] " && [ -z "$REPLY" ] && REPLY="y"
if [ "$REPLY" == "y" ]; then
  DLLDUMP="http://www.dlldump.com/dllfiles"
  REFERRER="http://www.dlldump.com/download-dll-files_new.php/dllfiles"
  wget "$DLLDUMP/M/mfc40.dll" -O mfc40.dll --referer="$REFERRER/M/mfc40.dll/4.1.001/download.html"
  wget "$DLLDUMP/I/itircl.dll" -O itircl.dll --referer="$REFERRER/I/itircl.dll/5.2.3790.1159/download.html"
  wget "$DLLDUMP/I/itss.dll" -O itss.dll --referer="$REFERRER/I/itss.dll/5.2.3790.1221/download.html"
  #wget 'http://www.afreeocx.com/ocx/get/3340/hhctrl.ocx' -O hhctrl.ocx
else
  read -p "Enter the path to your Windows installation (e.g. /mount/winxp/):$NL"
  echo ""
  [ ! -d $REPLY ] && echo "The directory '$REPLY' doesn't exist." && exit;
  WINDOWS=`find $REPLY -maxdepth 1 -iname windows -type d`
  [ ! -d $WINDOWS ] && echo "Couldn't find the Windows directory in '$REPLY'." && exit;
  SYSTEM32=`find $WINDOWS -maxdepth 1 -iname system32 -type d`
  [ ! -d $SYSTEM32 ] && echo "Couldn't find the System32 directory in '$WINDOWS'." && exit;

  function fetchfile {
    DLL=`find $SYSTEM32 -maxdepth 1 -iname $1 -type f`
    [ ! -f $DLL ] && echo "Couldn't find $1 in '$SYSTEM32'." && exit;
    cp $DLL ./$1
    echo "Found and fetched $DLL"
  }
  fetchfile mfc40.dll; fetchfile itss.dll; fetchfile itircl.dll;
fi

echo "${NL}Starting setup."
wine htmlhelp.exe

echo "${NL}Copying mfc40.dll, itircl.dll and itss.dll to C:\\Windows\\system32.$NL"
cp mfc40.dll itircl.dll itss.dll `winepath 'C:\windows\system32\'`

echo "${NL}Registering native DLL files.$NL"
wine regsvr32.exe 'C:\Windows\system32\mfc40.dll'\
                  'C:\Windows\system32\itss.dll' \
                  'C:\Windows\system32\itircl.dll'

echo "${NL}Creating hhw.reg and applying the registry patch (to use native DLL files).$NL"
echo 'REGEDIT4

[HKEY_CURRENT_USER\Software\Wine\DllOverrides]
"itircl"="native,builtin"
"itss"="native,builtin"' > hhw.reg && \
wine regedit.exe hhw.reg

read -p "Remove downloaded and created files? [Y/n] " && [ -z "$REPLY" ] && REPLY="y"
[ "$REPLY" == "y" ] && rm mfc40.dll itss.dll itircl.dll hhw.reg htmlhelp.exe

read -p "Start HTML Help Workshop now? [Y/n] " && [ -z "$REPLY" ] && REPLY="y"
[ "$REPLY" == "y" ] && wine 'C:\Program Files\HTML Help Workshop\hhw.exe' &
