import os


before = """Name "Pure Writer"
OutFile "PureWriter-Setup.exe"
InstallDir "$PROGRAMFILES\PureWriter"
Icon "PureWriter.ico"

Page license
Page directory
Page instfiles 
UninstPage uninstConfirm
UninstPage instfiles
LicenseText "LICENSE For PureWriter"
LicenseData "PureWriter-LICENSE"
LoadLanguageFile "${NSISDIR}/Contrib/Language files/SimpChinese.nlf"

Section "" ; Setup
    SetOutPath $INSTDIR
"""

after = """
    WriteRegStr HKLM "SOFTWARE\PureWriter" "Install_Dir" "$INSTDIR"
    CreateShortCut "$Desktop\PureWriter.lnk" "$INSTDIR\Pure Writer.exe"
SectionEnd
"""

setup_files = ""
for file in os.listdir("PureWriter"):
    if os.path.isdir("PureWriter\\" + file):
        setup_files += '    File \\r "PureWriter\\' + file + '"\n'
    else:
        setup_files += '    File "PureWriter\\' + file + '"\n'

content = before + setup_files + after

with open("PureWriter.nsi", "w", encoding="utf-8") as f:
    f.write(content)