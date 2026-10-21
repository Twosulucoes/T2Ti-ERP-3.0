; Instalador do Nortix (PDV) com o ACBrMonitor para emissão de NFC-e.
; Montado pelo workflow nortix-instalador.yml, que coloca nesta pasta:
;   pdv\      saída do flutter build windows (Nortix.exe e dependências)
;   acbr\     ACBrMonitor compilado com as DLLs e o ACBrMonitor.ini inicial
;   vc_redist.x64.exe   runtime do Visual C++ exigido pelo Flutter

#ifndef Versao
  #define Versao "1.1.0"
#endif

[Setup]
AppId={{6E2B1C4A-7F3D-4B8E-9A51-2D0C8F4E7B19}
AppName=Nortix
AppVersion={#Versao}
AppPublisher=Two Soluções
AppPublisherURL=https://wa.me/5595981142516
AppSupportURL=https://wa.me/5595981142516
DefaultDirName={autopf}\Nortix
DefaultGroupName=Nortix
DisableProgramGroupPage=yes
OutputDir=saida
OutputBaseFilename=Nortix-Instalador-{#Versao}
SetupIconFile=..\assets\images\nortix.ico
UninstallDisplayIcon={app}\Nortix.exe
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=admin
Compression=lzma2
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "ptbr"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "atalho"; Description: "Criar atalho na área de trabalho"
Name: "acbrinicio"; Description: "Abrir o ACBrMonitor junto com o Windows (necessário para a NFC-e)"

[Dirs]
; o PDV grava ENT.TXT e lê SAI.TXT nesta pasta, então o usuário comum precisa poder escrever nela
Name: "C:\ACBrMonitor"; Permissions: users-modify

[Files]
Source: "pdv\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "acbr\*"; DestDir: "C:\ACBrMonitor"; Excludes: "ACBrMonitor.ini"; Flags: ignoreversion recursesubdirs createallsubdirs
; a configuração do monitor é do cliente: só grava na primeira instalação
Source: "acbr\ACBrMonitor.ini"; DestDir: "C:\ACBrMonitor"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "vc_redist.x64.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall

[Icons]
Name: "{group}\Nortix"; Filename: "{app}\Nortix.exe"
Name: "{group}\ACBrMonitor"; Filename: "C:\ACBrMonitor\ACBrMonitor.exe"; WorkingDir: "C:\ACBrMonitor"
Name: "{autodesktop}\Nortix"; Filename: "{app}\Nortix.exe"; Tasks: atalho
Name: "{commonstartup}\ACBrMonitor"; Filename: "C:\ACBrMonitor\ACBrMonitor.exe"; WorkingDir: "C:\ACBrMonitor"; Tasks: acbrinicio

[Run]
Filename: "{tmp}\vc_redist.x64.exe"; Parameters: "/install /quiet /norestart"; StatusMsg: "Instalando o runtime do Visual C++..."; Flags: waituntilterminated
Filename: "C:\ACBrMonitor\ACBrMonitor.exe"; WorkingDir: "C:\ACBrMonitor"; Description: "Abrir o ACBrMonitor"; Flags: nowait postinstall skipifsilent; Tasks: acbrinicio
Filename: "{app}\Nortix.exe"; Description: "Abrir o Nortix"; Flags: nowait postinstall skipifsilent
