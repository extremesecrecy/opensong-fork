unit OSI_Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, ExtCtrls, Spin, Math, ValEdit, IniFiles, Registry,
  Menus;

type
  TForm1 = class(TForm)
    dlgOpen: TOpenDialog;
    grdSource: TStringGrid;
    Panel1: TPanel;
    grdDest: TStringGrid;
    edtLyrics: TMemo;
    Panel2: TPanel;
    lblSection: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    btnImport: TButton;
    edtFileFormat: TComboBox;
    edtSection: TComboBox;
    edtChords: TComboBox;
    pnlSection: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    edtSectionPrefix: TEdit;
    edtSectionSuffix: TEdit;
    chkSectionPrefix: TCheckBox;
    chkSectionSuffix: TCheckBox;
    edtSectionLine: TSpinEdit;
    edtVerse: TEdit;
    edtChorus: TEdit;
    edtPreChorus: TEdit;
    edtBridge: TEdit;
    edtTag: TEdit;
    edtSectionString: TEdit;
    btnPreviewOutput: TButton;
    btnExport: TButton;
    edtForceLine: TEdit;
    edtSectionNames: TComboBox;
    pnlChords: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edtChordsPrefix: TEdit;
    edtChordsSuffix: TEdit;
    chkChordsSuffix: TCheckBox;
    chkChordsPrefix: TCheckBox;
    btnSaveFormat: TButton;
    btnDelFormat: TButton;
    chkStripBlank: TCheckBox;
    grdReplace: TStringGrid;
    btnBatchImport: TButton;
    edtSongPath: TEdit;
    Label1: TLabel;
    btnSongPath: TButton;
    PopupMenu1: TPopupMenu;
    Delete1: TMenuItem;
    Insert1: TMenuItem;
    Append1: TMenuItem;
    procedure btnImportClick(Sender: TObject);
    procedure ImportFile(fileName: String);
    function Replace(S: String): String;
    procedure FormCreate(Sender: TObject);
    procedure edtChordsChange(Sender: TObject);
    procedure RecodeSection(Sender: TObject);
    procedure grdDestSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnPreviewSectionClick(Sender: TObject);
    function SourceToOpenSong(): TStrings;
    function EncodeSection(): String;
    function DecodeSection(S: String): String;
    function GetSection(Section: Integer): String;
    function SourceSearch(prefix: String; prefixInclude: Boolean; suffix: String; suffixInclude: Boolean): String;
    function GetSectionLine(Section: Integer): Integer;
    procedure btnPreviewOutputClick(Sender: TObject);
    function SourceSection(sectionIdentity: String; sectionCount: Integer): String;
    procedure ReadImportFormats();
    procedure btnSaveFormatClick(Sender: TObject);
    procedure btnDelFormatClick(Sender: TObject);
    procedure btnLoadFormatClick(Sender: TObject);
    procedure edtFileFormatChange(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure grdReplaceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBatchImportClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnSongPathClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Insert1Click(Sender: TObject);
    procedure Append1Click(Sender: TObject);
  private
    Selecting: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function  GetRegistryKeyValue(ARoot: HKEY; AKey,AName: string) : string;
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := ARoot;
    If Reg.OpenKey(AKey, FALSE) then
      Result := Reg.ReadString(AName);
  finally
    Reg.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  grdSource.RowCount := 1;
  grdSource.ColCount := 2;
  grdSource.ColWidths[0] := 55;
  grdSource.ColWidths[1] := 300;
  grdSource.Cells[0,0] := 'File Name';
  grdSource.Cells[1,0] := 'No file loaded';

  grdDest.RowCount := 17;
  grdDest.ColCount := 2;
  grdDest.ColWidths[0] := 75;
  grdDest.ColWidths[1] := 300;
  grdDest.Cols[0] := edtSectionNames.Items;

  grdReplace.Cells[0,0] := 'Prefix';
  grdReplace.Cells[1,0] := 'Suffix';
  grdReplace.Cells[2,0] := 'Replace';

  ReadImportFormats();
  edtFileFormat.ItemIndex := 0;
  edtFileFormatChange(Self);
  grdDest.Cells[1,0] := DecodeSection(grdDest.Cells[1,0]);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  grdSource.ColWidths[1] := grdSource.Width;
end;

// Import and Export multiple selected files
procedure TForm1.btnBatchImportClick(Sender: TObject);
var
  N: Integer;
begin
  dlgOpen.Options := [ofFileMustExist,ofHideReadOnly,ofEnableSizing,ofAllowMultiSelect];
  if dlgopen.Execute then
  begin
    with dlgopen.Files do
      for N := 0 to Count - 1 do
      begin
        ImportFile(Strings[N]);
        btnExportClick(Self);
      end;
  end;
end;

// Change the OpenSong songs path
procedure TForm1.btnSongPathClick(Sender: TObject);
begin
  dlgOpen.Options := [ofHideReadOnly,ofPathMustExist,ofEnableSizing];
  if dlgOpen.Execute then edtSongPath.Text := ExtractFilePath(dlgOpen.FileName);
end;

// Import file to source grid
procedure TForm1.btnImportClick(Sender: TObject);
begin
  dlgOpen.Options := [ofFileMustExist,ofHideReadOnly,ofEnableSizing];
  if dlgOpen.Execute then ImportFile(dlgOpen.FileName);
end;

// Import file to source grid
procedure TForm1.ImportFile(fileName: String);
var
  F1: TextFile;
  S: String;
  rowNumber, posLine: Integer;
begin
    AssignFile(F1, fileName);
    Reset(F1);
    grdSource.RowCount := 1;
    grdSource.Cells[0,0] := 'File Name';
    grdSource.Cells[1,0] := fileName;
    rowNumber := 1;
    while not Eof(F1) do
    begin
      Readln(F1, S);
      repeat
        grdSource.Cells[0,rowNumber] := IntToStr(rowNumber);
        posLine := Pos(edtForceLine.Text, S);
        if posLine > 0 then
        begin
          grdSource.Cells[1,rowNumber] := Replace(Copy(S, 1, posLine - 1));
          S := Copy(S, posLine + Length(edtForceLine.Text), Length(S));
        end
        else
        begin
          grdSource.Cells[1,rowNumber] := Replace(S);
          S := '';
        end;
        if (Length(grdSource.Cells[1,rowNumber]) > 0) or (not chkStripBlank.Checked) then rowNumber := rowNumber + 1;
        grdSource.RowCount := rowNumber;
      until S = '';
    end;
    CloseFile(F1);
end;

// Export source grid to OpenSong
procedure TForm1.btnExportClick(Sender: TObject);
var
  F1: TextFile;
  fileName: String;
  posLine: Integer;
  openSongStrings: TStrings;
begin
  fileName := edtSongPath.Text + GetSection(0);
  if FileExists(fileName) then
    ShowMessage('"' + filename + '" already exists')
  else
  begin
    AssignFile(F1, fileName);
    Rewrite(F1);
    openSongStrings := TStringList.Create;
    openSongStrings.Clear;
    openSongStrings := SourceToOpenSong();
//    btnPreviewOutputClick(Self);
    for posLine := 0 to openSongStrings.Count - 1 do
    begin
      Writeln(F1, openSongStrings[posLine]);
    end;
    CloseFile(F1);
    openSongStrings.Free;
  end;
end;

// Replace matching strings <prefix>*<suffix> with <replace> (for Import)
function TForm1.Replace(S: String): String;
var
  N, posPrefix, posSuffix: Integer;
  prefixString: String;
begin
  for N := 1 to grdReplace.RowCount - 1 do
  begin
    if (grdReplace.Cells[0, N] <> '') then
    repeat
     posPrefix := Pos(grdReplace.Cells[0, N], S);
     if (posPrefix > 0) then
      begin
        prefixString := Copy(S, 1, posPrefix - 1);
        S := Copy(S, posPrefix + Length(grdReplace.Cells[0, N]), Length(S));
        if (grdReplace.Cells[1, N] = '') then
          posSuffix := 1
        else
        begin
          posSuffix := Pos(grdReplace.Cells[1, N], S);
          if posSuffix > 0 then
            posSuffix := PosSuffix + Length(grdReplace.Cells[1, N]);
        end;
        if posSuffix > 0 then
          S := prefixString + grdReplace.Cells[2, N] + Copy(S, posSuffix, Length(S))
        else
          S := prefixString;
      end;
    until posPrefix <= 0;
  end;
  Replace := S;
end;

// Display relevant edit items for chords
procedure TForm1.edtChordsChange(Sender: TObject);
begin
{edtChords.Items
        No Chords
        Chord line before Lyric
        Lyric line before Chord
        Chord prefix/suffix
        Lyric prefix/suffix }
  pnlChords.Visible := (edtChords.ItemIndex = 3) or (edtChords.ItemIndex = 4);
end;

// Store section location edit items back to the string grid on change
procedure TForm1.RecodeSection(Sender: TObject);
begin
  if Sender.ClassNameIs('TComboBox') then // edtSection combo box changed, display relevant edit items
  begin
    edtSectionString.Visible := edtSection.ItemIndex = 1;
    edtSectionLine.Visible := (edtSection.ItemIndex = 2) or (edtSection.ItemIndex = 3);
    edtSectionLine.MaxValue := grdSource.RowCount;
    edtSectionNames.Visible := edtSection.ItemIndex = 3;
    pnlSection.Visible := edtSection.ItemIndex = 4;
  end;
  if not Selecting then
  begin
    grdDest.Cells[1,grdDest.Row] := EncodeSection();
    btnPreviewSectionClick(Self);
  end;
end;

// Encode section location edit items to current row, decode new row to edit items
procedure TForm1.grdDestSelectCell(Sender: TObject; ACol, ARow: Integer;
var
  CanSelect: Boolean);
begin
  grdDest.Cells[1,grdDest.Row] := EncodeSection();
  CanSelect := True;
  grdDest.Cells[1,ARow] := DecodeSection(grdDest.Cells[1,ARow]);
  lblSection.Caption := grdDest.Cells[0,ARow] + ' Section';
  if (grdDest.Row <> ARow) then edtLyrics.Clear;
end;

// Generate preview of selected section location
procedure TForm1.btnPreviewSectionClick(Sender: TObject);
var
  openSongStrings: TStrings;
  posLine, startPos: Integer;
  lyricLine, sectionType: String;
begin
  edtLyrics.Clear;
  sectionType := grdDest.Cells[0, grdDest.Row];
  openSongStrings := TStringList.Create;
  openSongStrings.Clear;
  openSongStrings := SourceToOpenSong();
  for posLine := 0 to openSongStrings.Count - 1 do
  begin
    lyricLine := openSongStrings[posLine];
    if Pos('<' + sectionType + '>', lyricLine) > 0 then
    begin
      startPos := Pos('<' + sectionType + '>', lyricLine) + length(sectionType) + 2;
      lyricLine := Copy(lyricLine, startPos, Pos('</' + sectionType + '>', lyricLine) - startPos);
      edtLyrics.Lines.Add(lyricLine);
      edtlyrics.SelStart := 0;
      edtLyrics.SelLength := 1;
    end;
  end;
  openSongStrings.Free;
end;

// Convert the section location edit items to a csv string
function TForm1.EncodeSection(): String;
var
  S: String;
begin
  try
  S := IntToStr(edtSection.ItemIndex);
  case edtSection.ItemIndex of
    0: ; // Not Used
    1: S := S + ',"' + edtSectionString.Text + '"'; // Fixed string
    2: S := S + ',' + IntToStr(edtSectionLine.Value); // Line number
    3: begin // Lines after Item
         S := S + ',' + IntToStr(edtSectionLine.Value);
         S := S + ',' + IntToStr(edtSectionNames.ItemIndex);
       end;
    4: begin // Prefix / Suffix
         S := S + ',"' + edtSectionPrefix.Text + '",' + BoolToStr(chkSectionPrefix.Checked);
         S := S + ',"' + edtSectionSuffix.Text + '",' + BoolToStr(chkSectionSuffix.Checked);
       end;
  end;
  except
    S := '0';
  end;
  EncodeSection := S;
end;

// Convert a csv string to section location edit items
function TForm1.DecodeSection(S: String): String;
var
  sectionIndex: Integer;
  sectionList: TStrings;
begin
  Selecting := True; // Used to prevent section location edit items RecodeSection
  sectionList := TStringList.Create;
  sectionList.Clear;
  if S = '' then S := '0';
  sectionList.CommaText := S;
  sectionIndex := StrToInt(sectionList[0]);

  edtSection.ItemIndex := sectionIndex;
  edtSection.OnChange(edtSection);

  case sectionIndex of
    0: ;// Not Used
    1: edtSectionString.Text := sectionList[1]; // Fixed string
    2: edtSectionLine.Value := StrToInt(sectionList[1]); // Line number
    3: begin // Lines after Item
         edtSectionLine.Value := StrToInt(sectionList[1]);
         edtSectionNames.ItemIndex := StrToInt(sectionList[2]);
       end;
    4: begin // Prefix / Suffix
         edtSectionPrefix.Text := sectionList[1];
         chkSectionPrefix.Checked := StrToBool(sectionList[2]);
         edtSectionSuffix.Text := sectionList[3];
         chkSectionSuffix.Checked := StrToBool(sectionList[4]);
       end;
  end;
  Selecting := False;
  SectionList.Free;
  DecodeSection := EncodeSection;
end;

// Returns a string containing the requested section location
function TForm1.GetSection(Section: Integer): String;
var
  sectionIndex: Integer;
  sectionList: TStrings;
begin
  GetSection := '';
  sectionList := TStringList.Create;
  sectionList.Clear;
  sectionList.CommaText := grdDest.Cells[1,Section];
  sectionIndex := StrToInt(sectionList[0]);
  case sectionIndex of
    0: GetSection := ''; // Not Used
    1: GetSection := sectionList[1]; // Fixed string
    2: GetSection := grdSource.Cells[1, StrToInt(sectionList[1])]; // Line number
    3: GetSection := grdSource.Cells[1, GetSectionLine(StrToInt(sectionList[2])) + StrToInt(sectionList[1])]; // Lines after Item
    4: GetSection := SourceSearch(sectionList[1], StrToBool(sectionList[2]), sectionList[3], StrToBool(sectionList[4]));
  end;
  sectionList.Free;
end;

// Return the line number for a requested section type (used for a "Lines after item" section)
function TForm1.GetSectionLine(Section: Integer): Integer;
var
  N, sectionIndex: Integer;
  sectionList: TStrings;
begin
  GetSectionLine := 0;
  sectionList := TStringList.Create;
  sectionList.Clear;
  sectionList.CommaText := grdDest.Cells[1,Section];
  sectionIndex := StrToInt(sectionList[0]);

  case sectionIndex of
    0: GetSectionLine := 0; // Not Used
    1: GetSectionLine := 0; // Fixed string
    2: GetSectionLine := StrToInt(sectionList[1]); // Line number
    3: GetSectionLine := 0; //-1000 * StrToInt(sectionList[1]) - 1000 - StrToInt(sectionList[2]); // Lines after Item
    4: begin // Prefix / Suffix
         for N := 0 to grdSource.RowCount do
         begin
           if ((Pos(sectionList[1], grdSource.Cells[1,N]) > 0) or (sectionList[1] = '')) and ((Pos(sectionList[3], grdSource.Cells[1,N]) > 0)  or (sectionList[3] = '')) then
           begin
             GetSectionLine := N;
             break;
           end;
         end;
       end;
  end;
  sectionList.Free;
end;

// Search Source for matching string
function TForm1.SourceSearch(prefix: String; prefixInclude: Boolean; suffix: String; suffixInclude: Boolean): String;
var
  sourceIndex, posPrefix, posSuffix: Integer;
  sectionString: String;
begin
  SourceSearch := '';
  for sourceIndex := 0 to grdSource.RowCount do
  begin
    sectionString := grdSource.Cells[1, sourceIndex];
    // Check for / strip Prefix
    if prefix = '' then posPrefix := -1
    else posPrefix := Pos(prefix, sectionString);
    if (posPrefix > 0) and (not prefixInclude) then
      sectionString := copy(sectionString, posPrefix + Length(prefix), posPrefix + Length(sectionString) - 1);
    // Check for / strip Suffix
    if suffix = '' then posSuffix := -1
    else posSuffix := Pos(suffix, sectionString);
    if (posSuffix > 0) and (not suffixInclude) then
      sectionString := copy(sectionString, 1, posSuffix - 1);
    // Check for match
    if (posPrefix <> 0) and (posSuffix <> 0) then
    begin
      SourceSearch := sectionString;
      break;
    end;
  end;
end;

// Preview the entire OpenSong file
procedure TForm1.btnPreviewOutputClick(Sender: TObject);
begin
  edtLyrics.Lines := SourceToOpenSong();
end;

// Generate the OpenSong file
function TForm1.SourceToOpenSong(): TStrings;
var
  sectionIndex, sectionLine: Integer;
  sectionTitle, sectionString: String;
  verseNo, chorusNo, preChorusNo, bridgeNo, tagNo: Integer;
  lyricTitle, lyricIn, lyricOut, chordString: String;
  lyricStart, lyricEnd, lyricLine, posPrefix, posSuffix: Integer;
  chordFound, newSection: Boolean;
begin
  SourceToOpenSong := TStringList.Create;
  SourceToOpenSong.Clear;
  lyricStart := GetSectionLine(15);
  lyricEnd := grdSource.RowCount + 1;
  verseNo := 1;
  chorusNo := 1;
  preChorusNo := 1;
  bridgeNo := 1;
  tagNo := 1;

  // Add the song start to the output
  SourceToOpenSong.Add('<?xml version="1.0" encoding="UTF-8"?>');
  SourceToOpenSong.Add('<song>');

  // Generate each section in order
  for sectionIndex := 0 to grdDest.RowCount - 1 do
  begin
    sectionTitle := grdDest.Cells[0, sectionIndex];

    // Lyrics section has multiple lines
    if sectionTitle = 'Lyrics' then
    begin
      // Inititialise lyrics section
      lyricTitle := '';
      lyricOut := '';
      newSection := True;
      case edtChords.ItemIndex of
        0: chordFound := False;  // No Chords
        1: chordFound := True;   // Chord line before lyric
        2: chordFound := False;  // Lyric line before chord
      else
        chordFound := True;  // Chord or Lyric Preffix/Suffix
      end;
      sectionString := '';

      // Process all lyric lines
      for lyricLine := lyricStart to lyricEnd - 1 do
      begin
        lyricIn := grdSource.Cells[1, lyricLine];
        if (lyricTitle <> '') and (Trim(lyricOut) <> '') then  // Section has been found and the first lyric line
        begin
          if Length(lyricTitle) > 2 then
          begin
            case lyricTitle[2] of
              'V': verseNo := verseNo + 1;
              'C': chorusNo := chorusNo + 1;
              'P': preChorusNo := preChorusNo + 1;
              'B': bridgeNo := bridgeNo + 1;
              'T': tagNo := tagNo + 1;
            end;
            sectionString := sectionString + lyricTitle + Chr(13) + Chr(10);
            lyricTitle := '..';
          end;
          if chordFound then lyricOut := '.' + lyricOut
          else lyricOut := ' ' + Trim(lyricOut);
          sectionString := sectionString + lyricOut + Chr(13) + Chr(10);
          lyricOut := '';
          newSection := False;
          if (edtChords.ItemIndex = 1) or (edtChords.ItemIndex = 2) then chordFound := not chordFound;
        end
        else if (lyricTitle = '..') and (Trim(lyricOut) = '') then  // Blank line has been found, look for a new Section
        begin
          if not newSection then sectionString := sectionString + Chr(13) + Chr(10);
          lyricTitle := '';
          newSection := True;
          case edtChords.ItemIndex of
            1: chordFound := True;   // Chord line before lyric
            2: chordFound := False;  // Lyric line before chord
          end;
        end
        else if (lyricTitle <> '') then  // Section has been is found, look for lyrics before adding the header
        begin
          if not newSection then sectionString := sectionString + Chr(13) + Chr(10);
          newSection := False;
        end;

        // Check for new lyric section header or lyric line
        if Pos(edtChorus.Text, Trim(lyricIn)) = 1 then
          lyricTitle := SourceSection('C', chorusNo)
        else if Pos(edtPreChorus.Text, Trim(lyricIn)) = 1 then
          lyricTitle := SourceSection('P', preChorusNo)
        else if Pos(edtBridge.Text, Trim(lyricIn)) = 1 then
          lyricTitle := SourceSection('B', bridgeNo)
        else if Pos(edtTag.Text, Trim(lyricIn)) = 1 then
          lyricTitle := SourceSection('T', tagNo)
        else if Pos(edtVerse.Text, Trim(lyricIn)) = 1 then
          lyricTitle := '[V' + IntToStr(verseNo) + ']'
        else if newSection then  // Looking for a new section header
        begin
          if (edtVerse.Text = '') then  // No identifier for a verse
            lyricTitle := '[V' + IntToStr(verseNo) + ']'
          else if (edtChorus.Text = '') then  // No identifier for a chorus
            lyricTitle := lyricTitle + SourceSection('C', chorusNo);
          // else Section headers not blank, this cannot be a new section
          lyricOut := lyricIn;
        end
        else  // If line is not a section header, it must be a lyric line
        begin
          lyricOut := lyricIn;
        end;

        // Check if line has Chords or Lyrics Prefix/Suffix
        if (lyricOut <> '') and ((edtChords.ItemIndex = 3) or (edtChords.ItemIndex = 4)) then
        begin
           chordString := LyricOut;
           // Check for / strip Prefix
           if edtChordsPrefix.Text = '' then posPrefix := -1
           else posPrefix := Pos(edtChordsPrefix.Text, chordString);
           if (posPrefix > 0) and (not chkChordsPrefix.Checked) then
             chordString := copy(chordString, posPrefix + Length(edtChordsPrefix.Text), Length(chordString));
           // Check for / strip Suffix
           if edtChordsSuffix.Text = '' then posSuffix := -1
           else posSuffix := Pos(edtChordsSuffix.Text, chordString);
           if (posSuffix > 0) and (not chkChordsSuffix.Checked) then
             chordString := copy(chordString, 1, posSuffix - 1);
           // Check for matchinf Prefix/Suffix
           if (posPrefix <> 0) and (posSuffix <> 0) then
           begin
             lyricOut := chordString;
             chordFound := (edtChords.ItemIndex = 3);  // 3 = Chord prefix/suffix
           end
           else
           begin
             chordFound := (edtChords.ItemIndex = 4);  // 3 = Lyric prefix/suffix
           end;
        end;  // End of check for Chords or Lyrics Prefix/Suffix
      end;
    end // End of 'Lyrics' section

    // Create an automatic presentation order if there is no presentation string already defined
    else if sectionTitle = 'Presentation' then
    begin
      sectionString := GetSection(sectionIndex);
      if (sectionString = '') and (verseNo > 2) and (chorusNo <= 2) and (preChorusNo <= 2) and (bridgeNo <= 2) and (tagNo <= 2) then
      begin // Change the presentation
        for lyricLine := 1 to verseNo - 1 do
        begin
          if lyricLine >= 2 then sectionString := sectionString + ' ';
          sectionstring := sectionString + 'V' + IntToStr(lyricLine);
          if (lyricLine = 2) and (bridgeNo = 2) then sectionString := sectionString + ' B';
          if preChorusNo = 2 then sectionString := sectionString + ' P';
          if chorusNo = 2 then sectionString := sectionString + ' C';
        end;
        if tagNo = 2 then sectionString := sectionString + ' T';
      end;
    end // End of 'Presentation' section

    // All other sections apart from lyrics and presentation are a single line returned by GetSection()
    else
    begin
      sectionString := GetSection(sectionIndex);
      sectionLine := GetSectionLine(sectionIndex);
      if (sectionLine > lyricStart) and (sectionLine < lyricEnd) then
        lyricEnd := sectionLine;
    end;

    // Add the section to the output
    if SectionString <> '' then
    begin
      SourceToOpenSong.Add('  <' + sectionTitle + '>' + sectionString + '</' + sectionTitle + '>');
    end;
  end;

  // Add the song end to the output
  SourceToOpenSong.Add('</song>');
end;

// Return the OpenSong section string, e.g. [V2]
function TForm1.SourceSection(sectionIdentity: string; sectionCount: Integer): String;
var
  S: String;
begin
  S := '[' + sectionIdentity;
  if sectionCount > 1 then S := S + IntToStr(sectionCount);
  SourceSection := S + ']';
end;

// Load ComboBox with available formats from ini file
procedure TForm1.ReadImportFormats();
var
  settingsFile: TIniFile;
begin
  edtFileFormat.Items.Clear;
  settingsFile := TIniFile.Create(GetEnvironmentVariable('AppData') + '\OpenSong Import\OSI.ini');
  settingsFile.ReadSections(edtFileFormat.Items);
  edtSongPath.Text := settingsFile.ReadString('Settings', 'Path', GetRegistryKeyValue(HKEY_CURRENT_USER, 'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', 'Personal') + '\OpenSong\Songs\');
  edtFileFormat.Items.Delete(edtFileFormat.Items.IndexOf('Settings'));
  settingsFile.Free;
end;

// Load import file if match found
procedure TForm1.edtFileFormatChange(Sender: TObject);
begin
  if edtFileFormat.ItemIndex >= 0 then btnLoadFormatClick(Self);
end;

// Load selected import file format from ini file
procedure TForm1.btnLoadFormatClick(Sender: TObject);
var
  settingsFile: TIniFile;
  sectionIndex: Integer;
  sectionList: TStrings;
begin
  if edtFileFormat.ItemIndex < 0 then exit;
  settingsFile := TIniFile.Create(GetEnvironmentVariable('AppData') + '\OpenSong Import\OSI.ini');
  if settingsFile.SectionExists(edtFileFormat.Text) then
  begin
    for sectionIndex := 0 to grdDest.RowCount - 1 do
    begin
      grdDest.Cells[1, sectionIndex] := settingsFile.ReadString(edtFileFormat.Text, grdDest.Cells[0, sectionIndex], '0');
    end;

    sectionList := TStringList.Create;

    sectionList.CommaText := settingsFile.ReadString(edtFileFormat.Text, 'Import Parsing', ',0,2');
    edtForceLine.Text := sectionList[0];
    chkStripBlank.Checked := StrToBool(sectionlist[1]);
    grdReplace.RowCount := MaxIntValue([StrToInt(sectionList[2]), 2]);
    for sectionIndex := 1 to grdReplace.RowCount - 1 do
    begin
      sectionList.CommaText := settingsFile.ReadString(edtFileFormat.Text, 'Import Parsing' + IntToStr(sectionIndex), ',,');
      grdReplace.Cells[0, sectionIndex] := sectionList[0];
      grdReplace.Cells[1, sectionIndex] := sectionList[1];
      grdReplace.Cells[2, sectionIndex] := sectionList[2];
    end;

    sectionList.CommaText := settingsFile.ReadString(edtFileFormat.Text, 'Lyric Sections', '[V,[C,[P,[B,[T');
    edtVerse.Text := sectionList[0];
    edtChorus.Text := sectionList[1];
    edtPreChorus.Text := sectionList[2];
    edtBridge.Text := sectionList[3];
    edtTag.Text := sectionList[4];

    sectionList.CommaText := settingsFile.ReadString(edtFileFormat.Text, 'Chords', '0,,0,,0');
    edtChords.ItemIndex := StrToInt(sectionList[0]);
    edtChordsPrefix.Text := sectionList[1];
    chkChordsPrefix.Checked := StrToBool(sectionList[2]);
    edtChordsSuffix.Text := sectionList[3];
    chkChordsSuffix.Checked := StrToBool(sectionList[4]);

    sectionList.Free;
  end;
  settingsFile.Free;
end;

// Save current import format to ini file
procedure TForm1.btnSaveFormatClick(Sender: TObject);
var
  settingsFile: TIniFile;
  sectionIndex: Integer;
  sectionList: TStrings;
begin
  if not FileExists(GetEnvironmentVariable('AppData') + '\OpenSong Import\OSI.ini') then
    CreateDir(GetEnvironmentVariable('AppData') + '\OpenSong Import');
  settingsFile := TIniFile.Create(GetEnvironmentVariable('AppData') + '\OpenSong Import\OSI.ini');
  if edtFileFormat.ItemIndex < 0 then
    edtFileFormat.ItemIndex := edtFileFormat.Items.Add(edtFileFormat.Text);

  sectionList := TStringList.Create;
  for sectionIndex := 0 to grdDest.RowCount - 1 do
  begin
    settingsFile.WriteString(edtFileFormat.Text, grdDest.Cells[0, sectionIndex], grdDest.Cells[1, sectionIndex]);
  end;

  sectionList.Clear;
  sectionList.Add(edtForceLine.Text);
  sectionList.Add(BoolToStr(chkStripBlank.Checked));
  sectionList.Add(IntToStr(grdReplace.RowCount));
  settingsFile.WriteString(edtFileFormat.Text, 'Import Parsing', sectionList.CommaText);

  for sectionIndex := 1 to grdReplace.RowCount - 1 do
  begin
    settingsFile.WriteString(edtFileFormat.Text, 'Import Parsing' + IntToStr(sectionIndex), grdReplace.Rows[sectionIndex].CommaText);
  end;

  sectionList.Clear;
  sectionList.Add(edtVerse.Text);
  sectionList.Add(edtChorus.Text);
  sectionList.Add(edtPreChorus.Text);
  sectionList.Add(edtBridge.Text);
  sectionList.Add(edtTag.Text);
  settingsFile.WriteString(edtFileFormat.Text, 'Lyric Sections', sectionList.CommaText);

  sectionList.Clear;
  sectionList.Add(IntToStr(edtChords.ItemIndex));
  sectionList.Add(edtChordsPrefix.Text);
  sectionList.Add(BoolToStr(chkChordsPrefix.Checked));
  sectionList.Add(edtChordsSuffix.Text);
  sectionList.Add(BoolToStr(chkChordsSuffix.Checked));
  settingsFile.WriteString(edtFileFormat.Text, 'Chords', sectionList.CommaText);

  sectionList.Free;
  settingsFile.Free;
end;

// Delete current import format from ComboBox and ini file
procedure TForm1.btnDelFormatClick(Sender: TObject);
var
  settingsFile: TIniFile;
begin
  settingsFile := TIniFile.Create(GetEnvironmentVariable('AppData') + '\OpenSong Import\OSI.ini');
  if settingsFile.SectionExists(edtFileFormat.Text) then
    settingsFile.EraseSection(edtFileFormat.Text);
  if edtFileFormat.ItemIndex >= 0 then
    edtFileFormat.Items.Delete(edtFileFormat.ItemIndex);
  edtFileFormat.ItemIndex := 0;
  settingsFile.Free;
end;

// Insert or Delete rows in import replace grid
procedure TForm1.grdReplaceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  N:Integer;
begin
  if (Key = VK_DELETE) and (not grdReplace.EditorMode) and (grdReplace.RowCount > 2) then
    if MessageDlg('Delete current row?', mtConfirmation, mbOKCancel, 0) = mrOK then
    begin
      if grdReplace.Row < grdReplace.RowCount + 1 then
      for N := grdReplace.Row to grdReplace.RowCount- 1 do
        grdReplace.Rows[N] := grdReplace.Rows[N+1];
      grdReplace.RowCount := grdReplace.RowCount - 1;
    end;

  if (Key = VK_INSERT) and (not grdReplace.EditorMode) then
    if MessageDlg('Insert row?', mtConfirmation, mbOKCancel, 0) = mrOK then
    begin
      grdReplace.RowCount := grdReplace.RowCount + 1;
      if grdReplace.Row < grdReplace.RowCount + 1 then
      for N := grdReplace.RowCount - 1 downto grdReplace.Row do
        grdReplace.Rows[N] := grdReplace.Rows[N-1];
      grdReplace.Rows[grdReplace.Row].Clear;
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  settingsFile: TIniFile;
begin
  settingsFile := TIniFile.Create(GetEnvironmentVariable('AppData') + '\OpenSong Import\OSI.ini');
  settingsFile.WriteString('Settings', 'Path', edtSongPath.Text);
  settingsFile.Free;
end;

procedure TForm1.Delete1Click(Sender: TObject);
var
  N:Integer;
begin
  if Self.ActiveControl.ClassNameIs('TStringGrid') then
  with Self.ActiveControl as TStringGrid do
  begin
    if (RowCount > 2) then
    begin
      if Row < RowCount + 1 then
      for N := Row to RowCount- 1 do
        Rows[N] := Rows[N+1];
      RowCount := RowCount - 1;
    end
    else Rows[Row].Clear;
  end;
end;

procedure TForm1.Insert1Click(Sender: TObject);
var
  N:Integer;
begin
  if Self.ActiveControl.ClassNameIs('TStringGrid') then
  with Self.ActiveControl as TStringGrid do
  begin
    RowCount := RowCount + 1;
    if Row < RowCount + 1 then
    for N := RowCount - 1 downto Row do
      Rows[N] := Rows[N-1];
    Rows[Row].Clear;
  end;
end;

procedure TForm1.Append1Click(Sender: TObject);
begin
  if Self.ActiveControl.ClassNameIs('TStringGrid') then
  with Self.ActiveControl as TStringGrid do
    RowCount := RowCount + 1;
end;

end.
