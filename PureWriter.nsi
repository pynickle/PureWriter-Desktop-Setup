!include "MUI.nsh"

Name "Pure Writer"
OutFile "PureWriter-Setup.exe"
InstallDir "$PROGRAMFILES"
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

Section "Setup" ; Setup
    SetOutPath $INSTDIR
    File /r "PureWriter"

    WriteRegStr HKLM "SOFTWARE\PureWriter" "Install_Dir" "$INSTDIR"
    CreateShortCut "$Desktop\PureWriter.lnk" "$INSTDIR\PureWriter\Pure Writer.exe"
    CreateShortCut "$SMPROGRAMS\PureWriter.lnk" "$INSTDIR\PureWriter\Pure Writer.exe"

    WriteUninstaller "$INSTDIR\PureWriter\uninstaller.exe"
SectionEnd

Section "Uninstall" ; Uninstall
    DeleteRegKey HKLM "SOFTWARE\PureWriter"
    Delete "$Desktop\PureWriter.lnk"
    Delete "$INSTDIR\uninstaller.exe"
    RMDir /r $INSTDIR
SectionEnd