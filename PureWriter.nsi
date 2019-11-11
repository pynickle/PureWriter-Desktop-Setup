!include "MUI.nsh"

Name "Pure Writer"
OutFile "PureWriter-Setup.exe"
InstallDir "$PROGRAMFILES\PureWriter"
Icon "PureWriter.ico"

Page license
Page directory
Page instfiles

Function .onInit
	Push ""
	Push ${LANG_ENGLISH}
	Push English
	Push ${LANG_SIMPCHINESE}
	Push "Simplified Chinese"
	Push A ; A means auto count languages
	       ; for the auto count to work the first empty push (Push "") must remain
	LangDLL::LangDialog "Installer Language" "Please select the language of the installer"

	Pop $LANGUAGE
	StrCmp $LANGUAGE "cancel" 0 +2
		Abort
FunctionEnd

UninstPage uninstConfirm
UninstPage instfiles
LicenseText "LICENSE For PureWriter"
LicenseData "PureWriter-LICENSE"

Section "" ; Setup
    SetOutPath $INSTDIR
    File "PureWriter\api-ms-win-core-console-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-datetime-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-debug-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-errorhandling-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-file-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-file-l1-2-0.dll"
    File "PureWriter\api-ms-win-core-file-l2-1-0.dll"
    File "PureWriter\api-ms-win-core-handle-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-heap-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-interlocked-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-libraryloader-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-localization-l1-2-0.dll"
    File "PureWriter\api-ms-win-core-memory-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-namedpipe-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-processenvironment-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-processthreads-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-processthreads-l1-1-1.dll"
    File "PureWriter\api-ms-win-core-profile-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-rtlsupport-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-string-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-synch-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-synch-l1-2-0.dll"
    File "PureWriter\api-ms-win-core-sysinfo-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-timezone-l1-1-0.dll"
    File "PureWriter\api-ms-win-core-util-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-conio-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-convert-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-environment-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-filesystem-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-heap-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-locale-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-math-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-multibyte-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-private-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-process-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-runtime-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-stdio-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-string-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-time-l1-1-0.dll"
    File "PureWriter\api-ms-win-crt-utility-l1-1-0.dll"
    File /r "PureWriter\app"
    File "PureWriter\msvcp140.dll"
    File "PureWriter\msvcr100.dll"
    File "PureWriter\packager.dll"
    File "PureWriter\Pure Writer.exe"
    File "PureWriter\Pure Writer.ico"
    File /r "PureWriter\runtime"
    File "PureWriter\ucrtbase.dll"
    File "PureWriter\vcruntime140.dll"

    WriteRegStr HKLM "SOFTWARE\PureWriter" "Install_Dir" "$INSTDIR"
    CreateShortCut "$Desktop\PureWriter.lnk" "$INSTDIR\Pure Writer.exe"
SectionEnd
