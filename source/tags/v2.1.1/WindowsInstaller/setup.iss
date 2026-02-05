
;; OpenSong Version 3 Installer Script

; If any version below the specified version is used for compiling,
; this error will be shown.
; Periods are automatically added at the end of the message.
#if VER < EncodeVer(5, 5, 2)
  #error You must use Inno Setup 5.5.2 or newer to compile this script
#endif

#ifdef UNICODE
  ; Do nothing, since Unicode is needed to compile
#else
  ; If non-Unicode (AKA ANSI) Inno Setup is used
  #error You must use Unicode Inno Setup to compile this script
#endif

; The ISPP eliminates redundant typing and prevents errors.
; Changing these values changes all other values that refer back to here.
;
; This is the location of the OpenSong source top directory
;
#define OpenSongDir "O:\source\trunk"
;
; This is the location of the executable file
;
#define BuildDir "Builds - OpenSong\Windows\OpenSong"
#define MyAppName "OpenSong"
#define MyAppExeName "OpenSong.exe"
#define MyAppVersion GetVersionNumbersString(AddBackslash(AddBackslash(OpenSongDir) + BuildDir) + MyAppExeName)
#define LastDot RPos(".", MyAppVersion)
#if LastDot == 0
   #define MyShortAppVersion MyAppVersion
#else
   #define MyShortAppVersion Copy(MyAppVersion, 0, LastDot - 1)
#endif
#define MyAppVerName MyAppName + " V" + MyAppVersion
#define MyAppPublisher "OpenSong Development Team"
#define MyAppURL "http://opensong.org/"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppID={{F7E0D5F3-0978-4DD5-82E7-007FC27A96CA}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppVerName}
VersionInfoVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
VersionInfoDescription=OpenSong is a free, open-source software application created to manage lyrics, chords, lead sheets, overheads, computer projection, and more.
VersionInfoCopyright=2025
AppCopyright=2025
LicenseFile=OpenSong License\gpl-en.txt
; general setup parameters
; use 32-bit install mode. Change the value of ArchitecturesInstallIn64BitMode to x64compatible, once we build an x64 windows executable
ArchitecturesInstallIn64BitMode=
PrivilegesRequiredOverridesAllowed=dialog
UsePreviousPrivileges=no
; this allows a portable installation even after a regular or personal installation has been done on the same machine
DisableDirPage=no
DisableProgramGroupPage=auto
; Start menu\screen and Desktop shortcuts
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=True
; Installer Graphics
WizardStyle=modern
SetupIconFile=OpenSong2.ico
WizardImageFile=Installer-Sidebar.bmp
WizardSmallImageFile=Installer-Icon.bmp
WizardImageBackColor=clWhite
; Location of the compiled Installer
OutputDir=Output
OutputBaseFilename={#MyAppName}-{#MyShortAppVersion}
; Show Language selection dialog
ShowLanguageDialog=yes
; Uninstallation items
UninstallFilesDir={app}
UninstallDisplayIcon={app}\OpenSong2Uninstall.ico
; An uninstall string and Exe won't be created if it was installed
; in portable mode, otherwise they will.
Uninstallable=not IsPortableInstall
CreateUninstallRegKey=not IsPortableInstall
UninstallDisplayName={#MyAppVerName}
; Compression
Compression=lzma2/ultra64
SolidCompression=True
InternalCompressLevel=ultra
LZMAUseSeparateProcess=yes
; Do not inherit previously selected installation options
UsePreviousTasks=no
AlwaysShowDirOnReadyPage=yes
AlwaysShowGroupOnReadyPage=yes

[Languages]
; Arranged in alphabetical order (according to the name used by the OpenSong language file),
; but with English on top
Name: english; MessagesFile: compiler:Default.isl; LicenseFile: OpenSong License\gpl-en.txt

; Unofficial Inno Setup Translation (required)
Name: belarusian; MessagesFile: "isl\Belarusian.isl"; LicenseFile: OpenSong License\gpl-ru.txt
Name: czech; MessagesFile: compiler:Languages\Czech.isl; LicenseFile: OpenSong License\gpl-cz.txt

; Unofficial Inno Setup Translation (required)
Name: chinese; MessagesFile: "isl\ChineseTraditional.isl"; LicenseFile: OpenSong License\gpl2-zh.txt
Name: deutsch; MessagesFile: compiler:Languages\German.isl; LicenseFile: OpenSong License\gpl-de.txt
Name: espanol; MessagesFile: compiler:Languages\Spanish.isl; LicenseFile: OpenSong License\gpl-es.txt

; Unofficial Inno Setup Translation (required)
Name: estonian; MessagesFile: "isl\Estonian.isl"; LicenseFile: OpenSong License\gpl-en.txt
Name: francais; MessagesFile: compiler:Languages\French.isl; LicenseFile: OpenSong License\gpl-fr.txt
Name: italiano; MessagesFile: compiler:Languages\Italian.isl; LicenseFile: OpenSong License\gpl-it.txt
Name: magyar; MessagesFile: compiler:Languages\Hungarian.isl; LicenseFile: OpenSong License\gpl-hu.txt
Name: nederlands; MessagesFile: compiler:Languages\Dutch.isl; LicenseFile: OpenSong License\gpl-nl.txt
Name: norwegian; MessagesFile: compiler:Languages\Norwegian.isl; LicenseFile: OpenSong License\gpl-no.txt
Name: polski; MessagesFile: compiler:Languages\Polish.isl; LicenseFile: OpenSong License\gpl2-pl.txt
Name: portugues; MessagesFile: compiler:Languages\Portuguese.isl; LicenseFile: OpenSong License\gpl-pt.txt
Name: portuguesbrazil; MessagesFile: compiler:Languages\BrazilianPortuguese.isl; LicenseFile: OpenSong License\gpl-pt_BR.txt
Name: russian; MessagesFile: compiler:Languages\Russian.isl; LicenseFile: OpenSong License\gpl-ru.txt
Name: slovak; MessagesFile: compiler:Languages\Slovak.isl; LicenseFile: OpenSong License\gpl-en.txt
Name: slovenian; MessagesFile: compiler:Languages\Slovenian.isl; LicenseFile: OpenSong License\gpl-en.txt
Name: svenska; MessagesFile: compiler:Languages\Swedish.isl; LicenseFile: OpenSong License\gpl-sv.txt
Name: turkish; MessagesFile: compiler:Languages\Turkish.isl; LicenseFile: OpenSong License\gpl-en.txt

[Dirs]
; Create all the directories
Name: {app}\OpenSong Data; Check: IsPortableInstall
Name: {app}\OpenSong Defaults
Name: {app}\OpenSong Scripture
Name: {app}\OpenSong Languages
Name: {app}\OpenSong Settings
Name: {app}\OpenSong Defaults\Settings
Name: {app}\OpenSong Defaults\Backgrounds; Components: Extras\Backgrounds
Name: {app}\OpenSong Defaults\Sets; Components: Extras\Example_Sets
Name: {app}\OpenSong Defaults\Songs; Components: Extras\Songs
Name: {app}\OpenSong Libs
Name: {app}\OpenSong Resources

[Files]
; Change logs, Exe
Source: "{#OpenSongDir}\changelog.txt"; DestDir: "{app}"
Source: "{#OpenSongDir}\Language-Changelog.txt"; DestDir: "{app}"
Source: "{#OpenSongDir}\{#BuildDir}\OpenSong.exe"; DestDir: "{app}"

; OpenSong Defaults folder
Source: "{#OpenSongDir}\OpenSong Defaults\Settings\*"; DestDir: "{app}\OpenSong Defaults\Settings"
Source: "{#OpenSongDir}\OpenSong Defaults\Backgrounds\*"; DestDir: "{app}\OpenSong Defaults\Backgrounds"; Components: Extras\Backgrounds
Source: "{#OpenSongDir}\OpenSong Defaults\Sets\*"; DestDir: "{app}\OpenSong Defaults\Sets"; Components: Extras\Example_Sets
Source: "{#OpenSongDir}\OpenSong Defaults\Songs\*"; DestDir: "{app}\OpenSong Defaults\Songs"; Components: Extras\Songs

; OpenSong Scripture, Settings, Libs, and Resources folders
Source: "{#OpenSongDir}\{#BuildDir}\OpenSong Scripture\*"; DestDir: "{app}\OpenSong Scripture"; Components: Bibles\KJV
Source: "{#OpenSongDir}\{#BuildDir}\OpenSong Settings\*"; DestDir: "{app}\OpenSong Settings"
Source: "{#OpenSongDir}\{#BuildDir}\OpenSong Libs\*"; DestDir: "{app}\OpenSong Libs"
Source: "{#OpenSongDir}\{#BuildDir}\OpenSong Resources\*"; DestDir: "{app}\OpenSong Resources"

; OpenSong Languages files
; Arranged in alphabetical order (according to native name)
Source: "{#OpenSongDir}\OpenSong Languages\English"; DestDir: "{app}\OpenSong Languages"
Source: "{#OpenSongDir}\OpenSong Languages\Belarusian"; DestDir: "{app}\OpenSong Languages"; Components: Languages\belarusian
Source: "{#OpenSongDir}\OpenSong Languages\Cestina"; DestDir: "{app}\OpenSong Languages"; Components: Languages\czech
Source: "{#OpenSongDir}\OpenSong Languages\Deutsch"; DestDir: "{app}\OpenSong Languages"; Components: Languages\german
Source: "{#OpenSongDir}\OpenSong Languages\Espanol"; DestDir: "{app}\OpenSong Languages"; Components: Languages\spanish
Source: "{#OpenSongDir}\OpenSong Languages\Estonian"; DestDir: "{app}\OpenSong Languages"; Components: Languages\estonian
Source: "{#OpenSongDir}\OpenSong Languages\Francais"; DestDir: "{app}\OpenSong Languages"; Components: Languages\french
Source: "{#OpenSongDir}\OpenSong Languages\Italiano"; DestDir: "{app}\OpenSong Languages"; Components: Languages\italian
Source: "{#OpenSongDir}\OpenSong Languages\Nederlands"; DestDir: "{app}\OpenSong Languages"; Components: Languages\dutch
Source: "{#OpenSongDir}\OpenSong Languages\Magyar"; DestDir: "{app}\OpenSong Languages"; Components: Languages\hungarian
Source: "{#OpenSongDir}\OpenSong Languages\Norwegian"; DestDir: "{app}\OpenSong Languages"; Components: Languages\norwegian
Source: "{#OpenSongDir}\OpenSong Languages\Polski"; DestDir: "{app}\OpenSong Languages"; Components: Languages\polish
Source: "{#OpenSongDir}\OpenSong Languages\Portugues"; DestDir: "{app}\OpenSong Languages"; Components: Languages\portugues
Source: "{#OpenSongDir}\OpenSong Languages\Portugues(Brasil)"; DestDir: "{app}\OpenSong Languages"; Components: Languages\portuguesbrasil
Source: "{#OpenSongDir}\OpenSong Languages\Russian"; DestDir: "{app}\OpenSong Languages"; Components: Languages\russian
Source: "{#OpenSongDir}\OpenSong Languages\Slovak"; DestDir: "{app}\OpenSong Languages"; Components: Languages\slovak
Source: "{#OpenSongDir}\OpenSong Languages\Slovenian"; DestDir: "{app}\OpenSong Languages"; Components: Languages\slovenian
Source: "{#OpenSongDir}\OpenSong Languages\Svenska"; DestDir: "{app}\OpenSong Languages"; Components: Languages\swedish
Source: "{#OpenSongDir}\OpenSong Languages\Turkish"; DestDir: "{app}\OpenSong Languages"; Components: Languages\turkish

; GPL V2 License files
Source: "OpenSong License\gpl2-zh.html"; DestDir: "{app}\OpenSong License"; Components: Languages\chinese
Source: "OpenSong License\gpl2-cz.pdf"; DestDir: "{app}\OpenSong License"; Components: Languages\czech
Source: "OpenSong License\gpl-nl.txt"; DestDir: "{app}\OpenSong License"; Components: Languages\dutch
Source: "OpenSong License\gpl-en.txt"; DestDir: "{app}\OpenSong License"
Source: "OpenSong License\gpl-fr.txt"; DestDir: "{app}\OpenSong License"; Components: Languages\french
Source: "OpenSong License\gpl-de.txt"; DestDir: "{app}\OpenSong License"; Components: Languages\german
Source: "OpenSong License\gpl-hu.txt"; DestDir: "{app}\OpenSong License"; Components: Languages\hungarian
Source: "OpenSong License\gpl-it.txt"; DestDir: "{app}\OpenSong License"; Components: Languages\italian
Source: "OpenSong License\gpl-no.txt"; DestDir: "{app}\OpenSong License"; Components: Languages\norwegian
Source: "OpenSong License\gpl-pl.pdf"; DestDir: "{app}\OpenSong License"; Components: Languages\polish
Source: "OpenSong License\gpl-ru.txt"; DestDir: "{app}\OpenSong License"; Components: Languages\russian Languages\belarusian
Source: "OpenSong License\gpl-es.txt"; DestDir: "{app}\OpenSong License"; Components: Languages\spanish
Source: "OpenSong License\gpl-sv.txt"; DestDir: "{app}\OpenSong License"; Components: Languages\swedish
Source: "OpenSong License\gpl-pt.txt"; DestDir: "{app}\OpenSong License"; Components: Languages\portugues
Source: "OpenSong License\gpl-pt_BR.txt"; DestDir: "{app}\OpenSong License"; Components: Languages\portuguesbrasil

; OpenSong 2 Icons
Source: "OpenSong2.ico"; DestDir: "{app}"
Source: "OpenSong2Uninstall.ico"; DestDir: "{app}"

; Portable Switch
Source: "OpenSong Portable\GlobalsInstall"; DestDir: "{app}\OpenSong Settings"; DestName: "Globals"; Check: not IsPortableInstall
Source: "OpenSong Portable\GlobalsPortable"; DestDir: "{app}\OpenSong Settings"; DestName: "Globals"; Check: IsPortableInstall

; Allow the user to reset the OpenSong preferences if desired.
Source: "{#OpenSongDir}\OpenSong Settings\preferences.plist"; DestDir: "{userappdata}\OpenSong"; Flags: uninsneveruninstall; Tasks: ResetPrefs; Permissions: users-modify; Check: not IsPortableInstall
Source: "{#OpenSongDir}\OpenSong Settings\preferences.plist"; DestDir: "{app}\OpenSong Settings"; Flags: uninsneveruninstall; Tasks: ResetPrefs; Permissions: users-modify; Check: IsPortableInstall

; Create the OpenSong Data files when Portable is selected, depending if they are selected in the first place.
Source: "{#OpenSongDir}\OpenSong Defaults\Backgrounds\*"; DestDir: "{app}\OpenSong Data\Backgrounds"; Components: Extras\Backgrounds; Check: IsPortableInstall
Source: "{#OpenSongDir}\OpenSong Defaults\Songs\*"; DestDir: "{app}\OpenSong Data\Songs"; Components: Extras\Songs; Check: IsPortableInstall
Source: "{#OpenSongDir}\OpenSong Defaults\Sets\*"; DestDir: "{app}\OpenSong Data\Sets"; Components: Extras\Example_Sets; Check: IsPortableInstall
Source: "{#OpenSongDir}\OpenSong Scripture\*"; DestDir: "{app}\OpenSong Data\Scripture"; Components: Bibles\KJV; Check: IsPortableInstall
Source: "{#OpenSongDir}\OpenSong Defaults\Settings\*"; DestDir: "{app}\OpenSong Data\Settings"; Check: IsPortableInstall

; VC++ 2015 Runtime for 32-bit. Extracted by the check routine, if needed
Source: "{#OpenSongDir}\Frameworks\windows\vc_redist.x86.exe"; DestDir: {tmp}; Flags: dontcopy nocompression solidbreak

[Types]
; Installation types
Name: Normal; Description: {cm:NormalInstallation}
Name: Full; Description: {code:GetMsgFullInstallation}
Name: Custom; Description: {code:GetMsgCustomInstallation}; Flags: iscustom

[Components]
; OpenSong itself, cannot be deselected
Name: {#MyAppName}; Description: {#MyAppVerName}; Types: Custom Normal Full; Flags: fixed

; OpenSong Extras
Name: Extras; Description: {cm:CompExtras}; Types: Full Normal
Name: Extras\Backgrounds; Description: {cm:CompBackgrounds}; Types: Full Normal
Name: Extras\Example_Sets; Description: {cm:CompSets}; Types: Full Normal
Name: Extras\Songs; Description: {cm:CompSongs}; Types: Full Normal
Name: Bibles; Description: {cm:CompBibles}; Types: Full Normal
Name: Bibles\KJV; Description: King James Version; Types: Full Normal

; OpenSong Languages
; Arranged in alphabetical order (according to native name),
; displayed when user is asked what components to install.
Name: Languages; Description: {cm:CompLanguages}; Types: Full; Flags: checkablealone
Name: Languages\english; Description: English; Types: Custom Normal Full; Flags: checkablealone fixed
Name: Languages\belarusian; Description: Беларуская; Types: Full; Flags: checkablealone
Name: Languages\chinese; Description: Chinese (Traditional); Types: Full; Flags: checkablealone
Name: Languages\czech; Description: Čeština; Types: Full; Flags: checkablealone
Name: Languages\german; Description: Deutsch; Types: Full; Flags: checkablealone
Name: Languages\spanish; Description: Español; Types: Full; Flags: checkablealone
Name: Languages\estonian; Description: Estonian; Types: Full; Flags: checkablealone
Name: Languages\french; Description: Français; Types: Full; Flags: checkablealone
Name: Languages\italian; Description: Italiano; Types: Full; Flags: checkablealone
Name: Languages\hungarian; Description: Magyar; Types: Full; Flags: checkablealone
Name: Languages\dutch; Description: Nederlands; Types: Full; Flags: checkablealone
Name: Languages\norwegian; Description: Norsk; Types: Full; Flags: checkablealone
Name: Languages\polish; Description: Polski; Types: Full; Flags: checkablealone
Name: Languages\portugues; Description: Português; Types: Full; Flags: checkablealone
Name: Languages\portuguesbrasil; Description: Português (Brasil); Types: Full; Flags: checkablealone
Name: Languages\russian; Description: русский; Types: Full; Flags: checkablealone
Name: Languages\slovak; Description: Slovenčina; Types: Full; Flags: checkablealone
Name: Languages\slovenian; Description: Slovenščina; Types: Full; Flags: checkablealone
Name: Languages\swedish; Description: Svenska; Types: Full; Flags: checkablealone
Name: Languages\turkish; Description: Türkçe; Types: Full; Flags: checkablealone

[InstallDelete]
; Delete the current OpenSong preferences if the task is selected.
; first line standard installation, second portable installation.
Type: files; Name: "{userappdata}\OpenSong\preferences.plist"; Tasks: ResetPrefs; Check: not IsPortableInstall
Type: files; Name: "{app}\preferences.plist"; Tasks: ResetPrefs; Check: IsPortableInstall
; Delete DLLs to avoid DLL hell from older Xojo versions used to compile previous versions of OpenSong
Type: filesandordirs; Name: "{app}\OpenSong Libs\*"

[Messages]
; Small line of text shown throughout the installer
; By not appending a specific language (english.BeveledLabel),
; it is used in all languages with no compile warnings.
BeveledLabel={#MyAppVerName}

; Keeping the the [CustomMessages] section in a separate script helps
; prevent character corruption when updating the main script.

#include "CustomMessages.iss"

[Tasks]
; From top to bottom: Reset Preferences switch, Portable switch, Desktop Icon.
; Will not be created if OpenSong was installed portable, else it will.
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:InstallOps}; Flags: unchecked; Check: not IsPortableInstall
Name: ResetPrefs; Description: {cm:ResetPrefs}; GroupDescription: {cm:InstallOps}; Flags: unchecked

[Icons]
; None of this will be created if the portable switch was selected.
Name: {autodesktop}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; Tasks: desktopicon; Check: not IsPortableInstall
Name: {autostartmenu}\Programs\{#MyAppName}\{#MyAppName}; Filename: {app}\{#MyAppName}; Check: not IsPortableInstall
Name: {autostartmenu}\Programs\{#MyAppName}\OpenSong.org; Filename: {#MyAppURL}; Check: not IsPortableInstall
Name: {autostartmenu}\Programs\{#MyAppName}\{cm:UninstallProgram,{#MyAppName}}; Filename: {uninstallexe}; IconFilename: {app}\OpenSong2Uninstall.ico; Check: not IsPortableInstall

[Run]
Filename: "{app}\changelog.txt"; Flags: shellexec skipifdoesntexist postinstall skipifsilent; Description: "{code:GetViewMessage|changelog}"
Filename: "{tmp}\vc_redist.x86.exe"; StatusMsg: "{cm:Redist}"; Parameters: "/quiet"; Check: IsAdminInstallMode and VC2015RedistNeedsInstall ; Flags: waituntilterminated
; Option to run OpenSong after installation is complete,
; valid for both installed and portable versions.
Filename: "{app}\{#MyAppExeName}"; Flags: nowait postinstall skipifsilent; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"

[Code]
var
  UsagePage: TInputOptionWizardPage;
  InstallType: String;
  UserAppDir: String;
  CommonAppDir: String;
  PortableAppDir: String;

function IsPortableInstall(): Boolean;
begin
  result := InstallType = 'portable';
end;

procedure AutoSelectLanguageComp(wp: TWizardForm);
  var
    TxLang: array[0..49] of String;
    numLang: Integer;
    LangDir: String;
    dbgStr: String;
    langID: Integer;
    Index: Integer;
    i: Integer;
    FindRec: TFindRec;
begin
  LangDir := ExpandConstant('{app}\OpenSong Languages');
  if DirExists(LangDir) then begin
    // select from what is already there
    numLang := 0;
    if FindFirst(AddBackslash(langDir) + '*.*', FindRec) then
      repeat
        if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0 then begin
          // translate filename to caption
          dbgStr := AnsiLowercase(FindRec.Name);
          case AnsiLowercase(FindRec.Name) of
            'english': TxLang[numLang] := 'English';
            'belarusian': TxLang[numLang] := 'Беларуская';
            'chinese_traditional': TxLang[numLang] := 'Chinese (Traditional)';
            'cestina': TxLang[numLang] := 'Čeština';
            'deutsch': TxLang[numLang] := 'Deutsch';
            'espanol': TxLang[numLang] := 'Español';
            'estonian': TxLang[numLang] := 'Estonian';
            'francais': TxLang[numLang] := 'Français';
            'italiano': TxLang[numLang] := 'Italiano';
            'magyar': TxLang[numLang] := 'Magyar';
            'nederlands': TxLang[numLang] := 'Nederlands';
            'norwegian': TxLang[numLang] := 'Norsk';
            'polski': TxLang[numLang] := 'Polski';
            'portugues': TxLang[numLang] := 'Português';
            'portugues(brasil)': TxLang[numLang] := 'Português (Brasil)';
            'russian': TxLang[numLang] := 'русский';
            'slovak': TxLang[numLang] := 'Slovenčina';
            'slovenian': TxLang[numLang] := 'Slovenščina';
            'svenska': TxLang[numLang] := 'Svenska';
            'turkish': TxLang[numLang] := 'Türkçe';
            // old names
            'čeština': TxLang[numLang] := 'Čeština'; // the AnsiLowercase function has issues with this non-ansi capital
            'Čeština': TxLang[numLang] := 'Čeština'; // ./.
            'ceština': TxLang[numLang] := 'Čeština'; // ./.
            'czech': TxLang[numLang] := 'Čeština';
            'español': TxLang[numLang] := 'Español';
            'türkçe': TxLang[numLang] := 'Türkçe';
          else
            TxLang[numLang] := '';
          end;
          if TxLang[numLang] <> '' then
            numLang := numLang + 1;
          if numLang = 30 then
            numLang := 29;  // prevent array overflow
        end;
      until not FindNext(FindRec);
    FindClose(FindRec);
  end else begin
    // select languages from installer language and Windows UI
    TxLang[0] := '';
    TxLang[1] := '';
    NumLang := 2;
    dbgStr := ActiveLanguage;
    case ActiveLanguage of
      // translate installer language name to ISO language id
      'english': TxLang[0] := 'en';
      'belarusian': TxLang[0] := 'be';
      'chinese': TxLang[0] := 'zh';
      'czech': TxLang[0] := 'cs';
      'deutsch': TxLang[0] := 'de';
      'espanol': TxLang[0] := 'es';
      'estonian': TxLang[0] := 'et';
      'francais': TxLang[0] := 'fr';
      'italiano': TxLang[0] := 'it';
      'magyar': TxLang[0] := 'hu';
      'nederlands': TxLang[0] := 'nl';
      'norwegian': TxLang[0] := 'no';
      'polski': TxLang[0] := 'pl';
      'portugues': TxLang[0] := 'pt';
      'portuguesbrazil': TxLang[0] := 'pt-BR';
      'russian': TxLang[0] := 'ru';
      'slovak': TxLang[0] := 'sk';
      'slovenian': TxLang[0] := 'sl';
      'svenska': TxLang[0] := 'sv';
      'turkish': TxLang[0] := 'tr';
    else
      TxLang[0] := '';
    end;
    
    langID := GetUILanguage;
    if langID <> $0416 then
      langID := langID and $3FF;
    // translate LANGID to ISO language id
    case langID of
      $009: TxLang[1] := 'en';
      $023: TxLang[1] := 'be';
      $004: TxLang[1] := 'zh';
      $005: TxLang[1] := 'cs';
      $007: TxLang[1] := 'de';
      $00A: TxLang[1] := 'es';
      $025: TxLang[1] := 'et';
      $00C: TxLang[1] := 'fr';
      $010: TxLang[1] := 'it';
      $00E: TxLang[1] := 'hu';
      $013: TxLang[1] := 'nl';
      $014: TxLang[1] := 'no';  // Nynorsk (nn) or Bokmål (nb)? I can't tell which our translation is
      $015: TxLang[1] := 'pl';
      $016: TxLang[1] := 'pt';
      $0416: TxLang[1] := 'pt-BR';
      $019: TxLang[1] := 'ru';
      $01B: TxLang[1] := 'sk';
      $024: TxLang[1] := 'sl';
      $01D: TxLang[1] := 'sv';
      $01F: TxLang[1] := 'tr';
    else
      TxLang[1] := '';
    end;
    
    if TxLang[0] = TxLang[1] then
      TxLang[1] := '';
      
    for i := 0 to 1 do begin
      // translate ISO language id to caption
      case TxLang[i] of
        'en': TxLang[i] := 'English';
        'be': TxLang[i] := 'Беларуская';
        'zh': TxLang[i] := 'Chinese (Traditional)';
        'cs': TxLang[i] := 'Čeština';
        'de': TxLang[i] := 'Deutsch';
        'es': TxLang[i] := 'Español';
        'et': TxLang[i] := 'Estonian';
        'fr': TxLang[i] := 'Français';
        'it': TxLang[i] := 'Italiano';
        'hu': TxLang[i] := 'Magyar';
        'nl': TxLang[i] := 'Nederlands';
        'no': TxLang[i] := 'Norsk';
        'pl': TxLang[i] := 'Polski';
        'pt': TxLang[i] := 'Português';
        'pt-BR': TxLang[i] := 'Português (Brasil)';
        'ru': TxLang[i] := 'русский';
        'sk': TxLang[i] := 'Slovenčina';
        'sl': TxLang[i] := 'Slovenščina';
        'sv': TxLang[i] := 'Svenska';
        'tr': TxLang[i] := 'Türkçe';
      else
        TxLang[i] := '';
      end;
    end;
  end;
  
  // this loop needs captions in order to identify the right component
  for i := 0 to NumLang - 1 do begin
    if TxLang[i] <> '' then begin
      Index := wp.ComponentsList.Items.IndexOf(TxLang[i]);
      if Index <> -1 then
        wp.ComponentsList.Checked[Index] := True;
    end;
  end;
end;

procedure SaveAppDir;
begin
  case InstallType of
    'regular':
      CommonAppDir := WizardForm.DirEdit.Text;
    'personal':
      UserAppDir := WizardForm.DirEdit.Text;
    'portable':
      PortableAppDir := WizardForm.DirEdit.Text;
  end;
end;

function GetViewMessage(what: String): String;
begin
  Result := FmtMessage(SetupMessage(msgRunEntryShellExec), [what]);
end;

function GetMsgFullInstallation(dummy: String): String;
begin
  Result := SetupMessage(msgFullInstallation);
end;

function GetMsgCustomInstallation(dummy: String): String;
begin
  Result := SetupMessage(msgCustomInstallation);
end;

function VC2015RedistNeedsInstall: Boolean;
var 
  Version: String;
begin
  if (RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\WOW6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\x64', 'Version', Version)) then
  begin
    // Is the installed version at least 14.0 ? 
    Log('VC Redist Version check : found ' + Version);
    Result := (CompareStr(Version, 'v14.0.24215')<0);
  end
  else 
  begin
    // Not even an old version installed (or on a 32-bit OS)
    Result := True;
  end;
  if (Result) then
  begin
    ExtractTemporaryFile('vc_redist.x86.exe');
  end;
end;

// <event('InitializeWizard')>
procedure InitializeWizard;
var
  PreviousInstallType: Integer;
begin
  { Create the pages }

  UsagePage := CreateInputOptionPage(wpUserInfo,
    CustomMessage('InstallTypeCaption'), CustomMessage('InstallTypeDescription'), CustomMessage('InstallTypeSubCaption'),
    True, False);
  UsagePage.Add(CustomMessage('InstallTypeRegular'));
  UsagePage.Add(CustomMessage('InstallTypePersonal'));
  UsagePage.Add(CustomMessage('InstallTypePortable'));
  if not IsAdminInstallMode then begin
    UsagePage.CheckListBox.ItemEnabled[0] := False;
    UsagePage.SelectedValueIndex := 1;
  end;

  case GetPreviousData('InstallType', '') of
    'regular': PreviousInstallType := 0;
    'personal': PreviousInstallType := 1;
    'portable': PreviousInstallType := 2;
  else
    PreviousInstallType := -1;
  end;
  if PreviousInstallType = -1 then
    if IsAdminInstallMode then
      UsagePage.SelectedValueIndex := 0
    else
      UsagePage.SelectedValueIndex := 1
  else
    if (PreviousInstallType = 0) and not IsAdminInstallMode then
      UsagePage.SelectedValueIndex := 2
    else
      UsagePage.SelectedValueIndex := PreviousInstallType;
end;

// <event('RegisterPreviousData')>
procedure RegisterPreviousData(PreviousDataKey: Integer);
var
  InstallType: String;
begin
  { Store the settings so we can restore them next time }
  // it is not defined when this gets called, so keep it independent on global InstallType set in CurPageChanged
  case UsagePage.SelectedValueIndex of
    0: InstallType := 'regular';
    1: InstallType := 'personal';
    2: InstallType := 'portable';
  end;
  SetPreviousData(PreviousDataKey, 'InstallType', InstallType);
end;

// <event('ShouldSkipPage')>
function ShouldSkipPage(PageID: Integer): Boolean;
begin
  if PageID = wpSelectProgramGroup then
    Result := IsPortableInstall
  else
    Result := False;
end;

// <event('CurPageChanged')>
procedure CurPageChanged(CurPageID: Integer);
begin
  { updates the install path depending on the install type or the entered suffix }
  if CurPageID = wpSelectDir then begin
    if IsAdminInstallMode then begin
      if CommonAppDir = '' then
          CommonAppDir := WizardForm.DirEdit.Text;
    end else begin
      if UserAppDir = '' then
        UserAppDir := WizardForm.DirEdit.Text;
    end;
    case InstallType of
      'regular':
        if CommonAppDir <> '' then
          WizardForm.DirEdit.Text := CommonAppDir
        else
          ; // the edit control is populated with a previous install dir or the default according to [Setup]
      'personal':
        if UserAppDir <> '' then
          WizardForm.DirEdit.Text := UserAppDir
        else
          if IsAdminInstallMode then
            WizardForm.DirEdit.Text := AddBackslash(ExpandConstant('{userpf}')) + '{#MyAppName}'
          else
            ; // the edit control is populated with a previous install dir or the default according to [Setup]
      'portable':
        if PortableAppDir <> '' then
          WizardForm.DirEdit.Text := PortableAppDir
        else
          WizardForm.DirEdit.Text := AddBackslash(ExpandConstant('{userdocs}')) + '{#MyAppName}';
    end;
  end;
  
  { auto-selects language files }
  if CurPageID = wpSelectComponents then begin
    AutoSelectLanguageComp(WizardForm);
  end;
end;

// <event('NextButtonClick')>
function NextButtonClick(CurPageID: Integer): Boolean;
begin
  { save choice for back and forth wizard navigation }
  if CurPageID = UsagePage.ID then
    case UsagePage.SelectedValueIndex of
      0: InstallType := 'regular';
      1: InstallType := 'personal';
      2: InstallType := 'portable';
    end;
    
  if CurPageID = wpSelectDir then
    SaveAppDir;

  Result := True;
end;

// <event('BackButtonClick')>
function BackButtonClick(CurPageID: Integer): Boolean;
begin
  { save choice for back and forth }
  if CurPageID = UsagePage.ID then
    case UsagePage.SelectedValueIndex of
      0: InstallType := 'regular';
      1: InstallType := 'personal';
      2: InstallType := 'portable';
    end;
    
  if CurPageID = wpSelectDir then
    SaveAppDir;
  Result := True;
end;

// <event('UpdateReadyMemo')>
function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  UsageMode: String;
begin
  case InstallType of
    'regular': UsageMode := CustomMessage('InstallTypeMemoRegular');
    'personal': UsageMode := CustomMessage('InstallTypeMemoPersonal');
    'portable': UsageMode := CustomMessage('InstallTypeMemoPortable');
  else
    UsageMode := CustomMessage('InstallTypeMemoRegular');
  end;
  Result := CustomMessage('InstallTypeMemo') + NewLine + Space + UsageMode;
  if MemoUserInfoInfo   <> '' then Result := Result + NewLine + NewLine + MemoUserInfoInfo;
  if MemoDirInfo        <> '' then Result := Result + NewLine + NewLine + MemoDirInfo;
  if MemoTypeInfo       <> '' then Result := Result + NewLine + NewLine + MemoTypeInfo;
  if MemoComponentsInfo <> '' then Result := Result + NewLine + NewLine + MemoComponentsInfo;
  if not IsPortableInstall then
    if MemoGroupInfo    <> '' then Result := Result + NewLine + NewLine + MemoGroupInfo;  // all icons are disabled - no folder is created
  if MemoTasksInfo      <> '' then Result := Result + NewLine + NewLine + MemoTasksInfo;
end;
