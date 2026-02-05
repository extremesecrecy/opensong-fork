object Form1: TForm1
  Left = 257
  Top = 226
  Width = 1000
  Height = 586
  Caption = 'OpenSong Import'
  Color = clBtnFace
  Constraints.MinHeight = 580
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object grdSource: TStringGrid
    Left = 0
    Top = 0
    Width = 366
    Height = 552
    Align = alClient
    ColCount = 2
    DefaultRowHeight = 16
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goThumbTracking]
    PopupMenu = PopupMenu1
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 631
    Top = 0
    Width = 361
    Height = 552
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object grdDest: TStringGrid
      Left = 0
      Top = 0
      Width = 361
      Height = 313
      Align = alTop
      ColCount = 2
      DefaultRowHeight = 16
      RowCount = 17
      FixedRows = 0
      TabOrder = 0
      OnDblClick = btnPreviewSectionClick
      OnSelectCell = grdDestSelectCell
    end
    object edtLyrics: TMemo
      Left = 0
      Top = 313
      Width = 361
      Height = 239
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
      WordWrap = False
    end
  end
  object Panel2: TPanel
    Left = 366
    Top = 0
    Width = 265
    Height = 552
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    object lblSection: TLabel
      Left = 16
      Top = 256
      Width = 44
      Height = 13
      Caption = 'Section'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 464
      Width = 40
      Height = 13
      Caption = 'Chords'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 0
      Top = 360
      Width = 57
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Verse'
    end
    object Label8: TLabel
      Left = 0
      Top = 380
      Width = 57
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Chorus'
    end
    object Label9: TLabel
      Left = 0
      Top = 400
      Width = 57
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Pre-Chorus'
    end
    object Label10: TLabel
      Left = 0
      Top = 420
      Width = 57
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Bridge'
    end
    object Label11: TLabel
      Left = 0
      Top = 440
      Width = 57
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Tag'
    end
    object Label12: TLabel
      Left = 16
      Top = 92
      Width = 51
      Height = 13
      Caption = 'File Format'
    end
    object Label16: TLabel
      Left = 8
      Top = 140
      Width = 57
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Force Line'
    end
    object Label19: TLabel
      Left = 16
      Top = 120
      Width = 82
      Height = 13
      Caption = 'Import Parsing'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 16
      Top = 340
      Width = 81
      Height = 13
      Caption = 'Lyric Sections'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 4
      Top = 64
      Width = 50
      Height = 13
      Caption = 'Song Path'
    end
    object btnImport: TButton
      Left = 16
      Top = 4
      Width = 97
      Height = 25
      Hint = 'Open a file you wish to convert to OpenSong format'
      Caption = 'Import File'
      TabOrder = 0
      OnClick = btnImportClick
    end
    object edtFileFormat: TComboBox
      Left = 73
      Top = 88
      Width = 111
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '?'
      OnChange = edtFileFormatChange
      Items.Strings = (
        '?')
    end
    object edtSection: TComboBox
      Left = 16
      Top = 272
      Width = 145
      Height = 21
      Hint = 'How to find the selected section'
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'Not Used'
      OnChange = RecodeSection
      Items.Strings = (
        'Not Used'
        'Fixed string'
        'Line number'
        'Lines after Item'
        'Prefix / Suffix')
    end
    object edtChords: TComboBox
      Left = 16
      Top = 480
      Width = 145
      Height = 21
      Hint = 'Does the import file contain chords'
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = 'No Chords'
      OnChange = edtChordsChange
      Items.Strings = (
        'No Chords'
        'Chord line before Lyric'
        'Lyric line before Chord'
        'Chord prefix/suffix'
        'Lyric prefix/suffix')
    end
    object pnlSection: TPanel
      Left = 32
      Top = 294
      Width = 201
      Height = 44
      BevelOuter = bvNone
      TabOrder = 4
      object Label5: TLabel
        Left = -1
        Top = 4
        Width = 26
        Height = 13
        Caption = 'Prefix'
      end
      object Label6: TLabel
        Left = -1
        Top = 24
        Width = 26
        Height = 13
        Caption = 'Suffix'
      end
      object edtSectionPrefix: TEdit
        Left = 32
        Top = 0
        Width = 97
        Height = 21
        TabOrder = 0
        OnChange = RecodeSection
      end
      object edtSectionSuffix: TEdit
        Left = 32
        Top = 20
        Width = 97
        Height = 21
        TabOrder = 1
        OnChange = RecodeSection
      end
      object chkSectionPrefix: TCheckBox
        Left = 136
        Top = 2
        Width = 57
        Height = 21
        Hint = 'Include the prefix in the export file'
        Caption = 'Include'
        TabOrder = 2
        OnClick = RecodeSection
      end
      object chkSectionSuffix: TCheckBox
        Left = 136
        Top = 22
        Width = 57
        Height = 21
        Hint = 'Include the suffix in the export file'
        Caption = 'Include'
        TabOrder = 3
        OnClick = RecodeSection
      end
    end
    object edtSectionLine: TSpinEdit
      Left = 168
      Top = 272
      Width = 49
      Height = 22
      MaxValue = 99
      MinValue = 0
      TabOrder = 5
      Value = 0
      OnChange = RecodeSection
    end
    object edtVerse: TEdit
      Left = 64
      Top = 356
      Width = 97
      Height = 21
      Hint = 'Prefix to indicate a verse section'
      TabOrder = 6
    end
    object edtChorus: TEdit
      Left = 64
      Top = 376
      Width = 97
      Height = 21
      Hint = 'Prefix to indicate a chorus section'
      TabOrder = 7
    end
    object edtPreChorus: TEdit
      Left = 64
      Top = 396
      Width = 97
      Height = 21
      Hint = 'Prefix to indicate a pre-chorus section'
      TabOrder = 8
    end
    object edtBridge: TEdit
      Left = 64
      Top = 416
      Width = 97
      Height = 21
      Hint = 'Prefix to indicate a bridge section'
      TabOrder = 9
    end
    object edtTag: TEdit
      Left = 64
      Top = 436
      Width = 97
      Height = 21
      Hint = 'Prefix to indicate a tag section'
      TabOrder = 10
    end
    object edtSectionString: TEdit
      Left = 80
      Top = 294
      Width = 137
      Height = 21
      TabOrder = 11
      OnChange = RecodeSection
    end
    object btnPreviewOutput: TButton
      Left = 128
      Top = 32
      Width = 97
      Height = 25
      Hint = 'Preview OpenSong output'
      Caption = 'Preview Output'
      TabOrder = 12
      OnClick = btnPreviewOutputClick
    end
    object btnExport: TButton
      Left = 128
      Top = 4
      Width = 97
      Height = 25
      Hint = 'Export file to OpenSong'
      Caption = 'Export OpenSong'
      TabOrder = 13
      OnClick = btnExportClick
    end
    object edtForceLine: TEdit
      Left = 72
      Top = 136
      Width = 65
      Height = 21
      Hint = 'String to replace with a new line'
      TabOrder = 14
    end
    object edtSectionNames: TComboBox
      Left = 80
      Top = 294
      Width = 105
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 15
      Text = 'Title'
      OnChange = RecodeSection
      Items.Strings = (
        'Title'
        'Author'
        'Copyright'
        'CCLI'
        'Theme'
        'Hymn Number'
        'Capo'
        'Tempo'
        'Time Sig'
        'Key'
        'AKA'
        'Key Line'
        'User1'
        'User2'
        'User3'
        'Lyrics'
        'Presentation')
    end
    object pnlChords: TPanel
      Left = 32
      Top = 503
      Width = 201
      Height = 44
      BevelOuter = bvNone
      TabOrder = 16
      object Label3: TLabel
        Left = -1
        Top = 4
        Width = 26
        Height = 13
        Caption = 'Prefix'
      end
      object Label4: TLabel
        Left = -1
        Top = 24
        Width = 26
        Height = 13
        Caption = 'Suffix'
      end
      object edtChordsPrefix: TEdit
        Left = 32
        Top = 0
        Width = 97
        Height = 21
        TabOrder = 0
      end
      object edtChordsSuffix: TEdit
        Left = 32
        Top = 20
        Width = 97
        Height = 21
        TabOrder = 1
      end
      object chkChordsSuffix: TCheckBox
        Left = 136
        Top = 22
        Width = 57
        Height = 17
        Hint = 'Include the suffix in the export file'
        Caption = 'Include'
        TabOrder = 2
        OnClick = RecodeSection
      end
      object chkChordsPrefix: TCheckBox
        Left = 136
        Top = 2
        Width = 57
        Height = 17
        Hint = 'Include the prefix in the export file'
        Caption = 'Include'
        TabOrder = 3
        OnClick = RecodeSection
      end
    end
    object btnSaveFormat: TButton
      Left = 192
      Top = 88
      Width = 65
      Height = 25
      Hint = 'Save current file format'
      Caption = 'Save'
      TabOrder = 17
      OnClick = btnSaveFormatClick
    end
    object btnDelFormat: TButton
      Left = 192
      Top = 112
      Width = 65
      Height = 25
      Hint = 'Delete current file format'
      Caption = 'Delete'
      TabOrder = 18
      OnClick = btnDelFormatClick
    end
    object chkStripBlank: TCheckBox
      Left = 144
      Top = 140
      Width = 97
      Height = 17
      Caption = 'Strip blank lines'
      TabOrder = 19
    end
    object grdReplace: TStringGrid
      Left = 24
      Top = 160
      Width = 217
      Height = 89
      ColCount = 3
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
      PopupMenu = PopupMenu1
      TabOrder = 20
      OnKeyDown = grdReplaceKeyDown
    end
    object btnBatchImport: TButton
      Left = 16
      Top = 32
      Width = 97
      Height = 25
      Hint = 'Convert multiple files to OpenSong'
      Caption = 'Batch Import'
      TabOrder = 21
      OnClick = btnBatchImportClick
    end
    object edtSongPath: TEdit
      Left = 56
      Top = 60
      Width = 185
      Height = 21
      Hint = 'Path for OpenSong songs'
      TabOrder = 22
    end
    object btnSongPath: TButton
      Left = 241
      Top = 60
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 23
      OnClick = btnSongPathClick
    end
  end
  object dlgOpen: TOpenDialog
    Filter = 'All Files|*.*'
    InitialDir = '%userprofile%\OpenSong\Songs'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 272
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 512
    Top = 208
    object Delete1: TMenuItem
      Caption = 'Delete Row'
      ShortCut = 16430
      OnClick = Delete1Click
    end
    object Insert1: TMenuItem
      Caption = 'Insert Row'
      ShortCut = 16429
      OnClick = Insert1Click
    end
    object Append1: TMenuItem
      Caption = 'Add Row'
      ShortCut = 16449
      OnClick = Append1Click
    end
  end
end
