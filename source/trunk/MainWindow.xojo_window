#tag Window
Begin Window MainWindow Implements ScriptureReceiver,SongPickerReceiver,ColorPaletteBroker.ColorPaletteSource
   BackColor       =   &c40404000
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   700
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1144876511
   MenuBarVisible  =   True
   MinHeight       =   600
   MinimizeButton  =   True
   MinWidth        =   850
   Placement       =   2
   Resizeable      =   True
   Title           =   "OpenSong"
   Visible         =   False
   Width           =   900
   Begin SButton btn_mode_songs_mode
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   False
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      HasFocus        =   False
      Height          =   28
      Icon            =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Label           =   ""
      LabelAlign      =   1
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuItem        =   ""
      NewPaint        =   False
      Outline         =   True
      Scope           =   0
      StickyBevel     =   True
      Stuck           =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Toggle          =   False
      Tooltip         =   ""
      Top             =   3
      Transparent     =   True
      Visible         =   True
      Width           =   200
   End
   Begin SButton btn_mode_sets_mode
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   False
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      HasFocus        =   False
      Height          =   28
      Icon            =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Label           =   ""
      LabelAlign      =   1
      Left            =   215
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuItem        =   ""
      NewPaint        =   False
      Outline         =   True
      Scope           =   0
      StickyBevel     =   True
      Stuck           =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Toggle          =   False
      Tooltip         =   ""
      Top             =   3
      Transparent     =   True
      Visible         =   True
      Width           =   200
   End
   Begin SPagePanel pge_controls
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   664
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   36
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   290
      Begin Canvas can_controls_sets_mode
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   654
         Index           =   -2147483648
         InitialParent   =   "pge_controls"
         Left            =   5
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Visible         =   True
         Width           =   280
         Begin GroupBox grp_sets_sets
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Sets"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   50
            Index           =   -2147483648
            InitialParent   =   "can_controls_sets_mode"
            Italic          =   False
            Left            =   10
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   41
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   270
            Begin PopupMenu pop_sets_sets
               AllowAutoDeactivate=   True
               Bold            =   False
               Enabled         =   True
               FontName        =   "Arial"
               FontSize        =   10.0
               FontUnit        =   0
               Height          =   25
               Index           =   -2147483648
               InitialParent   =   "grp_sets_sets"
               InitialValue    =   ""
               Italic          =   False
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               Scope           =   0
               SelectedRowIndex=   0
               TabIndex        =   0
               TabPanelIndex   =   2
               TabStop         =   True
               Tooltip         =   ""
               Top             =   59
               Transparent     =   True
               Underline       =   False
               Visible         =   True
               Width           =   225
            End
            Begin SButton btn_sets_add
               AllowAutoDeactivate=   True
               AllowFocus      =   False
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   True
               HasFocus        =   False
               Height          =   23
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_sets_sets"
               Label           =   ""
               LabelAlign      =   0
               Left            =   250
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   1
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   60
               Transparent     =   True
               Visible         =   True
               Width           =   23
            End
         End
         Begin GroupBox grp_set_current_item
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Current Item"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   213
            Index           =   -2147483648
            InitialParent   =   "can_controls_sets_mode"
            Italic          =   False
            Left            =   149
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   226
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   131
            Begin SButton btn_set_remove
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   3
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   326
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_move_down
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   2
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   299
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_copy
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   4
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   353
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_move_up
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   1
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   272
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_paste
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   5
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   380
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_store
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   6
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   407
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_presentitem
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   0
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   245
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
         End
         Begin GroupBox grp_set_current_set
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Current Set"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   131
            Index           =   -2147483648
            InitialParent   =   "can_controls_sets_mode"
            Italic          =   False
            Left            =   10
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   93
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   270
            Begin SButton btn_set_delete
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_set"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   2
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   165
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_present
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_set"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   4
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   111
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_rename
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_set"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   1
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   138
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_print_songs
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_set"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   5
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   138
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_print_order
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_set"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   6
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   165
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_save
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_set"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   0
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   111
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_saveas
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   True
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_set"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   3
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   192
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_export
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_current_set"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   7
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   192
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
         End
         Begin Label lbl_set_items
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_controls_sets_mode"
            Italic          =   False
            Left            =   10
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Items In Set:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   422
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   139
         End
         Begin GroupBox grp_set_new_item
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "New Item"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   187
            Index           =   -2147483648
            InitialParent   =   "can_controls_sets_mode"
            Italic          =   False
            Left            =   10
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   226
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   131
            Begin SButton btn_set_add_scripture
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_new_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   1
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   272
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_add_slides
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_new_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   2
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   299
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_add_style
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_new_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   3
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   326
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_add_song
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_new_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   0
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   245
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_add_image
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_new_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   4
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   353
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_set_add_external
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_set_new_item"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   False
               LockRight       =   False
               LockTop         =   False
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   5
               TabPanelIndex   =   2
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   380
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
         End
         Begin Listbox lst_set_items
            AllowAutoDeactivate=   True
            AllowAutoHideScrollbars=   True
            AllowExpandableRows=   False
            AllowFocusRing  =   True
            AllowResizableColumns=   False
            AllowRowDragging=   False
            AllowRowReordering=   True
            Bold            =   False
            ColumnCount     =   1
            ColumnWidths    =   ""
            DefaultRowHeight=   -1
            DropIndicatorVisible=   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            GridLinesHorizontalStyle=   0
            GridLinesVerticalStyle=   0
            HasBorder       =   True
            HasHeader       =   False
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            HeadingIndex    =   -1
            Height          =   240
            Index           =   -2147483648
            InitialParent   =   "can_controls_sets_mode"
            InitialValue    =   ""
            Italic          =   False
            Left            =   10
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            RequiresSelection=   False
            RowSelectionType=   0
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   446
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   270
            _ScrollOffset   =   0
            _ScrollWidth    =   -1
         End
      End
      Begin Canvas can_controls_songs_mode
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   654
         Index           =   -2147483648
         InitialParent   =   "pge_controls"
         Left            =   5
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Visible         =   True
         Width           =   280
         Begin PopupMenu pop_songs_song_folders
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   11.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "can_controls_songs_mode"
            InitialValue    =   ""
            Italic          =   False
            Left            =   10
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   -1
            TabIndex        =   4
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   324
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   220
         End
         Begin GroupBox grp_songs_selected_song
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Selected Song"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   271
            Index           =   -2147483648
            InitialParent   =   "can_controls_songs_mode"
            Italic          =   False
            Left            =   149
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   41
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   131
            Begin SButton btn_song_revert
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_selected_song"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   1
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   88
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_song_present
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_selected_song"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   3
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   142
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_song_save
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_selected_song"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   0
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   61
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_song_print
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_selected_song"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   2
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   115
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_song_rename
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_selected_song"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   5
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   196
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_song_export
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_selected_song"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   4
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   169
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_song_copy
               AllowAutoDeactivate=   True
               AllowFocus      =   False
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_selected_song"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   7
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   250
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_song_move
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_selected_song"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   6
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   223
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_song_delete
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_selected_song"
               Label           =   ""
               LabelAlign      =   0
               Left            =   157
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   8
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   277
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
         End
         Begin GroupBox grp_songs_all_songs
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "All Songs"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   108
            Index           =   -2147483648
            InitialParent   =   "can_controls_songs_mode"
            Italic          =   False
            Left            =   10
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   41
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   131
            Begin SButton btn_songs_print
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   True
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_all_songs"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   0
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   62
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_songs_export
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   True
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_all_songs"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   1
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   89
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_songs_find
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   True
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_all_songs"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   2
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   116
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
         End
         Begin GroupBox grp_songs_new_song
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "New Song"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   53
            Index           =   -2147483648
            InitialParent   =   "can_controls_songs_mode"
            Italic          =   False
            Left            =   10
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   154
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   131
            Begin SButton btn_song_create
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   True
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_new_song"
               Label           =   ""
               LabelAlign      =   0
               Left            =   18
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   0
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   175
               Transparent     =   True
               Visible         =   True
               Width           =   115
            End
            Begin SButton btn_song_import
               AllowAutoDeactivate=   True
               AllowFocus      =   True
               AllowFocusRing  =   True
               AllowTabs       =   False
               Backdrop        =   0
               DoubleBuffer    =   False
               Enabled         =   False
               HasFocus        =   False
               Height          =   24
               Icon            =   0
               Index           =   -2147483648
               InitialParent   =   "grp_songs_new_song"
               Label           =   ""
               LabelAlign      =   0
               Left            =   -88
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               MenuItem        =   ""
               NewPaint        =   False
               Outline         =   True
               Scope           =   0
               StickyBevel     =   False
               Stuck           =   False
               TabIndex        =   1
               TabPanelIndex   =   1
               TabStop         =   True
               Toggle          =   False
               Tooltip         =   ""
               Top             =   203
               Transparent     =   True
               Visible         =   False
               Width           =   87
            End
         End
         Begin Label lbl_songs_song_folders
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_controls_songs_mode"
            Italic          =   False
            Left            =   10
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Folders:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   302
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   139
         End
         Begin Label lbl_songs_songs
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_controls_songs_mode"
            Italic          =   False
            Left            =   10
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   7
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Songs:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   351
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   270
         End
         Begin SButton btn_songs_song_folders_add
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   23
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_controls_songs_mode"
            Label           =   ""
            LabelAlign      =   0
            Left            =   233
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   5
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   325
            Transparent     =   True
            Visible         =   True
            Width           =   23
         End
         Begin Label lbl_songs_curr_folder
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_controls_songs_mode"
            Italic          =   False
            Left            =   10
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   10
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Containing Folder:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   647
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   270
         End
         Begin SButton btn_songs_song_folders_delete
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   23
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_controls_songs_mode"
            Label           =   ""
            LabelAlign      =   0
            Left            =   258
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   6
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   325
            Transparent     =   True
            Visible         =   True
            Width           =   23
         End
         Begin Listbox lst_songs_songs
            AllowAutoDeactivate=   True
            AllowAutoHideScrollbars=   True
            AllowExpandableRows=   False
            AllowFocusRing  =   True
            AllowResizableColumns=   False
            AllowRowDragging=   False
            AllowRowReordering=   False
            Bold            =   False
            ColumnCount     =   1
            ColumnWidths    =   ""
            DefaultRowHeight=   -1
            DropIndicatorVisible=   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            GridLinesHorizontalStyle=   0
            GridLinesVerticalStyle=   0
            HasBorder       =   True
            HasHeader       =   False
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            HeadingIndex    =   -1
            Height          =   247
            Index           =   -2147483648
            InitialParent   =   "can_controls_songs_mode"
            InitialValue    =   ""
            Italic          =   False
            Left            =   10
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            RequiresSelection=   False
            RowSelectionType=   0
            Scope           =   0
            TabIndex        =   9
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   398
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   270
            _ScrollOffset   =   0
            _ScrollWidth    =   -1
         End
         Begin SEditField edt_songs_curr_folder
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   True
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   False
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_controls_songs_mode"
            Italic          =   False
            Left            =   10
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   11
            TabPanelIndex   =   1
            TabStop         =   False
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   670
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   270
         End
         Begin SSearchField sch_songs_songs
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowRecentItems=   False
            ClearMenuItemValue=   ""
            Enabled         =   True
            Height          =   22
            Hint            =   ""
            Index           =   -2147483648
            InitialParent   =   "can_controls_songs_mode"
            Left            =   10
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            MaximumRecentItems=   0
            RecentItemsValue=   ""
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            Tooltip         =   ""
            Top             =   373
            Transparent     =   False
            Value           =   ""
            Visible         =   True
            Width           =   270
         End
      End
   End
   Begin SPagePanel pge_contents
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   664
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   290
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   7
      Panels          =   ""
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   36
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   605
      Begin Canvas can_editor_style_change
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   654
         Index           =   -2147483648
         InitialParent   =   "pge_contents"
         Left            =   295
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Visible         =   True
         Width           =   595
         Begin Label hdr_style_header
            AllowAutoDeactivate=   True
            Bold            =   True
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   22.0
            FontUnit        =   0
            Height          =   30
            Index           =   -2147483648
            InitialParent   =   "can_editor_style_change"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   "Style Change"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   51
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   460
         End
         Begin RadioButton rad_style_change
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Change Style to the Following:"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_style_change"
            Italic          =   False
            Left            =   310
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   4
            TabStop         =   True
            Tooltip         =   ""
            Top             =   131
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   250
         End
         Begin RadioButton rad_style_revert
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Revert to Previous Style"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_style_change"
            Italic          =   False
            Left            =   310
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   4
            TabStop         =   True
            Tooltip         =   ""
            Top             =   106
            Transparent     =   True
            Underline       =   False
            Value           =   True
            Visible         =   True
            Width           =   250
         End
         Begin SStyleCanvas can_style_style
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   240
            Index           =   -2147483648
            InitialParent   =   "can_editor_style_change"
            Left            =   375
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SongStyle       =   True
            TabIndex        =   3
            TabPanelIndex   =   4
            TabStop         =   True
            Tooltip         =   ""
            Top             =   185
            Transparent     =   True
            Visible         =   True
            Width           =   320
         End
      End
      Begin Canvas can_editor_general_song_editor
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   654
         Index           =   -2147483648
         InitialParent   =   "pge_contents"
         Left            =   295
         LockBottom      =   True
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Visible         =   True
         Width           =   595
         Begin Label hdr_song_header
            AllowAutoDeactivate=   True
            Bold            =   True
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   22.0
            FontUnit        =   0
            Height          =   30
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Song Editor"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   51
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   310
         End
         Begin Label lbl_song_ccli
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   16
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   596
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   11
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "CCLI #:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   241
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   105
         End
         Begin Label lbl_song_author
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   16
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Author:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   153
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   272
         End
         Begin Label lbl_song_lyrics
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   16
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   13
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Chord/Lyrics:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   197
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   286
         End
         Begin Label lbl_song_insert
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   16
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   596
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   15
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Insert:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   290
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   133
         End
         Begin Label lbl_song_title
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   16
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Title:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   109
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   272
         End
         Begin GroupBox grp_song_transpose
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Transpose"
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   77
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   596
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   22
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   391
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   279
            Begin PopupMenu pop_song_accidentals
               AllowAutoDeactivate=   True
               Bold            =   False
               Enabled         =   True
               FontName        =   "Arial"
               FontSize        =   10.0
               FontUnit        =   0
               Height          =   25
               Index           =   -2147483648
               InitialParent   =   "grp_song_transpose"
               InitialValue    =   ""
               Italic          =   False
               Left            =   615
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   False
               LockRight       =   True
               LockTop         =   True
               Scope           =   0
               SelectedRowIndex=   0
               TabIndex        =   1
               TabPanelIndex   =   1
               TabStop         =   True
               Tooltip         =   ""
               Top             =   429
               Transparent     =   True
               Underline       =   False
               Visible         =   True
               Width           =   113
            End
            Begin PopupMenu pop_song_transpose
               AllowAutoDeactivate=   True
               Bold            =   False
               Enabled         =   True
               FontName        =   "Arial"
               FontSize        =   10.0
               FontUnit        =   0
               Height          =   25
               Index           =   -2147483648
               InitialParent   =   "grp_song_transpose"
               InitialValue    =   "-6\r\n-5\r\n-4\r\n-3\r\n-2\r\n-1\r\n0\r\n+1\r\n+2\r\n+3\r\n+4\r\n+5\r\n+6\r\n"
               Italic          =   False
               Left            =   740
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   False
               LockRight       =   True
               LockTop         =   True
               Scope           =   0
               SelectedRowIndex=   6
               TabIndex        =   2
               TabPanelIndex   =   1
               TabStop         =   True
               Tooltip         =   ""
               Top             =   429
               Transparent     =   True
               Underline       =   False
               Visible         =   True
               Width           =   113
            End
            Begin Label lbl_song_using
               AllowAutoDeactivate=   True
               Bold            =   False
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               FontName        =   "System"
               FontSize        =   0.0
               FontUnit        =   0
               Height          =   22
               Index           =   -2147483648
               InitialParent   =   "grp_song_transpose"
               Italic          =   False
               Left            =   608
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               Multiline       =   False
               Scope           =   0
               Selectable      =   False
               TabIndex        =   0
               TabPanelIndex   =   1
               TabStop         =   True
               Text            =   "Using:"
               TextAlignment   =   0
               TextColor       =   &c00000000
               Tooltip         =   ""
               Top             =   407
               Transparent     =   False
               Underline       =   False
               Visible         =   True
               Width           =   86
            End
         End
         Begin SEditField edt_song_author
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   305
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   171
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   272
         End
         Begin SEditFieldLyrics edf_song_lyrics
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   True
            AllowTabs       =   True
            BackgroundColor =   &cFFFFFF00
            Bilingual       =   False
            Bold            =   False
            Enabled         =   False
            FontName        =   "#kFixedFont"
            FontSize        =   12.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   True
            HasVerticalScrollbar=   True
            Height          =   475
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   305
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   True
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   14
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   215
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   279
         End
         Begin SButton btn_song_ins_section
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Label           =   ""
            LabelAlign      =   0
            Left            =   596
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   16
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   307
            Transparent     =   True
            Visible         =   True
            Width           =   138
         End
         Begin SButton btn_song_ins_lyrics
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Label           =   ""
            LabelAlign      =   0
            Left            =   596
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   17
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   332
            Transparent     =   True
            Visible         =   True
            Width           =   138
         End
         Begin SButton btn_song_ins_multi_verse
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Label           =   ""
            LabelAlign      =   0
            Left            =   596
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   18
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   357
            Transparent     =   True
            Visible         =   True
            Width           =   138
         End
         Begin SButton btn_song_show_general_editor
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   26
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Label           =   ""
            LabelAlign      =   1
            Left            =   620
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   True
            Stuck           =   False
            TabIndex        =   27
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   51
            Transparent     =   True
            Visible         =   True
            Width           =   125
         End
         Begin SButton btn_song_show_advanced_editor
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   26
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Label           =   ""
            LabelAlign      =   1
            Left            =   750
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   True
            Stuck           =   False
            TabIndex        =   28
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   51
            Transparent     =   True
            Visible         =   True
            Width           =   125
         End
         Begin SEditField edt_song_ccli
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   596
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   12
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   259
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   135
         End
         Begin SEditField edt_song_title
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   305
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   127
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   272
         End
         Begin SButton btn_song_add_link
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Label           =   ""
            LabelAlign      =   0
            Left            =   596
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   25
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   668
            Transparent     =   True
            Visible         =   True
            Width           =   113
         End
         Begin SButton btn_song_remove_link
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Label           =   ""
            LabelAlign      =   0
            Left            =   718
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   26
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   668
            Transparent     =   True
            Visible         =   True
            Width           =   113
         End
         Begin Label lbl_song_linked
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   596
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   23
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Linked Songs:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   473
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   279
         End
         Begin Listbox lst_song_linked
            AllowAutoDeactivate=   True
            AllowAutoHideScrollbars=   True
            AllowExpandableRows=   False
            AllowFocusRing  =   True
            AllowResizableColumns=   False
            AllowRowDragging=   False
            AllowRowReordering=   False
            Bold            =   False
            ColumnCount     =   1
            ColumnWidths    =   ""
            DefaultRowHeight=   -1
            DropIndicatorVisible=   False
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            GridLinesHorizontalStyle=   0
            GridLinesVerticalStyle=   0
            HasBorder       =   True
            HasHeader       =   False
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            HeadingIndex    =   -1
            Height          =   168
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            InitialValue    =   ""
            Italic          =   False
            Left            =   596
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            RequiresSelection=   False
            RowSelectionType=   0
            Scope           =   0
            TabIndex        =   24
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   495
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   279
            _ScrollOffset   =   0
            _ScrollWidth    =   -1
         End
         Begin SEditField edt_song_hymn_number
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   12.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   596
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   10
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   215
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   135
         End
         Begin SButton btn_song_ins_page
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Label           =   ""
            LabelAlign      =   0
            Left            =   739
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   21
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   357
            Transparent     =   True
            Visible         =   True
            Width           =   138
         End
         Begin SButton btn_song_ins_column
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Label           =   ""
            LabelAlign      =   0
            Left            =   739
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   20
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   332
            Transparent     =   True
            Visible         =   True
            Width           =   138
         End
         Begin SButton btn_song_ins_comment
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Label           =   ""
            LabelAlign      =   0
            Left            =   739
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   19
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   307
            Transparent     =   True
            Visible         =   True
            Width           =   138
         End
         Begin SEditField edt_song_copyright
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   596
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   6
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   127
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   279
         End
         Begin SButton btn_song_show_backgrounds_editor
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   26
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Label           =   ""
            LabelAlign      =   1
            Left            =   750
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   True
            Stuck           =   False
            TabIndex        =   29
            TabPanelIndex   =   1
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   81
            Transparent     =   True
            Visible         =   True
            Width           =   125
         End
         Begin Label lbl_song_copyright
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   16
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   596
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   5
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Copyright:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   109
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   279
         End
         Begin Label lbl_song_hymn_number
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   16
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   596
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   9
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Hymn #:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   197
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   163
         End
         Begin SEditField edt_song_presentation
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   596
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   171
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ">CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
            Visible         =   True
            Width           =   279
         End
         Begin Label lbl_song_presentation
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   16
            Index           =   -2147483648
            InitialParent   =   "can_editor_general_song_editor"
            Italic          =   False
            Left            =   596
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   7
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Presentation:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   153
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   279
         End
      End
      Begin Canvas can_editor_slide_editor
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   654
         Index           =   -2147483648
         InitialParent   =   "pge_contents"
         Left            =   295
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Visible         =   True
         Width           =   595
         Begin Label lbl_slide_auto_advance
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   34
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   21
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Auto-advance slide(s) every..."
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   250
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   136
         End
         Begin Label txt_slide_seconds
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   23
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "seconds"
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   309
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   136
         End
         Begin Label lbl_slide_insert
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   17
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Insert:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   133
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   129
         End
         Begin CheckBox chk_slide_print
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Print in Set List"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   20
            TabPanelIndex   =   3
            TabStop         =   True
            Tooltip         =   ""
            Top             =   216
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   142
         End
         Begin SEditField edt_slide_auto_advance
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   787
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   22
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   287
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   54
         End
         Begin CheckBox chk_slide_loop
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Loop Slides"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   19
            TabPanelIndex   =   3
            TabStop         =   True
            Tooltip         =   ""
            Top             =   190
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   142
         End
         Begin CheckBox chk_slide_style
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Override Style"
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   25
            TabPanelIndex   =   3
            TabStop         =   True
            Tooltip         =   ""
            Top             =   415
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   142
         End
         Begin PopupMenu pop_slide_transition
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            InitialValue    =   ""
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   27
            TabPanelIndex   =   3
            TabStop         =   True
            Tooltip         =   ""
            Top             =   460
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   129
         End
         Begin SEditField edt_slide_origorder
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   535
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   12
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   493
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   199
         End
         Begin Label lbl_slide_folder
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   13
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "File Folder"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   517
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   170
         End
         Begin Label hdr_slide_header
            AllowAutoDeactivate=   True
            Bold            =   True
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   22.0
            FontUnit        =   0
            Height          =   30
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Custom Slide Editor"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   51
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   460
         End
         Begin Label lbl_slide_presentation
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   306
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   9
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Custom Presentation Order:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   471
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   217
         End
         Begin Label lbl_slide_origorder
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   535
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   11
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Original Presentation Order:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   471
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   199
         End
         Begin SEditField edt_slide_order
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   305
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   10
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   493
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ">CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
            Visible         =   True
            Width           =   218
         End
         Begin Label lbl_slide_name
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   693
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   5
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Name:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   85
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin Label lbl_slide_subtitle
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   499
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Subtitle:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   85
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin Label lbl_slide_title
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Title:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   85
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin Label lbl_slide_slides
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   7
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Slides:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   133
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   436
         End
         Begin Label lbl_slide_transition
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   26
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Use Transition"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   438
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   142
         End
         Begin Label lbl_slide_notes
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   15
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Notes:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   563
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   436
         End
         Begin SEditField edt_slide_subtitle
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   499
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   106
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   182
         End
         Begin SEditField edt_slide_title
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   305
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   106
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   182
         End
         Begin SEditField edt_slide_name
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   693
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   6
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   106
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   182
         End
         Begin SEditFieldLyrics edf_slide_slides
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   True
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bilingual       =   False
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   True
            HasVerticalScrollbar=   True
            Height          =   313
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   305
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   True
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   156
            Transparent     =   False
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   436
         End
         Begin SEditField edt_slide_folder
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   305
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   14
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   539
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   218
         End
         Begin SButton btn_slide_ins_slide
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Label           =   ""
            LabelAlign      =   0
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   18
            TabPanelIndex   =   3
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   156
            Transparent     =   True
            Visible         =   True
            Width           =   129
         End
         Begin SEditField edt_slide_notes
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   True
            HasVerticalScrollbar=   True
            Height          =   100
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Italic          =   False
            Left            =   305
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            MaximumCharactersAllowed=   0
            Multiline       =   True
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   16
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   585
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   436
         End
         Begin SStyleCanvas can_slide_style
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   77
            Index           =   -2147483648
            InitialParent   =   "can_editor_slide_editor"
            Left            =   763
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            SongStyle       =   False
            TabIndex        =   24
            TabPanelIndex   =   3
            TabStop         =   True
            Tooltip         =   ""
            Top             =   335
            Transparent     =   True
            Visible         =   True
            Width           =   102
         End
      End
      Begin Canvas can_editor_image_slide
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   654
         Index           =   -2147483648
         InitialParent   =   "pge_contents"
         Left            =   295
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   5
         TabStop         =   True
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Visible         =   True
         Width           =   595
         Begin Label txt_image_seconds
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   20
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "seconds"
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   406
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   136
         End
         Begin Label lbl_image_auto_advance
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   40
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   18
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Auto-advance slide(s) every..."
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   341
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   136
         End
         Begin Label lbl_image_transition
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   23
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Use Transition"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   535
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   142
         End
         Begin CheckBox chk_image_style
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Override Style"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   22
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   509
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   142
         End
         Begin Label hdr_image_header
            AllowAutoDeactivate=   True
            Bold            =   True
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   22.0
            FontUnit        =   0
            Height          =   30
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Image Slide Editor"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   51
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   460
         End
         Begin PopupMenu pop_image_transition
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            InitialValue    =   ""
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   24
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   557
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   129
         End
         Begin Label lbl_image_name
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   693
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   6
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Name:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   85
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin CheckBox chk_image_fit_to_screen
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Resize images to fit the screen"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   25
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   494
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   436
         End
         Begin CheckBox chk_image_fit_to_body
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Resize images to fit the body area"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   26
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   516
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   436
         End
         Begin CheckBox chk_image_store_as_link
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Do not store the image in the set, use a link"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   28
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   560
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   436
         End
         Begin CheckBox chk_image_keepaspect
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Keep aspect ratio when resizing images"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   27
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   538
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   436
         End
         Begin Label lbl_image_notes
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   29
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Notes:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   587
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   436
         End
         Begin Label lbl_image_title
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   309
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Title:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   85
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin Label lbl_image_action
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   10
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Insert:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   140
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   129
         End
         Begin CheckBox chk_image_print
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Print in Set List"
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   17
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   319
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   142
         End
         Begin CheckBox chk_image_loop
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Loop Slides"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   16
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   297
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   142
         End
         Begin SEditField edt_image_auto_advance
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   794
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   19
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   379
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   40
         End
         Begin Label lbl_image_subtitle
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   499
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Subtitle:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   85
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   182
         End
         Begin Label lbl_image_images
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   8
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   "Images:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   140
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   186
         End
         Begin CheckBox chk_image_descriptions
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Image description in subtitle"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   499
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   131
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   242
         End
         Begin SEditField edt_image_title
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   304
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   106
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   182
         End
         Begin SStyleCanvas can_image_style
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            Height          =   77
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Left            =   764
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            SongStyle       =   False
            TabIndex        =   21
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   429
            Transparent     =   True
            Visible         =   True
            Width           =   102
         End
         Begin SEditField edt_image_subtitle
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   499
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   106
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   182
         End
         Begin SEditField edt_image_name
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   693
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   7
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   106
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   182
         End
         Begin SEditField edt_image_notes
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   True
            HasVerticalScrollbar=   True
            Height          =   75
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Italic          =   False
            Left            =   305
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            MaximumCharactersAllowed=   0
            Multiline       =   True
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   30
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   610
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   436
         End
         Begin SButton btn_image_ins_image
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Label           =   ""
            LabelAlign      =   0
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   11
            TabPanelIndex   =   5
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   162
            Transparent     =   True
            Visible         =   True
            Width           =   129
         End
         Begin SButton btn_image_del_image
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Label           =   ""
            LabelAlign      =   0
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   13
            TabPanelIndex   =   5
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   214
            Transparent     =   True
            Visible         =   True
            Width           =   129
         End
         Begin SButton btn_image_move_down
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Label           =   ""
            LabelAlign      =   0
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   15
            TabPanelIndex   =   5
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   264
            Transparent     =   True
            Visible         =   True
            Width           =   129
         End
         Begin SButton btn_image_move_up
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Label           =   ""
            LabelAlign      =   0
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   14
            TabPanelIndex   =   5
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   239
            Transparent     =   True
            Visible         =   True
            Width           =   129
         End
         Begin SButton btn_image_imp_image
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            Label           =   ""
            LabelAlign      =   0
            Left            =   746
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   12
            TabPanelIndex   =   5
            TabStop         =   False
            Toggle          =   False
            Tooltip         =   ""
            Top             =   188
            Transparent     =   True
            Visible         =   True
            Width           =   129
         End
         Begin ImageListBox lst_image_images
            AllowAutoDeactivate=   True
            AllowAutoHideScrollbars=   True
            AllowExpandableRows=   False
            AllowFocusRing  =   True
            AllowResizableColumns=   True
            AllowRowDragging=   False
            AllowRowReordering=   True
            Bold            =   False
            ColumnCount     =   2
            ColumnWidths    =   "80,*"
            DefaultRowHeight=   80
            DropIndicatorVisible=   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            GridLinesHorizontalStyle=   0
            GridLinesVerticalStyle=   0
            HasBorder       =   True
            HasHeader       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            HeadingIndex    =   -1
            Height          =   327
            ImageColumn     =   0
            ImageMargin     =   2
            Index           =   -2147483648
            InitialParent   =   "can_editor_image_slide"
            InitialValue    =   ""
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            RequiresSelection=   False
            RowSelectionType=   1
            Scope           =   0
            TabIndex        =   9
            TabPanelIndex   =   5
            TabStop         =   True
            Tooltip         =   ""
            Top             =   162
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   436
            _ScrollOffset   =   0
            _ScrollWidth    =   -1
         End
      End
      Begin Canvas can_editor_advanced_song_editor
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   654
         Index           =   -2147483648
         InitialParent   =   "pge_contents"
         Left            =   295
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Visible         =   True
         Width           =   595
         Begin Label lbl_song_aka
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   11
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "AKA:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   290
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   304
         End
         Begin Label lbl_song_capo
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Capo:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   105
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   125
         End
         Begin Label lbl_song_key_line
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   13
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Key Line:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   334
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   304
         End
         Begin SButton btn_song_show_general_editor_2
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   26
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Label           =   ""
            LabelAlign      =   1
            Left            =   620
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   True
            Stuck           =   False
            TabIndex        =   25
            TabPanelIndex   =   2
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   51
            Transparent     =   True
            Visible         =   True
            Width           =   125
         End
         Begin Label lbl_song_key
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   5
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Key:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   152
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   125
         End
         Begin Label lbl_song_time_sig
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   7
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Time Signature:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   196
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   125
         End
         Begin PopupMenu pop_song_time_sig
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            InitialValue    =   ""
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   8
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   218
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   143
         End
         Begin Label lbl_song_user2
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   17
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "User Defined 2:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   457
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   304
         End
         Begin Label lbl_song_tempo
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   9
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Tempo:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   243
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   125
         End
         Begin Label lbl_song_user3
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   19
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "User Defined 3:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   536
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   304
         End
         Begin CheckBox chk_song_capo_print
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Print"
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   637
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   105
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   100
         End
         Begin CheckBox chk_song_style
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Override Style"
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   773
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   22
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   207
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   102
         End
         Begin SButton btn_song_show_advanced_editor_2
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   26
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Label           =   ""
            LabelAlign      =   1
            Left            =   750
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   True
            Stuck           =   False
            TabIndex        =   26
            TabPanelIndex   =   2
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   51
            Transparent     =   True
            Visible         =   True
            Width           =   125
         End
         Begin PopupMenu pop_song_tempo
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            InitialValue    =   ""
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   10
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   265
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   143
         End
         Begin SStyleCanvas can_song_style
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            Height          =   77
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Left            =   773
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            SongStyle       =   True
            TabIndex        =   21
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   127
            Transparent     =   True
            Visible         =   True
            Width           =   102
         End
         Begin SEditField edt_song_key
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   6
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   174
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   143
         End
         Begin SEditField edt_song_aka
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   12
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   312
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   304
         End
         Begin PopupMenu pop_song_capo
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            InitialValue    =   "0\r1\r2\r3\r4\r5\r6"
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   127
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   55
         End
         Begin SEditField edt_song_key_line
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   14
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   356
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   303
         End
         Begin Label lbl_song_user1
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   15
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "User Defined 1:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   378
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   304
         End
         Begin Label hdr_song_header_2
            AllowAutoDeactivate=   True
            Bold            =   True
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   22.0
            FontUnit        =   0
            Height          =   30
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Song Editor"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   51
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   310
         End
         Begin SEditField edt_song_user1
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   57
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   True
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   16
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   400
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   303
         End
         Begin SEditField edt_song_user2
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   57
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   True
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   18
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   479
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   303
         End
         Begin SEditField edt_song_user3
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   False
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   57
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   572
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   True
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   20
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   558
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   303
         End
         Begin PopupMenu pop_song_capo_accidentals
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   25
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            InitialValue    =   ""
            Italic          =   False
            Left            =   637
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   0
            TabIndex        =   4
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   127
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   78
         End
         Begin Listbox lst_song_themes
            AllowAutoDeactivate=   True
            AllowAutoHideScrollbars=   True
            AllowExpandableRows=   False
            AllowFocusRing  =   True
            AllowResizableColumns=   False
            AllowRowDragging=   False
            AllowRowReordering=   False
            Bold            =   False
            ColumnCount     =   1
            ColumnWidths    =   ""
            DefaultRowHeight=   -1
            DropIndicatorVisible=   False
            Enabled         =   False
            FontName        =   "SmallSystem"
            FontSize        =   0.0
            FontUnit        =   0
            GridLinesHorizontalStyle=   0
            GridLinesVerticalStyle=   0
            HasBorder       =   True
            HasHeader       =   False
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            HeadingIndex    =   -1
            Height          =   563
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            InitialValue    =   ""
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            RequiresSelection=   False
            RowSelectionType=   0
            Scope           =   0
            TabIndex        =   24
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   127
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   255
            _ScrollOffset   =   0
            _ScrollWidth    =   -1
         End
         Begin Label lbl_song_themes
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   23
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Themes:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   105
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   255
         End
         Begin SButton btn_song_show_backgrounds_editor_2
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   26
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_advanced_song_editor"
            Label           =   ""
            LabelAlign      =   1
            Left            =   750
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   True
            Stuck           =   False
            TabIndex        =   27
            TabPanelIndex   =   2
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   81
            Transparent     =   True
            Visible         =   True
            Width           =   125
         End
      End
      Begin Canvas can_editor_backgrounds_song_editor
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   654
         Index           =   -2147483648
         InitialParent   =   "pge_contents"
         Left            =   295
         LockBottom      =   True
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   7
         TabStop         =   True
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Visible         =   True
         Width           =   595
         Begin SButton btn_song_del_background
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            Label           =   ""
            LabelAlign      =   0
            Left            =   424
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   0
            TabPanelIndex   =   7
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   547
            Transparent     =   True
            Visible         =   True
            Width           =   115
         End
         Begin SButton btn_song_add_background
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   22
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            Label           =   ""
            LabelAlign      =   0
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   1
            TabPanelIndex   =   7
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   547
            Transparent     =   True
            Visible         =   True
            Width           =   115
         End
         Begin CheckBox chk_song_background_as_text
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Show the background instead of the verse text"
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   7
            TabStop         =   True
            Tooltip         =   ""
            Top             =   661
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   302
         End
         Begin CheckBox chk_song_store_as_link
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Do not store the image in the song, use a link"
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   7
            TabStop         =   True
            Tooltip         =   ""
            Top             =   639
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   302
         End
         Begin CheckBox chk_song_keepaspect
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Keep aspect ratio when resizing images"
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   7
            TabStop         =   True
            Tooltip         =   ""
            Top             =   617
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   302
         End
         Begin CheckBox chk_song_fit_to_body
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Resize images to fit the body area"
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   7
            TabStop         =   True
            Tooltip         =   ""
            Top             =   595
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   302
         End
         Begin CheckBox chk_song_fit_to_screen
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Resize images to fit the screen"
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            Scope           =   0
            TabIndex        =   6
            TabPanelIndex   =   7
            TabStop         =   True
            Tooltip         =   ""
            Top             =   573
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   302
         End
         Begin Label lbl_song_backgrounds
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   8
            TabPanelIndex   =   7
            TabStop         =   True
            Text            =   "Verse specific backgrounds:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   109
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   232
         End
         Begin SButton btn_song_show_advanced_editor_3
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   26
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            Label           =   ""
            LabelAlign      =   1
            Left            =   750
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   True
            Stuck           =   False
            TabIndex        =   9
            TabPanelIndex   =   7
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   51
            Transparent     =   True
            Visible         =   True
            Width           =   125
         End
         Begin SButton btn_song_show_general_editor_3
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   26
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            Label           =   ""
            LabelAlign      =   1
            Left            =   620
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   True
            Stuck           =   False
            TabIndex        =   10
            TabPanelIndex   =   7
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   51
            Transparent     =   True
            Visible         =   True
            Width           =   125
         End
         Begin Label hdr_song_header_3
            AllowAutoDeactivate=   True
            Bold            =   True
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   22.0
            FontUnit        =   0
            Height          =   30
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   11
            TabPanelIndex   =   7
            TabStop         =   True
            Text            =   "Song Editor"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   51
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   300
         End
         Begin SButton btn_song_show_backgrounds_editor_3
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   False
            HasFocus        =   False
            Height          =   26
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            Label           =   ""
            LabelAlign      =   1
            Left            =   750
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   True
            Stuck           =   False
            TabIndex        =   12
            TabPanelIndex   =   7
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   81
            Transparent     =   True
            Visible         =   True
            Width           =   125
         End
         Begin ImageListbox lst_song_backgrounds
            AllowAutoDeactivate=   True
            AllowAutoHideScrollbars=   False
            AllowExpandableRows=   False
            AllowFocusRing  =   True
            AllowResizableColumns=   True
            AllowRowDragging=   False
            AllowRowReordering=   False
            Bold            =   False
            ColumnCount     =   2
            ColumnWidths    =   "50,*"
            DefaultRowHeight=   120
            DropIndicatorVisible=   False
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            GridLinesHorizontalStyle=   0
            GridLinesVerticalStyle=   1
            HasBorder       =   True
            HasHeader       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            HeadingIndex    =   -1
            Height          =   410
            ImageColumn     =   1
            ImageMargin     =   2
            Index           =   -2147483648
            InitialParent   =   "can_editor_backgrounds_song_editor"
            InitialValue    =   ""
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            RequiresSelection=   False
            RowSelectionType=   1
            Scope           =   0
            TabIndex        =   7
            TabPanelIndex   =   7
            TabStop         =   True
            Tooltip         =   ""
            Top             =   131
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   285
            _ScrollOffset   =   0
            _ScrollWidth    =   -1
         End
      End
      Begin Canvas can_editor_external_slide
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   654
         Index           =   -2147483648
         InitialParent   =   "pge_contents"
         Left            =   295
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   6
         TabStop         =   True
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Visible         =   True
         Width           =   595
         Begin Label hdr_external_header
            AllowAutoDeactivate=   True
            Bold            =   True
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   22.0
            FontUnit        =   0
            Height          =   30
            Index           =   -2147483648
            InitialParent   =   "can_editor_external_slide"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "External Slide Editor"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   51
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   460
         End
         Begin Label lbl_external_name
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_external_slide"
            Italic          =   False
            Left            =   305
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Name:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   85
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   570
         End
         Begin Label lbl_external_notes
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_external_slide"
            Italic          =   False
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   10
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Notes:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   569
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   450
         End
         Begin Label lbl_external_application
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_external_slide"
            Italic          =   False
            Left            =   747
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "Application:"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   147
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   142
         End
         Begin CheckBox chk_external_loop
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Loop Slides"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_external_slide"
            Italic          =   False
            Left            =   747
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   258
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   142
         End
         Begin SEditField edt_external_name
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   False
            HasVerticalScrollbar=   True
            Height          =   22
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_external_slide"
            Italic          =   False
            Left            =   305
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Multiline       =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   106
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   570
         End
         Begin SEditField edt_external_notes
            AllowAutoDeactivate=   True
            AllowFocusRing  =   True
            AllowSpellChecking=   False
            AllowStyledText =   False
            AllowTabs       =   False
            BackgroundColor =   &cFFFFFF00
            Bold            =   False
            Enabled         =   True
            FontName        =   "Arial"
            FontSize        =   10.0
            FontUnit        =   0
            Format          =   ""
            HasBorder       =   True
            HasHorizontalScrollbar=   True
            HasVerticalScrollbar=   True
            Height          =   94
            HideSelection   =   True
            Index           =   -2147483648
            InitialParent   =   "can_editor_external_slide"
            Italic          =   False
            Left            =   305
            LineHeight      =   0.0
            LineSpacing     =   1.0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            MaximumCharactersAllowed=   0
            Multiline       =   True
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   11
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   591
            Transparent     =   True
            Underline       =   False
            UnicodeMode     =   0
            ValidationMask  =   ""
            Visible         =   True
            Width           =   430
         End
         Begin SButton btn_external_presentation
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   24
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_external_slide"
            Label           =   ""
            LabelAlign      =   0
            Left            =   747
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   5
            TabPanelIndex   =   6
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   170
            Transparent     =   True
            Visible         =   True
            Width           =   129
         End
         Begin SButton btn_external_application
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   24
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_external_slide"
            Label           =   ""
            LabelAlign      =   0
            Left            =   747
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   7
            TabPanelIndex   =   6
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   224
            Transparent     =   True
            Visible         =   True
            Width           =   129
         End
         Begin SButton btn_external_videolan
            AllowAutoDeactivate=   True
            AllowFocus      =   True
            AllowFocusRing  =   True
            AllowTabs       =   False
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            HasFocus        =   False
            Height          =   24
            Icon            =   0
            Index           =   -2147483648
            InitialParent   =   "can_editor_external_slide"
            Label           =   ""
            LabelAlign      =   0
            Left            =   747
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            MenuItem        =   ""
            NewPaint        =   False
            Outline         =   True
            Scope           =   0
            StickyBevel     =   False
            Stuck           =   False
            TabIndex        =   6
            TabPanelIndex   =   6
            TabStop         =   True
            Toggle          =   False
            Tooltip         =   ""
            Top             =   197
            Transparent     =   True
            Visible         =   True
            Width           =   129
         End
         Begin SPagePanel pge_externals
            AllowAutoDeactivate=   True
            Enabled         =   True
            Height          =   420
            Index           =   -2147483648
            InitialParent   =   "can_editor_external_slide"
            Left            =   305
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            PanelCount      =   4
            Panels          =   ""
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   147
            Transparent     =   True
            Value           =   0
            Visible         =   True
            Width           =   430
            Begin GroupBox grp_external_presentation_settings
               AllowAutoDeactivate=   True
               Bold            =   False
               Caption         =   "Presentation settings"
               Enabled         =   True
               FontName        =   "System"
               FontSize        =   0.0
               FontUnit        =   0
               Height          =   410
               Index           =   -2147483648
               InitialParent   =   "pge_externals"
               Italic          =   False
               Left            =   310
               LockBottom      =   True
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   True
               LockTop         =   True
               Scope           =   0
               TabIndex        =   0
               TabPanelIndex   =   2
               TabStop         =   True
               Tooltip         =   ""
               Top             =   151
               Transparent     =   True
               Underline       =   False
               Visible         =   True
               Width           =   420
               Begin CheckBox chk_external_loop_presentation
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  Caption         =   "Loop presentation"
                  Enabled         =   True
                  FontName        =   "System"
                  FontSize        =   0.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_presentation_settings"
                  Italic          =   False
                  Left            =   320
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   False
                  LockTop         =   True
                  Scope           =   0
                  TabIndex        =   10
                  TabPanelIndex   =   2
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   402
                  Transparent     =   True
                  Underline       =   False
                  Value           =   False
                  Visible         =   True
                  VisualState     =   0
                  Width           =   310
               End
               Begin SButton btn_external_presentation_file
                  AllowAutoDeactivate=   True
                  AllowFocus      =   False
                  AllowFocusRing  =   True
                  AllowTabs       =   False
                  Backdrop        =   0
                  DoubleBuffer    =   False
                  Enabled         =   True
                  HasFocus        =   False
                  Height          =   22
                  Icon            =   0
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_presentation_settings"
                  Label           =   ""
                  LabelAlign      =   0
                  Left            =   698
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   False
                  LockRight       =   True
                  LockTop         =   True
                  MenuItem        =   ""
                  NewPaint        =   False
                  Outline         =   True
                  Scope           =   0
                  StickyBevel     =   False
                  Stuck           =   False
                  TabIndex        =   9
                  TabPanelIndex   =   2
                  TabStop         =   True
                  Toggle          =   False
                  Tooltip         =   ""
                  Top             =   351
                  Transparent     =   True
                  Visible         =   True
                  Width           =   22
               End
               Begin Label lbl_external_presentation_file
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  DataField       =   ""
                  DataSource      =   ""
                  Enabled         =   True
                  FontName        =   "System"
                  FontSize        =   0.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_presentation_settings"
                  Italic          =   False
                  Left            =   320
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Multiline       =   False
                  Scope           =   0
                  Selectable      =   False
                  TabIndex        =   7
                  TabPanelIndex   =   2
                  TabStop         =   True
                  Text            =   "Presentation filename"
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   352
                  Transparent     =   False
                  Underline       =   False
                  Visible         =   True
                  Width           =   368
               End
               Begin RadioButton rad_external_host_impress
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  Caption         =   "OpenOffice.org Impress"
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_presentation_settings"
                  Italic          =   False
                  Left            =   320
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Scope           =   0
                  TabIndex        =   5
                  TabPanelIndex   =   2
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   296
                  Transparent     =   True
                  Underline       =   False
                  Value           =   False
                  Visible         =   True
                  Width           =   400
               End
               Begin RadioButton rad_external_host_pptview
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  Caption         =   "Microsoft PowerPoint Viewer"
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_presentation_settings"
                  Italic          =   False
                  Left            =   320
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Scope           =   0
                  TabIndex        =   3
                  TabPanelIndex   =   2
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   230
                  Transparent     =   True
                  Underline       =   False
                  Value           =   False
                  Visible         =   True
                  Width           =   400
               End
               Begin RadioButton rad_external_host_powerpoint
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  Caption         =   "Microsoft PowerPoint"
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_presentation_settings"
                  Italic          =   False
                  Left            =   320
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Scope           =   0
                  TabIndex        =   1
                  TabPanelIndex   =   2
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   184
                  Transparent     =   True
                  Underline       =   False
                  Value           =   False
                  Visible         =   True
                  Width           =   400
               End
               Begin Label lbl_external_presentation_host
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  DataField       =   ""
                  DataSource      =   ""
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_presentation_settings"
                  Italic          =   False
                  Left            =   320
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Multiline       =   False
                  Scope           =   0
                  Selectable      =   False
                  TabIndex        =   0
                  TabPanelIndex   =   2
                  TabStop         =   True
                  Text            =   "Which application should be used to run the presentation?"
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   166
                  Transparent     =   False
                  Underline       =   False
                  Visible         =   True
                  Width           =   400
               End
               Begin SEditField edt_external_presentation_file
                  AllowAutoDeactivate=   True
                  AllowFocusRing  =   True
                  AllowSpellChecking=   False
                  AllowStyledText =   False
                  AllowTabs       =   False
                  BackgroundColor =   &cFFFFFF00
                  Bold            =   False
                  Enabled         =   True
                  FontName        =   "System"
                  FontSize        =   0.0
                  FontUnit        =   0
                  Format          =   ""
                  HasBorder       =   True
                  HasHorizontalScrollbar=   False
                  HasVerticalScrollbar=   True
                  Height          =   22
                  HideSelection   =   True
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_presentation_settings"
                  Italic          =   False
                  Left            =   320
                  LineHeight      =   0.0
                  LineSpacing     =   1.0
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  MaximumCharactersAllowed=   0
                  Multiline       =   False
                  ReadOnly        =   False
                  Scope           =   0
                  TabIndex        =   8
                  TabPanelIndex   =   2
                  TabStop         =   True
                  Text            =   ""
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   374
                  Transparent     =   True
                  Underline       =   False
                  UnicodeMode     =   0
                  ValidationMask  =   ""
                  Visible         =   True
                  Width           =   400
               End
               Begin CheckBox chk_external_embed_presentation
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  Caption         =   "Include the presentation in the OpenSong set"
                  Enabled         =   False
                  FontName        =   "System"
                  FontSize        =   0.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_presentation_settings"
                  Italic          =   False
                  Left            =   320
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Scope           =   0
                  TabIndex        =   11
                  TabPanelIndex   =   2
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   425
                  Transparent     =   True
                  Underline       =   False
                  Value           =   False
                  Visible         =   True
                  VisualState     =   0
                  Width           =   400
               End
               Begin Label nte_external_host_powerpoint_info
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  DataField       =   ""
                  DataSource      =   ""
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   28
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_presentation_settings"
                  Italic          =   False
                  Left            =   340
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Multiline       =   True
                  Scope           =   0
                  Selectable      =   False
                  TabIndex        =   2
                  TabPanelIndex   =   2
                  TabStop         =   True
                  Text            =   "For full control over your PowerPoint presentation an installation of Microsoft Office is required."
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   204
                  Transparent     =   False
                  Underline       =   False
                  Visible         =   True
                  Width           =   380
               End
               Begin Label nte_external_host_pptview_info
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  DataField       =   ""
                  DataSource      =   ""
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   53
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_presentation_settings"
                  Italic          =   False
                  Left            =   340
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Multiline       =   True
                  Scope           =   0
                  Selectable      =   False
                  TabIndex        =   4
                  TabPanelIndex   =   2
                  TabStop         =   True
                  Text            =   "For showing your PowerPoint presentation without interaction, you can use the free Microsoft PowerPoint Viewer. OpenSong tries to detect it. You can set a specific viewer in the general settings."
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   250
                  Transparent     =   False
                  Underline       =   False
                  Visible         =   True
                  Width           =   380
               End
               Begin Label nte_external_host_impress_info
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  DataField       =   ""
                  DataSource      =   ""
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   26
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_presentation_settings"
                  Italic          =   False
                  Left            =   340
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Multiline       =   True
                  Scope           =   0
                  Selectable      =   False
                  TabIndex        =   6
                  TabPanelIndex   =   2
                  TabStop         =   True
                  Text            =   "For full control of an Impress or PowerPoint presentation the free OpenOffice.org suite is required."
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   316
                  Transparent     =   False
                  Underline       =   False
                  Visible         =   True
                  Width           =   380
               End
            End
            Begin GroupBox grp_external_no_application
               AllowAutoDeactivate=   True
               Bold            =   False
               Caption         =   "No application"
               Enabled         =   True
               FontName        =   "Arial"
               FontSize        =   11.0
               FontUnit        =   0
               Height          =   404
               Index           =   -2147483648
               InitialParent   =   "pge_externals"
               Italic          =   False
               Left            =   310
               LockBottom      =   True
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   True
               LockTop         =   True
               Scope           =   0
               TabIndex        =   0
               TabPanelIndex   =   1
               TabStop         =   True
               Tooltip         =   ""
               Top             =   151
               Transparent     =   True
               Underline       =   False
               Visible         =   True
               Width           =   420
               Begin Label txt_external_no_application
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  DataField       =   ""
                  DataSource      =   ""
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   174
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_no_application"
                  Italic          =   False
                  Left            =   320
                  LockBottom      =   True
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Multiline       =   True
                  Scope           =   0
                  Selectable      =   False
                  TabIndex        =   0
                  TabPanelIndex   =   1
                  TabStop         =   True
                  Text            =   "Select an application to use as source for this slides content."
                  TextAlignment   =   2
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   266
                  Transparent     =   False
                  Underline       =   False
                  Visible         =   True
                  Width           =   400
               End
            End
            Begin GroupBox grp_external_application_settings
               AllowAutoDeactivate=   True
               Bold            =   False
               Caption         =   "Application launcher settings"
               Enabled         =   True
               FontName        =   "Arial"
               FontSize        =   11.0
               FontUnit        =   0
               Height          =   404
               Index           =   -2147483648
               InitialParent   =   "pge_externals"
               Italic          =   False
               Left            =   310
               LockBottom      =   True
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   True
               LockTop         =   True
               Scope           =   0
               TabIndex        =   0
               TabPanelIndex   =   4
               TabStop         =   True
               Tooltip         =   ""
               Top             =   151
               Transparent     =   True
               Underline       =   False
               Visible         =   True
               Width           =   420
               Begin Label lbl_external_application_parameters
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  DataField       =   ""
                  DataSource      =   ""
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_application_settings"
                  Italic          =   False
                  Left            =   340
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Multiline       =   False
                  Scope           =   0
                  Selectable      =   False
                  TabIndex        =   4
                  TabPanelIndex   =   4
                  TabStop         =   True
                  Text            =   "Application parameters"
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   241
                  Transparent     =   False
                  Underline       =   False
                  Visible         =   True
                  Width           =   380
               End
               Begin Label lbl_external_application_filename
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  DataField       =   ""
                  DataSource      =   ""
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_application_settings"
                  Italic          =   False
                  Left            =   340
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Multiline       =   False
                  Scope           =   0
                  Selectable      =   False
                  TabIndex        =   1
                  TabPanelIndex   =   4
                  TabStop         =   True
                  Text            =   "Path to application executable"
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   195
                  Transparent     =   False
                  Underline       =   False
                  Visible         =   True
                  Width           =   348
               End
               Begin SButton btn_external_application_filename
                  AllowAutoDeactivate=   True
                  AllowFocus      =   False
                  AllowFocusRing  =   True
                  AllowTabs       =   False
                  Backdrop        =   0
                  DoubleBuffer    =   False
                  Enabled         =   True
                  HasFocus        =   False
                  Height          =   22
                  Icon            =   0
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_application_settings"
                  Label           =   ""
                  LabelAlign      =   0
                  Left            =   698
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   False
                  LockRight       =   True
                  LockTop         =   True
                  MenuItem        =   ""
                  NewPaint        =   False
                  Outline         =   True
                  Scope           =   0
                  StickyBevel     =   False
                  Stuck           =   False
                  TabIndex        =   3
                  TabPanelIndex   =   4
                  TabStop         =   True
                  Toggle          =   False
                  Tooltip         =   ""
                  Top             =   192
                  Transparent     =   True
                  Visible         =   True
                  Width           =   22
               End
               Begin SEditField edt_external_application_filename
                  AllowAutoDeactivate=   True
                  AllowFocusRing  =   True
                  AllowSpellChecking=   False
                  AllowStyledText =   False
                  AllowTabs       =   False
                  BackgroundColor =   &cFFFFFF00
                  Bold            =   False
                  Enabled         =   True
                  FontName        =   "System"
                  FontSize        =   0.0
                  FontUnit        =   0
                  Format          =   ""
                  HasBorder       =   True
                  HasHorizontalScrollbar=   False
                  HasVerticalScrollbar=   True
                  Height          =   22
                  HideSelection   =   True
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_application_settings"
                  Italic          =   False
                  Left            =   340
                  LineHeight      =   0.0
                  LineSpacing     =   1.0
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  MaximumCharactersAllowed=   0
                  Multiline       =   False
                  ReadOnly        =   False
                  Scope           =   0
                  TabIndex        =   2
                  TabPanelIndex   =   4
                  TabStop         =   True
                  Text            =   ""
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   217
                  Transparent     =   True
                  Underline       =   False
                  UnicodeMode     =   0
                  ValidationMask  =   ""
                  Visible         =   True
                  Width           =   380
               End
               Begin SEditField edt_external_application_parameters
                  AllowAutoDeactivate=   True
                  AllowFocusRing  =   True
                  AllowSpellChecking=   False
                  AllowStyledText =   False
                  AllowTabs       =   False
                  BackgroundColor =   &cFFFFFF00
                  Bold            =   False
                  Enabled         =   True
                  FontName        =   "System"
                  FontSize        =   0.0
                  FontUnit        =   0
                  Format          =   ""
                  HasBorder       =   True
                  HasHorizontalScrollbar=   False
                  HasVerticalScrollbar=   True
                  Height          =   22
                  HideSelection   =   True
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_application_settings"
                  Italic          =   False
                  Left            =   340
                  LineHeight      =   0.0
                  LineSpacing     =   1.0
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  MaximumCharactersAllowed=   0
                  Multiline       =   False
                  ReadOnly        =   False
                  Scope           =   0
                  TabIndex        =   5
                  TabPanelIndex   =   4
                  TabStop         =   True
                  Text            =   ""
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   264
                  Transparent     =   True
                  Underline       =   False
                  UnicodeMode     =   0
                  ValidationMask  =   ""
                  Visible         =   True
                  Width           =   380
               End
               Begin CheckBox chk_external_wait_for_application
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  Caption         =   "Wait for external application to finish before continuing"
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_application_settings"
                  Italic          =   False
                  Left            =   340
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Scope           =   0
                  TabIndex        =   6
                  TabPanelIndex   =   4
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   291
                  Transparent     =   True
                  Underline       =   False
                  Value           =   False
                  Visible         =   True
                  VisualState     =   0
                  Width           =   380
               End
               Begin RadioButton rad_external_application_start
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  Caption         =   "Start an external application"
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_application_settings"
                  Italic          =   False
                  Left            =   320
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   False
                  LockTop         =   True
                  Scope           =   0
                  TabIndex        =   0
                  TabPanelIndex   =   4
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   174
                  Transparent     =   True
                  Underline       =   False
                  Value           =   False
                  Visible         =   True
                  Width           =   310
               End
               Begin RadioButton rad_external_application_stop
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  Caption         =   "Stop any currently running launched application"
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_application_settings"
                  Italic          =   False
                  Left            =   320
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   False
                  LockTop         =   True
                  Scope           =   0
                  TabIndex        =   7
                  TabPanelIndex   =   4
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   318
                  Transparent     =   True
                  Underline       =   False
                  Value           =   False
                  Visible         =   True
                  Width           =   310
               End
            End
            Begin GroupBox grp_external_videolan_settings
               AllowAutoDeactivate=   True
               Bold            =   False
               Caption         =   "Videolan settings"
               Enabled         =   True
               FontName        =   "Arial"
               FontSize        =   11.0
               FontUnit        =   0
               Height          =   411
               Index           =   -2147483648
               InitialParent   =   "pge_externals"
               Italic          =   False
               Left            =   310
               LockBottom      =   True
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   True
               LockTop         =   True
               Scope           =   0
               TabIndex        =   0
               TabPanelIndex   =   3
               TabStop         =   True
               Tooltip         =   ""
               Top             =   151
               Transparent     =   True
               Underline       =   False
               Visible         =   True
               Width           =   420
               Begin Listbox lst_external_videolan_preset
                  AllowAutoDeactivate=   True
                  AllowAutoHideScrollbars=   True
                  AllowExpandableRows=   False
                  AllowFocusRing  =   True
                  AllowResizableColumns=   False
                  AllowRowDragging=   False
                  AllowRowReordering=   False
                  Bold            =   False
                  ColumnCount     =   1
                  ColumnWidths    =   ""
                  DefaultRowHeight=   -1
                  DropIndicatorVisible=   False
                  Enabled         =   True
                  FontName        =   "System"
                  FontSize        =   0.0
                  FontUnit        =   0
                  GridLinesHorizontalStyle=   0
                  GridLinesVerticalStyle=   0
                  HasBorder       =   True
                  HasHeader       =   False
                  HasHorizontalScrollbar=   False
                  HasVerticalScrollbar=   True
                  HeadingIndex    =   -1
                  Height          =   186
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_videolan_settings"
                  InitialValue    =   ""
                  Italic          =   False
                  Left            =   340
                  LockBottom      =   True
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  RequiresSelection=   False
                  RowSelectionType=   0
                  Scope           =   0
                  TabIndex        =   6
                  TabPanelIndex   =   3
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   281
                  Transparent     =   True
                  Underline       =   False
                  Visible         =   True
                  Width           =   380
                  _ScrollOffset   =   0
                  _ScrollWidth    =   -1
               End
               Begin RadioButton rad_external_videolan_start
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  Caption         =   "Launch Videolan"
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_videolan_settings"
                  Italic          =   False
                  Left            =   320
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   False
                  LockTop         =   True
                  Scope           =   0
                  TabIndex        =   0
                  TabPanelIndex   =   3
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   174
                  Transparent     =   True
                  Underline       =   False
                  Value           =   False
                  Visible         =   True
                  Width           =   310
               End
               Begin SButton btn_external_videolan_mediafilename
                  AllowAutoDeactivate=   True
                  AllowFocus      =   False
                  AllowFocusRing  =   True
                  AllowTabs       =   False
                  Backdrop        =   0
                  DoubleBuffer    =   False
                  Enabled         =   True
                  HasFocus        =   False
                  Height          =   22
                  Icon            =   0
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_videolan_settings"
                  Label           =   ""
                  LabelAlign      =   0
                  Left            =   698
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   False
                  LockRight       =   True
                  LockTop         =   True
                  MenuItem        =   ""
                  NewPaint        =   False
                  Outline         =   True
                  Scope           =   0
                  StickyBevel     =   False
                  Stuck           =   False
                  TabIndex        =   3
                  TabPanelIndex   =   3
                  TabStop         =   True
                  Toggle          =   False
                  Tooltip         =   ""
                  Top             =   192
                  Transparent     =   True
                  Visible         =   True
                  Width           =   22
               End
               Begin SEditField edt_external_videolan_mediafilename
                  AllowAutoDeactivate=   True
                  AllowFocusRing  =   True
                  AllowSpellChecking=   False
                  AllowStyledText =   False
                  AllowTabs       =   False
                  BackgroundColor =   &cFFFFFF00
                  Bold            =   False
                  Enabled         =   True
                  FontName        =   "System"
                  FontSize        =   0.0
                  FontUnit        =   0
                  Format          =   ""
                  HasBorder       =   True
                  HasHorizontalScrollbar=   False
                  HasVerticalScrollbar=   True
                  Height          =   22
                  HideSelection   =   True
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_videolan_settings"
                  Italic          =   False
                  Left            =   340
                  LineHeight      =   0.0
                  LineSpacing     =   1.0
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  MaximumCharactersAllowed=   0
                  Multiline       =   False
                  ReadOnly        =   False
                  Scope           =   0
                  TabIndex        =   2
                  TabPanelIndex   =   3
                  TabStop         =   False
                  Text            =   ""
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   217
                  Transparent     =   True
                  Underline       =   False
                  UnicodeMode     =   0
                  ValidationMask  =   ""
                  Visible         =   True
                  Width           =   380
               End
               Begin RadioButton rad_external_videolan_stop
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  Caption         =   "Stop any launched instance of Videolan"
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_videolan_settings"
                  Italic          =   False
                  Left            =   320
                  LockBottom      =   True
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   False
                  Scope           =   0
                  TabIndex        =   10
                  TabPanelIndex   =   3
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   537
                  Transparent     =   True
                  Underline       =   False
                  Value           =   False
                  Visible         =   True
                  Width           =   400
               End
               Begin Label lbl_external_videolan_mediafilename
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  DataField       =   ""
                  DataSource      =   ""
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_videolan_settings"
                  Italic          =   False
                  Left            =   340
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Multiline       =   False
                  Scope           =   0
                  Selectable      =   False
                  TabIndex        =   1
                  TabPanelIndex   =   3
                  TabStop         =   True
                  Text            =   "Path to media file to play"
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   195
                  Transparent     =   False
                  Underline       =   False
                  Visible         =   True
                  Width           =   348
               End
               Begin Label lbl_external_videolan_preset
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  DataField       =   ""
                  DataSource      =   ""
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_videolan_settings"
                  Italic          =   False
                  Left            =   340
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Multiline       =   False
                  Scope           =   0
                  Selectable      =   False
                  TabIndex        =   5
                  TabPanelIndex   =   3
                  TabStop         =   True
                  Text            =   "Use the following preset with parameters"
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   259
                  Transparent     =   False
                  Underline       =   False
                  Visible         =   True
                  Width           =   380
               End
               Begin Label lbl_external_videolan_manual
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  DataField       =   ""
                  DataSource      =   ""
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_videolan_settings"
                  Italic          =   False
                  Left            =   340
                  LockBottom      =   True
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   False
                  Multiline       =   False
                  Scope           =   0
                  Selectable      =   False
                  TabIndex        =   7
                  TabPanelIndex   =   3
                  TabStop         =   True
                  Text            =   "Manually adjusted parameters (use %d for display number, %s for mediafile)"
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   470
                  Transparent     =   False
                  Underline       =   False
                  Visible         =   True
                  Width           =   380
               End
               Begin SEditField edt_external_videolan_manual
                  AllowAutoDeactivate=   True
                  AllowFocusRing  =   True
                  AllowSpellChecking=   False
                  AllowStyledText =   False
                  AllowTabs       =   False
                  BackgroundColor =   &cFFFFFF00
                  Bold            =   False
                  Enabled         =   True
                  FontName        =   "System"
                  FontSize        =   0.0
                  FontUnit        =   0
                  Format          =   ""
                  HasBorder       =   True
                  HasHorizontalScrollbar=   False
                  HasVerticalScrollbar=   True
                  Height          =   22
                  HideSelection   =   True
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_videolan_settings"
                  Italic          =   False
                  Left            =   340
                  LineHeight      =   0.0
                  LineSpacing     =   1.0
                  LockBottom      =   True
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   False
                  MaximumCharactersAllowed=   0
                  Multiline       =   False
                  ReadOnly        =   False
                  Scope           =   0
                  TabIndex        =   8
                  TabPanelIndex   =   3
                  TabStop         =   True
                  Text            =   ""
                  TextAlignment   =   0
                  TextColor       =   &c00000000
                  Tooltip         =   ""
                  Top             =   492
                  Transparent     =   True
                  Underline       =   False
                  UnicodeMode     =   0
                  ValidationMask  =   ""
                  Visible         =   True
                  Width           =   380
               End
               Begin CheckBox chk_external_wait_for_videolan
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  Caption         =   "Wait for playback to finish before continuing to next slide"
                  Enabled         =   True
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_videolan_settings"
                  Italic          =   False
                  Left            =   340
                  LockBottom      =   True
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   False
                  Scope           =   0
                  TabIndex        =   9
                  TabPanelIndex   =   3
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   517
                  Transparent     =   True
                  Underline       =   False
                  Value           =   False
                  Visible         =   True
                  VisualState     =   0
                  Width           =   380
               End
               Begin CheckBox chk_external_embed_mediafile
                  AllowAutoDeactivate=   True
                  Bold            =   False
                  Caption         =   "Include the media file in the OpenSong set"
                  Enabled         =   False
                  FontName        =   "Arial"
                  FontSize        =   10.0
                  FontUnit        =   0
                  Height          =   22
                  Index           =   -2147483648
                  InitialParent   =   "grp_external_videolan_settings"
                  Italic          =   False
                  Left            =   340
                  LockBottom      =   False
                  LockedInPosition=   False
                  LockLeft        =   True
                  LockRight       =   True
                  LockTop         =   True
                  Scope           =   0
                  TabIndex        =   4
                  TabPanelIndex   =   3
                  TabStop         =   True
                  Tooltip         =   ""
                  Top             =   241
                  Transparent     =   True
                  Underline       =   False
                  Value           =   False
                  Visible         =   True
                  VisualState     =   0
                  Width           =   380
               End
            End
         End
         Begin CheckBox chk_external_print
            AllowAutoDeactivate=   True
            Bold            =   False
            Caption         =   "Print in Set List"
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   22
            Index           =   -2147483648
            InitialParent   =   "can_editor_external_slide"
            Italic          =   False
            Left            =   747
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   9
            TabPanelIndex   =   6
            TabStop         =   True
            Tooltip         =   ""
            Top             =   280
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            VisualState     =   0
            Width           =   142
         End
      End
   End
   Begin Separator sep_vertical
      AllowAutoDeactivate=   True
      Enabled         =   False
      Height          =   664
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   289
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   36
      Transparent     =   True
      Visible         =   False
      Width           =   4
   End
   Begin Separator sep_horizontal
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   4
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   32
      Transparent     =   True
      Visible         =   True
      Width           =   900
   End
   Begin Timer tmr_lookup
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Period          =   1500
      RunMode         =   1
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin imSplitter spl_main
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DockAfter       =   False
      DockAfterSize   =   635
      DockBefore      =   True
      DockBeforeSize  =   293
      DoubleBuffer    =   True
      DoubleClickAction=   1
      DrawHandles     =   False
      Enabled         =   True
      HandlesColor    =   &c00000000
      HasBackColor    =   False
      Height          =   664
      Index           =   -2147483648
      InitialParent   =   ""
      IsDocked        =   False
      IsDockedPosition=   ""
      Left            =   288
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MinAfterArea    =   640
      MinBeforeArea   =   288
      PositionBeforeDock=   0
      Scope           =   2
      SplitterColor   =   &c00000000
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   36
      Transparent     =   True
      Visible         =   True
      Width           =   10
   End
   Begin Label txt_context_help
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   31
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   3
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   470
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  App.DebugWriter.Write("Begin MainWindow.Activate", 8)
		  If Globals.Status_Presentation Then
		    #if Not TargetMacOS
		      App.MinimizeWindow(MainWindow)
		    #endif
		    
		    If PresentWindow.HelperActive Then
		      #if Not TargetWin32
		        App.RestoreWindow(PresentHelperWindow)
		        App.SetForeground(PresentHelperWindow)
		      #else
		        If PresentHelperWindow.IsWindowMinimized Then
		          App.DebugWriter.Write CurrentMethodName + ": PresentHelperWindow SW_RESTORE"
		          App.ShowWin(PresentHelperWindow,App.SW_RESTORE)
		        Else
		          App.DebugWriter.Write CurrentMethodName + ": PresentHelperWindow SW_SHOW"
		          App.ShowWin(PresentHelperWindow,App.SW_SHOW)
		        End If
		      #endif
		    Else
		      If Not (PresentWindow.XCurrentSlide = Nil Or SetML.IsExternal(PresentWindow.XCurrentSlide)) Then
		        #if Not TargetWin32
		          App.RestoreWindow(PresentWindow)
		          App.SetForeground(PresentWindow)
		        #else
		          If PresentWindow.IsWindowMinimized Then
		            App.ShowWin(PresentWindow,App.SW_RESTORE)
		          Else
		            App.ShowWin(PresentWindow,App.SW_RESTORE)
		          End If
		        #endif
		      End If
		    End If
		  End If
		  
		  If App.SplashShowing Then Splash.Show
		  
		  Dim i As Integer
		  Dim w As Window
		  App.DebugWriter.Write(CurrentMethodName + ": WindowCount=" + Str(WindowCount), 8)
		  For i = 0 To WindowCount - 1
		    w = Window(i)
		    App.DebugWriter.Write(CurrentMethodName + ": Window(" + Str(i) + ") " + Introspection.GetType(w).FullName + " '" + w.Title + "' is " + if(w.Visible, "visible", "hidden"), 8)
		    If w.Visible Then
		      If Not (w IsA PresentWindow Or w Is self Or w IsA PresentHelperWindow) Then
		        App.SetForeground(w)
		        App.DebugWriter.Write "SetForeground for window " + Str(i) + " " + w.Title
		        Exit
		      End If
		    End If
		  Next
		  App.DebugWriter.Write("End MainWindow.Activate", 8)
		End Sub
	#tag EndEvent

	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  Status_Closing = True
		  If Status_SongChanged Then
		    // Ask if user wants to save
		    If Not ActionSongAskSave Then
		      Status_Closing = False
		      Return True // User Canceled, Cancel the Close
		    End If
		  End if
		  
		  If Status_SetChanged Then
		    // Ask if user wants to save
		    If Not ActionSetAskSave Then
		      Status_Closing = False
		      Return True // User Canceled
		    End If
		  End If
		  
		  // Cancel the close if we're presenting
		  If Globals.Status_Presentation Then Return True
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  If WindowBounds = Nil Or WindowBounds.Width < Self.MinimumWidth Or WindowBounds.Height < Self.MaximumHeight Then
		    If Self.Width >= Self.MinimumWidth And Self.Height >= Self.MaximumHeight Then
		      WindowBounds = Self.Bounds
		    End If
		  End If
		  If WindowBounds <> Nil Then
		    App.MainPreferences.SetValueN(prefs.kMainWindowState + "/geometry/@top", WindowBounds.Top)
		    App.MainPreferences.SetValueN(prefs.kMainWindowState + "/geometry/@left", WindowBounds.Left)
		    App.MainPreferences.SetValueN(prefs.kMainWindowState + "/geometry/@width", WindowBounds.Width)
		    App.MainPreferences.SetValueN(prefs.kMainWindowState + "/geometry/@height", WindowBounds.Height)
		  End If
		  Dim prefState As WindowState
		  If WindowState = Globals.WindowState.Minimized Then
		    prefState = WindowStateBefore
		  Else
		    prefState = WindowState
		  End If
		  If prefState = Globals.WindowState.Minimized Then
		    prefState = Globals.WindowState.Normal
		  End If
		  App.MainPreferences.SetValueN(prefs.kMainWindowState + "/@viewstate", Integer(prefState))
		  App.MainPreferences.SetValueB(prefs.kMainWindowState + "/@minimized", WindowState = Globals.WindowState.Minimized)
		  
		  App.MainPreferences.SetValue(prefs.kCurrentSongFolder, Globals.CurrentSongFolder)
		  If pop_sets_sets.ListIndex >= 0 And pop_sets_sets.ListIndex < pop_sets_sets.ListCount Then
		    App.MainPreferences.SetValue(prefs.kLastOpenSet, pop_sets_sets.List(pop_sets_sets.ListIndex))
		  Else
		    App.MainPreferences.SetValue(prefs.kLastOpenSet, "")
		  End If
		  
		  App.MouseCursor = Nil
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  ColorPaletteBroker.UnregisterColorPaletteSource(self)
		  App.DebugWriter.Write(CurrentMethodName + ": remaining windows: " + Str(App.WindowCount), 6)
		  App.MainWindowIsOpen = False
		  #if TargetLinux And XojoVersion >= 2025 then
		    If App.WindowCount = 0 Then
		      Quit
		    End
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  UpdateMenuItems
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Keyboard.AsyncKeyDown(&h75) Then  // DELETE
		    If pge_controls.Value = 0 Then
		      If Status_SongOpen Then
		        ActionSongRemove
		        Return True
		      End If
		    Else
		      If Status_SetOpen And Status_InSetOpen Then
		        ActionInSetRemove True
		        Return True
		      End If
		    End If
		  End If
		  
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent

	#tag Event
		Sub Maximize()
		  App.DebugWriter.Write(CurrentMethodName + " Bounds=" + Bounds.ToString, 8)
		  
		  If WindowState <> Globals.WindowState.Maximized then
		    WindowStateBefore = WindowState
		  End If
		  WindowState = Globals.WindowState.Maximized
		End Sub
	#tag EndEvent

	#tag Event
		Sub Minimize()
		  App.DebugWriter.Write(CurrentMethodName + " Bounds=" + Bounds.ToString, 8)
		  
		  If WindowState <> Globals.WindowState.Minimized then
		    WindowStateBefore = WindowState
		  End If
		  WindowState = Globals.WindowState.Minimized
		End Sub
	#tag EndEvent

	#tag Event
		Sub Moved()
		  App.DebugWriter.Write(CurrentMethodName + " Bounds=" + Bounds.ToString, 8)
		  
		  If Self.Width >= Self.MinimumWidth And Self.Height >= Self.MinimumHeight Then
		    WindowBounds = Self.Bounds
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Profiler.BeginProfilerEntry "MainWindow::Open"
		  App.DebugWriter.Write "MainWindow.Open: Enter", 7
		  Dim s As String
		  Dim StartMode As Integer
		  Dim i As Integer
		  Dim bibleNames() As String
		  
		  Globals.OldFolderSel = -1
		  CurrentSetIndex = -1
		  
		  pop_sets_sets.AddRow("")
		  pop_sets_sets.DeleteAllRows
		  
		  Splash.SetStatus App.T.Translate("load_data/bible") + "..."
		  s = App.MainPreferences.GetValue(prefs.kScriptureVersion).Trim
		  If s = "" Then
		    // there is no Scripture Version configured yet
		    // use KJV if available
		    // else use the only one if exactly one is available
		    // else do not load any just yet
		    If BibleFactory.HasBible Then
		      App.MyBible = BibleFactory.GetBible("KJV")
		      If App.MyBible = Nil Then
		        Dim b() As String = BibleFactory.BibleList()
		        If b.Count = 1 Then
		          App.MyBible = BibleFactory.GetBible(b(0))
		        End If
		      End If
		    End If
		    If App.MyBible = Nil Then
		      App.DebugWriter.Write CurrentMethodName + ": No default Bible loaded", 4
		    End If
		  Else
		    App.MyBible = BibleFactory.GetBible(s)
		    If App.MyBible = Nil Then
		      App.DebugWriter.Write CurrentMethodName + ": preference Bible '" + s + "' did not load.", 4
		      
		      // Notify user that we could not load default Bible
		      
		      If App.SplashShowing Then Splash.Hide
		      
		      MsgBox App.T.Translate("errors/load_bible", s)
		      
		      
		      bibleNames = BibleFactory.BibleList
		      If UBound(bibleNames) >= 0 Then
		        // run through the list and try to load the next available Bible
		        For i = 0 To UBound(bibleNames)
		          App.MyBible = BibleFactory.GetBible(bibleNames(i))
		          If App.MyBible <> Nil Then
		            If Not s.Trim.IsEmpty Then
		              If App.SplashShowing Then Splash.Hide
		              
		              MsgBox App.T.Translate("bible/load_successful", bibleNames(i))
		            End If
		            
		            App.DebugWriter.Write CurrentMethodName + ": Successfully opened auto-selected Bible " + bibleNames(i), 5
		            App.MainPreferences.SetValue(prefs.kScriptureVersion, bibleNames(i))
		            Call App.MainPreferences.Save
		            App.DebugWriter.Write CurrentMethodName + ": Bible " + bibleNames(i) + " made new preference", 5
		            Exit For
		          End If
		          
		        Next
		      Else
		        'If no Scripture files were found, set MyBible to Nil and continue operation
		        App.MyBible = Nil
		      End If
		      If App.SplashShowing Then Splash.Show
		    Else
		      App.DebugWriter.Write CurrentMethodName + ": Successfully loaded saved Bible translation " + s, 6
		    End If
		  End If
		  
		  Splash.SetStatus App.T.Translate("load_data/songs_cache") + "..."
		  'If DocsFolder is Nil set Songs to Nil as well (and cross our fingers :)
		  If App.DocsFolder <> Nil Then
		    Songs = New FolderDB(App.DocsFolder.Child("Songs"))
		  Else
		    Songs = Nil
		  End If
		  If Songs <> Nil Then
		    Songs.SetBuiltinFilters "( " + App.T.Translate("songs_mode/song_folders/filter_all/@caption") + " )", _
		    "( " + App.T.Translate("/songs_mode/song_folders/filter_main/@caption") + " )"
		  End If
		  
		  Splash.SetStatus App.T.Translate("load_data/folders") + "..."
		  If Songs <> Nil Then
		    Call Songs.GetFolders(pop_songs_song_folders)
		  End If
		  
		  Splash.SetStatus App.T.Translate("load_data/songs") + "..."
		  If SmartML.GetValueB(App.MyMainSettings.DocumentElement, "reload/@songfolder", False, True) Then
		    Globals.CurrentSongFolder = App.MainPreferences.GetValue(prefs.kCurrentSongFolder)
		  Else
		    Globals.CurrentSongFolder = ""
		  End If
		  If Globals.CurrentSongFolder = "" Then
		    pop_songs_song_folders.ListIndex = 0
		  Else
		    For i = 0 To pop_songs_song_folders.ListCount - 1
		      If Globals.CurrentSongFolder = pop_songs_song_folders.List(i) Then
		        pop_songs_song_folders.ListIndex = i
		        Exit
		      End If
		    Next
		    // Catch the odd case where the directories have changed between runs
		    // (or the language selection affected the (Main) and (All) texts)
		    If pop_songs_song_folders.Text <> Globals.CurrentSongFolder Then
		      pop_songs_song_folders.ListIndex = 0
		      Globals.CurrentSongFolder = pop_songs_song_folders.Text
		    End If
		  End If
		  
		  
		  Status_ProgramInitialized = False 'The status window will come up otherwise...see LoadSets
		  LoadSets App.DocsFolder.Child("Sets")
		  
		  
		  LastSongPane = 0
		  LastSetPane = 2
		  
		  Try
		    If SmartML.GetValueB(App.MyMainSettings.DocumentElement, "reload/@set", False, True) Then
		      Dim lastSetName As String
		      lastSetName = App.MainPreferences.GetValue(prefs.kLastOpenSet)
		      If lastSetName.Len > 0 Then
		        For i = 0 To pop_sets_sets.ListCount - 1
		          If pop_sets_sets.List(i) = lastSetName Then
		            pop_sets_sets.ListIndex = i
		            Exit For
		          End If
		        Next
		      End If
		    End If
		  Catch
		    pop_sets_sets.ListIndex = -1
		  End Try
		  
		  StartMode = Val(SmartML.GetValue(App.MyMainSettings.DocumentElement,"startmode/@sets"))
		  If StartMode > 1 Or StartMode < 0 Then StartMode = 1
		  SetMode StartMode
		  
		  Find = New FindClass
		  
		  TranslateMe
		  
		  // try to show two lines of help text
		  // this code assumes the text can fill the complete height and there is no padding
		  // minimum text size is 8; 1 unit too small for txt_context_help.Height is tolerated
		  Try
		    Dim cp As Picture = self.BitmapForCaching(1, 1)
		    Dim g As Graphics = cp.Graphics
		    Dim testStr As String = "@" + EndOfLine + "@"
		    Dim sz As Single
		    Dim h As Double
		    g.FontName = txt_context_help.FontName
		    g.FontUnit = txt_context_help.FontUnit
		    g.FontSize = txt_context_help.FontSize
		    g.Bold = txt_context_help.Bold
		    g.Italic = txt_context_help.Italic
		    g.Underline = txt_context_help.Underline
		    h = g.TextHeight(testStr, txt_context_help.Width)
		    If h > txt_context_help.Height + 1.0 Then
		      sz = g.FontSize
		      Do 
		        If sz < 9 Then Exit
		        sz = sz - 1
		        g.FontSize = sz
		        h = g.TextHeight(testStr, txt_context_help.Width)
		      Loop Until h <= txt_context_help.Height + 1.0
		      // check half a step up
		      g.FontSize = sz + 0.5
		      h = g.TextHeight(testStr, txt_context_help.Width)
		      If h <= txt_context_help.Height + 1.0 Then
		        sz = sz + 0.5
		      End If
		      txt_context_help.FontSize = sz
		    End If
		  Catch
		  End Try
		  
		  HSizer = New HalfSizer(Me)
		  
		  'HSizer.AddWidth edf_song_lyrics, .85
		  
		  HSizer.AddWidth lbl_song_title, .5, pge_contents
		  HSizer.AddWidth edt_song_title, .5, pge_contents
		  HSizer.AddWidth lbl_song_author, .5, pge_contents
		  HSizer.AddWidth edt_song_author, .5, pge_contents
		  HSizer.AddLeftWidth lbl_song_copyright, .5, .5, pge_contents
		  HSizer.AddLeftWidth edt_song_copyright, .5, .5, pge_contents
		  HSizer.AddLeftWidth lbl_song_presentation, .5, .5, pge_contents
		  HSizer.AddLeftWidth edt_song_presentation, .5, .5, pge_contents
		  
		  'HSizer.AddLeftWidth lbl_song_hymn_number , .85, .15
		  'HSizer.AddLeft edt_song_hymn_number, .85
		  'HSizer.AddLeft lbl_song_ccli, .85
		  'HSizer.AddLeft edt_song_ccli, .85
		  'HSizer.AddLeftWidth lbl_song_insert, .85, .15
		  'HSizer.AddLeft btn_song_ins_column, .85
		  'HSizer.AddLeft btn_song_ins_comment, .85
		  'HSizer.AddLeft btn_song_ins_lyrics, .85
		  'HSizer.AddLeft btn_song_ins_multi_verse, .85
		  'HSizer.AddLeft btn_song_ins_page, .85
		  'HSizer.AddLeft btn_song_ins_section, .85
		  '
		  'HSizer.AddLeftTop grp_song_transpose, .85, .1
		  
		  HSizer.AddHeight lst_song_themes, 1, pge_contents
		  
		  'HSizer.AddTop lbl_song_linked, .9
		  'HSizer.AddTopHeight lst_song_linked, .9, .1
		  'HSizer.AddTop btn_song_add_link, 1
		  'HSizer.AddTop btn_song_remove_link, 1
		  
		  'HSizer.AddLeftWidth lbl_song_linked, .85, .15
		  'HSizer.AddLeftWidth lst_song_linked, .85, .15
		  'HSizer.AddLeftWidth btn_song_add_link, .85, .075
		  'HSizer.AddLeftWidth btn_song_remove_link, .925, .075
		  
		  ' Style canvas gets scaled seperately to maintain screen proportions; the associated enabler checkbox moves in accordance
		  ' HSizer.AddLeftTopWidthHeight can_song_style, .6, 0, .4, .4
		  ' HSizer.AddLeftTop chk_song_style, .6, .4
		  
		  HSizer.AddTopHeight lbl_song_user1, 0, 0, pge_contents
		  HSizer.AddTopHeight edt_song_user1, 0, .1, pge_contents
		  HSizer.AddTopHeight lbl_song_user2, .1, 0, pge_contents
		  HSizer.AddTopHeight edt_song_user2, .1, .1, pge_contents
		  HSizer.AddTopHeight lbl_song_user3, .2, 0, pge_contents
		  HSizer.AddTopHeight edt_song_user3, .2, .1, pge_contents
		  
		  HSizer.AddLeftWidth lbl_slide_title, 0, .33, pge_contents
		  HSizer.AddLeftWidth edt_slide_title, 0, .33, pge_contents
		  HSizer.AddLeftWidth lbl_slide_subtitle, .33, .33, pge_contents
		  HSizer.AddLeftWidth edt_slide_subtitle, .33, .33, pge_contents
		  HSizer.AddLeftWidth lbl_slide_name, .66, .33, pge_contents
		  HSizer.AddLeftWidth edt_slide_name, .66, .33, pge_contents
		  
		  HSizer.AddLeftWidth lbl_image_title, 0, .33, pge_contents
		  HSizer.AddLeftWidth edt_image_title, 0, .33, pge_contents
		  HSizer.AddLeftWidth lbl_image_subtitle, .33, .33, pge_contents
		  HSizer.AddLeftWidth edt_image_subtitle, .33, .33, pge_contents
		  HSizer.AddLeft chk_image_descriptions, .33, pge_contents
		  HSizer.AddWidth chk_image_descriptions, .66, lst_image_images  // this is an experimental value
		  HSizer.AddLeftWidth lbl_image_name, .66, .33, pge_contents
		  HSizer.AddLeftWidth edt_image_name, .66, .33, pge_contents
		  
		  HSizer.AddLeftTop can_style_style, .5, 0, pge_contents
		  
		  AddHandler HSizer.Resized, AddressOf OnAfterHsizerResized
		  
		  spl_main.AddControl(pge_controls, True)
		  spl_main.AddControl(pge_contents, False)
		  
		  // Prevent the splitter from completely obscuring the controls on the right
		  spl_main.MinAfterArea = self.MinimumWidth - pge_contents.Left
		  
		  App.DebugWriter.Write(CurrentMethodName + ": Restoring main Window: begin", 6)
		  Dim controlScreen As OpenSongUtils.OS_Screen = App.ControlScreen
		  Dim presentationScreen As OpenSongUtils.OS_Screen = App.PresentationScreen
		  Dim v As Double
		  v = App.MainPreferences.GetValueN(prefs.kMainWindowState + "/geometry/@x", -0.1234, false)
		  If v <> -0.1234 then
		    // old values saved using Window.Top, .Left, ...
		    WindowBounds = New REALbasic.Rect
		    WindowBounds.Top = v
		    WindowBounds.Left = App.MainPreferences.GetValueN(prefs.kMainWindowState + "/geometry/@y", 0.0, false)
		    WindowBounds.Width = App.MainPreferences.GetValueN(prefs.kMainWindowState + "/geometry/@width", 0.0, false)
		    WindowBounds.Height = App.MainPreferences.GetValueN(prefs.kMainWindowState + "/geometry/@height", 0.0, false)
		    App.DebugWriter.Write(CurrentMethodName + ": Restoring main Window: old settings found: " + WindowBounds.ToString, 6)
		    App.MainPreferences.Remove(prefs.kMainWindowState)
		    If WindowBounds.Width < Self.MinimumWidth Or WindowBounds.Height < Self.MinimumHeight Then
		      WindowBounds = Nil
		      App.DebugWriter.Write(CurrentMethodName + ": Restoring main Window: old settings ignored because of minimum width/height", 6)
		    Else
		      // Check if the center is on the control screen and no part is on the presentation screen
		      If controlScreen.Bounds.Contains(WindowBounds.Center) _
		        and (controlScreen.Index = presentationScreen.Index Or Not presentationScreen.Bounds.Intersects(WindowBounds)) Then
		        Self.Top = WindowBounds.Top
		        Self.Left = WindowBounds.Left
		        Self.Width = WindowBounds.Width
		        Self.Height = WindowBounds.Height
		        
		        WindowBounds = Self.Bounds
		        App.MainPreferences.SetValueN(prefs.kMainWindowState + "/geometry/@top", WindowBounds.Top)
		        App.MainPreferences.SetValueN(prefs.kMainWindowState + "/geometry/@left", WindowBounds.Left)
		        App.MainPreferences.SetValueN(prefs.kMainWindowState + "/geometry/@width", WindowBounds.Width)
		        App.MainPreferences.SetValueN(prefs.kMainWindowState + "/geometry/@height", WindowBounds.Height)
		        App.MainPreferences.SetValueN(prefs.kMainWindowState + "/@viewstate", Integer(Globals.WindowState.Normal))
		        App.MainPreferences.SetValueB(prefs.kMainWindowState + "/@minimized", false)
		        App.DebugWriter.Write(CurrentMethodName + ": Restoring main Window: old settings resulting in window bounds " + WindowBounds.ToString, 6)
		      Else
		        WindowBounds = Nil
		        App.DebugWriter.Write(CurrentMethodName + ": Restoring main Window: old settings ignored because window would not be completely on control screen", 6)
		      End If
		    End If
		  Else
		    WindowBounds = New REALbasic.Rect
		    WindowBounds.Top = App.MainPreferences.GetValueN(prefs.kMainWindowState + "/geometry/@top", 0.0, false)
		    WindowBounds.Left = App.MainPreferences.GetValueN(prefs.kMainWindowState + "/geometry/@left", 0.0, false)
		    WindowBounds.Width = App.MainPreferences.GetValueN(prefs.kMainWindowState + "/geometry/@width", 0.0, false)
		    WindowBounds.Height = App.MainPreferences.GetValueN(prefs.kMainWindowState + "/geometry/@height", 0.0, false)
		    App.DebugWriter.Write(CurrentMethodName + ": Restoring main Window: stored bounds " + WindowBounds.ToString, 6)
		    If WindowBounds.Width < Self.MinimumWidth Or WindowBounds.Height < Self.MinimumHeight Then
		      WindowBounds = Nil
		      App.DebugWriter.Write(CurrentMethodName + ": Restoring main Window: stored bounds ignored because of minimum width/height", 6)
		    Else
		      // Check if the center is on the control screen and no part is on the presentation screen
		      If controlScreen.Bounds.Contains(WindowBounds.Center) _
		        and (controlScreen.Index = presentationScreen.Index Or Not presentationScreen.Bounds.Intersects(WindowBounds)) Then
		        If WindowBounds.Top < controlScreen.AvailableTop Or WindowBounds.Left < controlScreen.AvailableLeft Or WindowBounds.Height > controlScreen.AvailableHeight Then
		          If WindowBounds.Left < controlScreen.AvailableLeft Then 
		            WindowBounds.Left = controlScreen.AvailableLeft
		            If WindowBounds.Width > controlScreen.AvailableWidth Then WindowBounds.Width = Min(controlScreen.AvailableWidth, Self.MinimumWidth)
		          End If
		          If WindowBounds.Top < controlScreen.AvailableTop Then WindowBounds.Top = controlScreen.AvailableTop
		          If WindowBounds.Height > controlScreen.AvailableHeight Then WindowBounds.Height = Min(controlScreen.AvailableHeight, Self.MinimumHeight)
		          App.DebugWriter.Write(CurrentMethodName + ": Restoring main Window: stored bounds adjusted: " + WindowBounds.ToString, 6)
		        End If
		        
		        Self.Bounds = WindowBounds
		        Dim viewstate As Integer = App.MainPreferences.GetValueN(prefs.kMainWindowState + "/@viewstate", Integer(Globals.WindowState.Normal), false)
		        If Globals.WindowState(viewstate) = Globals.WindowState.Maximized Then
		          Self.Maximize
		        End If
		      Else
		        WindowBounds = Nil
		        App.DebugWriter.Write(CurrentMethodName + ": Restoring main Window: stored bounds ignored because window would not be completely on control screen", 6)
		      End If
		    End If
		  End If
		  
		  If WindowBounds = Nil Then
		    App.MaximizeInControlScreen Me
		  End If
		  App.DebugWriter.Write(CurrentMethodName + ": Restoring main Window: end " + self.Bounds.ToString + If(self.WindowState = Globals.WindowState.Maximized, " maximized", ""), 6)
		  
		  Profiler.EndProfilerEntry
		  Splash.SetStatus App.T.Translate("welcome")
		  Splash.SlowClose
		  Me.Visible = True
		  Select Case StartMode
		  Case 0 // Songs
		    lst_songs_songs.SetFocus
		  Case 1 // Sets
		    pop_sets_sets.SetFocus
		  End Select
		  SetSplitterPosition
		  App.MainWindowIsOpen = True
		  
		  ColorPaletteBroker.RegisterColorPaletteSource(self)
		  
		  App.DebugWriter.Write "MainWindow.Open: Exit", 7
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  ' left side
		  g.ForeColor = DarkBevelColor
		  g.FillOval 3, 9, 2, 2
		  g.FillOval 3, 14, 2, 2
		  g.FillOval 3, 19, 2, 2
		  g.ForeColor = LightBevelColor
		  g.FillOval 4, 10, 2, 2
		  g.FillOval 4, 15, 2, 2
		  g.FillOval 4, 20, 2, 2
		  
		  ' right side
		  g.ForeColor = DarkBevelColor
		  g.FillOval g.Width - 6, 9, 2, 2
		  g.FillOval g.Width - 6, 14, 2, 2
		  g.FillOval g.Width - 6, 19, 2, 2
		  g.ForeColor = LightBevelColor
		  g.FillOval g.Width - 5, 10, 2, 2
		  g.FillOval g.Width - 5, 15, 2, 2
		  g.FillOval g.Width - 5, 20, 2, 2
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  App.DebugWriter.Write(CurrentMethodName, 8)
		  App.DebugWriter.Write(CurrentMethodName + " Bounds=" + Bounds.ToString, 8)
		  
		  DoWindowResize
		  Refresh True
		  if Self.Width >= Self.MinimumWidth And Self.Height >= Self.MinimumHeight Then
		    WindowBounds = Self.Bounds
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  App.DebugWriter.Write(CurrentMethodName, 8)
		  
		  DoWindowResize
		End Sub
	#tag EndEvent

	#tag Event
		Sub Restore()
		  App.DebugWriter.Write(CurrentMethodName + " Bounds=" + Bounds.ToString, 8)
		  
		  If WindowState <> Globals.WindowState.Normal then
		    WindowStateBefore = WindowState
		  End If
		  WindowState = Globals.WindowState.Normal
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function mnu_edit_find() As Boolean Handles mnu_edit_find.Action
		  Find
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_edit_find_next() As Boolean Handles mnu_edit_find_next.Action
		  FindNext
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_edit_interleave() As Boolean Handles mnu_edit_interleave.Action
		  If edf_song_lyrics.Active Then
		    Dim lines() As String
		    If GetSelectedLines(edf_song_lyrics, lines, True) Then
		      If ActionSongInterleave(lines) Then
		        edf_song_lyrics.SelText = Join(lines, SmartML.Newline.Left(1))
		      End If
		    End If
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_file_dual_screen() As Boolean Handles mnu_file_dual_screen.Action
		  If OSScreenCount() = 1 Then
		    InputBox.Message App.T.Translate("errors/no_multi_screen")
		  Else
		    If pge_controls.Value = 0 Then
		      ActionSongPresent PresentWindow.MODE_DUAL_SCREEN
		    Else
		      ActionSetPresent PresentWindow.MODE_DUAL_SCREEN
		    End If
		  End If
		  
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_file_new() As Boolean Handles mnu_file_new.Action
		  If pge_controls.Value = 0 Then
		    ActionSongNew
		  Else
		    ActionSetNew
		  End If
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_file_pagesetup() As Boolean Handles mnu_file_pagesetup.Action
		  //++
		  // Handler for Print Setup
		  //
		  // Get page data from either
		  //     (a) Margins defined in PrintSettingsWindow
		  //     (b) Previously store PrinterSetup object
		  //
		  // Ed Palmer, 01/06
		  //
		  Dim ps As PrinterSetup
		  
		  ps = App.GetPrinterSetup(True, Self)
		  'Dim SetupString As String
		  '
		  '// Is there a valid PrinterSetup in the App?
		  '
		  'If App.PrinterSettings = Nil Then
		  '
		  'App.PrinterSettings = New PrinterSetup
		  '
		  '// Check for an existing setup string first
		  '
		  'SetupString = DecodeBase64(SmartML.GetValue(App.MyPrintSettings.DocumentElement, "printersetup", False))
		  'If SetupString <> "" Then
		  '// Build the PrinterSetup object
		  'App.PrinterSettings.SetupString = SetupString
		  'Else
		  '// Default it to max resolution
		  'App.PrinterSettings.MaxHorizontalResolution = -1
		  'App.PrinterSettings.MaxVerticalResolution = -1
		  'End If
		  '
		  'End If
		  '// Present the setup dialog
		  '
		  'If App.PrinterSettings.PageSetupDialog Then
		  'SmartML.SetValue(App.MyPrintSettings.DocumentElement, "printersetup", EncodeBase64(App.PrinterSettings.SetupString))
		  'End If
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_file_preview_dual_screen() As Boolean Handles mnu_file_preview_dual_screen.Action
		  If pge_controls.Value = 0 Then
		    ActionSongPresent PresentWindow.MODE_PREVIEW
		  Else
		    ActionSetPresent PresentWindow.MODE_PREVIEW
		  End If
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_file_print() As Boolean Handles mnu_file_print.Action
		  If pge_controls.Value = 0 Then
		    ActionSongPrint
		  Else
		    ActionSetPrintList
		  End If
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_file_print_alphabetical_toc() As Boolean Handles mnu_file_print_alphabetical_toc.Action
		  //
		  // Worked over to reflect report object model introduced in V1.0Beta2
		  //
		  // Ed Palmer, February 2006
		  //
		  Dim i As Integer
		  Dim AlphaTOC As New AlphaTOCReport
		  
		  App.DebugWriter.Write "MainWindow.mnu_file_print_alphabetical_toc.Action: Enter"
		  
		  If lst_songs_songs.ListCount = 0 Then
		    InputBox.Message App.T.Translate("errors/no_songs")
		    Return False
		  End If
		  
		  //++
		  // Feature request 1528693: require confirmation
		  //--
		  If Not InputBox.AskYN(App.T.Translate("questions/long_operation/@caption")) Then Return False
		  
		  If Not AlphaTOC.Setup Then Return False
		  
		  For i = 0 To lst_songs_songs.ListCount - 1
		    AlphaTOC.AddItem lst_songs_songs.List(i)
		  Next i
		  
		  If Not AlphaTOC.Prepare Then
		    InputBox.Message App.T.Translate("errors/internal") + EndOfLine +_
		    "MainWindow, Print Alphabetical TOC, Prepare failed"
		    App.DebugWriter.Write "MainWindow.mnu_file_print_alphabetical_toc.Action: " +_
		    "AlphaTOCReport.PrepareReport returned False", 1
		    Return True
		  End If
		  
		  If Not AlphaTOC.Generate Then
		    InputBox.Message App.T.Translate("errors/internal") + EndOfLine +_
		    "MainWindow, Print Alphabetical TOC, Generate failed"
		    App.DebugWriter.Write "MainWindow.mnu_file_print_alphabetical_toc.Action: " +_
		    "AlphaTOCReport.Generate returned False", 1
		    Return True
		  End If
		  
		  PrintWindow.SetReport AlphaTOC
		  PrintWindow.Left = Self.Left + 20
		  PrintWindow.Top = Self.Top + 20
		  PrintWindow.Width = Self.Width - 40
		  PrintWindow.Height = Self.Height - 40
		  PrintWindow.ShowModalWithin Self
		  App.DebugWriter.Write "MainWindow.mnu_file_print_alphabetical_toc.Action: Exit"
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_file_print_categorical_toc() As Boolean Handles mnu_file_print_categorical_toc.Action
		  //
		  // Worked over to reflect report object model introduced in V1.0Beta2
		  //
		  // Ed Palmer, February 2006
		  //
		  Dim i As Integer
		  Dim CatTOC As New CategoryTOCReport
		  
		  App.DebugWriter.Write "MainWindow.mnu_file_print_categorical_toc.Action: Enter"
		  
		  If lst_songs_songs.ListCount = 0 Then
		    InputBox.Message App.T.Translate("errors/no_songs")
		    Return False
		  End If
		  
		  //++
		  // Feature request 1528693: require confirmation
		  //--
		  If Not InputBox.AskYN(App.T.Translate("questions/long_operation/@caption")) Then Return False
		  
		  If Not CatTOC.Setup Then Return False
		  
		  For i = 0 To lst_songs_songs.ListCount - 1
		    CatTOC.AddSong Songs.CombinePath(lst_songs_songs.CellTagAt(i, 0), lst_songs_songs.List(i))
		  Next i
		  
		  If Not CatTOC.Prepare Then
		    InputBox.Message App.T.Translate("errors/internal") + EndOfLine +_
		    "MainWindow, Print Categorical TOC, Prepare failed"
		    App.DebugWriter.Write "MainWindow.mnu_file_print_categorical_toc.Action: " +_
		    "CategoryTOCReport.Prepare returned False", 1
		    Return True
		  End If
		  
		  If Not CatTOC.Generate Then
		    InputBox.Message App.T.Translate("errors/internal") + EndOfLine +_
		    "MainWindow, Print Categorical TOC, Generate failed"
		    App.DebugWriter.Write "MainWindow.mnu_file_print_categorical_toc.Action: " +_
		    "CategoryTOCReport.Generate returned False", 1
		    Return True
		  End If
		  
		  PrintWindow.SetReport CatTOC
		  PrintWindow.Left = Self.Left + 20
		  PrintWindow.Top = Self.Top + 20
		  PrintWindow.Width = Self.Width - 40
		  PrintWindow.Height = Self.Height - 40
		  PrintWindow.ShowModalWithin Self
		  App.DebugWriter.Write "MainWindow.mnu_file_print_categorical_toc.Action: Exit"
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_file_save() As Boolean Handles mnu_file_save.Action
		  If pge_controls.Value = 0 Then
		    If Status_SongChanged Then ActionSongSave
		  Else
		    If Status_SetChanged Then ActionSetSave
		  End If
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_file_scripture() As Boolean Handles mnu_file_scripture.Action
		  ActionSetAddScripture
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_file_single_screen() As Boolean Handles mnu_file_single_screen.Action
		  If pge_controls.Value = 0 Then
		    ActionSongPresent PresentWindow.MODE_SINGLE_SCREEN
		  Else
		    ActionSetPresent PresentWindow.MODE_SINGLE_SCREEN
		  End If
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_file_song_act() As Boolean Handles mnu_file_song_act.Action
		  saWin = New SongActivity
		  saWin.ActLog = Globals.SongActivityLog
		  saWin.FromFile = false
		  saWin.RefreshList
		  saWin.btn_act_merge.Enabled = false
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_help_about() As Boolean Handles mnu_help_about.Action
		  AboutWindow.ShowModalWithin Self
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_help_help_topics() As Boolean Handles mnu_help_help_topics.Action
		  HelpWindow.ShowModalWithin Self
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_help_translating() As Boolean Handles mnu_help_translating.Action
		  InputBox.Message App.T.Translate("about/translating")
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_help_user_manual() As Boolean Handles mnu_help_user_manual.Action
		  ShowURL "http://www.opensong.org/d/manual"
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_mode_sets() As Boolean Handles mnu_mode_sets.Action
		  SetMode 1
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_mode_songs() As Boolean Handles mnu_mode_songs.Action
		  SetMode 0
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_settings_general() As Boolean Handles mnu_settings_general.Action
		  MainSettingsWindow.ShowModalWithin MainWindow
		  App.InitControlServer()
		  lst_set_items.Invalidate(True)
		  LoadSongThemes()
		  App.vMixEnabled = App.MainPreferences.GetValueB(prefs.kvMixEnable)
		  If App.NDIEnabled Xor App.MainPreferences.GetValueB(prefs.kNDIEnableSender, False, True) Then
		    App.NDIEnabled = Not App.NDIEnabled
		    If App.NDIEnabled Then
		      App.NDISingleton = NDI.NDI  // init NDI
		    End If
		  End If
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_settings_install_module() As Boolean Handles mnu_settings_install_module.Action
		  Dim file As FolderItem
		  Dim XMM As New FileType
		  
		  Dim newBible As Bible
		  
		  XMM = FileTypes.OpenSongModule
		  XMM.Name = App.T.Translate("module/file_type")
		  XMM.Extensions = "xmm"
		  XMM.MacType = "XMM"
		  
		  file = GetOpenFolderItem(XMM)
		  
		  If file = Nil Then Return False
		  
		  Dim toChild As String
		  
		  Dim xfile As XmlDocument
		  App.MouseCursor = System.Cursors.Wait
		  xfile = SmartML.XDocFromFile(file)
		  App.MouseCursor = Nil
		  If xfile = Nil Then
		    InputBox.Message App.T.Translate("module/read_error")
		    Return False
		  End If
		  
		  Dim moduleType As String = xfile.DocumentElement.Name
		  If moduleType = "bible" Then
		    toChild = "OpenSong Scripture"
		  ElseIf xfile.DocumentElement.Name = "language" Then
		    toChild = "OpenSong Languages"
		  Else
		    InputBox.Message App.T.Translate("module/format_error")
		    Return False
		  End If
		  
		  file.MoveFileTo App.AppFolder.Child(toChild)
		  If file.LastErrorCode <> 0 Then
		    FileUtils.SetLastError(file)
		    InputBox.Message App.T.Translate("module/move_error", App.AppFolder.Child(toChild).NativePath) + " (" + FileUtils.LastError + ")"
		    Return False
		  End If
		  file = App.AppFolder.Child(toChild).Child(file.Name)
		  If file = Nil Or file.LastErrorCode <> 0 Then
		    FileUtils.SetLastError(file)
		    InputBox.Message App.T.Translate("module/move_error", App.AppFolder.Child(toChild).NativePath) + " (" + FileUtils.LastError + ")"
		    Return False
		  End If
		  
		  If InStr(file.Name, ".") > 0 Then file.Name = Left(file.Name, StringUtils.InStrReverse(file.Name, ".") - 1)
		  If file.LastErrorCode <> 0 Then
		    InputBox.Message App.T.Translate("module/rename_error", App.AppFolder.Child(toChild).NativePath)
		    Return False
		  End If
		  
		  //++
		  // If a Bible, offer to generate the index now.
		  //--
		  If moduleType = "bible" Then
		    newBible = New Bible
		    App.MouseCursor = System.Cursors.Wait
		    If Not newBible.LoadBible(file) Then
		      App.MouseCursor = Nil
		      InputBox.Message(App.T.Translate("module/generate_error", file.NativePath))
		      Return True
		    End If
		    
		    'Bible added successfully
		    'If no other Bibles are installed make this the default
		    If  App.MyBible = Nil Then
		      App.MyBible = newbible
		      App.MainPreferences.SetValue(prefs.kScriptureVersion, file.Name)
		    End If
		  End If
		  
		  App.MouseCursor = Nil
		  
		  InputBox.Message App.T.Translate("module/success")
		  
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_settings_presentation() As Boolean Handles mnu_settings_presentation.Action
		  PresentSettingsWindow.ShowModalWithin MainWindow
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_settings_print() As Boolean Handles mnu_settings_print.Action
		  PrintSettingsWindow.ShowModalWithin MainWindow
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_settings_refresh_sets() As Boolean Handles mnu_settings_refresh_sets.Action
		  If Not ActionSetAskSave Then Return True
		  
		  LoadSets App.DocsFolder.Child("Sets")
		  
		  If CurrentSetIndex >= 0 And CurrentSetName <> "" And pop_sets_sets.ListCount > 0 Then
		    If LoadSet(CurrentSetName) Then
		      Return True
		    End If
		  End If
		  
		  lst_set_items.DeleteAllRows
		  pop_sets_sets.ListIndex = -1
		  
		  EnableMenuItems
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function mnu_settings_refresh_songs() As Boolean Handles mnu_settings_refresh_songs.Action
		  'Ask if user wants to save
		  If Not ActionSongAskSave Then Return True 'User Canceled
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  Dim songFolder As String
		  Dim songName As String
		  Dim songPath As String
		  Dim foldersListIndex As Integer
		  Dim songsListIndex As Integer
		  Dim songsListPosition As Integer
		  
		  foldersListIndex = pop_songs_song_folders.ListIndex
		  songsListIndex = lst_songs_songs.ListIndex
		  If foldersListIndex >= 0 Then
		    songFolder = pop_songs_song_folders.Text
		  End If
		  If songsListIndex >= 0 Then
		    songName = lst_songs_songs.Text
		    songPath = lst_songs_songs.CellTag(lst_songs_songs.ListIndex, 0).StringValue
		    songsListPosition = songsListIndex - lst_songs_songs.ScrollPosition
		  End If
		  
		  Status_SongOpen = False
		  Status_SongChanged = False
		  If Not Songs.RefreshCache Then
		    InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", App.DocsFolder.Child("Songs").NativePath)
		  End If
		  
		  Call Songs.GetFolders(pop_songs_song_folders)
		  
		  If foldersListIndex >= pop_songs_song_folders.ListCount Then
		    foldersListIndex = -1
		  End If
		  If foldersListIndex >= 0 And pop_songs_song_folders.List(foldersListIndex) <> songFolder Then
		    foldersListIndex = pop_songs_song_folders.ListCount - 1
		    While foldersListIndex >= 0
		      If pop_songs_song_folders.List(foldersListIndex) = songFolder Then Exit
		      foldersListIndex = foldersListIndex - 1
		    Wend
		  End If
		  Globals.OldFolderSel = -1 // trigger reload of lst_songs_songs
		  If foldersListIndex < 0 Then
		    pop_songs_song_folders.ListIndex = 0
		  Else
		    // the old folder is re-used
		    Globals.OldSongSel = -1 // do not reload a song in the editor yet when change of folder triggers reload of lst_songs_songs
		    pop_songs_song_folders.ListIndex = foldersListIndex
		    
		    // Now check the song
		    If songsListIndex >= lst_songs_songs.ListCount Then
		      songsListIndex = -1
		    End If
		    If songsListIndex >= 0 And (lst_songs_songs.List(songsListIndex) <> songName Or lst_songs_songs.CellTag(songsListIndex, 0).StringValue <> songPath) Then
		      songsListIndex = lst_songs_songs.ListCount - 1
		      While songsListIndex >= 0
		        If lst_songs_songs.List(songsListIndex) = songName And lst_songs_songs.CellTag(songsListIndex, 0).StringValue = songPath Then
		          Exit
		        End If
		        songsListIndex = songsListIndex - 1
		      Wend
		    End If
		    If songsListIndex < 0 Then
		      Globals.OldSongSel = 0
		      lst_songs_songs.ListIndex = -1
		    Else
		      // the song is found
		      lst_songs_songs.ListIndex = -1
		      Globals.OldSongSel = songsListIndex + 1
		      lst_songs_songs.ListIndex = songsListIndex
		      lst_songs_songs.ScrollPosition = Max(0, songsListIndex - songsListPosition)
		    End If
		  End If
		  
		  EnableMenuItems
		  App.MouseCursor = Nil
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub ActionInSetAddSlide(xslide As XmlNode)
		  If Status_SetOpen Then
		    Status_SetChanged = True
		    ' No need to EnableMenuItems, since the following selection change will call it
		    
		    Dim set_item_index As Integer = 0
		    
		    If lst_set_items.ListIndex >= 0 Then
		      lst_set_items.InsertRow lst_set_items.ListIndex + 1, SetML.GetSlideGroupCaption(xslide)
		      set_item_index = lst_set_items.ListIndex + 1
		    Else
		      lst_set_items.AddRow SetML.GetSlideGroupCaption(xslide)
		      set_item_index = lst_set_items.ListCount - 1
		    End If
		    
		    lst_set_items.CellTag(set_item_index, 0) = SmartML.GetValue(xslide, "@type", True)
		    lst_set_items.ListIndex = set_item_index
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ActionInSetAskSave() As Boolean
		  //
		  // Check to see if the current set has been changed
		  // if so, give the user a chance to save it before continuing
		  // with an action that will throw away the changes
		  //
		  // JRC 1/27/2007
		  'Changed to return whether the user canceled or not
		  ' EMP 12/06: Move guts of doing the message dialog to a utility method
		  ' so it can be reused by sets mode and other areas.
		  ' EMP 18 Sep 2007: Make certain the InSetItem is valid
		  '     because this may have been triggered by lst_set_items.DeleteAllItems
		  
		  If Status_InSetChanged And (CurrentInSetItem < lst_set_items.ListCount) Then
		    '++JRC
		    Select Case SaveDialog( App.T.Translate("questions/save/@caption", lst_set_items.Cell(CurrentInSetItem, 0)))
		    Case 1
		      'User pressed Yes, so save
		      If Not ActionInSetSave() Then
		        Return False
		      End If
		    Case 0
		      //++EMP:
		      // Don't reset the modified flag, otherwise the user could select not to save,
		      // change his mind, and then have no way to save changes (Save doesn't enable
		      // unless the SongChanged flag is True).  Set Status_MadUser = True
		      //
		    Case -1
		      'user pressed Cancel, go back
		      Return False
		    End Select
		    '--
		  End If
		  
		  'Return True, meaning user wants to continue with/without saving
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionInSetCopy()
		  Dim xgroups, oldGroup As XmlNode
		  // Ask if user wants to save
		  If Not ActionInSetAskSave Then Return  // User Canceled
		  
		  xgroups = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True)
		  oldGroup = xgroups.Child(lst_set_items.ListIndex)
		  
		  Dim c As New Clipboard
		  c.AddRawData oldGroup.ToString, CopyTypes.SetSlides.MacType
		  c.close
		  
		  EnableMenuItems
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionInSetImageRemove()
		  // does not do anything special to lst_image_images, just deletes selected rows
		  
		  Dim listindex As Integer
		  Dim imgRemoved As Boolean
		  Dim selCnt As Integer
		  
		  listindex = lst_image_images.ListIndex
		  selCnt = lst_image_images.SelCount
		  If selCnt > 1 Then
		    For row As Integer = lst_image_images.ListCount - 1 DownTo 0
		      If lst_image_images.Selected(row) Then
		        lst_image_images.RemoveRow(row)
		        imgRemoved = True
		        selCnt = selCnt - 1
		        If selCnt = 0 Then Exit
		      End If
		    Next
		  ElseIf lst_image_images.ListIndex > -1 Then
		    lst_image_images.RemoveRow(lst_image_images.ListIndex)
		    imgRemoved = True
		  End If
		  
		  If imgRemoved Then
		    If listindex >= lst_image_images.ListCount Then
		      listindex = lst_image_images.ListCount - 1
		    End If
		    lst_image_images.ListIndex = listindex
		    
		    Status_InSetChanged = True
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionInSetPaste()
		  '++gerritp
		  Dim text As String
		  Dim xgroups, oldGroup, newGroup As XmlNode
		  dim xml as XmlDocument
		  'Ask if user wants to save
		  If NOT ActionInSetAskSave Then Return 'User Canceled
		  
		  Dim c As New Clipboard
		  If c.RawDataAvailable(CopyTypes.SetSlides.MacType) Then
		    text = c.RawData(CopyTypes.SetSlides.MacType)
		    If Left(text,12) = "<slide_group" Then
		      xml = SmartML.XDocFromString(text)
		      If IsNull(xml) Then
		        InputBox.Message App.T.Translate("sets_mode/errors/insert/@caption", SmartML.ErrorString)
		      Else
		        xgroups = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True)
		        oldGroup = xml.FirstChild
		        
		        newGroup = SmartML.InsertChild(xgroups, "slide_group", lst_set_items.ListIndex + 1)
		        
		        ActionInSetAddSlide oldGroup
		        
		        SmartML.CloneChildren oldGroup, newGroup
		        SmartML.CloneAttributes oldGroup, newGroup
		        
		        Status_SetChanged = True
		        
		      End If
		    End If
		  End If
		  c.Close()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionInSetRemove(autoDetectDeleteTarget As Boolean)
		  Dim slide_groups As XmlNode
		  Dim listindex As Integer
		  
		  'if in a lst_images only delete the selected picture, not the whole slide.
		  If autoDetectDeleteTarget = True And pge_contents.value = 4 And lst_image_images.HasFocus() Then
		    ActionInSetImageRemove
		    
		  Else
		    listindex = lst_set_items.ListIndex
		    If listindex > -1 Then
		      slide_groups = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True)
		      slide_groups.RemoveChild slide_groups.Child(listindex)
		      '++JRC Prevent OutofBounds Exception
		      Status_InSetChanged = False
		      '--
		      '++JRC Fix issue where Currently selected  Set Item was not updating after removing an item from set list
		      CurrentInSetItem = -2
		      '--
		      lst_set_items.RemoveRow listindex
		      If listindex < lst_set_items.ListCount Then
		        lst_set_items.ListIndex = listindex
		      ElseIf listindex = lst_set_items.ListCount Then
		        lst_set_items.ListIndex = listindex - 1
		      End If
		      
		      Status_SetChanged = True
		    End If
		  End If
		  
		  EnableMenuItems
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ActionInSetSave() As Boolean
		  Dim i As Integer
		  Dim str As String
		  Dim xgroup, xslides, xslide As XmlNode
		  Dim bodies() As String
		  Dim img As StyleImage
		  
		  If Not Status_InSetChanged Then Return True
		  
		  xgroup = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True).Child(CurrentInSetItem)
		  
		  Select Case SmartML.GetValue(xgroup, "@type")
		    
		  Case "song"
		    SmartML.SetValue xgroup, "@presentation", edt_slide_order.Text
		    SmartML.SetValueN xgroup, "@transition", pop_slide_transition.ListIndex
		    If edt_slide_notes.Text <> "" Then
		      SmartML.SetValue xgroup, "notes", edt_slide_notes.Text
		    Else
		      SmartML.RemoveNode xgroup, "notes"
		    End If
		    
		  Case "image"
		    SmartML.SetValue xgroup, "@name", edt_image_name.Text
		    SmartML.SetValue xgroup, "title", edt_image_title.Text
		    SmartML.SetValue xgroup, "subtitle", edt_image_subtitle.Text
		    SmartML.SetValueB xgroup, "@descriptions_in_subtitle", chk_image_descriptions.Value
		    SmartML.SetValue xgroup, "notes", edt_image_notes.Text
		    SmartML.SetValueN xgroup, "@seconds", Val(edt_image_auto_advance.Text)
		    SmartML.SetValueB xgroup, "@loop", chk_image_loop.Value
		    SmartML.SetValueB xgroup, "@print", chk_image_print.Value
		    SmartML.SetValueN xgroup, "@transition", pop_image_transition.ListIndex
		    
		    If chk_image_fit_to_screen.Value Then
		      SmartML.SetValue xgroup, "@resize", "screen"
		    ElseIf chk_image_fit_to_body.Value Then
		      SmartML.SetValue xgroup, "@resize", "body"
		    Else
		      SmartML.SetValue xgroup, "@resize", ""
		    End If
		    SmartML.SetValueB xgroup, "@keep_aspect", chk_image_keepaspect.Value
		    SmartML.SetValueB xgroup, "@link", chk_image_store_as_link.Value
		    
		    ' Delete the old slides
		    xslides = SmartML.GetNode(xgroup, "slides", False)
		    If xslides <> Nil Then xgroup.RemoveChild xslides
		    
		    ' Create the new slides
		    xslides = xgroup.AppendChild(CurrentSet.CreateElement("slides"))
		    str = edf_slide_slides.Text
		    Dim bgpath As String = App.DocsFolder.Child("Backgrounds").NativePath
		    Dim docpath As String = App.DocsFolder.NativePath
		    
		    For i = 0 To lst_image_images.ListCount()-1
		      xslide = xslides.AppendChild(CurrentSet.CreateElement("slide"))
		      img = lst_image_images.GetImage( i )
		      
		      Dim filename As String = img.GetImageFilename()
		      If filename.StartsWith(bgpath) And _
		        (chk_image_store_as_link.Value Or ImageDefaults.LinkToBackgroundsFolder) Then
		        SmartML.SetValue xslide, "filename", filename.Mid(bgpath.Len()+1)
		      ElseIf chk_image_store_as_link.Value And filename <> "" Then
		        If filename.StartsWith(docpath) Then
		          SmartML.SetValue xslide, "filename", "../" + filename.Mid(docpath.Len()+1)
		        Else
		          SmartML.SetValue xslide, "filename", filename
		        End If
		      Else
		        SmartML.SetValue xslide, "image", img.GetImageAsString
		      End If
		      SmartML.SetValue xslide, "description", lst_image_images.Cell( i, 1 )
		    Next i
		    
		    can_image_style.PreviewSlide = GetImageSlideStylePreviewSlide(SmartML.GetNode(xgroup, "slides/slide"))
		    lst_set_items.List(CurrentInSetItem) = SetML.GetSlideGroupCaption(xgroup)
		    
		  Case "external"
		    If btn_external_presentation.Stuck() Then
		      If chk_external_embed_presentation.Enabled Then
		        Dim f As FolderItem
		        If Trim(edt_external_presentation_file.Text) <> "" Then f = GetFolderItem(edt_external_presentation_file.Text)
		        If f = Nil Then
		          MsgBox(App.T.Translate("errors/fileutils/invalidname", edt_external_presentation_file.Text))
		          Return False
		        ElseIf f.Exists() Then
		          If chk_external_embed_presentation.Value Then
		            Dim inputStream As BinaryStream = BinaryStream.Open(f, False)
		            SmartML.SetValue xgroup, "file", EncodeBase64(inputStream.Read(f.Length))
		            SmartML.SetValue xgroup, "@filename", f.Name
		            inputStream.Close
		            
		            chk_external_embed_presentation.Enabled = False
		          Else
		            SmartML.SetValueFI xgroup, "@filename", f
		          End If
		        Else
		          MsgBox(App.T.Translate("errors/fileutils/filenotfound", f.NativePath))
		          Return False
		        End If
		      Else
		        SmartML.SetValue xgroup, "@filename", edt_external_presentation_file.Text
		      End If
		      
		      SmartML.SetValue xgroup, "@application", "presentation"
		      
		      If rad_external_host_powerpoint.Value Then
		        SmartML.SetValue xgroup, "@host", "ppt"
		      ElseIf rad_external_host_pptview.Value Then
		        SmartML.SetValue xgroup, "@host", "pptview"
		      ElseIf rad_external_host_impress.Value Then
		        SmartML.SetValue xgroup, "@host", "impress"
		      End If
		      
		      SmartML.SetValueB xgroup, "@loop_presentation", chk_external_loop_presentation.Value
		      
		    ElseIf btn_external_videolan.Stuck() Then
		      SmartML.SetValue xgroup, "@application", "videolan"
		      
		      If rad_external_videolan_start.Value Then
		        SmartML.SetValue xgroup, "@action", "start"
		      ElseIf rad_external_videolan_stop.Value Then
		        SmartML.SetValue xgroup, "@action", "stop"
		      End If
		      Dim videoLanPresetParams As String
		      If lst_external_videolan_preset.ListIndex > -1 Then
		        videoLanPresetParams = App.VideolanPresetList.Lookup(lst_external_videolan_preset.Cell(lst_external_videolan_preset.ListIndex,0), "")
		      End If
		      If videoLanPresetParams = "" Then videoLanPresetParams = edt_external_videolan_manual.Text
		      SmartML.SetValue xgroup, "@videolan_parameters", videoLanPresetParams
		      SmartML.SetValueB xgroup, "@wait_to_finish", chk_external_wait_for_videolan.Value
		      
		      If chk_external_embed_mediafile.Enabled Then
		        Dim f As FolderItem
		        If Trim(edt_external_videolan_mediafilename.Text) = "" Then
		          If videoLanPresetParams.InStrB("%s") <> 0 Then
		            MsgBox(App.T.Translate("errors/videolan/no_medium", SetML.GetSlideGroupCaption(xgroup)))
		            Return False
		          End If
		        Else
		          f = GetFolderItem(edt_external_videolan_mediafilename.Text)
		        End If
		        If f = Nil Then
		          If chk_external_embed_mediafile.Value Then
		            MsgBox(App.T.Translate("errors/fileutils/invalidname", edt_external_videolan_mediafilename.Text))
		            Return False
		          Else
		            SmartML.SetValue xgroup, "@filename", edt_external_videolan_mediafilename.Text
		          End If
		          ' Else we just ignore it. It might be an URL or a MRL (Media Resource Locator, VLC's stream naming scheme)
		        ElseIf f.Exists() Then
		          If chk_external_embed_mediafile.Value Then
		            Dim inputStream As BinaryStream = BinaryStream.Open(f, False)
		            SmartML.SetValue xgroup, "file", EncodeBase64(inputStream.Read(f.Length))
		            SmartML.SetValue xgroup, "@filename", f.Name
		            inputStream.Close
		            
		            chk_external_embed_mediafile.Enabled = False
		          Else
		            SmartML.SetValueFI xgroup, "@filename", f
		          End If
		        Else
		          MsgBox(App.T.Translate("errors/fileutils/filenotfound", f.NativePath))
		          Return False
		        End If
		      Else
		        SmartML.SetValue xgroup, "@filename", edt_external_videolan_mediafilename.Text
		      End If
		      
		    ElseIf btn_external_application.Stuck() Then
		      If rad_external_application_start.Value Then
		        Dim f As FolderItem
		        If Trim(edt_external_application_filename.Text) <> "" Then f = PathToFolderItem(edt_external_application_filename.Text)
		        If f = Nil Then
		          MsgBox(App.T.Translate("errors/fileutils/invalidname", edt_external_application_filename.Text))
		          Return False
		        ElseIf f.Exists() Then
		          SmartML.SetValue xgroup, "@app_filename", f.NativePath
		        Else
		          MsgBox(App.T.Translate("errors/fileutils/filenotfound", f.NativePath))
		          Return False
		        End If
		      End If
		      
		      SmartML.SetValue xgroup, "@application", "launch"
		      
		      If rad_external_application_start.Value Then
		        SmartML.SetValue xgroup, "@action", "start"
		      ElseIf rad_external_application_stop.Value Then
		        SmartML.SetValue xgroup, "@action", "stop"
		      End If
		      SmartML.SetValue xgroup, "@app_parameters", edt_external_application_parameters.Text
		      SmartML.SetValueB xgroup, "@wait_to_finish", chk_external_wait_for_application.Value
		    End If
		    
		    SmartML.SetValue xgroup, "@name", edt_external_name.Text
		    SmartML.SetValue xgroup, "notes", edt_external_notes.Text
		    SmartML.SetValueB xgroup, "@loop", chk_external_loop.Value
		    SmartML.SetValueB xgroup, "@print", chk_external_print.Value
		    
		    lst_set_items.List(CurrentInSetItem) = SetML.GetSlideGroupCaption(xgroup)
		    
		  Case "style"
		    
		  Case Else
		    str = edf_slide_slides.Text.FormatUnixEndOfLine
		    bodies = OpenSongUtils.SplitRE(str, "^---$")
		    ' Set the title and sub-title
		    SmartML.SetValue xgroup, "@name", edt_slide_name.Text
		    SmartML.SetValue xgroup, "title", edt_slide_title.Text
		    SmartML.SetValue xgroup, "subtitle", edt_slide_subtitle.Text
		    SmartML.SetValue xgroup, "notes", edt_slide_notes.Text
		    SmartML.SetValueN xgroup, "@seconds", Val(edt_slide_auto_advance.Text)
		    SmartML.SetValueB xgroup, "@loop", chk_slide_loop.Value
		    SmartML.SetValueB xgroup, "@print", chk_slide_print.Value
		    SmartML.SetValueN xgroup, "@transition", pop_slide_transition.ListIndex
		    
		    ' Delete the old slides
		    xslides = SmartML.GetNode(xgroup, "slides", False)
		    If xslides <> Nil Then xgroup.RemoveChild xslides
		    
		    ' Create the new slides
		    xslides = xgroup.AppendChild(CurrentSet.CreateElement("slides"))
		    For i = 0 To UBound(bodies)
		      xslide = xslides.AppendChild(CurrentSet.CreateElement("slide"))
		      SmartML.SetValue xslide, "body", StringUtils.Trim(bodies(i), StringUtils.WhiteSpaces)
		    Next i
		    
		    lst_set_items.List(CurrentInSetItem) = SetML.GetSlideGroupCaption(xgroup)
		  End Select
		  
		  Status_InSetChanged = False
		  EnableMenuItems
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionInSetSwap(WithIndex As Integer)
		  Dim index As Integer = lst_set_items.SelectedRowIndex
		  
		  Dim slide_groups As XmlNode = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True)
		  
		  SmartML.SwapChildren(slide_groups, index, WithIndex)
		  
		  Dim tempCaption As String = lst_set_items.List(index)
		  Dim tempType As String = lst_set_items.CellTagAt(index, 0)
		  
		  lst_set_items.List(index) = lst_set_items.List(WithIndex)
		  lst_set_items.CellTagAt(index, 0) = lst_set_items.CellTagAt(WithIndex, 0)
		  lst_set_items.List(WithIndex) = tempCaption
		  lst_set_items.CellTagAt(WithIndex, 0) = tempType
		  
		  If CurrentInSetItem = index Then
		    CurrentInSetItem = WithIndex
		  ElseIf CurrentInSetItem = WithIndex Then
		    CurrentInSetItem = index
		  End If
		  lst_set_items.SelectedRowIndex = WithIndex
		  
		  Status_SetChanged = True
		  EnableMenuItems
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSetAddScripture()
		  Dim w As ScripturePickerWindow
		  
		  Dim c As ScripturePickerController
		  
		  If Not ActionInSetAskSave Then Return
		  
		  If Not BibleFactory.HasBible Then Return
		  Try
		    c = New ScripturePickerController
		    c.registerScriptureReceiver Self
		    
		    // Only enable 'Add' button if in Sets mode AND a set is currently open
		    If Status_CurrentMode = 1 And Status_SetOpen Then
		      w = New ScripturePickerWindow(c, True)
		    Else
		      w = New ScripturePickerWindow(c, False)
		    End If
		    
		    If App.MyBible = Nil Then
		      App.MyBible = c.CurrentBible
		    End If
		    
		    w.ShowModal
		    
		  Catch ex As RuntimeException
		    If App.DebugWriter <> Nil And App.DebugWriter.Enabled And App.DebugWriter.Level >= 4 Then
		      Dim Popup As New ErrorPopup
		      Popup.SetDescription(ex)
		      Popup.MouseCursor = System.Cursors.StandardPointer
		      Popup.ShowModalWithin(Self)
		    Else
		      InputBox.Message(ex.ToString)
		    End If
		  End Try
		  Try
		    c.unregisterScriptureReceiver Self
		    w = Nil
		    c = Nil
		  Catch
		  End Try
		  If Status_SetOpen Then lst_set_items.SetFocus
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub ActionSetAddSong()
		  // Check if we have a songs folder if not try to create one
		  If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		    If App.DocsFolder <> Nil Then
		      InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.NativePath + App.STR_SONGS)
		    Else
		      InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		    End If
		    Return
		  End If
		  
		  // If Songs is Nil, try to generate FolderDB
		  If Songs = Nil Then
		    If App.DocsFolder <> Nil Then
		      Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		    Else
		      Return
		    End If
		    If Songs = Nil Then
		      // Songs is still Nil, return (should never get here but we probably should
		      // give some error message anyway ;)
		      Return
		    End If
		  End If
		  
		  SongPickerWindow.PickMultipleSongs(SongPickerReceiver(self))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ActionSetAskSave() As Boolean
		  //
		  // Check to see if the current set has been changed
		  // if so, give the user a chance to save it before continuing
		  // with an action that will throw away the changes
		  //
		  // JRC 1/27/2007
		  'Changed to return whether the user canceled or not
		  ' EMP 12/06: Move guts of doing the message dialog to a utility method
		  ' so it can be reused by sets mode and other areas.
		  
		  If Status_SetChanged then
		    '++JRC
		    Select Case SaveDialog(App.T.Translate("questions/set_changed/@caption"))
		    Case 1
		      'User pressed Yes, so save
		      If ActionInSetSave() Then
		        ActionSetSave
		      Else
		        Return False
		      End If
		    Case 0
		      '++JRC Check if the App is Closing, if it is we don't need to reload
		      If Status_Closing Then Return True 'Continue closing
		      
		      If SmartML.GetValueB(App.MyMainSettings.DocumentElement, "set_revert_on_dont_save", False, True) Then
		        //++
		        // Revert the entire set to the last saved version
		        //--
		        CurrentSet = Nil
		        CurrentSet = New XmlDocument
		        CurrentSet.AppendChild CurrentSet.SafeImportNode(TempSet.DocumentElement, True)
		        Status_SetChanged = False
		        Status_InSetChanged = False
		        lst_set_items.ListIndex = lst_set_items.ListIndex // Reload the active item
		      End If
		    Case -1
		      'user pressed Cancel, go back
		      Return False
		    End Select
		    '--
		  End If
		  
		  'Return True, meaning user wants to continue with/without saving
		  Return True
		  
		  'Old Function
		  'Dim Msg as MessageDialog
		  
		  'if Status_SetChanged then
		  'msg = new MessageDialog
		  'msg.Message = App.T.Translate("questions/save/@caption", CurrentSetName)
		  'msg.Title = App.T.Translate("sets_mode/current_set/save/@caption")
		  'msg.Icon = 3'question
		  'msg.ActionButton.Caption = App.T.Translate("shared/yes/@caption")
		  'msg.CancelButton.Caption = App.T.Translate("shared/no/@caption")
		  'Msg.CancelButton.Visible = true
		  'if msg.ShowModal = msg.ActionButton then
		  'ActionInSetSave
		  'ActionSetSave
		  'end if
		  'end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSetDelete()
		  If Not ActionSetAskSave Then Return
		  
		  '++JRC Check if we have a sets folder if not offer to create one
		  If App.CheckDocumentFolders(App.SETS_FOLDER) = App.NO_FOLDER Then
		    If App.DocsFolder <> Nil Then
		      InputBox.Message App.T.Translate("errors/create_sets_folder", App.DocsFolder.NativePath + App.STR_SETS)
		    Else
		      MsgBox App.T.Translate("errors/no_docs_folder", "")
		    End If
		    Return
		  End If
		  '--
		  
		  If InputBox.Ask(App.T.Translate("questions/delete/@caption", pop_sets_sets.Text)) Then
		    If App.DocsFolder.Child(App.STR_SETS).Child(pop_sets_sets.Text) <> Nil Then
		      App.DocsFolder.Child(App.STR_SETS).Child(pop_sets_sets.Text).Delete
		    End If
		    pop_sets_sets.RemoveRow pop_sets_sets.ListIndex
		    pop_sets_sets.ListIndex = -1
		    
		    Status_SetOpen = False
		    Status_SetChanged = False
		    Status_InSetOpen = False
		    Status_InSetChanged = False
		    Status_InSetEditable = False
		    EnableMenuItems
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSetExport()
		  // 1.2: Add code to put the songs in a folder named Songs, and set goes into Sets
		  //TODO:
		  // Break the copying out in to another function that takes the base folder, array of folderitems and target folder as parameters for use in the import
		  // Instead of using folderDelimiter use the parent fodler method to find the target directories that need to be built.
		  
		  // Ask if user wants to save
		  If Not ActionSetAskSave Then Return 'User Canceled
		  
		  // Getting the targetFolderPath from user
		  Dim targetFolderPath As String
		  Dim targetFolder, targetFile As FolderItem
		  Dim setFolder, songFolder As FolderItem
		  Dim dlg As New SelectFolderDialog
		  
		  targetFolder = App.MainPreferences.GetValueFI(Prefs.kSetsLastExportFolder)
		  While Not (targetFolder Is Nil)
		    dlg.InitialDirectory = targetFolder
		    If targetFolder.Exists Then Exit
		    targetFolder = targetFolder.Parent
		  Wend
		  
		  // Translate dialog
		  dlg.ActionButtonCaption = App.T.Translate("shared/ok/@caption")
		  dlg.CancelButtonCaption = App.T.Translate("shared/cancel/@caption")
		  dlg.PromptText = App.T.Translate("shared/export_to/@caption")
		  dlg.Title = App.T.Translate("shared/browse_for/@caption")
		  
		  If targetFolder Is Nil Then dlg.InitialDirectory = App.AppDocumentsFolder
		  targetFolder = dlg.ShowModal
		  If targetFolder = Nil Then Return  // User cancelled
		  
		  App.MainPreferences.SetValueFI(Prefs.kSetsLastExportFolder, targetFolder)
		  
		  targetFolderPath = targetFolder.NativePath
		  
		  If Not targetFolder.Exists Then
		    Return
		  End If
		  
		  songFolder = targetFolder.Child("Songs")
		  setFolder = targetFolder.Child("Sets")
		  
		  If Not songFolder.Exists Then
		    If Not FileUtils.CreateFolder(songFolder) Then
		      InputBox.Message songFolder.NativePath + ": " + EndOfLine + FileUtils.LastError
		      Return
		    End If
		  End If
		  
		  If Not setFolder.Exists Then
		    If Not FileUtils.CreateFolder(setFolder) Then
		      InputBox.Message setFolder.NativePath + ": " + EndOfLine + FileUtils.LastError
		      Return
		    End If
		  End If
		  
		  // Check if we have a sets folder. If not, offer to create one
		  If App.CheckDocumentFolders(App.SETS_FOLDER) = App.NO_FOLDER Then
		    If App.DocsFolder <> Nil Then
		      InputBox.Message App.T.Translate("errors/create_sets_folder", App.DocsFolder.NativePath + App.STR_SETS)
		    Else
		      MsgBox App.T.Translate("errors/no_docs_folder", "")
		    End If
		    Return
		  End If
		  
		  // If Songs is Nil, try to generate FolderDB
		  If Songs = Nil Then
		    If App.DocsFolder <> Nil Then
		      Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		    Else
		      'InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		      Return
		    End If
		    If Songs = Nil Then
		      // Songs is still Nil, return (should never get here but we probably should
		      // give some error message anyway ;)
		      Return
		    End If
		  End If
		  
		  // Start of the calculation and copying bit
		  Dim f, songFile, setFile As FolderItem
		  Dim SongPath As String
		  Dim RelFiles(0) As String
		  Dim i As Integer
		  
		  // Get path for current set
		  // Should be setFile = CurrentSet.GetFolderItem
		  Dim att As XMLattribute
		  Try
		    att = CurrentSet.documentElement.GetAttributeNode("name")
		  Catch err As XMLexception
		    i = msgbox(err.Message, 48, "ActionSetExport Could not find set name")
		    Return
		  End Try
		  If att = Nil Then
		    CurrentSet.documentElement.SetAttribute("name",CurrentSetName)
		  End If
		  
		  setFile = App.DocsFolder.Child(App.STR_SETS).Child(CurrentSetName)
		  If setFile = Nil Or Not setFile.Exists Then
		    InputBox.Message App.T.Translate("errors/no_such_set", App.DocsFolder.Child(App.STR_SETS).NativePath + CurrentSetName)
		    Return
		  End If
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  // Append the FolderItem used in each SlideGroup to AbsFiles
		  // Should be a call to CurrentSet.GetChildFolderItems
		  Dim setDoc As New XmlDocument
		  Dim slide_group, slide_groups As XmlNode
		  
		  setDoc.AppendChild setDoc.SafeImportNode(CurrentSet.DocumentElement, True)
		  
		  slide_groups = SmartML.GetNode(setDoc.DocumentElement, "slide_groups", True)
		  slide_group = slide_groups.FirstChild
		  While slide_group <> Nil
		    songFile = Nil
		    // Get paths for the individual slide groups
		    // Should be a call to SlideGroup.GetChildFolderItems
		    If SmartML.GetValue(slide_group, "@type", True) = "song" Then
		      SongPath = Songs.CombinePath(SmartML.GetValue(slide_group, "@path", False), SmartML.GetValue(slide_group, "@name"))
		      f = Songs.GetFile(SongPath)
		      If f = Nil Then
		        InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", SmartML.GetValue(slide_group, "@name", True))
		      Else
		        RelFiles.Append(SongPath)
		      End If
		    End If
		    slide_group  = slide_group.NextSibling
		  Wend
		  
		  // Copy the files to the target
		  Dim fileCount As Integer
		  fileCount = UBound(RelFiles)
		  
		  Dim sourcePathPartCount, j As Integer
		  Dim currentFolderItem As FolderItem
		  Dim sourcePathParts() As String
		  
		  For i = 1 To fileCount
		    // Split the path up and create each folder if needed
		    sourcePathParts = Split(RelFiles(i), "/")
		    sourcePathPartCount = UBound(sourcePathParts) - 1
		    currentFolderItem = songFolder
		    For j = 0 To sourcePathPartCount
		      If Not currentFolderItem.Child(sourcePathParts(j)).Exists Then
		        If Not FileUtils.CreateFolder(currentFolderItem.Child(sourcePathParts(j))) Then
		          InputBox.Message FileUtils.LastError
		          Return
		        End If
		      End If
		      currentFolderItem = currentFolderItem.Child(sourcePathParts(j))
		    Next
		    targetFile = FileUtils.RelativePathToFolderItem(songFolder, RelFiles(i))
		    
		    // Create the actual file.
		    currentFolderItem = Songs.GetFile(RelFiles(i))
		    If Not IsNull(targetFile) Then
		      App.DebugWriter.Write("targetFile At " + targetFile.NativePath, 1)
		      If Not FileUtils.CopyFile(currentFolderItem, targetFile, FileUtils.kOverwriteNewer) Then
		        InputBox.Message FileUtils.LastError
		      End If
		      targetFile.ModificationDate = currentFolderItem.ModificationDate
		      targetFile.CreationDate = currentFolderItem.CreationDate
		    End If
		  Next
		  
		  // Add the default styles to the copied set
		  Dim copyset As XmlDocument
		  Dim xgroups, newGroup, xnode As XmlNode
		  copyset = SmartML.XDocFromFile(setFile)
		  xgroups = SmartML.GetNode(copyset.DocumentElement, "slide_groups", True)
		  
		  // Insert the default style yeah i know this should be a method but it seems like a lot of effort.
		  newGroup = SmartML.InsertChild(xgroups, "slide_group", 0)
		  xnode = SmartML.GetNode(newGroup, "style", True)
		  SongML.CloneStyle SmartML.GetNode(App.MyPresentSettings.DocumentElement, "default_style"), xnode
		  SmartML.SetValue newGroup, "@type", "style"
		  SmartML.SetValue newGroup, "@action", "new"
		  SmartML.SetValue newGroup, "@name", App.T.Translate("sets_mode/items/defaultstyle")
		  
		  If Not SmartML.XDocToFile(copyset, setFolder.Child(setFile.Name)) Then
		    App.MouseCursor = Nil
		    SmartML.DisplayError
		    Return
		  End If
		  
		  App.MouseCursor = Nil
		  InputBox.Message(App.T.Translate("sets_mode/messages/export_complete", SetFile.Name, _
		  targetFolder.FormatFolderName(50)))
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSetNew()
		  Dim t as String
		  Dim f as FolderItem
		  Dim i As Integer
		  
		  'Ask if user wants to save
		  If NOT ActionSetAskSave Then Return 'User Canceled
		  
		  '++JRC Check if we have a sets folder if not offer to create one
		  If App.CheckDocumentFolders(App.SETS_FOLDER) = App.NO_FOLDER Then
		    If App.DocsFolder <> Nil Then
		      InputBox.Message App.T.Translate("errors/create_sets_folder", App.DocsFolder.NativePath + App.STR_SETS)
		    Else
		      MsgBox App.T.Translate("errors/no_docs_folder", "")
		    End If
		    Return
		  End If
		  '--
		  
		  t = InputBox.Input(App.T.Translate("questions/new_name/@caption"), "")
		  If Len(t) > 0 Then
		    If Not FileUtils.IsSafeFileName(t) Then
		      InputBox.Message App.T.Translate("errors/bad_file_name", t)
		      Return
		    End If
		    
		    f = App.DocsFolder.Child("Sets").Child(t)
		    If f.Exists Then
		      InputBox.Message App.T.Translate("errors/already_exists", f.NativePath)
		      Return
		    End If
		    
		    CurrentSet = New XmlDocument
		    CurrentSet.AppendChild CurrentSet.CreateElement("set")
		    
		    CurrentSet.DocumentElement.SetAttribute("name",t)
		    '++JRC Save backup copy
		    TempSet = New XmlDocument
		    TempSet.AppendChild TempSet.SafeImportNode(CurrentSet.DocumentElement, True)
		    '--
		    CurrentSetName = t
		    
		    If Not SmartML.XDocToFile(CurrentSet, f) Then
		      SmartML.DisplayError
		      Return
		    End If
		    
		    i = 0
		    While i < pop_sets_sets.ListCount And StringUtils.CompareHymnBookOrder(t, pop_sets_sets.List(i)) = 1
		      i = i + 1
		    Wend
		    
		    pop_sets_sets.InsertRow i, t
		    
		    Status_SetOpen = True
		    Status_SetChanged = False
		    Status_InSetOpen = False
		    Status_InSetChanged = False
		    
		    pop_sets_sets.ListIndex = i
		    
		    EnableMenuItems
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSetPresent(screenMode As Integer, ItemNumber As Integer = -1, countBlanks As Boolean = False)
		  'Ask if user wants to save
		  If Not ActionSetAskSave Then Return 'User Canceled
		  
		  PreparePresentation
		  
		  PresentWindow.Hide
		  PresentWindow.Present CurrentSet, screenMode, ItemNumber + 1, -1, countBlanks
		  If Globals.Status_Presentation Then
		    PresentWindow.Show
		  End If
		  'reset cursor
		  App.MouseCursor = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSetPrint()
		  Dim foundSong As Boolean = False
		  Dim rpt As LeadSheetReport
		  Dim song As FolderItem
		  Dim songPath As String
		  Dim xgroup As XmlNode
		  Dim setDoc As New XmlDocument  // working copy
		  
		  App.DebugWriter.Write "MainWindow.ActionSetPrint: Enter"
		  
		  // Ask if user wants to save
		  If Not ActionSetAskSave Then Return  // User Canceled
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  rpt = New LeadSheetReport
		  If Not rpt.Setup Then
		    App.MouseCursor = Nil
		    Return  // User cancelled
		  End If
		  
		  setDoc.AppendChild setDoc.SafeImportNode(CurrentSet.DocumentElement, True)
		  xgroup = SmartML.GetNode(setDoc.DocumentElement, "slide_groups", True).FirstChild
		  While xgroup <> Nil
		    If SmartML.GetValue(xgroup, "@type") = "song" Then
		      songPath = Songs.CombinePath(SmartML.GetValue(xgroup, "@path"), SmartML.GetValue(xgroup, "@name"))
		      song = Songs.GetFile(songPath)
		      If song <> Nil And song.Exists Then
		        If Not foundSong Then
		          foundSong = True
		        End If
		        rpt.AddSong(songPath)
		      Else
		        App.MouseCursor = Nil
		        PrintWindow.Hide
		        InputBox.Message App.T.Translate("folderdb_errors/error[@code=8]", SmartML.GetValue(xgroup, "@name"))
		        App.MouseCursor = System.Cursors.Wait
		      End If
		    End If
		    xgroup = xgroup.NextSibling
		  Wend
		  App.MouseCursor = Nil
		  
		  If Not foundSong Then
		    InputBox.Message App.T.Translate("sets_mode/current_set/print_songs/no_songs")
		    Return
		  End If
		  
		  If rpt.Generate Then
		    PrintWindow.SetReport(rpt)
		    PrintWindow.Top = Self.Top + 40
		    PrintWindow.Height = Self.Height - 80
		    PrintWindow.Left = Self.Left + 40
		    PrintWindow.Width = Self.Width - 80
		    PrintWindow.ShowModalWithin Self
		    App.DebugWriter.Write "MainWindow.ActionSongPrint: Return from PrintWindow"
		  End If
		  rpt = Nil
		  App.DebugWriter.Write "MainWindow.ActionSetPrint: Exit"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSetPrintList()
		  //
		  // The 0.9.9 version of this routine has migrated to SetListReport.AddSet
		  //
		  // Print a set list of the current set
		  //
		  // Ed Palmer, February 2006
		  //
		  Dim status As Boolean
		  Dim MySetListReport As SetListReport
		  'working copy
		  Dim setDoc As New XmlDocument
		  
		  App.DebugWriter.Write "MainWindow.ActionSetPrintList: Enter"
		  
		  // if action affects the entire set, ask the user if he/she wants to save the entire set
		  '
		  'ActionInSetAskSave
		  // Ask if user wants to save
		  If Not ActionSetAskSave Then Return  // User Canceled
		  
		  MySetListReport = New SetListReport
		  If MySetListReport = Nil Then
		    InputBox.Message App.T.Translate("errors/internal") + _
		    EndOfLine + "MainWindow.ActionSetPrintList: New SetListReport returned Nil"
		    App.DebugWriter.Write "MainWindow.ActionSetPrintList: Exit: New SetListReport returned Nil", 1
		    Return
		  End If
		  
		  status = MySetListReport.Setup
		  If Not status Then
		    InputBox.Message App.T.Translate("errors/internal") + _
		    EndOfLine + "MainWindow.ActionSetPrintList: SetListReport.Setup failed"
		    App.DebugWriter.Write "MainWindow.ActionSetPrintList: Exit: SetListReport.Setup failed", 1
		    Return
		  End If
		  
		  'use working copy
		  setDoc.AppendChild setDoc.SafeImportNode(CurrentSet.DocumentElement, True)
		  status = MySetListReport.AddSet(CurrentSetName, setDoc)
		  If Not status Then
		    InputBox.Message App.T.Translate("errors/internal") + _
		    EndOfLine + "MainWindow.ActionSetPrintList: SetListReport.AddSet failed"
		    App.DebugWriter.Write "MainWindow.ActionSetPrintList: Exit: SetListReport.AddSet failed", 1
		    Return
		  End If
		  
		  status = MySetListReport.Generate
		  If Not status Then
		    InputBox.Message App.T.Translate("errors/internal") + _
		    EndOfLine + "MainWindow.ActionSetPrintList: SetListReport.Generate failed"
		    App.DebugWriter.Write "MainWindow.ActionSetPrintList: Exit: SetListReport.Generate failed", 1
		    Return
		  End If
		  
		  PrintWindow.SetReport(MySetListReport)
		  PrintWindow.Top = Self.Top + 40
		  PrintWindow.Height = Self.Height - 80
		  PrintWindow.Left = Self.Left + 40
		  PrintWindow.Width = Self.Width - 80
		  PrintWindow.ShowModalWithin Self
		  App.DebugWriter.Write "MainWindow.ActionSetPrintList: Return from PrintWindow"
		  
		  MySetListReport = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSetRename()
		  Dim t As String
		  Dim old As String
		  Dim f As FolderItem
		  Dim i As Integer
		  
		  // Ask if user wants to save
		  If Not ActionSetAskSave Then Return  // User Canceled
		  
		  '++JRC Check if we have a sets folder if not try to create one
		  If App.CheckDocumentFolders(App.SETS_FOLDER) = App.NO_FOLDER Then
		    If App.DocsFolder <> Nil Then
		      InputBox.Message App.T.Translate("errors/create_sets_folder", App.DocsFolder.NativePath +  App.STR_SETS)
		    Else
		      MsgBox App.T.Translate("errors/no_docs_folder", "")
		    End If
		    Return
		  End If
		  '--
		  
		  old = pop_sets_sets.Text
		  
		  t = InputBox.Input(App.T.Translate("questions/rename/@caption", old), old)
		  If Len(t) > 0 Then
		    If Not FileUtils.IsSafeFileName(t) Then
		      InputBox.Message App.T.Translate("errors/bad_file_name", t)
		      Return
		    End If
		    
		    f = App.DocsFolder.Child("Sets").Child(t)
		    If f <> Nil Then
		      If f.Exists Then
		        InputBox.Message App.T.Translate("folderdb_errors/error[@code=3]", f.NativePath) ' already exists
		        Exit
		      End If
		    End If
		    
		    f = App.DocsFolder.Child("Sets").Child(old)
		    If f = Nil Or Not f.Exists Then
		      InputBox.Message App.T.Translate("folderdb_errors/error[@code=8]", f.NativePath) ' could not find file
		      Exit
		    End If
		    
		    f.Name = t
		    i = pop_sets_sets.ListIndex
		    pop_sets_sets.RemoveRow i
		    pop_sets_sets.InsertRow i, t
		    // Prevent Second save prompt
		    If Status_SetChanged Then
		      Status_SetChanged = False
		      pop_sets_sets.ListIndex = i
		      Status_SetChanged = True
		      SmartML.SetValue(CurrentSet.DocumentElement,"@name",t)
		      EnableMenuItems
		    Else
		      pop_sets_sets.ListIndex = i
		      SmartML.SetValue(CurrentSet.DocumentElement,"@name",t)
		      Status_SetChanged = True
		      ActionSetSave
		      Status_SetChanged = False
		    End If
		    '--
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSetSave()
		  Dim f As FolderItem
		  Dim i As Integer
		  Dim xSlide As XmlNode
		  
		  If Not Status_SetChanged Then Return
		  If Status_InSetChanged Then
		    If Not ActionInSetSave() then
		      Return
		    End If
		  End If
		  
		  '++JRC Check if we have a sets folder if not try to create one
		  If App.CheckDocumentFolders(App.SETS_FOLDER) = App.NO_FOLDER Then
		    If App.DocsFolder <> Nil Then
		      InputBox.Message App.T.Translate("errors/create_sets_folder", App.DocsFolder.NativePath +  App.STR_SETS)
		    Else
		      MsgBox App.T.Translate("errors/no_docs_folder", "")
		    End If
		    Return
		  End If
		  '--
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  dim att as XMLattribute
		  try
		    att = CurrentSet.documentElement.GetAttributeNode("name")
		  catch err as XMLexception
		    App.MouseCursor = Nil
		    i = msgbox(err.Message, 48, "ActionSetSave")
		    return
		  end try
		  if att = Nil then
		    SmartML.SetValue(CurrentSet.documentElement,"@name",CurrentSetName)
		  end if
		  
		  f = App.DocsFolder.Child(App.STR_SETS).Child(CurrentSetName)
		  If Not SmartML.XDocToFile(CurrentSet, f) Then
		    App.MouseCursor = Nil
		    SmartML.DisplayError
		    Return
		  End If
		  Status_InSetChanged = False
		  Status_SetChanged = False
		  '++JRC Temporary hack for bug #2308669
		  'The name change is saved correctly, but for some reason
		  'SmartML.GetValue refuses to return to the proper information
		  'so for now well just reload the set, not very elegant but it works
		  CurrentSet = SmartML.XDocFromFile(f)
		  If CurrentSet = Nil Then
		    // revert
		    App.MouseCursor = Nil
		    CurrentSet = New XmlDocument
		    CurrentSet.AppendChild CurrentSet.SafeImportNode(TempSet.DocumentElement, True)
		    lst_set_items.ListIndex = lst_set_items.ListIndex // Reload the active item
		    SmartML.DisplayError
		  Else
		    
		    //++
		    // This becomes the new base for a revert.  Update TempSet to reflect this.
		    //--
		    TempSet = Nil
		    If CurrentSet <> Nil Then
		      TempSet = New XmlDocument
		      TempSet.AppendChild TempSet.SafeImportNode(CurrentSet.DocumentElement, True)
		    End If
		  End If
		  EnableMenuItems
		  
		  If can_slide_style.Enabled Then
		    xSlide = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups").Child(lst_set_items.ListIndex)
		    If xSlide <> Nil Then xSlide = SmartML.GetNode(xSlide, "slides/slide")
		    If xSlide = Nil Then
		      can_slide_style.ClearPreviewSlide
		    Else
		      can_slide_style.PreviewSlide = xSlide
		    End If
		  End If
		  
		  App.MouseCursor = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongAddBackgroundImage()
		  Dim f As FolderItem
		  Dim img As StyleImage
		  Dim rowsToProcess As Integer
		  
		  rowsToProcess = lst_song_backgrounds.SelectedRowCount
		  If rowsToProcess > 0 Then
		    f = SelectImageFile
		    If f <> Nil Then
		      img = new StyleImage
		      If img.SetImageFromFile(f) Then
		        For i As Integer = lst_song_backgrounds.SelectedRowIndex to lst_song_backgrounds.LastRowIndex
		          If lst_song_backgrounds.Selected(i) Then
		            lst_song_backgrounds.SetImage(i, img)
		            rowsToProcess = RowsToProcess - 1
		            If rowsToProcess = 0 Then Exit
		          End If
		        Next i
		        
		        Status_SongChanged = True
		        EnableMenuItems
		      End If
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongAddLinked()
		  Dim s As String
		  Dim folder As String
		  Dim i As Integer
		  Dim songlist() As String
		  Dim f As FolderItem
		  Dim fullpath As String
		  
		  folder = Globals.CurrentSongFolder
		  songlist = Songs.GetFiles(folder)
		  songlist.Insert(0, "")
		  f = SongPickerWindow.Popup(s, False)
		  
		  If f = Nil Then Return
		  
		  If f.Name = "" Or NOT f.Exists Then
		    Return
		  End If
		  
		  fullpath = Songs.DBPathFromFolderItem(f)
		  
		  'selected song cannot be current song
		  'TODO maybe allow this?
		  If f.Name = lst_songs_songs.Text Then
		    InputBox.Message(App.T.Translate("errors/linked_song/current"))
		    Return
		  End If
		  
		  'check if song is already in the list, if it is return
		  For i = 0 To lst_song_linked.ListCount - 1
		    If fullpath = lst_song_linked.List(i) Then
		      InputBox.Message(App.T.Translate("errors/linked_song/exists"))
		      Return
		    End If
		  Next i
		  
		  lst_song_linked.AddRow(Songs.CleanPath(fullpath))
		  
		  Status_SongChanged = True
		  EnableMenuItems
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ActionSongAskSave() As Boolean
		  //
		  // Check to see if the current song has been changed
		  // if so, give the user a chance to save it before continuing
		  // with an action that will throw away the changes
		  //
		  
		  If CurrentSong <> Nil And Status_SongChanged = True And Globals.OldSongFileName <> "" Then
		    Select Case SaveDialog(App.T.Translate("questions/song_changed/@caption"))
		    Case 1
		      // User pressed Yes, so save
		      ActionSongSave false, true
		    Case 0
		      // Don't save. Two options: if App.MyMainSettings option song_revert_on_dont_save is True (default),
		      // then revert to the last saved version.
		      // If False, just update the in-memory song from the form.
		      
		      // Check if the App is Closing, if it is we don't need to reload
		      If Status_Closing Then Return True 'Continue closing
		      
		      If SmartML.GetValueB(App.MyMainSettings.DocumentElement, "song_revert_on_dont_save", True, True) Then
		        ActionSongRevert False
		      Else
		        StoreSongFields
		      End If
		      
		    Case -1
		      // user pressed Cancel, go back
		      Return False
		    End Select
		  End if
		  // Return True, meaning user wants to continue with/without saving
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongCopy()
		  Dim folders(0) As String
		  Dim oldFolder, newFolder As String
		  Dim oldSongName, newSongName As String
		  Dim listindex As Integer
		  Dim status As Boolean
		  
		  // Ask if user wants to save
		  If Not ActionSongAskSave Then Return  // User Canceled
		  
		  // Check if we have a songs folder if not try to create one
		  If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		    If  App.DocsFolder <> Nil Then
		      InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.NativePath + App.STR_SONGS)
		    Else
		      InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		    End If
		    Return
		  End If
		  
		  // If Songs is Nil, try to generate FolderDB
		  If Songs = Nil Then
		    If App.DocsFolder <> Nil Then
		      Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		    Else
		      InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		      Return
		    End If
		    If Songs = Nil Then
		      // Songs is still Nil, return (should never get here but we probably should
		      // give some error message anyway ;)
		      Return
		    End If
		  End If
		  
		  listindex = lst_songs_songs.SelectedRowIndex
		  oldFolder = lst_songs_songs.CellTagAt(listindex, 0)
		  oldSongName = lst_songs_songs.SelectedRowValue
		  
		  folders = Songs.GetFolders
		  folders.AddAt(0, "")
		  newFolder = InputBox.Pick(App.T.Translate("songs_mode/selected_song/copy/where/@caption", lst_songs_songs.SelectedRowValue), folders, "( " + App.T.Translate("songs_mode/song_folders/filter_main/@caption") + " )")
		  If newFolder.Length = 0 Then Return
		  oldFolder = Songs.CellTagFormat(oldFolder)
		  newFolder = Songs.CellTagFormat(newFolder)
		  newSongName = oldSongName
		  
		  Dim newFolderItem As FolderItem
		  
		  newFolderItem = Songs.GetFile(newFolder, newSongName)
		  If newFolderItem <> Nil And newFolderItem.Exists Then
		    // Ask user if they want to copy the file to a new name
		    If Not InputBox.AskYN(App.T.Translate("questions/destination_exists/@caption")) Then
		      Return
		    End If
		    newSongName = InputBox.Input(App.T.Translate("questions/rename/@caption", oldSongName), oldSongName)
		    If newSongName.Length > 0 Then
		      // Check for path characters
		      #If XojoVersion >= 2022.02
		        If newSongName.Contains("/") Or newSongName.Contains(":") Or newSongName.Contains("\") Then
		          InputBox.Message(App.T.Translate("errors/no_path_allowed"))
		          Return
		        End If
		      #Else
		        If newSongName.ContainsSU("/") Or newSongName.ContainsSU(":") Or newSongName.ContainsSU("\") Then
		          InputBox.Message(App.T.Translate("errors/no_path_allowed"))
		          Return
		        End If
		      #EndIf
		      newSongName = newSongName.Trim
		      If newSongName.IsEmpty Or Songs.CleanPath(newSongName) <> newSongName Then
		        InputBox.Message(App.T.Translate("errors/bad_file_name"))
		        Return
		      End If
		    Else
		      InputBox.Message(App.T.Translate("errors/rename_error"))
		      Return
		    End If
		    If newSongName = oldSongName Then
		      // user is being silly
		      InputBox.Message(App.T.Translate("errors/same_filename"))
		      Return
		    End If
		  End If
		  
		  App.MouseCursor = System.Cursors.Wait  // Wait...
		  status = Songs.CopyFileEx(oldFolder, oldSongName, newFolder, newSongName)
		  App.MouseCursor = Nil  // Don't wait...
		  
		  If Not status Then
		    Dim p1, p2 As String
		    Select Case Songs.ErrorCode
		    Case 3
		      p1 = Songs.CombinePath(newFolder, newSongName)  // File '%1' already exists.
		    Case 6
		      p1 = Songs.UIPath(newFolder)  // Could not find folder '%1'. / Destination folder is a regular file.
		    Case 8
		      p1 = Songs.CombinePath(oldFolder, oldSongName)  // Could not find file '%1'.
		    Case 12  // Could not move file '%1' to '%2'. ! should be >copy<, not >move<, but that message is not available
		      p1 = Songs.CombinePath(oldFolder, oldSongName)
		      p2 = Songs.CombinePath(newFolder, newSongName)
		    Case 13  // File '%1' already exists in folder '%2'.
		      p1 = newSongName
		      p2 = Songs.UIPath(newFolder)
		    Case Else
		      p1 = Songs.CombinePath(oldFolder, oldSongName)
		      p2 = Songs.CombinePath(newFolder, newSongName)
		    End Select
		    
		    InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", p1, p2)
		  ElseIf newSongName.Length > 0 Then
		    
		    // log song copy
		    If App.MainPreferences.GetValueB(App.kActivityLog, True) And Globals.SongActivityLog <> Nil Then
		      Dim Log As New LogEntry(Globals.SongActivityLog)
		      Dim d As New Date
		      
		      Log.Title = edt_song_title.Text
		      Log.Author = edt_song_author.Text
		      Log.CCLISongNumber = edt_song_ccli.Text
		      Log.OldSongFileName = Songs.CombinePath(oldFolder, oldSongName)
		      Log.SongFileName = Songs.CombinePath(newFolder, newSongName)
		      Log.DateAndTime = d
		      Log.HasChords = Log.CheckLyricsForChords(edf_song_lyrics.Text)
		      Log.Copied = True
		      
		      If Not Log.AddLogEntry Then
		        InputBox.Message App.T.Translate("errors/adding_entry")
		      End If
		    End If
		    
		    If oldFolder = newFolder Or pop_songs_song_folders.SelectedRow.StartsWith(Songs.GetFilterAll) Then
		      // we need to add the copied song to the window
		      
		      If SongListIsFiltered Then
		        SavedSongList.Add(newSongName : newFolder)
		      End If
		      
		      Dim searchText As String = sch_songs_songs.Text.ConvertEncoding(Encodings.UTF8)
		      If searchText.IsEmpty Or newSongName.IndexOf(searchText, ComparisonOptions.CaseInsensitive, App.LocaleForSearch) > -1 Then
		        lst_songs_songs.AddRow(newSongName)
		        lst_songs_songs.CellTagAt(lst_songs_songs.LastAddedRowIndex, 0) = newFolder
		        
		        If lst_songs_songs.SortingColumn <> -1 Then
		          lst_songs_songs.Sort
		          
		          // try to maintain the position on the old song
		          // the new song might be in a new folder that is not displayed, or might not be in the current filter. So
		          // keeping the old position is consistent and does not surprise and confuse the user by jumping around
		          If listindex >= 0 And listindex <= lst_songs_songs.LastRowIndex Then
		            Dim name, folder As String
		            name = lst_songs_songs.CellValueAt(listindex, 0)
		            folder = lst_songs_songs.CellTagAt(listindex, 0)
		            If name = oldSongName And folder = oldFolder Then
		              If Not lst_songs_songs.Selected(listindex) Then
		                lst_songs_songs.SelectedRowIndex = listindex
		              End If
		            ElseIf listindex < lst_songs_songs.LastRowIndex Then
		              name = lst_songs_songs.CellValueAt(listindex+1, 0)
		              folder = lst_songs_songs.CellTagAt(listindex+1, 0)
		              If name = oldSongName And folder = oldFolder Then
		                If Not lst_songs_songs.Selected(listindex+1) Then
		                  lst_songs_songs.SelectedRowIndex = listindex+1
		                End If
		              End If
		            ElseIf listindex <> lst_songs_songs.SelectedRowIndex And lst_songs_songs.SelectedRowIndex <> -1 Then
		              listindex = lst_songs_songs.SelectedRowIndex
		              name = lst_songs_songs.CellValueAt(listindex, 0)
		              folder = lst_songs_songs.CellTagAt(listindex, 0)
		              If name = oldSongName And folder = oldFolder Then
		                If Not lst_songs_songs.Selected(listindex) Then
		                  lst_songs_songs.SelectedRowIndex = listindex
		                End If
		              End If
		            End If
		          End If
		        End If
		      End If
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongDeleteBackgroundImage()
		  Dim rowsToProcess As Integer
		  
		  rowsToProcess = lst_song_backgrounds.SelectedRowCount
		  If rowsToProcess > 0 Then
		    For i As Integer = lst_song_backgrounds.SelectedRowIndex to lst_song_backgrounds.LastRowIndex
		      If lst_song_backgrounds.Selected(i) Then
		        If lst_song_backgrounds.CellTagAt(i, 1).BooleanValue Then
		          lst_song_backgrounds.RemoveRowAt(i)
		        Else
		          lst_song_backgrounds.ClearImage(i)
		        End If
		        RowsToProcess = RowsToProcess - 1
		        If RowsToProcess = 0 Then Exit
		      End If
		    Next i
		    
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongExport()
		  Dim output As TextOutputStream
		  Dim song As XmlDocument
		  Dim exportOptionsWin As HTMLExportWindow
		  Dim exportOptions As HTMLExportOptions
		  Dim cancelled As Boolean
		  Dim songHTML As String
		  Dim printSettings as XmlElement
		  Dim printCSSfile As FolderItem
		  Dim printCSS As String
		  Dim printCSSfileName As String
		  
		  'Ask if user wants to save
		  If NOT ActionSongAskSave Then Return 'User Canceled
		  
		  '++JRC Check if we have a songs folder if not try to create one
		  If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		    If  App.DocsFolder <> Nil Then
		      InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.NativePath + App.STR_SONGS)
		    Else
		      InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		    End If
		  End If
		  '--
		  '++JRC If Songs is Nil, try to generate FolderDB
		  If Songs = Nil Then
		    If App.DocsFolder <> Nil Then
		      Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		    Else
		      'InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		      Return
		    End If
		    If Songs = Nil Then
		      'Songs is still Nil, return (should never get here but we probably should
		      'give some error message anyway ;)
		      Return
		    End If
		  End If
		  
		  exportOptions = New HTMLExportOptions
		  exportOptions.Load(App.MainPreferences)
		  
		  exportOptionsWin = New HTMLExportWindow
		  cancelled = exportOptionsWin.ShowDialog(exportOptions)
		  
		  If cancelled Then
		    Return
		  End If
		  
		  exportOptions.Save(App.MainPreferences)
		  App.MouseCursor = System.Cursors.Wait
		  output = TextOutputStream.Create(exportOptions.OutputFolder.Child(MakeSafeURLName(lst_songs_songs.Text, False) + ".html"))
		  song = SmartML.XDocFromFile(Songs.GetFile(lst_songs_songs.CellTag(lst_songs_songs.ListIndex ,0), lst_songs_songs.List(lst_songs_songs.ListIndex)))
		  If output <> Nil And song <> Nil Then
		    //++
		    // If the user has selected to use the printer settings, create a CSS file based on those settings
		    //--
		    
		    If Not exportOptions.EmbedCSS Then
		      If exportOptions.TargetStyleSheetName.Trim = "" Then
		        exportOptions.TargetStyleSheetName = exportOptions.StyleSheet.Name
		      End If
		      printCSSfile = exportOptions.OutputFolder.Child(exportOptions.TargetStyleSheetName)
		    End If
		    If exportOptions.PrintStyle Then
		      printSettings = App.MyPrintSettings.DocumentElement
		      printCSS = PrintSettingsToCSS(printSettings)
		      If exportOptions.EmbedCSS Then
		        printCSSfile = GetTemporaryFolderItem()
		        printCSSfileName = printCSSfile.Name + ".css"
		        printCSSfile = exportOptions.OutputFolder.Child(printCSSfileName)
		      End If
		      If printCSSfile <> Nil Then
		        Dim printCSSoutput As TextOutputStream
		        printCSSoutput = TextOutputStream.Create(printCSSfile)
		        printCSSoutput.Write printCSS
		        printCSSoutput.Close
		      End If
		      exportOptions.StyleSheet = printCSSfile
		    End If
		    
		    songHTML = SongML.ToHTML(song.DocumentElement, exportOptions)
		    output.Write songHTML
		    output.Close
		    // Hooks for future...
		    'app.MouseCursor = Nil
		    'Dim previewWindow As New HTMLPreviewWindow
		    'previewWindow.LoadAndShow(songHTML,exportOptions.OutputFolder)
		  End If
		  App.MouseCursor = Nil
		  
		  If exportOptions.EmbedCSS Then
		    If exportOptions.PrintStyle Then
		      If printCSSfile <> Nil Then
		        printCSSfile.Delete
		      End If
		    End If
		  ElseIf Not exportOptions.PrintStyle Then
		    If Not FileUtils.CopyFile(exportOptions.StyleSheet, printCSSfile, FileUtils.kOverwriteAlways) Then
		      Dim e As New IOException
		      e.ErrorNumber = -1
		      e.Message = FileUtils.LastError
		      Raise e
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongExportAll()
		  // ToDo: Ask overwrite permission for song and stylesheet seperately, for songs allowing the option "Yes for all"
		  // currently an existing stylesheet is not overwritten withourt warning
		  
		  Dim i As Integer
		  Dim f, g as FolderItem
		  Dim output, goutput As TextOutputStream
		  Dim song As XmlDocument
		  Dim exportOptionsWin As HTMLExportWindow
		  Dim exportOptions As HTMLExportOptions
		  Dim cancelled As Boolean
		  Dim printSettings As  XmlNode
		  Dim printCSSFile As FolderItem
		  Dim printCSS As String
		  Dim printCSSfileName As String
		  Dim recursive As Boolean
		  Dim SongDbPath As String
		  
		  'Ask if user wants to save
		  If NOT ActionSongAskSave Then Return 'User Canceled
		  
		  exportOptions = New HTMLExportOptions
		  exportOptions.Load(App.MainPreferences)
		  
		  exportOptionsWin = New HTMLExportWindow
		  cancelled = exportOptionsWin.ShowDialog(exportOptions)
		  
		  If cancelled Or exportOptions = Nil Or exportOptions.OutputFolder = Nil Then
		    Return // user aborted
		  End If
		  
		  exportOptions.Save(App.MainPreferences)
		  f = exportOptions.OutputFolder
		  
		  If f <> Nil Then
		    'App.DoEvents
		    If Not exportOptions.EmbedCSS Then
		      If exportOptions.TargetStyleSheetName.Trim = "" Then
		        exportOptions.TargetStyleSheetName = exportOptions.StyleSheet.Name
		      End If
		      printCSSfile = exportOptions.OutputFolder.Child(exportOptions.TargetStyleSheetName)
		    End If
		    If exportOptions.PrintStyle Then
		      printSettings = App.MyPrintSettings.DocumentElement
		      printCSS = PrintSettingsToCSS(printSettings)
		      If exportOptions.EmbedCSS Then
		        printCSSfile = GetTemporaryFolderItem()
		        printCSSfileName = printCSSfile.Name + ".css"
		        printCSSfile = exportOptions.OutputFolder.Child(printCSSfileName)
		      End If
		      If printCSSfile <> Nil Then
		        Dim printCSSoutput As TextOutputStream
		        printCSSoutput = TextOutputStream.Create(printCSSfile)
		        printCSSoutput.Write printCSS
		        printCSSoutput.Close
		      End If
		      exportOptions.StyleSheet = printCSSfile
		    End If
		    
		    g = f.Child("index.html")
		    goutput = TextOutputStream.Create(g)
		    If goutput <> Nil Then
		      goutput.WriteLine "<html><head>"
		      goutput.WriteLine "<meta http-equiv=""Content-type"" content=""text/html;charset=UTF-8"" />"
		      goutput.WriteLine "<title>" + App.T.Translate("songs_mode/songs/@caption") + "</title><link rel=""stylesheet"" href=""" + exportOptions.StyleSheet.Name + """ type=""text/css""/></head><body>"
		      goutput.WriteLine "<div id=""title"">" + App.T.Translate("songs_mode/songs/@caption") + "</div><ul id=""song_list"">"
		    End If
		    App.MouseCursor = System.Cursors.Wait
		    ProgressWindow.Show
		    recursive =  pop_songs_song_folders.Text = Songs.GetFilterAll()
		    For i = 0 To lst_songs_songs.ListCount - 1
		      song = SmartML.XDocFromFile(Songs.GetFile(lst_songs_songs.CellTag(i, 0), lst_songs_songs.List(i)))
		      If song <> Nil Then // silently skip non-XML files
		        If recursive Then
		          SongDbPath = StringUtils.Trim(lst_songs_songs.CellTag(i, 0), "/")
		          If CountFields(SongDbPath, "/") > 1 Then
		            SongDbPath = StringUtils.ReverseFields(SongDbPath, "/").ReplaceAll("/", "_")
		          End If
		          If SongDbPath <> "" Then
		            SongDbPath = lst_songs_songs.List(i) + "_" + SongDbPath
		          Else
		            SongDbPath = lst_songs_songs.List(i)
		          End If
		        Else
		          SongDbPath = lst_songs_songs.List(i)
		        End If
		        output = TextOutputStream.Create(f.Child(MakeSafeURLName(SongDbPath, False) + ".html"))
		        If output <> Nil Then
		          output.Write SongML.ToHTML(song.DocumentElement, exportOptions)
		          If goutput <> Nil Then goutput.WriteLine "<li><a href=""" + MakeSafeURLName(SongDbPath, True) + ".html"">" + lst_songs_songs.List(i) + "</a></li>"
		          output.Close
		        End If
		      End If
		      ProgressWindow.SetProgress (i+1) / lst_songs_songs.ListCount * 100
		      '++JRC
		      ProgressWindow.lbl_status.Text =  App.T.Translate("progress_status/export") + "..."
		      '--
		      ProgressWindow.SetStatus lst_songs_songs.List(i)
		    Next i
		    If goutput <> Nil Then
		      goutput.WriteLine "</ul><p><a class=""opensong"" href=""http://www.opensong.org/"">" + App.T.Translate("about/created_with_opensong") + "</a></p>"
		      goutput.Write "</body></html>"
		    End If
		    goutput.Close
		    App.MouseCursor = Nil
		    
		    If exportOptions.EmbedCSS Then
		      If exportOptions.PrintStyle Then
		        If printCSSfile <> Nil Then
		          printCSSfile.Delete
		        End If
		      End If
		    ElseIf Not exportOptions.PrintStyle Then
		      If Not FileUtils.CopyFile(exportOptions.StyleSheet, printCSSFile, FileUtils.kOverwriteAlways) Then
		        Dim e As New IOException
		        e.ErrorNumber = -1
		        e.Message = FileUtils.LastError
		        Raise e
		      End If
		    End If
		    
		  End If
		  ProgressWindow.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongFolderAdd()
		  Dim f As FolderItem
		  Dim folderName As String
		  Dim i As Integer
		  
		  folderName = InputBox.Input(App.T.Translate("questions/new_name/@caption"), "")
		  If Len(folderName) > 0 Then
		    folderName = folderName.Trim
		    If folderName.IsEmpty Or Songs.CleanPath(folderName) <> folderName Or Not FileUtils.IsSafeFileName(folderName) Then
		      InputBox.Message App.T.Translate("errors/bad_file_name", folderName)
		      Return
		    End If
		    
		    // Check if we have a songs folder if not try to create one
		    If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		      If  App.DocsFolder <> Nil Then
		        InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.NativePath + App.STR_SONGS)
		      Else
		        InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		      End If
		      Return
		    End If
		    // If Songs is Nil, try to generate FolderDB
		    If Songs = Nil Then
		      If App.DocsFolder <> Nil Then
		        Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		      Else
		        InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		        Return
		      End If
		      If Songs = Nil Then
		        'Songs is still Nil, return (should never get here but we probably should
		        'give some error message anyway ;)
		        Return
		      End If
		    End If
		    
		    folderName = Songs.CombinePath(pop_songs_song_folders.Text, folderName)
		    f = Songs.AddFolder(folderName)
		    
		    If f = Nil Then
		      InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", folderName)
		      Return
		    End If
		    
		    If UBound(Songs.GetFolders(pop_songs_song_folders)) = 0 Then
		    End If
		    
		    For i = 0 To pop_songs_song_folders.ListCount - 1
		      If StrComp(pop_songs_song_folders.List(i), folderName, 1) = 0 Then
		        pop_songs_song_folders.ListIndex = i
		        Exit
		      End If
		    Next i
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongFolderDelete()
		  If pop_songs_song_folders.ListIndex <= 1 Then Return
		  
		  If InputBox.Ask(App.T.Translate("questions/delete/@caption", pop_songs_song_folders.Text)) Then
		    '++JRC Check if we have a songs folder if not try to create one
		    If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		      If  App.DocsFolder <> Nil Then
		        InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.NativePath + App.STR_SONGS)
		      Else
		        InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		      End If
		      Return
		    End If
		    '++JRC If Songs is Nil, try to generate FolderDB
		    If Songs = Nil Then
		      If App.DocsFolder <> Nil Then
		        Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		      Else
		        InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		        Return
		      End If
		      If Songs = Nil Then
		        'Songs is still Nil, return (should never get here but we probably should
		        'give some error message anyway ;)
		        Return
		      End If
		    End If
		    
		    If Not Songs.DeleteFolder(pop_songs_song_folders.Text) Then
		      InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", pop_songs_song_folders.Text)
		    Else
		      Dim folderName As String
		      Dim i As Integer
		      
		      folderName = pop_songs_song_folders.Text
		      
		      pop_songs_song_folders.RemoveRow pop_songs_song_folders.ListIndex
		      
		      i = StringUtils.InStrReverse(folderName, "/")
		      If i > 1 Then
		        folderName = folderName.Left(i - 1)
		        For i = pop_songs_song_folders.SelectedRowIndex DownTo 2
		          If StrComp(pop_songs_song_folders.List(i), folderName, 1) = 0 Then
		            pop_songs_song_folders.ListIndex = i
		            Exit
		          End If
		        Next i
		        If StrComp(pop_songs_song_folders.SelectedRow, folderName, 1) <> 0 Then
		          pop_songs_song_folders.ListIndex = 0
		        End If
		      Else
		        pop_songs_song_folders.ListIndex = 0
		      End If
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ActionSongInterleave(ByRef lines() As String) As Boolean
		  Dim start, count, state As Integer
		  Dim i As Integer
		  
		  state = 0
		  For i = 0 To UBound(lines)
		    If lines(i).Left(1).Len = 0 Then
		      lines(i) = " "
		    End If
		    If InStr(" 0123456789", lines(i).Left(1)) > 0 Then
		      If state = 0 Then
		        start = i
		        state = 1
		      End If
		      If State = 1 Then
		        count = count + 1
		      End If
		    Else
		      If state = 1 Then
		        Exit
		      End If
		    End If
		  Next
		  
		  If count < 3 Then Return False
		  
		  Dim offs As Integer
		  offs = count \ 2
		  
		  For i = offs DownTo 1
		    lines.Insert(i, lines.Pop)
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongMove()
		  Dim folder, folders(0) As String
		  Dim oldfolder As String
		  Dim oldFolderDisplay As String
		  Dim songName As String
		  Dim oldCellTag, newCellTag As String
		  Dim listindex As Integer
		  Dim status As Boolean
		  
		  'Ask if user wants to save
		  If Not ActionSongAskSave Then Return  // User Canceled
		  
		  'Check if we have a songs folder if not try to create one
		  If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		    If  App.DocsFolder <> Nil Then
		      InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.NativePath + App.STR_SONGS)
		    Else
		      InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		    End If
		    Return
		  End If
		  
		  'If Songs is Nil, try to generate FolderDB
		  If Songs = Nil Then
		    If App.DocsFolder <> Nil Then
		      Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		    Else
		      InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		      Return
		    End If
		    If Songs = Nil Then
		      'Songs is still Nil, return (should never get here but we probably should
		      'give some error message anyway ;)
		      Return
		    End If
		  End If
		  
		  listindex = lst_songs_songs.SelectedRowIndex
		  songName = lst_songs_songs.SelectedRowValue
		  If listindex < 0 Or listindex > lst_songs_songs.LastRowIndex Then Return // UpdateMenuItems should have made sure this never happens
		  oldCellTag = lst_songs_songs.CellTagAt(listindex, 0)
		  oldfolder = songs.CleanPath(oldCellTag)
		  oldFolderDisplay = Songs.UIPath(oldfolder)
		  folders = Songs.GetFolders
		  
		  // exclude oldFolder (no rename is provided here)
		  Dim folderIndex As Integer
		  folderIndex = folders.IndexOf(oldFolderDisplay)
		  If folderIndex >= 0 Then
		    folders.RemoveAt(folderIndex)
		  End If
		  
		  folders.AddAt(0, "")
		  folder = InputBox.Pick(App.T.Translate("songs_mode/selected_song/move/where/@caption", songName), folders, "( " + App.T.Translate("songs_mode/song_folders/filter_main/@caption") + " )")
		  
		  If folder.Length = 0 Then Return
		  folder = songs.CleanPath(folder)
		  If folder = oldfolder Then 
		    InputBox.Message(App.T.Translate("errors/same_filename"))
		    Return
		  End If
		  
		  App.MouseCursor = System.Cursors.Wait
		  status = Songs.MoveFile(Songs.CombinePath(oldfolder, songName), folder)
		  App.MouseCursor = Nil
		  
		  If Not status Then
		    InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", songName, folder)
		  Else
		    // Log song move
		    If App.MainPreferences.GetValueB(App.kActivityLog, True) And Globals.SongActivityLog <> Nil Then
		      Dim Log As New LogEntry(Globals.SongActivityLog)
		      Dim d As New Date
		      
		      Log.Title = edt_song_title.Text
		      Log.Author = edt_song_author.Text
		      Log.CCLISongNumber = edt_song_ccli.Text
		      Log.OldSongFileName = Songs.CombinePath(oldfolder, songName)
		      Log.SongFileName = Songs.CombinePath(folder, songName)
		      Log.DateAndTime = d
		      Log.HasChords = Log.CheckLyricsForChords(edf_song_lyrics.Text)
		      Log.Moved = True
		      
		      If Not Log.AddLogEntry Then
		        InputBox.Message App.T.Translate("errors/adding_entry")
		      End If
		    End If
		    
		    newCellTag = Songs.CellTagFormat(folder)
		    If pop_songs_song_folders.SelectedRow <> Songs.GetFilterAll() Then
		      lst_songs_songs.RemoveRowAt(lst_songs_songs.SelectedRowIndex)
		      // Open the song at the same index if possible
		      If listindex > lst_songs_songs.LastRowIndex Then
		        listindex = lst_songs_songs.LastRowIndex
		      End If
		    Else  // Fix the folder info on this file
		      lst_songs_songs.CellTagAt(listindex, 0) = newCellTag
		    End If
		    lst_songs_songs.SelectedRowIndex = listindex // Force a reopen...this will fix all the status items and fields
		    
		    If SongListIsFiltered Then
		      // fix the filter cache
		      Dim idx As Integer
		      idx = IndexOf(SavedSongList, songName : oldCellTag)
		      If idx <> -1 Then
		        If pop_songs_song_folders.SelectedRow = Songs.GetFilterAll() Then
		          SavedSongList(idx) = SavedSongList(idx).Left : newCellTag
		        Else
		          SavedSongList.RemoveAt(idx)
		        End If
		      End If
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongNew()
		  Dim newName, newPath As String
		  Dim f As FolderItem
		  Dim i As Integer
		  Dim loc As Integer 'location of file in list
		  Dim xnode As XmlNode
		  
		  'Ask if user wants to save
		  If Not ActionSongAskSave Then Return 'User Canceled
		  
		  newName = InputBox.Input(App.T.Translate("questions/new_name/@caption"), "")
		  If newName.Length > 0 Then
		    newName = newName.Trim
		    If newName.IsEmpty Or Songs.CleanPath(newName) <> newName Or Not FileUtils.IsSafeFileName(newName) Then
		      InputBox.Message App.T.Translate("errors/bad_file_name", newName)
		      Return
		    End If
		    
		    If App.CheckDocumentFolders(App.SONGS_FOLDER) <> App.NO_FOLDER Then
		      'If Songs is Nil, try to generate FolderDB
		      If Songs = Nil Then
		        Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		        If Songs = Nil Then
		          'Songs is still Nil, return (should never get here but we probably should
		          'give some error message anyway ;)
		          Return
		        End If
		      End If
		      
		      If pop_songs_song_folders.SelectedRowIndex >= 0 Then
		        newPath = pop_songs_song_folders.SelectedRow
		      End If
		      newPath = Songs.CellTagFormat(newPath)
		      f = Songs.AddFile(Songs.CombinePath(newPath, newName))
		      
		      If f = Nil Then
		        InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", newName)
		        Return
		      End If
		      
		      CurrentSong = New XmlDocument
		      xnode = CurrentSong.AppendChild(CurrentSong.CreateElement("song"))
		      SmartML.SetValue(xnode, "title", newName)
		      
		      If Not SmartML.XDocToFile(CurrentSong, f) Then
		        SmartML.DisplayError
		        Return
		      End If
		      
		      // Log song creation
		      If App.MainPreferences.GetValueB(App.kActivityLog, True) And Globals.SongActivityLog <> Nil Then
		        Dim Log As New LogEntry(Globals.SongActivityLog)
		        Dim d As New Date
		        
		        Log.Title = newName
		        Log.Author = ""
		        Log.CCLISongNumber = ""
		        Log.SongFileName = Songs.CombinePath(newPath, newName)
		        Log.DateAndTime = d
		        Log.HasChords = False  // Probably not ;)
		        Log.Created = True
		        
		        If Not Log.AddLogEntry Then
		          InputBox.Message App.T.Translate("errors/adding_entry")
		        End If
		      End If
		      
		      If SongListIsFiltered Then
		        ClearSongSearch
		      End If
		      i = 0
		      // Look for the place to insert the new song
		      While i < lst_songs_songs.RowCount And _
		        SortSongCmp(newName, newPath, _
		        lst_songs_songs.CellValueAt(i, 0), lst_songs_songs.CellTagAt(i, 0).StringValue) = 1
		        i = i + 1
		      Wend
		      lst_songs_songs.AddRowAt(i, newName)
		      loc = lst_songs_songs.LastAddedRowIndex
		      lst_songs_songs.CellTagAt(loc, 0) = newPath
		      Globals.OldSongFileName = ""
		      Status_SongOpen = False  // Hold off on unnecessary refreshes
		      LoadSongFields
		      Status_SongOpen = True
		      Status_SongChanged = False
		      lst_songs_songs.SelectedRowIndex = loc
		      lst_songs_songs.selected(loc) = True
		      Globals.OldSongFileName = Songs.CombinePath(newPath, newName)
		      Globals.OldSongSel = loc
		    Else
		      If App.DocsFolder <> Nil Then
		        InputBox.Message App.T.Translate("errors/create_songs_folder",  App.DocsFolder.NativePath + App.STR_SONGS)
		      Else
		        InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		      End If
		    End If
		  End If
		  
		  EnableMenuItems
		  If pge_contents.SelectedPanelIndex = 0 Then //General panel, go to author field
		    edt_song_author.SetFocus
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongPresent(screenMode As Integer, slideNumber As Integer = 0)
		  // Ask if user wants to save
		  If Not ActionSongAskSave Then Return  // User Canceled, Don't Present
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  // Create a temporary set document
		  Dim setDoc As XmlDocument = New XmlDocument
		  setDoc.AppendChild(setDoc.CreateElement("set"))
		  
		  Dim f As FolderItem
		  Dim where As Integer = 0
		  If Songs <> Nil Then f = Songs.GetFile(Globals.OldSongFileName)
		  AddSongFolderItemToSet(f, setDoc, where)
		  
		  PreparePresentation
		  
		  PresentWindow.Hide
		  PresentWindow.Present setDoc, screenMode, 0, slideNumber
		  If Globals.Status_Presentation Then
		    PresentWindow.Show
		  End If
		  
		  App.MouseCursor = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongPrint()
		  Dim rpt As LeadSheetReport
		  
		  // Ask if user wants to save
		  If Not ActionSongAskSave Then Return  // User Canceled
		  
		  rpt = New LeadSheetReport
		  If Not rpt.Setup Then
		    App.MouseCursor = Nil
		    Return  // User cancelled
		  End If
		  
		  rpt.AddSong(Songs.CombinePath(lst_songs_songs.CellTag(lst_songs_songs.ListIndex, 0), lst_songs_songs.Text))  // FolderDB path
		  If rpt.Generate Then
		    PrintWindow.SetReport(rpt)
		    PrintWindow.Top = Self.Top + 40
		    PrintWindow.Height = Self.Height - 80
		    PrintWindow.Left = Self.Left + 40
		    PrintWindow.Width = Self.Width - 80
		    PrintWindow.ShowModalWithin Self
		    App.DebugWriter.Write "MainWindow.ActionSongPrint: Return from PrintWindow"
		  End If
		  rpt = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongPrintAll()
		  //
		  // Print all songs in the current list.
		  //
		  Dim rpt As LeadSheetReport
		  Dim i As Integer
		  //++
		  // Feature request 1528693: require confirmation
		  //--
		  If Not InputBox.AskYN(App.T.Translate("questions/long_operation/@caption")) Then Return
		  
		  'Ask if user wants to save
		  If NOT ActionSongAskSave Then Return 'User Canceled
		  
		  If Status_SongChanged Then Return 'Don't print if user cancelled the save
		  
		  App.MouseCursor = System.Cursors.Wait
		  rpt = New LeadSheetReport
		  If Not rpt.Setup Then'++JRC Reset Mouse Cursor
		    App.MouseCursor = Nil
		    Return // User cancelled
		  End If
		  '--
		  
		  For i = 0 To lst_songs_songs.ListCount - 1
		    rpt.AddSong(Songs.CombinePath(lst_songs_songs.CellTag(i, 0), lst_songs_songs.list(i)))
		  Next i
		  If rpt.Generate Then
		    PrintWindow.SetReport(rpt)
		    PrintWindow.Top = Self.Top + 40
		    PrintWindow.Height = Self.Height - 80
		    PrintWindow.Left = Self.Left + 40
		    PrintWindow.Width = Self.Width - 80
		    App.MouseCursor = Nil
		    PrintWindow.ShowModalWithin Self
		    App.DebugWriter.Write "MainWindow.ActionSongPrintAll: Return from PrintWindow"
		  End If
		  App.MouseCursor = Nil
		  Catch ex
		    App.DebugWriter.Write "MainWindow.ActionSongPrintAll: Caught exception"
		    App.MouseCursor = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongRemove()
		  Dim listindex As Integer
		  Dim cellTag As String
		  Dim songPath, songName As String
		  listindex = lst_songs_songs.SelectedRowIndex
		  songName = lst_songs_songs.SelectedRowValue
		  If listindex = -1 Then
		    // we lost the position in lst_songs_songs or the button did not get disabled
		    // try to recover
		    If Globals.OldSongSel >= 0 And Globals.OldSongSel <= lst_songs_songs.LastColumnIndex Then
		      If lst_songs_songs.CellValueAt(Globals.OldSongSel, 0) = CurrentSongName Then
		        listindex = Globals.OldSongSel
		        songName = CurrentSongName
		      End If
		    End If
		  End If
		  cellTag = lst_songs_songs.CellTagAt(ListIndex, 0)
		  songPath = Songs.CleanPath(cellTag)
		  
		  If InputBox.Ask(App.T.Translate("questions/delete/@caption", songName)) Then
		    'Check if we have a songs folder if not try to create one
		    If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		      If  App.DocsFolder <> Nil Then
		        InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.NativePath + App.STR_SONGS)
		      Else
		        InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		      End If
		      Return
		    End If
		    
		    'If Songs is Nil, try to generate FolderDB
		    If Songs = Nil Then
		      If App.DocsFolder <> Nil Then
		        Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		      Else
		        'InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		        Return
		      End If
		      If Songs = Nil Then
		        'Songs is still Nil, return (should never get here but we probably should
		        'give some error message anyway ;)
		        Return
		      End If
		    End If
		    
		    If Not Songs.DeleteFile(Songs.CombinePath(songPath, songName)) Then
		      InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", songName)
		    Else
		      // Log song delete
		      If App.MainPreferences.GetValueB(App.kActivityLog, True) And Globals.SongActivityLog <> Nil Then
		        Dim Log As New LogEntry(Globals.SongActivityLog)
		        Dim d As New Date
		        
		        Log.Title = edt_song_title.Text
		        Log.Author = edt_song_author.Text
		        Log.CCLISongNumber = edt_song_ccli.Text
		        Log.SongFileName = Songs.CombinePath(songPath, songName)
		        Log.DateAndTime = d
		        Log.HasChords = Log.CheckLyricsForChords(edf_song_lyrics.Text)
		        Log.Deleted = True
		        
		        If Not Log.AddLogEntry Then
		          InputBox.Message App.T.Translate("errors/adding_entry")
		        End If
		      End If
		      
		      If SongListIsFiltered Then
		        Dim idx As Integer
		        idx = IndexOf(SavedSongList, songName : cellTag)
		        If idx <> -1 Then
		          SavedSongList.RemoveAt(idx)
		        End If
		      End If
		      
		      lst_songs_songs.RemoveRowAt(listindex)
		      If listindex < lst_songs_songs.RowCount Then
		        lst_songs_songs.SelectedRowIndex = listindex ' Open the next song in the list
		      ElseIf listindex = lst_songs_songs.RowCount Then
		        lst_songs_songs.SelectedRowIndex = listindex - 1 'Deleted the bottom of the list, stay there
		      End If
		      EnableMenuItems
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongRemoveLinked()
		  If lst_song_linked.ListIndex  < 0 Then
		    Return
		  End If
		  
		  lst_song_linked.RemoveRow(lst_song_linked.ListIndex)
		  Status_SongChanged = True
		  EnableMenuItems
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongRename()
		  Dim oldName, newName As String
		  Dim songTag, songPath As String
		  
		  'Ask if user wants to save
		  If Not ActionSongAskSave Then Return 'User Canceled
		  
		  'Check if we have a songs folder if not try to create one
		  If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		    If  App.DocsFolder <> Nil Then
		      InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.NativePath + App.STR_SONGS)
		    Else
		      InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		    End If
		    Return
		  End If
		  
		  'If Songs is Nil, try to generate FolderDB
		  If Songs = Nil Then
		    If App.DocsFolder <> Nil Then
		      Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		    Else
		      'InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		      Return
		    End If
		    If Songs = Nil Then
		      'Songs is still Nil, return (should never get here but we probably should
		      'give some error message anyway ;)
		      Return
		    End If
		  End If
		  
		  oldName = lst_songs_songs.SelectedRowValue
		  songTag = lst_songs_songs.CellTagAt(lst_songs_songs.SelectedRowIndex, 0)
		  songPath = Songs.CleanPath(songTag)
		  
		  newName = InputBox.Input(App.T.Translate("questions/rename/@caption", oldName), oldName)
		  If newName.Length > 0 Then
		    newName = newName.Trim
		    // Check for path characters
		    If newName.IndexOf("/") > 0 Or newName.IndexOf(":") > 0 Or newName.IndexOf("\") > 0 Then
		      InputBox.Message(App.T.Translate("errors/no_path_allowed"))
		      Return
		    End If
		    If newName.IsEmpty Or Songs.CleanPath(newName) <> newName Then
		      InputBox.Message(App.T.Translate("errors/bad_file_name", newName))
		      Return
		    End If
		    
		    If Songs.RenameFile(Songs.CombinePath(songPath, oldName), newName) Then
		      lst_songs_songs.List(lst_songs_songs.SelectedRowIndex) = newName
		      lst_songs_songs.SortingColumn = 0
		      If SongListIsFiltered Then
		        For Each song As Pair In SavedSongList
		          If song.Left.StringValue = oldName And song.Right.StringValue = songTag Then
		            song = newName : song.Right
		            Exit For
		          End If
		        Next
		        If newName.IndexOf(sch_songs_songs.Value) = -1 Then
		          lst_songs_songs.RemoveRowAt(lst_songs_songs.SelectedRowIndex)
		        End If
		      End If
		      lst_songs_songs.Sort
		      EnableMenuItems
		      
		      // Log song rename
		      If App.MainPreferences.GetValueB(App.kActivityLog, True) And Globals.SongActivityLog <> Nil Then
		        Dim Log As New LogEntry(Globals.SongActivityLog)
		        Dim d As New Date
		        
		        Log.Title = edt_song_title.Text
		        Log.Author = edt_song_author.Text
		        Log.CCLISongNumber = edt_song_ccli.Text
		        Log.OldSongFileName = Songs.CombinePath(songPath, oldName)
		        Log.SongFileName = Songs.CombinePath(songPath, newName)
		        Log.DateAndTime = d
		        Log.HasChords = Log.CheckLyricsForChords(edf_song_lyrics.Text)
		        Log.Renamed = True
		        
		        If Not Log.AddLogEntry Then
		          InputBox.Message App.T.Translate("errors/adding_entry")
		        End If
		      End If
		    Else
		      InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", newName, oldName)
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongRevert(Ask As Boolean)
		  'Dim f As FolderItem
		  Dim listindex As Integer
		  //++
		  // Feature request 1528693: require confirmation
		  //--
		  If Ask Then
		    If Not InputBox.AskYN(App.T.Translate("questions/revert/@caption")) Then Return
		  End If
		  listindex = lst_songs_songs.ListIndex
		  //++
		  // Bug 3455320 -- Was asking for "Save/Don't Save" after InputBox above.
		  Status_SongChanged = False ' This prevents ActionSongAskSave from firing
		  //--
		  lst_songs_songs.ListIndex = -1
		  lst_songs_songs.ListIndex = ListIndex
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionSongSave(noWrite As Boolean = False, SaveOldSong As Boolean = False)
		  'Changed function now has two parameters
		  '
		  'noWrite = True is the equivalent of just calling StoreSongFields
		  'Calling parameters not changed to avoid introducing unwanted side effects
		  'prior to release of V1.0 (EMP, February 2007)
		  
		  Dim f As FolderItem
		  Dim FullName As String
		  
		  If Not noWrite Then
		    '++JRC Check if we have a songs folder if not try to create one
		    If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		      If  App.DocsFolder <> Nil Then
		        InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.NativePath + App.STR_SONGS)
		      Else
		        InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		      End If
		      noWrite = True
		    End If
		    '--
		    
		    If Not noWrite Then
		      '++JRC If Songs is Nil, try to generate FolderDB
		      If Songs = Nil Then
		        If App.DocsFolder <> Nil Then
		          Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		        Else
		          'InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		        End If
		      End If
		      
		      if SaveOldSong = true then
		        If Songs <> Nil Then
		          f = Songs.GetFile(Globals.OldSongFileName)
		          If f = Nil Then
		            'File dosen't exist, try to create it
		            f = Songs.AddFile(Globals.OldSongFileName)
		            If f = Nil Then 'we tried
		              InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", Globals.OldSongFileName)
		              noWrite  = True
		            End If
		          End If
		        End If
		      Else
		        If Songs <> Nil Then
		          FullName = Songs.CombinePath(lst_songs_songs.CellTag(Globals.OldSongSel, 0).StringValue, lst_songs_songs.Cell(Globals.OldSongSel, 0))
		          f = Songs.GetFile(FullName)
		          If f = Nil Then
		            'File dosen't exist, try to create it
		            f = Songs.AddFile(FullName)
		            If f = Nil Then 'we tried
		              noWrite = True
		              InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", FullName)
		            End If
		          End If
		        End If
		        
		      End if
		      
		    End If
		  End If
		  
		  StoreSongFields
		  
		  If Not noWrite Then
		    If Not SmartML.XDocToFile(CurrentSong, f) Then
		      SmartML.DisplayError
		      Return
		    End If
		    
		    // Log song modification
		    If App.MainPreferences.GetValueB(App.kActivityLog, True) And Globals.SongActivityLog <> Nil Then
		      Dim Log As New LogEntry(Globals.SongActivityLog)
		      Log.Title = edt_song_title.Text
		      Log.Author = edt_song_author.Text
		      Log.CCLISongNumber = edt_song_ccli.Text
		      Log.SongFileName = Songs.CombinePath(lst_songs_songs.CellTag(Globals.OldSongSel, 0), lst_songs_songs.Text)
		      Log.DateAndTime = f.ModificationDate
		      Log.HasChords = Log.CheckLyricsForChords(edf_song_lyrics.Text)
		      Log.Modified = True
		      
		      If Not Log.AddLogEntry Then
		        InputBox.Message App.T.Translate("errors/adding_entry")
		      End If
		    End If
		    
		    Status_SongChanged = False
		    EnableMenuItems
		    
		  End If
		  
		  edf_song_lyrics.ColorizeBilingual()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ActionSongTryChange(updateFolderSelection As Boolean)
		  Dim changeToFullPath As String
		  
		  If Status_InSongLoading Then
		    Return
		  End If
		  
		  // If Globals.OldSongSel < 0, then immediately return.
		  // This is a flag that some manipulation of items is going on
		  // (See ActionSongNew, for example)
		  If Globals.OldSongSel < 0 Then Return
		  
		  If lst_songs_songs.ListIndex >= 0 Then
		    changeToFullPath = Songs.CombinePath(lst_songs_songs.CellTag(lst_songs_songs.ListIndex, 0).StringValue, lst_songs_songs.Text)
		  End If
		  If lst_songs_songs.ListIndex >= -1 Then // Fix corner case where user would click in an empty row of the list
		    // and has unsaved changes: those changes would be lost
		    If lst_songs_songs.ListIndex <> Globals.OldSongSel Or changeToFullPath <> Globals.OldSongFileName Then
		      If CurrentSong <> Nil And Status_SongChanged = True And Globals.OldSongFileName <> "" Then
		        // Ask if user wants to save
		        If Not ActionSongAskSave Then
		          // user canceled, go back to old selection
		          // this works except the FocusRing doesn't change back
		          // along with the selection box grrr
		          lst_songs_songs.ListIndex = Globals.OldSongSel
		          Return
		        End If
		      End If
		    Else
		      If CurrentSong <> Nil And Status_SongChanged = True And Globals.OldSongFileName <> "" Then
		        Return
		      End If
		    End If
		    
		    If lst_songs_songs.ListIndex >= 0 Then
		      Globals.OldSongSel = lst_songs_songs.ListIndex
		    End If
		  End If
		  
		  If lst_songs_songs.ListIndex >= 0 Then
		    // Check if we have a songs folder if not try to create one
		    If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		      If  App.DocsFolder <> Nil Then
		        InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.NativePath + App.STR_SONGS)
		      Else
		        InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		      End If
		      lst_songs_songs.ListIndex = -1
		      Return
		    End If
		    
		    // If Songs is Nil, try to generate FolderDB
		    If Songs = Nil Then
		      If App.DocsFolder <> Nil Then
		        Songs = New FolderDB(App.DocsFolder.Child(App.STR_SONGS))
		      Else
		        InputBox.Message App.T.Translate("errors/no_docs_folder", "")
		        lst_songs_songs.ListIndex = -1
		        Return
		      End If
		      If Songs = Nil Then
		        // Songs is still Nil, return (should never get here but we probably should
		        // give some error message anyway ;)
		        lst_songs_songs.ListIndex = -1
		        Return
		      End If
		    End If
		    
		    Call LoadSong(Songs.GetFile(changeToFullPath), updateFolderSelection)
		    
		  Else
		    Status_SongOpen = False
		    
		    ClearSongEditorFields()
		    
		    Status_SongChanged = False
		    CurrentSongName = ""
		    EnableMenuItems
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddLinkedSongs(song As XmlNode, AddToLog As Boolean, recursing As Boolean = False) As XmlDocument()
		  Dim i, j As Integer
		  Dim f As FolderItem
		  Dim sDoc As XmlDocument
		  Dim nodes() As XmlDocument
		  Dim nodesSub() As XmlDocument
		  Dim d As New Date
		  Dim index As Integer
		  Dim songId As String
		  Static songIds As Dictionary
		  
		  If Not recursing Then
		    songIds = New Dictionary
		  End If
		  
		  'sanity check
		  If song = Nil Then
		    Return Nil
		  End If
		  
		  Dim xlinked_songs As XmlNode = SmartML.GetNode(song, "linked_songs", True)
		  
		  For i = 0 To xlinked_songs.ChildCount - 1
		    
		    songId = xlinked_songs.Child(i).GetText
		    If SongIds.HasKey(songId) Then Continue
		    songIDs.Value(songId) = Nil
		    f = Songs.GetFile(songId)
		    If f = Nil Then
		      InputBox.Message App.T.Translate("folderdb_errors/error[@code='" + Str(Songs.ErrorCode) + "']", xlinked_songs.Child(i).GetText)
		      Continue
		    End If
		    
		    sDoc = SmartML.XDocFromFile(f)
		    If sDoc = Nil Then
		      SmartML.DisplayError
		      Continue
		    End If
		    
		    nodes.Append(sDoc)
		    
		    If AddToLog Then
		      ActLog.Append(New LogEntry(Globals.SongActivityLog))
		      index = Ubound(ActLog)
		      ActLog(index).Title = SmartML.GetValue(sDoc.DocumentElement, "title", True)
		      ActLog(index).Author = SmartML.GetValue(sDoc.DocumentElement, "author", True)
		      ActLog(index).CCLISongNumber = edt_song_ccli.Text
		      ActLog(index).SongFileName =  Songs.DBPathFromFolderItem(f)
		      ActLog(index).DateAndTime = d
		      ActLog(index).HasChords = ActLog(index).CheckLyricsForChords(edf_song_lyrics.Text)
		      ActLog(index).Presented = True
		      ActLog(index).SetItemNumber = index  // Assign an index to this song
		      ActLog(index).Displayed = False  // Set this to true if user displays this song
		    End If
		    
		    // recurse
		    nodesSub = AddLinkedSongs(sDoc.DocumentElement, AddToLog, True)
		    For j = 0 To UBound(nodesSub)
		      nodes.Append(nodesSub(j))
		    Next j
		    
		  Next i
		  
		  Return nodes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddLinkedSongsFolderItem(fSong As FolderItem, xSong As XmlNode, recursing As Boolean = False) As FolderItem()
		  Dim i, j As Integer
		  Dim f As FolderItem
		  Dim sDoc As XmlDocument
		  Dim nodes() As FolderItem
		  Dim nodesSub() As FolderItem
		  Dim songId As String
		  Static songIds As Dictionary
		  
		  If fSong = Nil Then Return nodes
		  If xSong = Nil Then
		    sDoc = SmartML.XDocFromFile(fSong)
		    If sDoc <> Nil Then
		      xSong = sDoc.DocumentElement
		    End If
		  End If
		  
		  'sanity check
		  If xSong = Nil Then
		    Return nodes
		  End If
		  
		  If Not recursing Then
		    songIds = New Dictionary
		    'Add the initial song so as to not recurse back to it
		    songIds.Value(Songs.DBPathFromFolderItem(fSong)) = Nil
		  End If
		  
		  Dim xlinked_songs As XmlNode = SmartML.GetNode(xSong, "linked_songs", True)
		  
		  i = 0
		  While i < xlinked_songs.ChildCount()
		    
		    songId = xlinked_songs.Child(i).GetText().Translate("\:","/")
		    If SongIds.HasKey(songId) Then
		      i = i + 1
		      Continue
		    End If
		    songIds.Value(songId) = Nil
		    f = Songs.GetFile(songId)
		    If f = Nil Then
		      InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", xlinked_songs.Child(i).GetText() )
		      i = i + 1
		      Continue
		    End If
		    
		    sDoc = SmartML.XDocFromFile(f)
		    If sDoc = Nil Then
		      SmartML.DisplayError
		      Continue
		    End If
		    
		    nodes.Append(f)
		    
		    // recurse
		    nodesSub = AddLinkedSongsFolderItem(f, sDoc.DocumentElement, True)
		    For j = 0 To UBound(nodesSub)
		      nodes.Insert(i+j,nodesSub(j))  // Insert rather than Append to do depth first recursion
		    Next j
		    
		    i = i + 1
		  Wend
		  
		  Return nodes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddPresentedSongsToLog()
		  // This function as the name implies checks which songs were presented
		  // and adds them to the activity log, then clears Globals.ActLog
		  Dim i As Integer
		  
		  For  i = 1  To  UBound(ActLog)
		    If ActLog(i) <> Nil Then
		      If ActLog(i).Displayed Then
		        If Not ActLog(i).AddLogEntry Then
		          InputBox.Message App.T.Translate("errors/adding_entry")
		        End If
		      End If
		    End If
		  Next i
		  
		  For i  = UBound(ActLog)  DownTo 1
		    If ActLog(i) <> Nil Then
		      ActLog.Remove(i)
		    End If
		  Next i
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddSongFolderItemToSet(f As FolderItem, setDoc As XmlDocument, ByRef Where As Integer, presentation As String = "", registerInItemListControl As Boolean = False)
		  Dim SongPath As String
		  Dim xgroups, newGroup As XmlNode
		  Dim sDoc As XmlDocument
		  Dim songFiles() As FolderItem
		  Dim i As Integer = 0
		  Dim CheckLinked As Boolean = True
		  
		  xgroups = SmartML.GetNode(setDoc.DocumentElement, "slide_groups", True)
		  
		  While f <> Nil
		    sDoc = SmartML.XDocFromFile(f)
		    If sDoc = Nil Then
		      SmartML.DisplayError
		    Else
		      newGroup = SmartML.InsertChild(xgroups, "slide_group", Where)
		      SmartML.SetValue newGroup, "@name", f.Name
		      SmartML.SetValue newGroup, "@type", "song"
		      If presentation <> "" Then SmartML.SetValue(newGroup, "@presentation", presentation)
		      
		      // Add a path attribute relative to the base songs directory.  Otherwise, two instances
		      // of the same song name in a parent/child folder relationship will never find the song
		      // in the child folder.
		      SongPath = Songs.DBPathFromFolderItem(f.Parent)
		      SmartML.SetValue newGroup, "@path", SongPath
		      
		      If registerInItemListControl Then ActionInSetAddSlide newGroup
		      
		      Where = Where + 1
		      
		      If CheckLinked Then
		        If HasLinkedSongs(sDoc.DocumentElement) Then
		          If SmartML.GetValueB(App.MyMainSettings.DocumentElement, "linked_songs/@prompt", True) Then
		            CheckLinked = InputBox.AskYN(App.T.Translate("questions/linked_songs/@caption"))
		          End If
		          If CheckLinked Then
		            songFiles = AddLinkedSongsFolderItem(f, sDoc.DocumentElement, False)
		            i = 0
		          End If
		        End If
		        
		        CheckLinked = False
		      End If
		    End If
		    
		    If i <= UBound(songFiles) Then
		      f = songFiles(i)
		      i = i + 1
		    Else
		      f = Nil
		    End If
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CheckLyricLines(edfLyrics As TextArea)
		  //+
		  // Revised version of CheckLyricLines works on the edit field instead of a string
		  // Goal: maintain cursor position while changing contents of the field
		  //
		  // Do a basic check on the lyrics lines
		  // If the first character on the line isn't a code of some sort,
		  // assume it's a lyric line and adjust the line to include
		  // the space at the start of the line.
		  //--
		  Dim codes As String
		  Dim numLines As Integer
		  Dim i As Integer
		  Dim cursorStart As Integer
		  Dim selectionLen As Integer
		  Dim cursorLine As Integer
		  Dim lineCode As String
		  Dim linePos As Integer
		  Dim iLineCode As Integer
		  Dim lyrics As String
		  Dim linePosOffset As Integer
		  Dim modified As Boolean
		  
		  numLines = edfLyrics.LineNumAtCharPos(edfLyrics.Text.Len)
		  cursorStart = edfLyrics.SelStart
		  selectionLen = edfLyrics.SelLength
		  cursorLine = edfLyrics.LineNumAtCharPos(cursorStart)
		  codes = " [-0123456789.!;"
		  #if TargetWin32
		    codes = codes + EndOfLine.Windows
		  #elseif TargetMacOS
		    codes = codes + EndOfLine.Macintosh
		  #elseif TargetLinux
		    codes = codes + EndOfLine.UNIX
		  #endif
		  
		  lyrics = edfLyrics.Text
		  linePosOffset = 0
		  
		  For i = 0 to numLines
		    linePos = edfLyrics.CharPosAtLineNum(i) + linePosOffset
		    lineCode = Mid(lyrics, linePos, 1)
		    iLineCode = Asc(lineCode)
		    If InStr(codes, lineCode) = 0 Then
		      modified = True
		      lyrics = Left(lyrics, linePos - 1) + " " + Mid(lyrics, linePos)
		      linePosOffset = linePosOffset + 1
		      If i <= cursorLine Then
		        cursorStart = cursorStart + 1
		      End If
		    End If
		  Next
		  
		  If modified Then
		    edfLyrics.Text = lyrics
		  End If
		  
		  If cursorStart <> edfLyrics.SelStart Then
		    edfLyrics.SelStart = cursorStart
		    edfLyrics.SelLength = selectionLen
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CleanupExternals(setDoc As XmlDocument)
		  Dim slide_group, slide_groups As XmlNode
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  If setDoc <> Nil Then
		    slide_groups = SmartML.GetNode(setDoc.DocumentElement, "slide_groups", True)
		  End If
		  If slide_groups <> Nil Then
		    slide_group = slide_groups.FirstChild
		  End If
		  
		  While slide_group <> Nil
		    If SmartML.GetValue(slide_group, "@type", True) = "external" Then
		      
		      Select Case SmartML.GetValue(slide_group, "@application")
		      Case "presentation", "videolan"
		        
		        Dim tempFilename As String
		        tempFilename = SmartML.GetValue(slide_group, "@_localfilename", False)
		        If Not tempFilename.IsEmpty Then
		          
		          Try
		            // This is an embedded file that was stored to disk for presenting, delete it
		            Dim embedFile As FolderItem
		            embedFile = New FolderItem(tempFilename, FolderItem.PathModes.Native)
		            If embedFile <> Nil And embedFile.Exists Then
		              embedFile.Delete()
		            End If
		          Catch
		            // ignore. The file needs to get cleaned up externally if it still exists
		          End Try
		        End If
		        
		      End Select
		    End If
		    
		    slide_group  = slide_group.NextSibling
		  Wend
		  
		  App.MouseCursor = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CleanupPresentation(ByRef setDoc As XmlDocument)
		  AddPresentedSongsToLog
		  
		  PresentationFactory.ClearPresentationCache()
		  CleanupExternals setDoc
		  
		  #If TargetWin32 Then
		    WinAPI.Animation = m_oldAnimationsEnabled
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearSetEditorFields()
		  // page 2 - custom slide
		  edt_slide_name.Text = ""
		  edt_slide_title.Text = ""
		  edt_slide_subtitle.Text = ""
		  edt_slide_notes.Text = ""
		  chk_slide_loop.Value = False
		  chk_slide_print.Value = False
		  pop_slide_transition.ListIndex = -1
		  edt_slide_auto_advance.Text = ""
		  edt_slide_order.Text = ""
		  edt_slide_origorder.Text = ""
		  edt_slide_folder.Text = ""
		  chk_slide_style.Value = False
		  can_slide_style.ClearStyleNode
		  can_slide_style.ClearPreviewSlide
		  can_slide_style.SongStyle = False
		  edf_slide_slides.Text = ""
		  
		  // page 3 - style
		  rad_style_change.Value = True
		  rad_style_change.Value = False
		  rad_style_revert.Value = False
		  can_style_style.ClearStyleNode
		  can_style_style.ClearPreviewSlide
		  can_style_style.SongStyle = False
		  
		  // page 4 - image
		  edt_image_title.Text = ""
		  edt_image_subtitle.Text = ""
		  edt_image_name.Text = ""
		  chk_image_descriptions.Value = False
		  lst_image_images.RemoveAllRows()
		  chk_image_fit_to_screen.Value = False
		  chk_image_fit_to_body.Value = False
		  chk_image_keepaspect.Value = False
		  chk_image_store_as_link.Value = False
		  edt_image_notes.Text = ""
		  chk_image_loop.Value = False
		  chk_image_print.Value = False
		  edt_image_auto_advance.Text = ""
		  chk_image_style.Value = False
		  can_image_style.ClearStyleNode
		  can_image_style.ClearPreviewSlide
		  can_image_style.SongStyle = False
		  pop_image_transition.ListIndex = -1
		  
		  // page 5 - external
		  edt_external_name.Text = ""
		  edt_external_notes.Text = ""
		  chk_external_loop.Value = False
		  chk_external_print.Value = False
		  // sub 5.1 presentation
		  rad_external_host_powerpoint.Value = True
		  rad_external_host_powerpoint.Value = False
		  rad_external_host_pptview.Value = False
		  rad_external_host_impress.Value = False
		  edt_external_presentation_file.Text = ""
		  chk_external_loop_presentation.Value = False
		  chk_external_embed_presentation.Value = False
		  // sub 5.2 videolan
		  rad_external_videolan_start.Value = True
		  rad_external_videolan_start.Value = False
		  rad_external_videolan_stop.Value = False
		  edt_external_videolan_mediafilename.Text = ""
		  chk_external_embed_mediafile.Value = False
		  lst_external_videolan_preset.RemoveAllRows()
		  edt_external_application_parameters.Text = ""
		  chk_external_wait_for_videolan.Value = False
		  // sub 5.3 application
		  rad_external_application_start.Value = True
		  rad_external_application_start.Value = False
		  rad_external_application_stop.Value = False
		  edt_external_application_filename.Text = ""
		  edt_external_application_parameters.Text = ""
		  chk_external_wait_for_application.Value = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearSongEditorFields()
		  // page 0 - general
		  edt_song_title.Text = ""
		  edt_song_copyright.Text = ""
		  edt_song_author.Text = ""
		  edt_song_presentation.Text = ""
		  edf_song_lyrics.Text = ""
		  edt_song_hymn_number.Text = ""
		  edt_song_ccli.Text = ""
		  pop_song_accidentals.ListIndex = 0
		  pop_song_transpose.ListIndex = 6
		  lst_song_linked.RemoveAllRows()
		  
		  // page 1 - advanced
		  lst_song_themes.RemoveAllRows()
		  chk_song_capo_print.Value = False
		  pop_song_capo.ListIndex = 0
		  pop_song_capo_accidentals.ListIndex = 0
		  edt_song_key.Text = ""
		  pop_song_time_sig.ListIndex = 0
		  pop_song_tempo.ListIndex = 0
		  edt_song_aka.Text = ""
		  edt_song_key_line.Text = ""
		  edt_song_user1.Text = ""
		  edt_song_user2.Text = ""
		  edt_song_user3.Text = ""
		  can_song_style.ClearStyleNode()
		  can_song_style.ClearStyleNode()
		  chk_song_style.Value = False
		  
		  // page 6 - images
		  lst_song_backgrounds.RemoveAllRows()
		  chk_song_fit_to_screen.Value = False
		  chk_song_fit_to_body.Value = False
		  chk_song_keepaspect.Value = False
		  chk_song_store_as_link.Value = False
		  chk_song_background_as_text.Value = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearSongSearch()
		  If SongListIsFiltered Then
		    SongListIsFiltered = False
		    
		    Status_InSongLoading = True
		    
		    // save the current position
		    Dim currSong, currPath As String
		    Dim currSongIdx As Integer
		    currSong = CurrentSongName
		    currPath = CurrentSongFolderPath
		    If CurrentSongName.IsEmpty Then
		      currSongIdx = -2  // flag to not try to find currSongIdx
		    Else
		      currSongIdx = -1
		    End If
		    
		    lst_songs_songs.RemoveAllRows
		    
		    For Each song As Pair In SavedSongList
		      lst_songs_songs.AddRow song.left.StringValue
		      lst_songs_songs.CellTag(lst_songs_songs.LastAddedRowIndex, 0) = song.Right.StringValue
		      If currSongIdx = -1 And song.Left.StringValue = currSong And song.Right.StringValue = currPath Then
		        currSongIdx = lst_songs_songs.LastAddedRowIndex
		      End If
		    Next
		    lst_songs_songs.Sort
		    
		    Status_InSongLoading = False
		    If currSongIdx = -2 Then currSongIdx = -1
		    lst_songs_songs.SelectedRowIndex = currSongIdx
		    
		    Redim SavedSongList(-1)
		    
		    If sch_songs_songs.Value <> "" Then
		      sch_songs_songs.Value = ""
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoSongSearch(searchText As String, inBackground As Boolean = False)
		  #Pragma Unused inBackground // intended to signify this function may return before the serach is executed completely e.g. on live-search while typing
		  
		  Dim itemValue As String
		  
		  If searchText = "" Then
		    ClearSongSearch
		  Else
		    Status_InSongLoading = True
		    
		    // save the current position
		    Dim currSong, currPath As String
		    Dim currSongIdx As Integer
		    currSong = CurrentSongName
		    currPath = CurrentSongFolderPath
		    If CurrentSongName.IsEmpty Then
		      currSongIdx = -2  // flag to not try to find currSongIdx
		    Else
		      currSongIdx = -1
		    End If
		    
		    // Todo: check if these encoding changes are redundant with introduction of LocaleForSearch below
		    searchText = searchText.ConvertEncoding(Encodings.UTF8)
		    #If TargetMacOS Then
		      searchText = searchText.NormalizeStringEncoding(StringUtils.NormalizationForms.NFD)
		    #EndIf
		    
		    If Not SongListIsFiltered Then
		      Redim SavedSongList(lst_songs_songs.LastRowIndex)
		      For i As Integer = 0 To lst_songs_songs.LastRowIndex
		        SavedSongList(i) = New Pair(lst_songs_songs.CellValueAt(i, 0), lst_songs_songs.CellTag(i, 0))
		      Next
		    End If
		    SongListIsFiltered = True
		    
		    lst_songs_songs.RemoveAllRows
		    
		    For Each song As Pair In SavedSongList
		      itemValue = song.Left.StringValue
		      itemValue = itemValue.ConvertEncoding(Encodings.UTF8).ToText // should be redundant with introduction of LocaleForSearch below
		      
		      #If DebugBuild Then
		        Dim dbgPos As Integer
		        dbgPos = itemValue.IndexOf(searchText)
		        dbgPos = itemValue.IndexOf(searchText, ComparisonOptions.CaseInsensitive)
		        dbgPos = itemValue.IndexOf(searchText, ComparisonOptions.CaseSensitive)
		        Dim LocaleName As String
		        LocaleName = Locale.Current.Identifier
		        dbgPos = itemValue.IndexOf(searchText, ComparisonOptions.CaseInsensitive, Locale.Current)
		        dbgPos = itemValue.IndexOf(searchText, ComparisonOptions.CaseSensitive, Locale.Current)
		        LocaleName = Locale.Raw.Identifier
		        dbgPos = itemValue.IndexOf(searchText, ComparisonOptions.CaseInsensitive, Locale.Raw)
		        dbgPos = itemValue.IndexOf(searchText, ComparisonOptions.CaseSensitive, Locale.Raw)
		        LocaleName = App.LocaleForSearch.Identifier
		        dbgPos = itemValue.IndexOf(searchText, ComparisonOptions.CaseInsensitive, App.LocaleForSearch)
		        dbgPos = itemValue.IndexOf(searchText, ComparisonOptions.CaseSensitive, App.LocaleForSearch)
		      #endif
		      
		      If itemValue.IndexOf(searchText, ComparisonOptions.CaseInsensitive, App.LocaleForSearch) > -1 Then
		        lst_songs_songs.AddRow(song.Left.StringValue)
		        lst_songs_songs.CellTag(lst_songs_songs.LastAddedRowIndex, 0) = song.Right.StringValue
		        If currSongIdx = -1 And song.Left.StringValue = currSong And song.Right.StringValue = currPath Then
		          currSongIdx = lst_songs_songs.LastAddedRowIndex
		        End If
		      End If
		    Next
		    lst_songs_songs.Sort
		    
		    Status_InSongLoading = False
		    If currSongIdx = -2 Then currSongIdx = -1
		    lst_songs_songs.SelectedRowIndex = currSongIdx
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoWindowResize()
		  spl_main.MoveSplitter
		  
		  #If DebugBuild
		    If HSizer <> Nil Then
		      App.DebugWriter.Write CurrentMethodName + ": Calling HSizer.Resize", 7
		    Else
		      App.DebugWriter.Write CurrentMethodName + ": HSizer is Nil", 7
		    End If
		  #EndIf
		  If HSizer <> Nil Then
		    HSizer.Resize
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Find()
		  App.DebugWriter.Write "MainWindow.Find: Enter"
		  If FindWindow.Popup(Find) Then
		    FindStartSong = lst_songs_songs.ListIndex
		    App.DebugWriter.Write "MainWindow.Find: FindStartSong = " + Str(lst_songs_songs.ListIndex)
		    FindNext
		  End If
		  App.DebugWriter.Write "MainWindow.Find: Exit"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindInFields(xSearchedSong As XmlDocument, currentSongIndex As Integer) As RectControl
		  If Find = Nil Then Return Nil
		  
		  Dim found As RectControl
		  Dim searchText As String = Find.FindString.Lowercase
		  
		  If find.FindTitle And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "title")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 1 Or (FindFocus = 1 And (edt_song_title.SelStart + edt_song_title.SelLength = 0 Or InStr(edt_song_title.SelStart + edt_song_title.SelLength + 1, Lowercase(edt_song_title.Text), searchText) > 0))) Then
		    found = edt_song_title
		  ElseIf find.FindAuthor And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "author")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 2 Or (FindFocus = 2 And (edt_song_author.SelStart+edt_song_author.SelLength = 0 Or InStr(edt_song_author.SelStart+edt_song_author.SelLength+1, Lowercase(edt_song_author.Text), searchText) > 0))) Then
		    found = edt_song_author
		  ElseIf find.FindCopyright And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "copyright")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 3 Or (FindFocus = 3 And (edt_song_copyright.SelStart+edt_song_copyright.SelLength = 0 Or InStr(edt_song_copyright.SelStart+edt_song_copyright.SelLength+1, Lowercase(edt_song_copyright.Text), searchText) > 0))) Then
		    found = edt_song_copyright
		  ElseIf find.FindCCLI And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "ccli")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 4 Or (FindFocus = 4 And (edt_song_ccli.SelStart+edt_song_ccli.SelLength = 0 Or InStr(edt_song_ccli.SelStart+edt_song_ccli.SelLength+1, Lowercase(edt_song_ccli.Text), searchText) > 0))) Then
		    found = edt_song_ccli
		  ElseIf find.FindPresentation And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "presentation")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 5 Or (FindFocus = 5 And (edt_song_presentation.SelStart+edt_song_presentation.SelLength = 0 Or InStr(edt_song_presentation.SelStart+edt_song_presentation.SelLength+1, Lowercase(edt_song_presentation.Text), searchText) > 0))) Then
		    found = edt_song_presentation
		  ElseIf find.FindLyrics And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "lyrics")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 6 Or (FindFocus = 6 And (edf_song_lyrics.SelStart+edf_song_lyrics.SelLength = 0 Or InStr(edf_song_lyrics.SelStart+edf_song_lyrics.SelLength+1, Lowercase(edf_song_lyrics.Text), searchText) > 0))) Then
		    found = edf_song_lyrics
		  ElseIf find.FindThemes And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "theme")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 7) Then
		    found = lst_song_themes
		  ElseIf find.FindCapo And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "capo")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 8) Then
		    found = pop_song_capo
		  ElseIf find.FindTimeSig And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "time_sig")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 9) Then
		    found = pop_song_time_sig
		  ElseIf find.FindTempo And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "tempo")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 10) Then
		    found = pop_song_tempo
		  ElseIf find.FindKey And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "key")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 11 Or (FindFocus = 11 And (edt_song_key.SelStart+edt_song_key.SelLength = 0 Or InStr(edt_song_key.SelStart+edt_song_key.SelLength+1, Lowercase(edt_song_key.Text), searchText) > 0))) Then
		    found = edt_song_key
		  ElseIf find.FindAKA And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "aka")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 12 Or (FindFocus = 12 And (edt_song_aka.SelStart+edt_song_aka.SelLength = 0 Or InStr(edt_song_aka.SelStart+edt_song_aka.SelLength+1, Lowercase(edt_song_aka.Text), searchText) > 0))) Then
		    found = edt_song_aka
		  ElseIf find.FindKeyLine And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "key_line")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 13 Or (FindFocus = 13 And (edt_song_key_line.SelStart+edt_song_key_line.SelLength = 0 Or InStr(edt_song_key_line.SelStart+edt_song_key_line.SelLength+1, Lowercase(edt_song_key_line.Text), searchText) > 0))) Then
		    found = edt_song_key_line
		  ElseIf find.FindUser1 And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "user1")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 14 Or (FindFocus = 14 And (edt_song_user1.SelStart+edt_song_user1.SelLength = 0 Or InStr(edt_song_user1.SelStart+edt_song_user1.SelLength+1, Lowercase(edt_song_user1.Text), searchText) > 0))) Then
		    found = edt_song_user1
		  ElseIf find.FindUser2 And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "user2")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 15 Or (FindFocus = 15 And (edt_song_user2.SelStart+edt_song_user2.SelLength = 0 Or InStr(edt_song_user2.SelStart+edt_song_user2.SelLength+1, Lowercase(edt_song_user2.Text), searchText) > 0))) Then
		    found = edt_song_user2
		  ElseIf find.FindUser3 And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "user3")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 16 Or (FindFocus = 16 And (edt_song_user3.SelStart+edt_song_user3.SelLength = 0 Or InStr(edt_song_user3.SelStart+edt_song_user3.SelLength+1, Lowercase(edt_song_user3.Text), searchText) > 0))) Then
		    found = edt_song_user3
		  ElseIf find.FindHymnNumber And InStr(Lowercase(SmartML.GetValue(xSearchedSong.DocumentElement, "hymn_number")), searchText) > 0 And (currentSongIndex <> lst_songs_songs.ListIndex Or FindFocus < 17 Or (FindFocus = 17 And (edt_song_hymn_number.SelStart + edt_song_hymn_number.SelLength = 0 Or InStr(edt_song_hymn_number.SelStart + edt_song_hymn_number.SelLength + 1, Lowercase(edt_song_hymn_number.Text), searchText) > 0))) Then
		    found = edt_song_hymn_number
		  ElseIf find.FindChord Then
		    If edf_song_lyrics.SelStart >= edf_song_lyrics.Text.Len And edf_song_lyrics.SelLength = 0 Then
		      edf_song_lyrics.SelStart = 0 // Correct for situation where the selection marker is at the end of the field.
		    End If
		    Dim pos As Integer
		    Dim c As String
		    pos = SongML.FindChord(xSearchedSong.DocumentElement, Find.ChordKey, Find.ChordForm, (edf_song_lyrics.SelStart + edf_song_lyrics.SelLength + 1), c)
		    If pos > 0 Then
		      found = edf_song_lyrics
		      If lst_songs_songs.ListIndex <> currentSongIndex Then lst_songs_songs.ListIndex = currentSongIndex
		      edf_song_lyrics.SelStart = (pos - c.Len - 1)
		      edf_song_lyrics.SelLength = c.Len
		      
		      searchText = c
		    Else
		      found = Nil
		    End If
		  End If
		  
		  Return found
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FindNext()
		  App.DebugWriter.Write "MainWindow.FindNext: Enter"
		  If Find = Nil Or (Find.FindString.Len = 0 And Find.FindChord = False) Then
		    Find
		    Return
		  End If
		  
		  Dim searchText As String
		  Dim xSearchedSong As XmlDocument
		  Dim i As Integer
		  Dim f As FolderItem
		  
		  Dim found As RectControl = Nil
		  Dim edtFound As TextEdit
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  If Status_SongChanged Then ActionSongSave True // updates CurrentSong but doesn't write it to file
		  If pge_controls.Value <> 0 Then SetMode 0
		  
		  searchText = Lowercase(find.FindString)
		  
		  If lst_songs_songs.ListCount() > 0 Then
		    i = lst_songs_songs.ListIndex
		    If i < 0 Then
		      i = 0 // if there is no song selected, select the first
		      If FindStartSong < 0 Then FindStartSong = 0 // by implication, if i < 0, this is too
		      App.DebugWriter.Write("MainWindow.FindNext: Open " + str(i) + " " +  lst_songs_songs.CellTag(i, 0).StringValue + lst_songs_songs.List(i))
		      f = Songs.GetFile(lst_songs_songs.CellTag(i, 0).StringValue, lst_songs_songs.List(i))
		      If f = Nil Or Not f.Exists Then
		        App.MouseCursor = Nil
		        InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", lst_songs_songs.List(i))
		        Return
		      End If
		      xSearchedSong = SmartML.XDocFromFile(f)
		    Else
		      xSearchedSong = CurrentSong
		    End If
		    
		    //++
		    // Bug 1089442: Catch s = Nil.  Unlikely to happen, but possible if i < 0 and the first document isn't valid
		    //
		    // For the moment, just error and return.  Could be avoided by splitting out the code that opens the song
		    // files and determines when done (i.e., XmlDocument = GetNextSong( ByRef i, FindStartSong ))
		    //--
		    If xSearchedSong = Nil Then
		      App.MouseCursor = Nil
		      InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", lst_songs_songs.List(i))
		      Return
		    End If
		    
		    ProgressWindow.SetProgress 0
		    ProgressWindow.lbl_status.Text =  App.T.Translate("progress_status/song_search") + "..."
		    ProgressWindow.Show()
		    
		    While found = Nil And i < lst_songs_songs.ListCount
		      ProgressWindow.SetProgress (i+1) / lst_songs_songs.ListCount * 100
		      ProgressWindow.SetStatus lst_songs_songs.List(i)
		      
		      found = FindInFields(xSearchedSong, i)
		      
		      If found <> Nil Then
		        If lst_songs_songs.ListIndex <> i Then 
		          lst_songs_songs.ListIndex = i
		        End If
		        
		        found.SetFocus
		        
		        If found IsA TextEdit Then
		          edtFound = TextEdit(found)
		          // Some edit fields end up with SelStart at the end and no selection after loading.
		          // This corrects incorrect highlighting of the first found string in a field.
		          If edtFound.SelStart >= edtFound.Text.Len And edtFound.SelLength = 0 Then
		            edtFound.SelStart = 0
		          End If
		          If edtFound.SelStart+edtFound.SelLength = 0 Then
		            edtFound.SelStart = InStr(Lowercase(edtFound.Text), searchText) - 1
		          Else
		            edtFound.SelStart = InStr(edtFound.SelStart+edtFound.SelLength+1, Lowercase(edtFound.Text), searchText) - 1
		          End If
		          edtFound.SelLength = searchText.Len 'find.FindString.Len
		        End If
		        
		        //++
		        // 3 December 2006, EMP
		        // Change logic that verifies the control is visible to a more generic form
		        // that doesn't rely on knowledge of the panel layout
		        //--
		        If pge_contents.Value <> Control(found).PanelIndex And Control(found).PanelIndex > -1 Then
		          pge_contents.Value = Control(found).PanelIndex
		        End If
		      Else
		        Do
		          i = i + 1
		          If i >= lst_songs_songs.ListCount Then
		            i = 0 // Circle around to the beginning
		          End If
		          If i = FindStartSong Then // Check for finished
		            Exit
		          End If
		          If i < lst_songs_songs.ListCount Then
		            Dim songNameAndPath As String
		            songNameAndPath = Songs.CombinePath(lst_songs_songs.CellTag(i, 0).StringValue, lst_songs_songs.List(i))
		            f = Songs.GetFile(songNameAndPath)
		            If f = Nil Or Not f.Exists Then
		              App.MouseCursor = Nil
		              InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", lst_songs_songs.List(i))
		              ProgressWindow.Close()
		              Return
		            End If
		            xSearchedSong = SmartML.XDocFromFile(f)
		            If xSearchedSong = Nil Then
		              App.DebugWriter.Write("MainWindow.FindNext: Error converting file to XML String: " + lst_songs_songs.CellTag(i, 0).StringValue + lst_songs_songs.list(i), 1)
		              App.MouseCursor = Nil
		              InputBox.Message App.T.Translate("errors/bad_format", lst_songs_songs.List(i), SmartML.ErrorString)
		              App.MouseCursor = System.Cursors.Wait
		            End If
		          End If
		        Loop Until xSearchedSong <> Nil
		        If find.FindChord Then
		          edf_song_lyrics.SelStart = 0
		        End If
		      End If
		      //++
		      // See if we left the loop because we are at the end.  If so, leave the While loop
		      //--
		      If i = FindStartSong Then
		        Exit
		      End If
		    Wend
		    ProgressWindow.Close()
		  End If
		  
		  If found = Nil Then
		    App.MouseCursor = Nil
		    InputBox.Message App.T.Translate("errors/end_of_songs")
		  End If
		  
		  App.MouseCursor = Nil
		  App.DebugWriter.Write("MainWindow.FindNext: Exit")
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FixLinuxLayout()
		  // This code fixes an issue with TextAreas overlapping the label below it
		  #If TargetLinux
		    Dim y As Integer
		    
		    // Should really adjust the entire column, but I start at the user fields
		    
		    y = lbl_song_user1.Top + lbl_song_user1.Height
		    If y > edt_song_user1.Top Then
		      edt_song_user1.Top = y
		    Else
		      y = edt_song_user1.Top
		    End If
		    y = y + edt_song_user1.Height
		    
		    If y > lbl_song_user2.Top Then
		      lbl_song_user2.Top = y
		    Else
		      y = lbl_song_user2.Top
		    End If
		    y = y + lbl_song_user2.Height
		    If y > edt_song_user2.Top Then
		      edt_song_user2.Top = y
		    Else
		      y = edt_song_user2.Top
		    End If
		    y = y + edt_song_user2.Height
		    
		    If y > lbl_song_user3.Top Then
		      lbl_song_user3.Top = y
		    Else
		      y = lbl_song_user3.Top
		    End If
		    y = y + lbl_song_user3.Height
		    If y > edt_song_user3.Top Then
		      edt_song_user3.Top = y
		    Else
		      y = edt_song_user3.Top
		    End If
		    y = y + edt_song_user3.Height
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetImageSlideStylePreviewSlide(xSlide As XmlNode) As XmlNode
		  Dim xPreviewDoc As XmlDocument = New XmlDocument
		  Dim xNode As XmlNode
		  xPreviewDoc.AppendChild(xPreviewDoc.SafeImportNode(App.StylePreview, True))
		  xNode = SmartML.GetNode(xPreviewDoc.DocumentElement, "slide_groups/slide_group")
		  // there's unfortunately no easy way to distinguish no node and node with value "" (i.e. element with no textnode) using SamartML
		  If SmartML.GetNode(xSlide.Parent.Parent, "title") <> Nil Then
		    SmartML.SetValue(xNode, "title", SmartML.GetValue(xSlide.Parent.Parent, "title", False))
		  End If
		  If SmartML.GetNode(xSlide.Parent.Parent, "subtitle") <> Nil Then
		    SmartML.SetValue(xNode, "subtitle", SmartML.GetValue(xSlide.Parent.Parent, "subtitle", False))
		  End If
		  SmartML.SetValue(xNode, "slides/slide/description", SmartML.GetValue(xSlide, "description", False, SmartML.GetValue(xNode, "description", False)))
		  SmartML.SetValue(xNode, "@descriptions_in_subtitle", SmartML.GetValue(xSlide.Parent.Parent, "@descriptions_in_subtitle", False, SmartML.GetValue(xNode, "@descriptions_in_subtitle", False)))
		  SmartML.SetValue(xNode, "@resize", SmartML.GetValue(xSlide.Parent.Parent, "@resize", False, SmartML.GetValue(xNode, "@resize", False)))
		  SmartML.SetValue(xNode, "@keep_aspect", SmartML.GetValue(xSlide.Parent.Parent, "@keep_aspect", False, SmartML.GetValue(xNode, "@keep_aspect", False)))
		  SmartML.SetValue(xNode, "slides/slide/body", "")
		  SmartML.SetValue(xNode, "@type", "image")
		  
		  xNode = SmartML.GetNode(xNode, "slides/slide", False)
		  Return xNode
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetSelectedLines(edt As TextArea, ByRef lines() As String, adjustSelection As Boolean = False) As Boolean
		  // Checks, if full lines are selected. Returns False if not, returns the selected lines as an array of strings if so.
		  // The initial character on the starting line of the selection may be not selected and the selection may end at the
		  // end of the last line or at the beginning of the followng line to be still counted as a valid selection.
		  // This does not affect the line data returned.
		  // The selection may be optionally adjusted for these fuzzy boundries, so that the selection may later be replaced
		  // by a processed version of the lines, where the lines are separated by a TextArea's NewLine character, but the last
		  // line not ending with one.
		  
		  If edt.SelLength = 0 Then Return False
		  
		  Dim sPos, ePos, selPos As Integer
		  Dim s As String
		  Dim eol As String = SmartML.Newline.Left(1)
		  selPos = edt.SelStart + 1  // character position is 1-based, contrary to SelStart
		  
		  sPos = edt.CharPosAtLineNum(edt.LineNumAtCharPos(selPos))
		  ePos = edt.CharPosAtLineNum(edt.LineNumAtCharPos(selPos + edt.SelLength))
		  If selPos + edt.SelLength - ePos > 1 Then
		    ePos = edt.CharPosAtLineNum(edt.LineNumAtCharPos(selPos + edt.SelLength) + 1)
		  End If
		  If edt.Text.Mid(ePos - 1, 1) = eol Then
		    ePos = ePos - 1
		  End If
		  
		  If selPos - sPos > 1 Or (selPos + edt.SelLength) - ePos > 1 Or (selPos + edt.SelLength) - ePos < 0 Then
		    Return False
		  End If
		  
		  s = edt.Text.Mid(sPos, ePos - sPos)
		  
		  lines = Split(s, eol)
		  If lines.Ubound < 2 Then Return False
		  
		  If adjustSelection Then
		    edt.SelStart = sPos - 1
		    edt.SelLength = ePos - sPos
		  End If
		  Return True
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HandleKeyDown(key As String) As Boolean
		  If Globals.Status_Presentation Then
		    App.DebugWriter.Write CurrentMethodName + ": Got a '" + Key + "' in Presentation Mode"
		    PresentWindow.SetFocus
		    Return False
		  End If
		  
		  If Keyboard.AsyncKeyDown(&h60) Then  // F5
		    Dim presentationMode As Integer
		    presentationMode = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "presentation_mode/@code")
		    If Status_SongOpen And (Status_CurrentMode = 0 Or Not Status_SetOpen) Then
		      // Ask if user wants to save
		      If Not ActionSongAskSave Then Return True  // User Canceled
		      
		      ActionSongPresent presentationMode
		      Return True
		    ElseIf Status_SetOpen Then
		      // Ask if user wants to save
		      If Not ActionSetAskSave Then Return True  // User Canceled
		      
		      ActionSetPresent presentationMode
		      Return True
		    End If
		  End If
		  
		  If Keyboard.AsyncKeyDown(&h7a) Then  // F1
		    'HelpWindow.ShowModalWithin Self
		    'Return True
		    
		    'ElseIf Keyboard.AsyncKeyDown(&h78) Then  // F2
		    'SetMode 0
		    'Return True
		    
		    'ElseIf Keyboard.AsyncKeyDown(&h63) Then  // F3
		    'SetMode 1
		    'Return True
		    
		    #If TargetMacOS
		  ElseIf Keyboard.AltKey And Keyboard.OptionKey Then
		    #Else
		  ElseIf Keyboard.AltKey And Keyboard.ControlKey Then
		    #EndIf
		    If Keyboard.AsyncKeyDown(&h12) Or Keyboard.AsyncKeyDown(&h53) Then  // Ctrl + Shift + 1 (main or numpad)
		      If btn_set_presentitem.Enabled Then
		        ActionSetPresent(PresentWindow.MODE_SINGLE_SCREEN, lst_set_items.ListIndex)
		        Return True
		      End If
		    ElseIf Keyboard.AsyncKeyDown(&h13) Or Keyboard.AsyncKeyDown(&h54) Then  // Ctrl + Shift + 2
		      If btn_set_presentitem.Enabled And OSScreenCount() > 1 Then
		        ActionSetPresent(PresentWindow.MODE_DUAL_SCREEN, lst_set_items.ListIndex)
		        Return True
		      End If
		    ElseIf Keyboard.AsyncKeyDown(&h14) Or Keyboard.AsyncKeyDown(&h55) Then  // Ctrl + Shift + 3
		      If btn_set_presentitem.Enabled Then
		        ActionSetPresent(PresentWindow.MODE_PREVIEW, lst_set_items.ListIndex)
		        Return True
		      End If
		    End If
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasLinkedSongs(song As XmlNode) As Boolean
		  Dim i As Integer
		  Dim xlinked_songs As XmlNode
		  
		  If song = Nil Then Return False
		  
		  xlinked_songs = SmartML.GetNode(song, "linked_songs", True)
		  
		  For i = 0 To xlinked_songs.ChildCount() - 1
		    If xlinked_songs.Child(i).GetText().Trim.Len > 0 Then
		      Return True
		    End If
		  Next
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LiveDisplay(slide As XmlNode, slides As XmlNodeList = Nil)
		  #Pragma Unused slides
		  #Pragma Unused slide
		  //++
		  // This is part of ScriptureReceiver and used for
		  // presenting a verse slide without adding it to
		  // the active set.
		  // It shouldn't ever get called when Scripture Picker is run
		  // from MainWindow.
		  //--
		  
		  App.DebugWriter.Write "MainWindow.LiveDisplay should never be called, but here we are..."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadSet(setName As String) As Boolean
		  Dim success As Boolean = False
		  Dim f As FolderItem
		  Dim xnode As XmlNode
		  
		  If Status_InSetLoading Then
		    Return success
		  End If
		  Status_InSetLoading = True
		  
		  Try
		    Do
		      lst_set_items.DeleteAllRows
		      CurrentInSetItem = -1
		      
		      Dim index As Integer = -1
		      For i As Integer = 0 To pop_sets_sets.ListCount-1
		        If pop_sets_sets.List(i) = setName Then
		          index = i
		          Exit
		        End If
		      Next
		      
		      If index > -1 Then
		        pop_sets_sets.ListIndex = index
		        CurrentSetIndex = index
		        
		        f = App.DocsFolder.Child("Sets").Child(setName)
		        CurrentSet = SmartML.XDocFromFile(f)
		        If CurrentSet = Nil Then
		          App.MouseCursor = Nil
		          CurrentSet = New XmlDocument
		          xnode = CurrentSet.AppendChild(CurrentSet.CreateElement("set"))
		          SmartML.DisplayError
		        End If
		        If CurrentSet.DocumentElement = Nil Or CurrentSet.DocumentElement.Name <> "set" Then
		          SmartML.ErrorString = SmartML.TranslateMessage("module/read_error", "The File is not an OpenSong set.")
		          SmartML.ErrorCode = 3
		          SmartML.DisplayError
		          success = False
		          Exit
		        End If
		        
		        // This section gets the /set/@name value from the current document
		        // Since this is a non-existent attribute in the released version, add it if
		        // it's not already there.
		        Dim nameAtt As xmlattribute
		        nameAtt = CurrentSet.DocumentElement.GetAttributeNode("name")
		        If nameatt = Nil Then
		          CurrentSet.DocumentElement.SetAttribute("name", setName)
		        End If
		        
		        CurrentSetName = setName
		        
		        Dim slide_groups, xchild As XmlNode
		        
		        slide_groups = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True)
		        If Not IsNull(slide_groups)Then
		          xchild = slide_groups.FirstChild
		          While xchild <> Nil
		            lst_set_items.AddRow SetML.GetSlideGroupCaption(xchild)
		            lst_set_items.CellTag(lst_set_items.ListCount-1, 0) = xchild.GetAttribute("type")
		            xchild = xchild.NextSibling
		          Wend
		          
		          // Save backup copy
		          TempSet = New XmlDocument
		          TempSet.AppendChild TempSet.SafeImportNode(CurrentSet.DocumentElement, True)
		          
		          Status_SetOpen = True
		          Status_SetChanged = False
		          Status_InSetOpen = False
		          Status_InSetChanged = False
		          CurrentInSetItem = -1
		          
		          success = True
		        Else
		          success = False
		        End If
		        
		      Else
		        success = False
		      End If
		      
		    Loop Until True
		    
		    Status_InSetLoading = False
		    Status_SetOpen = success
		    If Not Status_SetOpen Then
		      CurrentSet = Nil
		    End If
		    EnableMenuItems
		    Return success
		    
		  Catch e As RuntimeException
		    Status_InSetLoading = False
		    Status_SetOpen = False
		    CurrentSet = Nil
		    EnableMenuItems
		    
		    Raise e
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadSets(folder As FolderItem)
		  Dim x As Integer
		  Dim s(-1) As String
		  Dim SetDB As FolderDB
		  App.MouseCursor = System.Cursors.Wait
		  pop_sets_sets.DeleteAllRows
		  If App.SplashShowing Then Splash.SetStatus App.T.Translate("load_data/sets") + "..."
		  If App.MainPreferences.GetValueB(Prefs.kUseOldFolderDB) Then
		    For x = 1 to folder.count
		      If (folder.item(x).Directory = False) _
		        And folder.item(x).IsFileVisible Then
		        s.Append folder.Item(x).Name
		      End If
		    Next x
		    heapsort s
		    
		    pop_sets_sets.AddRows(s)
		  Else
		    SetDB = New FolderDB(folder)
		    s = SetDB.GetFiles(".") // Current folder only
		    pop_sets_sets.AddRows(s)
		  End If
		  lst_set_items.DeleteAllRows
		  App.MouseCursor = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadSong(f As FolderItem, updateFolderSelection As Boolean = False) As Boolean
		  Dim result As Boolean = False
		  Dim CelTag As String
		  Dim songFullName, songFolderTagName, SongFolderDisplayName As String
		  Dim index As Integer = -1
		  
		  If Status_InSongLoading Then
		    Return result
		  End If
		  Status_InSongLoading = True
		  
		  If f <> Nil And f.Exists And Not f.IsFolder Then
		    App.MouseCursor = System.Cursors.Wait
		    
		    songFullName = Songs.DBPathFromFolderItem(f)
		    songFolderTagName = Songs.CellTagFormat(Songs.DBPathFromFolderItem(f.Parent))
		    SongFolderDisplayName = Songs.CleanPath(songFolderTagName)
		    SetSongEditorPath(SongFolderDisplayName, True, updateFolderSelection)
		    
		    index = lst_songs_songs.SelectedRowIndex
		    CelTag = lst_songs_songs.CellTag(index, 0).StringValue
		    If CelTag = songFolderTagName And _
		      lst_songs_songs.List(index) = f.Name Then
		      // found without searching
		    Else
		      index = -1
		      For i As Integer = 0 To lst_songs_songs.ListCount-1
		        CelTag = lst_songs_songs.CellTag(i, 0).StringValue
		        
		        If CelTag = songFolderTagName And _
		          lst_songs_songs.List(i) = f.Name Then
		          index = i
		          Exit
		        End If
		      Next
		    End If
		    
		    // If the index is still -1, no match was found.
		    // This really should not happen.
		    // There is enough data to open the song,
		    // so log the issue and continue.
		    // With no selection in the listbox,
		    // actions on the song will be invalid.
		    If index = -1 Then
		      App.DebugWriter.Write CurrentMethodName + ": Validating lst_songs_songs index, got -1 for songFolderTagName = " + songFolderTagName + " and song name " + f.name, 1
		    End If
		    
		    lst_songs_songs.ListIndex = index
		    
		    CurrentSong = SmartML.XDocFromFile(f)
		    CurrentSongName = f.Name
		    CurrentSongFolderPath = songFolderTagName
		    Globals.OldSongFileName = songFullName
		    
		    // Show which folder this song is found in
		    edt_songs_curr_folder.Text = SongFolderDisplayName
		    
		    App.MouseCursor = Nil
		    If CurrentSong <> Nil  Then
		      Status_SongOpen = False  // Just to keep the field changes from calling EnableMenuItems
		      LoadSongFields
		      Status_SongOpen = True
		      Status_SongChanged = False
		      
		      result = True
		    Else
		      // Dummy up a doc to avoid a Nil object
		      CurrentSong = New XmlDocument
		      Dim xnode As XmlNode = CurrentSong.AppendChild(CurrentSong.CreateElement("song"))
		      SmartML.SetValue xnode, "title", f.Name
		      LoadSongFields
		      Status_SongOpen = True
		      Status_SongChanged = False
		      SmartML.DisplayError
		    End If
		  Else
		    InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", lst_songs_songs.Text)
		    Status_SongOpen = False
		    Status_SongChanged = False
		  End If
		  
		  App.MouseCursor = Nil
		  Status_InSongLoading = False
		  EnableMenuItems
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadSongFields()
		  Dim i As Integer
		  
		  lst_song_backgrounds.DeleteAllRows()
		  lst_song_backgrounds.ImageColumn = 1
		  
		  Dim imageLink As Boolean = ImageDefaults.LinkToBackgroundsFolder
		  Dim xbacks As XmlNode = SmartML.GetNode(CurrentSong.DocumentElement, "backgrounds", False)
		  
		  If Not IsNull(xbacks) Then
		    imageLink = SmartML.GetValueB(xbacks, "@link", False, imageLink)
		    
		    // this just transferes backgrounds data from the xml to the controls
		    // RefreshSongBackgroundsList() called later properly sets up the list control
		    For i = 0 To xbacks.ChildCount - 1
		      Dim image As StyleImage = new StyleImage()
		      Dim s As String = SmartML.GetValue(xbacks.Child(i), "filename")
		      Dim imagestring As String = SmartML.GetValue(xbacks.Child(i), "image")
		      Dim imageIsLoaded As Boolean = False
		      If imagestring <> "" Then
		        imageIsLoaded = image.SetImageFromString( imagestring )
		      End If
		      If Not imageIsLoaded and s <> "" then
		        imageIsLoaded = image.SetImageFromFileName( s )
		      End If
		      
		      If imagestring <> "" Or s <> "" Then
		        lst_song_backgrounds.AddRow(SmartML.GetValue(xbacks.Child(i), "@verse"))
		        lst_song_backgrounds.SetImage(lst_song_backgrounds.LastAddedRowIndex, image)
		      End If
		    Next i
		  End If
		  
		  btn_song_move.Enabled = True
		  btn_song_delete.Enabled = True
		  btn_song_rename.Enabled = True
		  btn_song_export.Enabled = True
		  btn_song_print.Enabled = True
		  btn_song_present.Enabled = True
		  
		  // Load from the object
		  edt_song_title.Text = SmartML.GetValue(CurrentSong.DocumentElement, "title", True)
		  edt_song_author.Text = SmartML.GetValue(CurrentSong.DocumentElement, "author", True)
		  edt_song_copyright.Text = SmartML.GetValue(CurrentSong.DocumentElement, "copyright", True)
		  edt_song_hymn_number.Text = SmartML.GetValue(CurrentSong.DocumentElement, "hymn_number", True)
		  edt_song_presentation.Text = SmartML.GetValue(CurrentSong.DocumentElement, "presentation", True)
		  edt_song_ccli.Text = SmartML.GetValue(CurrentSong.DocumentElement, "ccli", True)
		  chk_song_capo_print.Value = SmartML.GetValueB(CurrentSong.DocumentElement, "capo/@print", True)
		  edt_song_key.Text = SmartML.GetValue(CurrentSong.DocumentElement, "key", True)
		  edt_song_aka.Text = SmartML.GetValue(CurrentSong.DocumentElement, "aka", True)
		  edt_song_key_line.Text = SmartML.GetValue(CurrentSong.DocumentElement, "key_line", True)
		  edt_song_user1.Text = SmartML.GetValue(CurrentSong.DocumentElement, "user1", True)
		  edt_song_user2.Text = SmartML.GetValue(CurrentSong.DocumentElement, "user2", True)
		  edt_song_user3.Text = SmartML.GetValue(CurrentSong.DocumentElement, "user3", True)
		  
		  Dim found As Integer
		  found = 0
		  
		  LoadSongThemes()
		  
		  Dim xlinked_songs As XmlNode = SmartML.GetNode( CurrentSong.DocumentElement, "linked_songs", True)
		  
		  lst_song_linked.DeleteAllRows
		  For i = 0 To xlinked_songs.ChildCount()-1
		    lst_song_linked.AddRow( Songs.CleanPath( xlinked_songs.Child(i).GetText() ) )
		  Next i
		  
		  Dim capo As Integer
		  capo = SmartML.GetValueN(CurrentSong.DocumentElement, "capo", True)
		  'capo = CurrentSongObj.Capo
		  found = 0
		  pop_song_capo.DeleteAllRows
		  pop_song_capo.AddRow ""
		  For i = 1 To UBound(App.CapoList)
		    If App.CapoList(i) = Str(capo) Then found = i
		    pop_song_capo.AddRow App.CapoList(i)
		  Next i
		  If found = 0 And capo > 0 Then pop_song_capo.InsertRow 0, Str(capo)
		  pop_song_capo.ListIndex = found
		  
		  If StrComp(SmartML.GetValue(CurrentSong.DocumentElement, "capo/@sharp", False, "unDefined"), "unDefined", 0) = 0 Then
		    found = MainWindow.pop_song_accidentals.ListIndex
		  ElseIf SmartML.GetValueB(CurrentSong.DocumentElement, "capo/@sharp", False) Then
		    found = 0
		  Else
		    found = 1
		  End If
		  pop_song_capo_accidentals.ListIndex = found
		  
		  Dim tempo As String
		  tempo = SmartML.GetValue(CurrentSong.DocumentElement, "tempo", True)
		  'tempo = CurrentSongObj.Tempo
		  found = 0
		  pop_song_tempo.DeleteAllRows
		  pop_song_tempo.AddRow ""
		  For i = 1 To UBound(App.TempoList)
		    If App.TempoList(i) = tempo Then found = i
		    pop_song_tempo.AddRow App.TempoList(i)
		  Next i
		  If found = 0 And Len(tempo) > 0 Then pop_song_tempo.InsertRow 0, tempo
		  pop_song_tempo.ListIndex = found
		  
		  Dim timesig As String
		  timesig = SmartML.GetValue(CurrentSong.DocumentElement, "time_sig", True)
		  'timesig = CurrentSongObj.TimeSignature
		  found = 0
		  pop_song_time_sig.DeleteAllRows
		  pop_song_time_sig.AddRow ""
		  For i = 1 To UBound(App.TimeSigList)
		    If App.TimeSigList(i) = timesig Then found = i
		    pop_song_time_sig.AddRow App.TimeSigList(i)
		  Next i
		  If found = 0 And Len(timesig) > 0 Then pop_song_time_sig.InsertRow 0, timesig
		  pop_song_time_sig.ListIndex = found
		  
		  edf_song_lyrics.Text = ""
		  edf_song_lyrics.Text = SmartML.GetValue(CurrentSong.DocumentElement, "lyrics", True).FormatLocalEndOfLine
		  edf_song_lyrics.ColorizeBilingual
		  
		  If SmartML.GetNode(CurrentSong.DocumentElement, "style", False) = Nil Then
		    'If CurrentSongObj.SongStyle = Nil Then
		    chk_song_style.Value = False
		    can_song_style.Enabled = False
		  Else
		    chk_song_style.Value = True
		    can_song_style.Enabled = True
		    can_song_style.SetStyleNode SmartML.GetNode(CurrentSong.DocumentElement, "style")
		    'can_song_style.SetStyleNode CurrentSongObj.SongStyle.ToXML.DocumentElement
		  End If
		  
		  btn_song_add_background.Enabled = False
		  btn_song_del_background.Enabled = False
		  
		  Dim resize As String = SmartML.GetValue(xbacks, "@resize", False, "default")
		  chk_song_fit_to_screen.Value = (resize = "screen") Or (resize = "default" And ImageDefaults.ResizeToScreenArea)
		  chk_song_fit_to_body.Value = (resize = "body") Or (resize = "default" And ImageDefaults.ResizeToBodyArea)
		  chk_song_keepaspect.Value = SmartML.GetValueB(xbacks, "@keep_aspect", False, ImageDefaults.KeepAspectRatio)
		  chk_song_keepaspect.Enabled = chk_song_fit_to_screen.Value Or chk_song_fit_to_body.Value
		  chk_song_store_as_link.Value = imageLink
		  chk_song_background_as_text.Value = SmartML.GetValueB(xbacks, "@background_as_text", False, ImageDefaults.UseBackgroundsAsText)
		  
		  RefreshSongBackgroundsList()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadSongThemes()
		  Dim i As Integer
		  
		  If Not IsNull(CurrentSong) Then
		    
		    Dim theme, alttheme As String
		    theme = SmartML.GetValue(CurrentSong.DocumentElement, "theme", True)
		    alttheme = SmartML.GetValue(CurrentSong.DocumentElement, "alttheme", False)
		    If Len(alttheme) > 0 Then theme = theme + "; "+ alttheme
		    'theme = ";" + CurrentSongObj.ThemeList + ";"
		    ' Build the dictionary
		    Dim themeDict As new Dictionary
		    For i = 1 To CountFields(theme, ";")
		      alttheme = Trim(NthField(theme, ";", i))
		      If Len(alttheme) > 0 Then themeDict.Value(alttheme) = False
		    Next i
		    
		    ' Build the list, checking the dictionary
		    lst_song_themes.DeleteAllRows
		    For i = 1 To UBound(App.ThemeList)
		      lst_song_themes.AddRow App.ThemeList(i)
		      lst_song_themes.CellType(lst_song_themes.ListCount-1, 0) = lst_song_themes.TypeCheckbox
		      If themeDict.hasKey(App.ThemeList(i)) Then
		        lst_song_themes.CellCheck(lst_song_themes.ListCount-1, 0) = True
		        themeDict.Value(App.ThemeList(i)) = True
		      End If
		    Next i
		    
		    ' Prepend to the list anything not in the theme list
		    For i = 0 To themeDict.Count - 1
		      If themeDict.Value(themeDict.Key(i)).BooleanValue = False Then
		        lst_song_themes.InsertRow 0, themeDict.Key(i)
		        lst_song_themes.CellType(0, 0) = lst_song_themes.TypeCheckbox
		        lst_song_themes.CellCheck(0, 0) = True
		      End if
		    Next i
		    
		    lst_song_themes.DefaultRowHeight = -1
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub OnAfterHsizerResized(sender As HalfSizer)
		  // adjust order and folder to the width of slides, but no wider than 300
		  
		  Dim w, x, gap As Integer
		  gap = 12
		  w = edf_slide_slides.Width - gap
		  If w < 600 And w Mod 2 = 1 Then gap = gap + 1
		  w = w \ 2
		  If w > 300 Then w = 300
		  
		  lbl_slide_presentation.Width = w
		  edt_slide_order.Width = w
		  lbl_slide_origorder.Left = lbl_slide_presentation.Left + w + gap
		  lbl_slide_origorder.Width = w
		  edt_slide_origorder.Left = lbl_slide_origorder.Left
		  edt_slide_origorder.Width = w
		  
		  lbl_slide_folder.Width = Max(w, 218)
		  edt_slide_folder.Width = lbl_slide_folder.Width
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PreparePresentation()
		  #If TargetWin32 Then
		    m_oldAnimationsEnabled = WinAPI.Animation
		    WinAPI.Animation = False
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RefreshSongBackgroundsList()
		  Dim verseDict As New Dictionary
		  Dim sectionIsBilingual As New Dictionary
		  Dim order As String
		  Dim posIndex As Integer
		  Dim posTag As String
		  Dim sectionlessBackground As New Dictionary
		  Dim sectionTag As String
		  Dim sectionlessBackgroundHelpTag As String
		  
		  CheckLyricLines(edf_song_lyrics)
		  SongML.LyricsToSections(edf_song_lyrics.Text.FormatUnixEndOfLine, verseDict, order, sectionIsBilingual)
		  If order = SongBackgroundsSectionOrder Then Return // nothing changed
		  
		  SongBackgroundsSectionOrder = order
		  posIndex = -1
		  postag = lst_song_backgrounds.SelectedRowValue
		  
		  For i As Integer = 0 To lst_song_backgrounds.LastRowIndex
		    If lst_song_backgrounds.HasImage(i) Then
		      sectionTag = lst_song_backgrounds.CellValueAt(i, 0)
		      If Not verseDict.HasKey(sectionTag) Then
		        sectionlessBackground.Value(sectionTag) = True
		        SongBackgroundsSectionOrder = "[invalid]"  // re-evaluate the next time
		      End If
		      verseDict.Value(sectionTag) = lst_song_backgrounds.GetImage(i)
		    End If
		  Next
		  
		  lst_song_backgrounds.RemoveAllRows
		  For Each entry As DictionaryEntry In verseDict
		    sectionTag = entry.Key.StringValue
		    lst_song_backgrounds.AddRow(sectionTag)
		    If entry.Value IsA StyleImage Then
		      lst_song_backgrounds.SetImage(lst_song_backgrounds.LastAddedRowIndex, entry.Value)
		    End If
		    lst_song_backgrounds.CellTagAt(lst_song_backgrounds.LastAddedRowIndex, 1) = sectionlessBackground.HasKey(sectionTag)
		    If sectionlessBackground.HasKey(sectionTag) Then
		      If sectionlessBackgroundHelpTag = "" Then
		        Dim found As Boolean
		        sectionlessBackgroundHelpTag = App.T.Translate("backgrounds_song_editor/sectionless_background")
		        sectionlessBackgroundHelpTag = App.T.Translate("backgrounds_song_editor/sectionless_background", found)
		        If Not Found Then
		          sectionlessBackgroundHelpTag = "This section does no longer exist in the song's lyrics."
		        End If
		      End If
		      For i As Integer = 0 To lst_song_backgrounds.LastColumnIndex
		        lst_song_backgrounds.CellTooltipAt(lst_song_backgrounds.LastAddedRowIndex, i) = sectionlessBackgroundHelpTag
		      Next i
		    End If
		    If entry.Key.StringValue = posTag Then
		      posIndex = lst_song_backgrounds.LastAddedRowIndex
		    End If
		  Next
		  
		  lst_song_backgrounds.SelectedRowIndex = posIndex
		  
		  Dim i As Integer
		  Dim j As Integer
		  // All of this seems necessary (on macOS) to get the listbox to properly display before the user clicks on it.
		  For i = 0 To lst_song_backgrounds.RowCount - 1
		    For j = 0 To lst_song_backgrounds.ColumnCount - 1
		      lst_song_backgrounds.InvalidateCell(i, j)
		    Next
		  Next
		  Dim c As RectControl = Self.Focus
		  lst_song_backgrounds.SetFocus
		  lst_song_backgrounds.Column(0).WidthActual = lst_song_backgrounds.Column(0).WidthActual - 1
		  lst_song_backgrounds.Column(0).WidthActual = lst_song_backgrounds.Column(0).WidthActual + 1
		  Self.Focus = c
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReorderSetItemList(CurrentPosition As Integer, newPosition As Integer)
		  // Handle Set Item list reordering
		  If newPosition = CurrentPosition Or CurrentPosition = -1 Or newPosition = -1 Then
		    Return
		  End If
		  If CurrentPosition < 0 Or CurrentPosition >= lst_set_items.ListCount Or newPosition < 0 Or newPosition > lst_set_items.ListCount Then
		    App.DebugWriter.Write(CurrentMethodName + " called with invalid parameters (" + Str(CurrentPosition) + ", " + Str(newPosition) + ")", 3)
		    Return
		  End If
		  
		  'Ask if user wants to save
		  If NOT ActionInSetAskSave Then
		    Return 'User Canceled, cancel the reorder
		  End If
		  
		  If Status_InSetChanged Then 'User chose not to save, set DontUpdateSetItem flag
		    DontUpdateSetItem = True 'reorder the list without changing any edit fields
		  End If
		  
		  Status_SetChanged = True
		  
		  'Update set XML with the new order
		  Dim xgroups As XmlNode = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True)
		  
		  If newPosition > CurrentPosition Then
		    If newPosition = lst_set_items.ListCount - 1 Then
		      xgroups.AppendChild xgroups.Child(CurrentPosition)
		    Else
		      xgroups.Insert xgroups.Child(CurrentPosition), xgroups.Child(newPosition+1)
		    End If
		    
		    'reorder the list
		    lst_set_items.InsertRow newPosition+1, lst_set_items.List(CurrentPosition)
		    lst_set_items.CellTag(newPosition+1, 0) = lst_set_items.CellTag(CurrentPosition, 0)
		    lst_set_items.RemoveRow(CurrentPosition)
		    CurrentInSetItem = newPosition
		    
		  ElseIf newPosition < CurrentPosition Then
		    xgroups.Insert xgroups.Child(CurrentPosition), xgroups.Child(newPosition)
		    
		    'reorder the list
		    lst_set_items.InsertRow newPosition, lst_set_items.List(CurrentPosition)
		    lst_set_items.CellTag(newPosition, 0) = lst_set_items.CellTag(CurrentPosition+1, 0)
		    lst_set_items.RemoveRow(CurrentPosition+1)
		    CurrentInSetItem = newPosition
		  End If
		  
		  lst_set_items.ListIndex = CurrentInSetItem
		  If NOT Status_InSetChanged Then
		    CurrentInSetItem = -1
		  End If
		  
		  DontUpdateSetItem = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetWindowCursor(theWindow As Window)
		  //
		  // Observed behavior on macOS:
		  // After the first song is opened, subsequent song
		  // changes will leave the mouse cursor showing the 
		  // wait cursor even though the wait cursor is not set
		  // for the control, its ancestors, or the app.
		  // Forceably resetting to Nil will correct the
		  // visual appearance if not the issue itself.
		  // This has not been observed on the other platforms.
		  //
		  #If TargetMacOS
		    Dim r As Window
		    If theWindow IsA Window Then
		      r = theWindow
		    Else
		      Return
		    End If
		    Try
		      For Each c As RectControl In r.Controls
		        Try
		          If c.MouseCursor <> Nil Then
		            If c IsA imSplitter Then
		              Continue
		            Else
		              Break
		            End If
		          End If
		          c.MouseCursor = Nil
		        End Try
		      Next
		      r.MouseCursor = Nil
		      App.MouseCursor = Nil
		    Catch
		      Break
		    End Try
		  #Else
		    #Pragma Unused theWindow
		    Return
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScriptureSelected(scripture As XmlNode)
		  // Part of the ScriptureReceiver interface.
		  // New scripture has been selected in the ScripturePicker.
		  // Add to the set at the current position
		  //
		  
		  If CurrentSet Is Nil Then Return
		  
		  Dim newGroup As XmlNode
		  Dim xGroups As XmlNode = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True)
		  
		  If lst_set_items.ListIndex >= 0 Then
		    newGroup = SmartML.InsertChild(xgroups, "slide_group", lst_set_items.ListIndex + 1)
		  Else
		    newGroup = SmartML.InsertChild(xgroups, "slide_group", lst_set_items.ListCount)
		  End If
		  
		  Dim newSetItem As XmlNode = SmartML.ReplaceWithImportNode(newGroup, scripture)
		  
		  ActionInSetAddSlide newSetItem
		  
		  Status_SetChanged = True
		  Status_InSetChanged = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SelectImageFile() As FolderItem
		  //
		  // Replace ImageChooserWindow with standard OS dialog
		  //
		  Dim f As FolderItem
		  Dim selectionDialog As New OpenDialog
		  Static SelectionFolder As FolderItem
		  
		  If App.CheckDocumentFolders(App.BACKGROUNDS_FOLDER) <> App.NO_FOLDER Then
		    SelectionFolder = App.DocsFolder.Child(App.STR_BACKGROUNDS)
		  Else
		    #If TargetWin32
		      SelectionFolder = SpecialFolder.Documents
		    #ElseIf TargetMacOS
		      SelectionFolder = SpecialFolder.Documents
		    #ElseIf TargetLinux
		      SelectionFolder = Nil
		    #EndIf
		  End If
		  
		  selectionDialog.InitialDirectory = SelectionFolder
		  Dim filter As String
		  Filter = FileTypes.ImageFiles + ImageFileTypes.All + FileTypes.AllFiles
		  selectionDialog.Filter = filter
		  selectionDialog.MultiSelect = False
		  f = selectionDialog.ShowModalWithin(Self)
		  If f <> Nil Then
		    SelectionFolder = f.Parent
		  End If
		  Return f
		  
		  Exception ex As RuntimeException
		    App.DebugWriter.Write(CurrentMethodName + ": Got an exception, message is '" + ex.message + "'")
		    Return Nil
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetForeground()
		  // used with Timer.CallLater
		  App.SetForeground(Self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetHelp(str As String)
		  If str = "" Then
		    txt_context_help.Text = ""
		  Else
		    txt_context_help.Text = App.T.Translate(str)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetMode(mode As Integer)
		  Dim idx As Integer
		  
		  Select Case mode
		  Case 0
		    ' Change to Song mode
		    
		    'Ask if user wants to save
		    If NOT ActionSetAskSave Then Return 'User Canceled
		    
		    If Status_SetChanged Then //User cancelled from AskSave, revert the set since we are changing modes
		      Status_InSetChanged = False // These two lines keep pop_sets_sets.Change calls to ActionSetAskSave from firing
		      Status_SetChanged = False
		      idx = pop_sets_sets.ListIndex //cheats, forces a change event that will reload the set
		      pop_sets_sets.ListIndex = -1
		      pop_sets_sets.ListIndex = idx
		    End If
		    btn_mode_songs_mode.Stuck = True
		    btn_mode_sets_mode.Stuck = False
		    pge_controls.Value = 0
		    pge_contents.Value = LastSongPane
		    mnu_mode_songs.Checked = True
		    mnu_mode_sets.Checked = False
		    
		  Case 1
		    ' Change to Set mode
		    
		    'Ask if user wants to save
		    If NOT ActionSongAskSave Then
		      Return 'User Canceled
		    End If
		    
		    '++JRC Reload Set when switching back to Set Mode, fixes bug #1851991
		    idx = pop_sets_sets.ListIndex //cheats, forces a change event that will reload the set
		    pop_sets_sets.ListIndex = -1
		    pop_sets_sets.ListIndex = idx
		    '--
		    
		    ActionSongRevert false
		    btn_mode_songs_mode.Stuck = False
		    btn_mode_sets_mode.Stuck = True
		    pge_controls.Value = 1
		    pge_contents.Value = LastSetPane
		    mnu_mode_songs.Checked = False
		    mnu_mode_sets.Checked = True
		  Case Else
		    // default to Set mode if mode is invalid
		    SetMode(1)
		    Return
		  End Select
		  
		  Status_CurrentMode = mode
		  
		  EnableMenuItems
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetSongEditorPath(newPath As String, keepFilterAll As Boolean = True, forceReload As Boolean = False)
		  //++
		  // June 2007, EMP
		  // Change the current folder for the song editor
		  //--
		  Dim i As Integer
		  
		  If pop_songs_song_folders.ListCount = 0 Then Return //Protect against empty list
		  
		  If keepFilterAll And pop_songs_song_folders.ListIndex = 0 Then Return
		  
		  If newPath = pop_songs_song_folders.RowValueAt(0) Then // Songs.GetFilterAll()
		    If forceReload Or pop_songs_song_folders.ListIndex <> 0 Then
		      pop_songs_song_folders.ListIndex = 0
		    End If
		    Return
		  Else
		    newPath = Songs.UIPath(newPath)  // maps special calse "" to Songs.GetFilterMain()
		    For i = 1 To pop_songs_song_folders.ListCount - 1
		      If newPath = pop_songs_song_folders.RowValueAt(i) Then
		        If forceReload Or pop_songs_song_folders.ListIndex <> i Then
		          pop_songs_song_folders.ListIndex = i
		        End If
		        Return
		      End If
		    Next
		  End If
		  
		  // Not found. Take advantage of the fact that ( All ) is always the first element.
		  If forceReload Or pop_songs_song_folders.ListIndex <> 0 Then
		    pop_songs_song_folders.ListIndex = 0
		  End If
		  
		  Catch ex
		    If ex IsA OutOfBoundsException Then
		      If pop_songs_song_folders.ListCount > 0 Then
		        pop_songs_song_folders.ListIndex = 0
		      End If
		    Else
		      Raise ex
		    End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetSplitterPosition()
		  Dim spl As imSplitter = spl_main
		  
		  Dim lastPosition As Integer = App.MainPreferences.GetValueN(Prefs.kMainSplitterPosition, spl.Left, False)
		  Dim isDockState As Integer = App.MainPreferences.GetValueN(Prefs.kMainSplitterDockedState, 2, False)  // default UnDocked
		  
		  If lastPosition = 0 Then lastPosition = spl.Left
		  spl.PositionBeforeDock = lastPosition
		  Dim moveX As Integer = lastPosition - spl.Left
		  spl.MoveSplitter(moveX)
		  
		  Select Case isDockState
		  Case 0  // DockedBefore
		    spl.Dock(True)
		  Case 1  // DockedAfter
		    spl.Dock(False)
		  Case Else
		    spl.Undock
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SongSelected(f As FolderItem, presentationOrder As String)
		  // Part of the SongPickerReceiver interface.
		  
		  Dim SongPath As String
		  Dim Where As Integer
		  Dim xgroups, newGroup As XmlNode
		  
		  Dim sDoc As XmlDocument
		  Dim songFiles() As FolderItem
		  Dim i As Integer = 0
		  Dim CheckLinked As Boolean = True
		  
		  If f Is Nil Then Return
		  If Not Status_SetOpen Then
		    App.DebugWriter.Write CurrentMethodName + " called when no Set was open.", 1
		    Return
		  End If
		  
		  xgroups = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True)
		  
		  While f <> Nil
		    sDoc = SmartML.XDocFromFile(f)
		    If sDoc = Nil Then
		      SmartML.DisplayError
		    Else
		      If lst_set_items.ListIndex >= 0 Then
		        Where = lst_set_items.ListIndex + 1
		      Else
		        Where = lst_set_items.ListCount
		      End If
		      
		      newGroup = SmartML.InsertChild(xgroups, "slide_group", Where)
		      SmartML.SetValue newGroup, "@name", f.Name
		      SmartML.SetValue newGroup, "@type", "song"
		      SmartML.SetValue newGroup, "@presentation", presentationOrder
		      // Add a path attribute relative to the base songs directory.  Otherwise, two instances
		      // of the same song name in a parent/child folder relationship will never find the song
		      // in the child folder.
		      SongPath = Songs.DBPathFromFolderItem(f.Parent)
		      SmartML.SetValue newGroup, "@path", SongPath
		      
		      ActionInSetAddSlide newGroup
		      If CheckLinked Then
		        If HasLinkedSongs(sDoc.DocumentElement) Then
		          If SmartML.GetValueB(App.MyMainSettings.DocumentElement, "linked_songs/@prompt", True) Then
		            CheckLinked = InputBox.AskYN(App.T.Translate("questions/linked_songs/@caption"))
		          End If
		          If CheckLinked Then
		            songFiles = AddLinkedSongsFolderItem(f, sDoc.DocumentElement, False)
		            i = 0
		          End If
		        End If
		        CheckLinked = False
		      End If
		    End If
		    
		    If i <= UBound(songFiles) Then
		      f = songFiles(i)
		      i = i + 1
		    Else
		      f = Nil
		    End If
		  Wend
		  
		  lst_set_items.ListIndex = Where
		  lst_set_items.SetFocus
		  
		  Return
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SortSongCmp(Name1 As String, Folder1 As String, Name2 As String, Folder2 As String) As Integer
		  // used to sort the songs in the listbox
		  // implemented as a separate function so code other than the event can use it
		  
		  Dim result As Integer
		  
		  result = CompareHymnBookOrder(Name1, Name2)
		  
		  If result = 0 Then // names are equal, sort by folder
		    result = Compare(Folder1, Folder2)
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SplitToArray(str As String, ByRef arr() As String, char As String)
		  Dim st, x As Integer
		  ReDim arr(0)
		  
		  str = str + char
		  
		  st = 1
		  x = InStr(st, str, char)
		  While x >= st
		    arr.Append RTrim(Mid(str, st, x-st))
		    st = x + Len(char)
		    x = InStr(st, str, char)
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StoreSongFields()
		  Dim theme As String
		  Dim i As Integer
		  
		  If CurrentSong = Nil Then Return
		  
		  SmartML.SetValue CurrentSong.DocumentElement, "title", edt_song_title.Text
		  SmartML.SetValue CurrentSong.DocumentElement, "author", edt_song_author.Text
		  SmartML.SetValue CurrentSong.DocumentElement, "copyright", edt_song_copyright.Text
		  SmartML.SetValue CurrentSong.DocumentElement, "hymn_number", edt_song_hymn_number.Text
		  SmartML.SetValue CurrentSong.DocumentElement, "presentation", edt_song_presentation.Text
		  SmartML.SetValue CurrentSong.DocumentElement, "ccli", edt_song_ccli.Text
		  
		  For i = 0 To lst_song_themes.ListCount - 1
		    If lst_song_themes.CellCheck(i, 0) Then
		      If theme <> "" Then
		        theme = theme + "; "
		      End If
		      theme = theme + lst_song_themes.Cell(i, 0)
		    End If
		  Next i
		  SmartML.SetValue CurrentSong.DocumentElement, "theme", theme
		  SmartML.RemoveSelf SmartML.GetNode(CurrentSong.DocumentElement, "alttheme")
		  
		  Dim xlinked_songs As XmlNode = SmartML.GetNode( CurrentSong.DocumentElement, "linked_songs", True)
		  SmartML.RemoveChildren(xlinked_songs)
		  For i = 0 To lst_song_linked.ListCount -1
		    Dim xlinked_song As XmlNode = xlinked_songs.AppendChild(CurrentSong.CreateElement("linked_song"))
		    xlinked_song.AppendChild(CurrentSong.CreateTextNode(lst_song_linked.List(i)))
		  Next i
		  
		  If pop_song_capo.ListIndex > -1 Then
		    SmartML.SetValue CurrentSong.DocumentElement, "capo", pop_song_capo.List(pop_song_capo.ListIndex)
		    SmartML.SetValueB CurrentSong.DocumentElement, "capo/@print", chk_song_capo_print.Value
		    SmartML.SetValueB CurrentSong.DocumentElement, "capo/@sharp", pop_song_capo_accidentals.ListIndex = 0
		  End If
		  
		  If pop_song_tempo.ListIndex >= 0 Then
		    SmartML.SetValue CurrentSong.DocumentElement, "tempo", pop_song_tempo.Text
		  Else
		    SmartML.RemoveSelf SmartML.GetNode(CurrentSong.DocumentElement, "tempo")
		  End If
		  If pop_song_time_sig.ListIndex >= 0 Then
		    SmartML.SetValue CurrentSong.DocumentElement, "time_sig", pop_song_time_sig.Text
		  Else
		    SmartML.RemoveSelf SmartML.GetNode(CurrentSong.DocumentElement, "time_sig")
		  End If
		  SmartML.RemoveSelf SmartML.GetNode(CurrentSong.DocumentElement, "timesig")
		  
		  SmartML.SetValue CurrentSong.DocumentElement, "key", edt_song_key.Text
		  SmartML.SetValue CurrentSong.DocumentElement, "aka", edt_song_aka.Text
		  SmartML.SetValue CurrentSong.DocumentElement, "key_line", edt_song_key_line.Text
		  SmartML.SetValue CurrentSong.DocumentElement, "user1", edt_song_user1.Text
		  SmartML.SetValue CurrentSong.DocumentElement, "user2", edt_song_user2.Text
		  SmartML.SetValue CurrentSong.DocumentElement, "user3", edt_song_user3.Text
		  
		  CheckLyricLines(edf_song_lyrics)
		  SmartML.SetValue CurrentSong.DocumentElement, "lyrics", edf_song_lyrics.Text.FormatUnixEndOfLine
		  
		  // Store the background properties
		  Dim xbacks As XmlNode = SmartML.GetNode( CurrentSong.DocumentElement, "backgrounds", True)
		  If chk_song_fit_to_screen.Value Then
		    SmartML.SetValue xbacks, "@resize", "screen"
		  ElseIf chk_song_fit_to_body.Value Then
		    SmartML.SetValue xbacks, "@resize", "body"
		  Else
		    SmartML.SetValue xbacks, "@resize", ""
		  End If
		  SmartML.SetValueB xbacks, "@keep_aspect", chk_song_keepaspect.Value
		  SmartML.SetValueB xbacks, "@link", chk_song_store_as_link.Value
		  SmartML.SetValueB xbacks, "@background_as_text", chk_song_background_as_text.Value
		  
		  // Delete any existing backgrounds
		  SmartML.RemoveChildren(xbacks)
		  
		  // Store the linked verse backgrounds
		  For i = 0 To lst_song_backgrounds.ListCount()-1
		    If lst_song_backgrounds.HasImage( i ) Then
		      Dim xback As XmlNode = xbacks.AppendChild(CurrentSong.CreateElement("background"))
		      Dim img As StyleImage = lst_song_backgrounds.GetImage( i )
		      
		      If chk_song_store_as_link.Value And img.GetImageFilename() <> "" Then
		        If img.GetImageFilename().StartsWith(App.DocsFolder.Child("Backgrounds").NativePath) And ImageDefaults.LinkToBackgroundsFolder Then
		          SmartML.SetValue xback, "filename", img.GetImageFilename().Mid(App.DocsFolder.Child("Backgrounds").NativePath.Len+1)
		        Else
		          SmartML.SetValue xback, "filename", img.GetImageFilename()
		        End If
		      Else
		        SmartML.SetValue xback, "image", img.GetImageAsString
		      End If
		      
		      SmartML.SetValue xback, "@verse", lst_song_backgrounds.Cell(i, 0)
		    End If
		  Next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupplyColorPalette(tag As String) As ColorPaletteBroker.ColorPalette()
		  // Part of the ColorPaletteBroker.ColorPaletteSource interface.
		  Dim pal, pals() As ColorPaletteBroker.ColorPalette
		  Dim colrs() As Color
		  Dim dlgColors() As Color
		  Dim dlgTag As String
		  Dim deck As XmlDocument
		  Dim styleDict As Dictionary
		  Dim txFound As Boolean
		  Dim xl As XmlNodeList
		  Dim xnode As XmlNode
		  Dim captionStr As String
		  
		  For i As Integer = 0 To App.WindowCount
		    If App.Window(i) IsA FontChooser Then
		      ColorPaletteBroker.AddFontColors(FontChooser(App.Window(i)).MyFont, dlgColors)
		    End If
		    If App.Window(i) IsA StyleWindow Then
		      Dim styleWin As StyleWindow = StyleWindow(App.Window(i))
		      ColorPaletteBroker.AddStyleColors(StyleWindow(App.Window(i)).PeekStyle(), dlgColors)
		      xNode = styleWin.StyleNode
		      If xNode <> Nil Then
		        Select case xNode.OwnerDocument.DocumentElement.Name
		        Case "set", "song"
		          dlgTag = "item"
		        Case "main_settings"
		        Case "print_settings"
		        Case "present_settings"
		          If xNode.Name = "default_style" Then dlgTag = "present.settings.defaultstyle"
		          If xNode.Name = "scripture_style" Then dlgTag = "present.settings.scripturestyle"
		        End Select
		      End If
		      xnode = Nil
		    End If
		  Next i
		  dlgColors = ColorPaletteBroker.SortUniqueColors(dlgColors)
		  
		  If ColorPaletteBroker.Included(tag, "present.settings.defaultstyle") Then
		    If App.MyPresentSettings <> Nil Then
		      
		      xnode = SmartML.GetNode(App.MyPresentSettings.DocumentElement, "default_style")
		      If xnode <> Nil Then
		        Redim colrs(-1)
		        If ColorPaletteBroker.Included(dlgTag, "present.settings.defaultstyle") Then
		          For i As Integer = 0 To dlgColors.Ubound
		            colrs.Add(dlgColors(i))
		          Next i
		        End If
		        ColorPaletteBroker.AddStyleColors(xNode, colrs)
		        If colrs.Ubound >= 0 Then
		          colrs = SortUniqueColors(colrs)
		          captionStr = App.T.Translate("color_selector/color_palette/default_style/@caption", txFound)
		          If not txFound Then captionStr = "Default Style"
		          pal = New ColorPaletteBroker.ColorPalette("present.settings.defaultstyle", captionStr, colrs)
		          pals.Add(pal)
		        End If
		      End If
		    End If
		  End If
		  
		  If ColorPaletteBroker.Included(tag, "present.settings.scripturestyle") Then
		    If App.MyPresentSettings <> Nil Then
		      
		      xnode = SmartML.GetNode(App.MyPresentSettings.DocumentElement, "scripture_style")
		      If xnode <> Nil Then
		        Redim colrs(-1)
		        If ColorPaletteBroker.Included(dlgTag, "present.settings.scripturestyle") Then
		          For i As Integer = 0 To dlgColors.Ubound
		            colrs.Add(dlgColors(i))
		          Next i
		        End If
		        ColorPaletteBroker.AddStyleColors(xNode, colrs)
		        If colrs.Ubound >= 0 Then
		          colrs = SortUniqueColors(colrs)
		          captionStr = App.T.Translate("color_selector/color_palette/scripture_style/@caption", txFound)
		          If not txFound Then captionStr = "Scripture Style"
		          pal = New ColorPaletteBroker.ColorPalette("present.settings.scripturestyle", captionStr, colrs)
		          pals.Add(pal)
		        End If
		      End If
		    End If
		  End If
		  
		  If ColorPaletteBroker.Included(tag, "item") Then
		    Redim colrs(-1)
		    Dim ItemType As String
		    If Status_SongOpen And pge_controls.Value = 0 Then
		      If ColorPaletteBroker.Included(dlgTag, "item") Then
		        For i As Integer = 0 To dlgColors.Ubound
		          colrs.Add(dlgColors(i))
		        Next i
		      End If
		      If CurrentSong <> Nil Then
		        ColorPaletteBroker.AddStyleColors(SmartML.GetNode(CurrentSong.DocumentElement, "/song/style"), colrs)
		        ItemType = App.T.Translate("color_selector/item_type/song/@caption", txFound)
		        If Not TxFound Then ItemType = "Song"
		      End If
		    ElseIf Status_SetOpen And CurrentSet <> Nil And CurrentInSetItem >= 0 And pge_controls.Value = 1 Then
		      If ColorPaletteBroker.Included(dlgTag, "item") Then
		        For i As Integer = 0 To dlgColors.Ubound
		          colrs.Add(dlgColors(i))
		        Next i
		      End If
		      If Status_InSetOpen Then
		        
		        If deck = Nil Then
		          deck = New XmlDocument
		          deck.AppendChild deck.SafeImportNode(CurrentSet.FirstChild, True)
		          SetML.ImportSongs(deck, False, False, True)
		          SetML.ProcessStyles(deck, styleDict)
		          #If DebugBuild
		            If App.DebugWriter.Level >= 7 Then
		              Call SmartML.XDocToFile(deck, FileUtils.RelativePathToFolderItem(App.DocsFolder, CurrentSetName + "_deck.xml"))
		            End If
		          #EndIf
		        End If
		        Dim key As String
		        xl = deck.Xql("/set/slide_groups/slide_group[@set_list_index='" + Str(CurrentInSetItem + 1) + "']")
		        If xl <> Nil And xl.Length > 0 Then
		          xnode = xl.Item(0)
		          If xnode <> Nil Then
		            key = SmartML.GetValue(xnode, "style/@index", False, "xXx")
		            If StrComp(key, "xXx", 0) = 0 Then  // i.e. not found
		              If SmartML.GetValue(xnode, "@type", False) = "style" And SmartML.GetValue(xnode, "@action", False) = "new" Then
		                key = SmartML.GetValue(xnode, "style/@setIndex", False)
		              End If
		            End If
		            If styleDict.HasKey(key) Then
		              ColorPaletteBroker.AddStyleColors(SlideStyle(styleDict.Value(key)), colrs)
		            End If
		            key = SmartML.GetValue(xnode, "@type", False)
		            ItemType = App.T.Translate("color_selector/item_type/" + key + "/@caption", txFound)
		            If not TxFound Then ItemType = key
		          End If
		        End If
		      End If
		    End If
		    If colrs.Ubound >= 0 Then
		      colrs = SortUniqueColors(colrs)
		      captionStr = App.T.Translate("color_selector/color_palette/current_item/@caption", txFound, ItemType)
		      If not txFound Then captionStr = Titlecase(ItemType)
		      pal = New ColorPaletteBroker.ColorPalette("item", captionStr, colrs)
		      pals.Add(pal)
		    End If
		  End If
		  
		  If ColorPaletteBroker.Included(tag, "set") Then
		    Redim colrs(-1)
		    If Status_SetOpen And pge_controls.Value = 1 Then
		      If ColorPaletteBroker.Included(dlgTag, "set") Then
		        For i As Integer = 0 To dlgColors.Ubound
		          colrs.Add(dlgColors(i))
		        Next i
		      End If
		      If CurrentSet <> Nil Then
		        If deck = Nil Then
		          deck = New XmlDocument
		          deck.AppendChild deck.SafeImportNode(CurrentSet.FirstChild, True)
		          SetML.ImportSongs(deck, False, False, True)
		          SetML.ProcessStyles(deck, styleDict)
		        End If
		        If styleDict <> Nil Then
		          For Each entry As DictionaryEntry In styleDict
		            ColorPaletteBroker.AddStyleColors(SlideStyle(entry.Value), colrs)
		          Next entry
		        End If
		      End If
		    End If
		    If colrs.Ubound >= 0 Then
		      colrs = SortUniqueColors(colrs)
		      captionStr = App.T.Translate("color_selector/color_palette/current_set/@caption", txFound)
		      If not txFound Then captionStr = "Set"
		      pal = New ColorPaletteBroker.ColorPalette("set", captionStr, colrs)
		      pals.Add(pal)
		    End If
		  End If
		  
		  
		  If pals.Ubound = -1 Then Return pals
		  captionStr = App.T.Translate("color_selector/color_palette/open_song/@caption", txFound)
		  If not txFound Then captionStr = "OpenSong"
		  pal = New ColorPaletteBroker.ColorPalette("OpenSong", captionStr, pals)
		  Redim pals(0)
		  pals(0) = pal
		  Return pals
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateMe()
		  App.T.TranslateWindow Me, "", App.TranslationFonts
		  txt_context_help.Caption = ""
		  
		  Dim s As String
		  s = SmartML.GetValue(App.MyMainSettings.DocumentElement, "user_defined/@user1")
		  If s.Len > 0 Then
		    lbl_song_user1.Caption = s + ":"
		  End If
		  s = SmartML.GetValue(App.MyMainSettings.DocumentElement, "user_defined/@user2")
		  If s.Len > 0 Then lbl_song_user2.Caption = s + ":"
		  s = SmartML.GetValue(App.MyMainSettings.DocumentElement, "user_defined/@user3")
		  If s.Len > 0 Then lbl_song_user3.Caption = s + ":"
		  
		  Title = "OpenSong " + App.SmartVersion
		  
		  btn_song_present.DeletePopup
		  btn_song_present.AddPopupRow App.T.Translate("songs_mode/selected_song/present/single_screen/@caption")
		  
		  If OSScreenCount() > 1 Then
		    btn_song_present.AddPopupRow App.T.Translate("songs_mode/selected_song/present/dual_screen/@caption")
		  End If
		  
		  btn_song_present.AddPopupSeparator
		  btn_song_present.AddPopupRow App.T.Translate("songs_mode/selected_song/present/preview_dual_screen/@caption")
		  
		  btn_set_present.DeletePopup
		  btn_set_present.AddPopupRow App.T.Translate("sets_mode/current_set/present/single_screen/@caption")
		  
		  If OSScreenCount() > 1 Then
		    btn_set_present.AddPopupRow App.T.Translate("sets_mode/current_set/present/dual_screen/@caption")
		  End If
		  
		  btn_set_present.AddPopupSeparator
		  btn_set_present.AddPopupRow App.T.Translate("sets_mode/current_set/present/preview_dual_screen/@caption")
		  
		  btn_set_presentitem.DeletePopup
		  btn_set_presentitem.AddPopupRow App.T.Translate("sets_mode/current_item/presentitem/single_screen/@caption")
		  
		  If OSScreenCount() > 1 Then
		    btn_set_presentitem.AddPopupRow App.T.Translate("sets_mode/current_item/presentitem/dual_screen/@caption")
		  End If
		  
		  btn_set_presentitem.AddPopupSeparator
		  btn_set_presentitem.AddPopupRow App.T.Translate("sets_mode/current_item/presentitem/preview_dual_screen/@caption")
		  
		  // PopupMenu text cannot be changed - so rebuild
		  Dim OldIndex As Integer
		  Dim i As Integer
		  
		  // prevent modify status to be changed during this
		  Status_InSetLoading = True
		  Status_InSongLoading = True
		  
		  OldIndex = pop_song_accidentals.SelectedRowIndex
		  pop_song_accidentals.DeleteAllRows
		  pop_song_accidentals.AddRow App.TransposeAccidentalsList(1)
		  pop_song_accidentals.AddRow App.TransposeAccidentalsList(2)
		  pop_song_accidentals.ListIndex = OldIndex
		  
		  OldIndex = pop_song_capo_accidentals.SelectedRowIndex
		  pop_song_capo_accidentals.DeleteAllRows
		  pop_song_capo_accidentals.AddRow App.TransposeAccidentalsList(1)
		  pop_song_capo_accidentals.AddRow App.TransposeAccidentalsList(2)
		  pop_song_capo_accidentals.ListIndex = OldIndex
		  
		  OldIndex = pop_slide_transition.SelectedRowIndex
		  pop_slide_transition.DeleteAllRows
		  For i = 1 To App.TransitionList.Ubound
		    pop_slide_transition.AddRow App.TransitionList(i)
		  Next i
		  pop_slide_transition.ListIndex = OldIndex
		  
		  OldIndex = pop_image_transition.SelectedRowIndex
		  pop_image_transition.DeleteAllRows
		  For i = 1 To App.TransitionList.Ubound
		    pop_image_transition.AddRow App.TransitionList(i)
		  Next i
		  pop_image_transition.ListIndex = OldIndex
		  
		  OldIndex = pop_song_time_sig.SelectedRowIndex
		  pop_song_time_sig.DeleteAllRows
		  For i = 1 To App.TimeSigList.Ubound
		    pop_song_time_sig.AddRow App.TimeSigList(i)
		  Next i
		  pop_song_time_sig.ListIndex = OldIndex
		  
		  OldIndex = pop_song_tempo.SelectedRowIndex
		  pop_song_tempo.DeleteAllRows
		  For i = 1 To App.TempoList.Ubound
		    pop_song_tempo.AddRow App.TempoList(i)
		  Next i
		  pop_song_tempo.ListIndex = OldIndex
		  
		  // translate (All) and (Main) folder items
		  OldIndex = pop_songs_song_folders.ListIndex
		  
		  Songs.SetBuiltinFilters "( " + App.T.Translate("songs_mode/song_folders/filter_all/@caption") + " )", _
		  "( " + App.T.Translate("songs_mode/song_folders/filter_main/@caption") + " )"
		  
		  Call Songs.GetFolders(pop_songs_song_folders)
		  
		  pop_songs_song_folders.ListIndex = OldIndex
		  // Rebuild old File Name
		  if Globals.OldSongFileName <> "" then
		    Globals.OldSongFileName = songs.CombinePath(pop_songs_song_folders.Text, lst_songs_songs.Text)
		  end if
		  
		  Status_InSetLoading = False
		  Status_InSongLoading = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMenuItems()
		  If Status_InSongLoading Then Return
		  If Status_InSetLoading Then Return
		  If Status_Closing Then Return
		  
		  If Globals.SongActivityLog <> Nil Then
		    mnu_file_song_act.Enabled = True
		  Else
		    mnu_file_song_act.Enabled = False
		  End If
		  
		  // If no Bibles found, disable Scripture Lookup
		  mnu_file_scripture.Enabled = BibleFactory.HasBible
		  
		  If Focus = edf_song_lyrics Then
		    Dim lines() As String
		    mnu_edit_interleave.Visible = True
		    mnu_edit_interleave_separator.Visible = True  // this may not work
		    mnu_edit_interleave.Enabled = GetSelectedLines(edf_song_lyrics, Lines)
		  Else
		    mnu_edit_interleave.Visible = False
		    mnu_edit_interleave_separator.Visible = False
		  End If
		  If pge_controls.Value = 0 Then  // Songs tab
		    mnu_mode_songs.Checked = True
		    mnu_mode_sets.Checked = False
		    mnu_file_pagesetup.Enabled = True
		    
		    If Status_SongOpen Then
		      btn_song_print.Enabled = True
		      btn_song_present.Enabled = True And (Not Globals.Status_Presentation)
		      btn_song_export.Enabled = True
		      btn_song_rename.Enabled = True
		      btn_song_move.Enabled = True
		      btn_song_copy.Enabled = True
		      btn_song_delete.Enabled = True
		      mnu_file_print.Enabled = True
		      mnu_file_single_screen.Enabled = True
		      mnu_file_dual_screen.Enabled = (OSScreenCount() > 1)
		      mnu_file_preview_dual_screen.Enabled = True
		      
		      // EDITOR FIELDS
		      
		      edf_song_lyrics.SetUseState(SEditField.UseState.Editable)
		      grp_song_transpose.Enabled = True
		      pop_song_transpose.Enabled = True
		      pop_song_accidentals.Enabled = True
		      edt_song_title.SetUseState(SEditField.UseState.Editable)
		      edt_song_author.SetUseState(SEditField.UseState.Editable)
		      edt_song_copyright.SetUseState(SEditField.UseState.Editable)
		      edt_song_presentation.SetUseState(SEditField.UseState.Editable)
		      edt_song_ccli.SetUseState(SEditField.UseState.Editable)
		      lst_song_themes.Enabled = True
		      pop_song_capo.Enabled = True
		      pop_song_capo_accidentals.Enabled = True
		      chk_song_capo_print.Enabled = True
		      pop_song_tempo.Enabled = True
		      pop_song_time_sig.Enabled = True
		      edt_song_key.SetUseState(SEditField.UseState.Editable)
		      edt_song_aka.SetUseState(SEditField.UseState.Editable)
		      edt_song_key_line.SetUseState(SEditField.UseState.Editable)
		      edt_song_user1.SetUseState(SEditField.UseState.Editable)
		      edt_song_user2.SetUseState(SEditField.UseState.Editable)
		      edt_song_user3.SetUseState(SEditField.UseState.Editable)
		      edt_song_hymn_number.SetUseState(SEditField.UseState.Editable)
		      btn_song_add_link.Enabled = True
		      btn_song_remove_link.Enabled = True
		      lst_song_linked.Enabled = True
		      btn_song_add_link.Enabled = True
		      btn_song_remove_link.Enabled = lst_song_linked.ListIndex > -1
		      
		      chk_song_style.Enabled = True
		      If chk_song_style.Value Then
		        If can_song_style.Enabled <> True Then
		          can_song_style.Enabled = True
		        End If
		      Else
		        If can_song_style.Enabled <> False Then
		          can_song_style.Enabled = False
		        End If
		      End If
		      
		      lst_song_backgrounds.Enabled = True
		      chk_song_fit_to_screen.Enabled = True
		      chk_song_fit_to_body.Enabled = True
		      chk_song_keepaspect.Enabled = chk_song_fit_to_screen.Value Or chk_song_fit_to_body.Value
		      chk_song_store_as_link.Enabled = True
		      chk_song_background_as_text.Enabled = True
		      Dim rowIndex As Integer = lst_song_backgrounds.SelectedRowIndex
		      Dim lastRow As Integer = lst_song_backgrounds.LastRowIndex
		      btn_song_add_background.Enabled = (rowIndex > -1 And rowIndex <= lastRow)
		      Dim rowCount As Integer = lst_song_backgrounds.SelectedRowCount
		      Dim hasImage As Boolean = False
		      While rowCount > 0 And Not hasImage And rowIndex <= lastRow
		        If lst_song_backgrounds.Selected(rowIndex) then
		          hasImage = lst_song_backgrounds.HasImage(rowIndex)
		          rowCount = rowCount - 1
		        End If
		        rowIndex = rowIndex + 1
		      Wend
		      btn_song_del_background.Enabled = hasImage
		      
		      // SHORTCUTS
		      
		      btn_song_ins_column.Enabled = True
		      btn_song_ins_page.Enabled = True
		      btn_song_ins_comment.Enabled = True
		      btn_song_ins_multi_verse.Enabled = True
		      btn_song_ins_section.Enabled = True
		      btn_song_ins_lyrics.Enabled = True
		      
		    Else
		      btn_song_print.Enabled = False
		      btn_song_present.Enabled = False
		      btn_song_export.Enabled = False
		      btn_song_rename.Enabled = False
		      btn_song_move.Enabled = False
		      btn_song_copy.Enabled = False
		      btn_song_delete.Enabled = False
		      mnu_file_print.Enabled = False
		      mnu_file_single_screen.Enabled = False
		      mnu_file_dual_screen.Enabled = False
		      mnu_file_preview_dual_screen.Enabled = False
		      
		      // EDITOR FIELDS
		      
		      edf_song_lyrics.SetUseState(SEditField.UseState.Empty)
		      grp_song_transpose.Enabled = False
		      pop_song_transpose.Enabled = False
		      pop_song_accidentals.Enabled = False
		      edt_song_title.SetUseState(SEditField.UseState.Empty)
		      edt_song_author.SetUseState(SEditField.UseState.Empty)
		      edt_song_copyright.SetUseState(SEditField.UseState.Empty)
		      edt_song_presentation.SetUseState(SEditField.UseState.Empty)
		      edt_song_ccli.SetUseState(SEditField.UseState.Empty)
		      edt_song_hymn_number.SetUseState(SEditField.UseState.Empty)
		      lst_song_themes.Enabled = False
		      pop_song_capo.Enabled = False
		      pop_song_capo_accidentals.Enabled = False
		      chk_song_capo_print.Enabled = False
		      pop_song_tempo.Enabled = False
		      pop_song_time_sig.Enabled = False
		      edt_song_key.SetUseState(SEditField.UseState.Empty)
		      edt_song_aka.SetUseState(SEditField.UseState.Empty)
		      edt_song_key_line.SetUseState(SEditField.UseState.Empty)
		      edt_song_user1.SetUseState(SEditField.UseState.Empty)
		      edt_song_user2.SetUseState(SEditField.UseState.Empty)
		      edt_song_user3.SetUseState(SEditField.UseState.Empty)
		      
		      btn_song_add_link.Enabled = False
		      btn_song_remove_link.Enabled = False
		      lst_song_linked.Enabled = False
		      lst_song_linked.DeleteAllRows
		      
		      chk_song_style.Enabled = False
		      If can_song_style.Enabled <> False Then
		        can_song_style.Enabled = False
		      End If
		      
		      lst_song_themes.DeleteAllRows
		      pop_song_capo.DeleteAllRows
		      chk_song_capo_print.Enabled = False
		      pop_song_tempo.DeleteAllRows
		      pop_song_time_sig.DeleteAllRows
		      can_song_style.ClearStyleNode
		      
		      lst_song_backgrounds.DeleteAllRows
		      chk_song_fit_to_screen.Enabled = False
		      chk_song_fit_to_body.Enabled = False
		      chk_song_keepaspect.Enabled = False
		      chk_song_store_as_link.Enabled = False
		      chk_song_background_as_text.Enabled = False
		      btn_song_add_background.Enabled = False
		      btn_song_del_background.Enabled = False
		      
		      // SHORTCUTS
		      
		      btn_song_ins_column.Enabled = False
		      btn_song_ins_page.Enabled = False
		      btn_song_ins_comment.Enabled = False
		      btn_song_ins_multi_verse.Enabled = False
		      btn_song_ins_section.Enabled = False
		      btn_song_ins_lyrics.Enabled = False
		      
		    End If
		    
		    If Status_SongChanged Then
		      btn_song_save.Enabled = True
		      btn_song_revert.Enabled = True
		      mnu_file_save.Enabled = True
		    Else
		      btn_song_save.Enabled = False
		      btn_song_revert.Enabled = False
		      mnu_file_save.Enabled = False
		    End If
		    
		    
		    
		  Else  // Sets tab
		    // Menu and left panel
		    // ===================
		    
		    Dim xgroup As XmlNode
		    Dim groupType As String
		    
		    // get currently selected set items' type
		    groupType = ""
		    Try
		      If CurrentSet <> Nil Then
		        xgroup = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True).Child(CurrentInSetItem)
		        If xgroup <> Nil Then
		          groupType = SmartML.GetValue(xgroup, "@type", True)
		        End If
		      End If
		    Catch
		    End Try
		    
		    mnu_mode_songs.Checked = False
		    mnu_mode_sets.Checked = True
		    mnu_file_pagesetup.Enabled = True
		    If Status_SetOpen Then
		      btn_set_add_scripture.Enabled = BibleFactory.HasBible
		      btn_set_add_song.Enabled = True
		      btn_set_add_style.Enabled = True
		      btn_set_add_slides.Enabled = True
		      btn_set_add_image.Enabled = True
		      btn_set_add_external.Enabled = True
		      btn_set_present.Enabled = True And (Not Globals.Status_Presentation)
		      btn_set_print_songs.Enabled = True
		      btn_set_print_order.Enabled = True
		      btn_set_export.Enabled = True
		      btn_set_rename.Enabled = True
		      btn_set_delete.Enabled = True
		      btn_set_saveas.Enabled = True
		      mnu_file_print.Enabled = True
		      mnu_file_single_screen.Enabled = True
		      mnu_file_dual_screen.Enabled = (OSScreenCount() > 1)
		      mnu_file_preview_dual_screen.Enabled = True
		    Else
		      btn_set_add_song.Enabled = False
		      btn_set_add_style.Enabled = False
		      btn_set_add_slides.Enabled = False
		      btn_set_add_scripture.Enabled = False
		      btn_set_add_image.Enabled = False
		      btn_set_add_external.Enabled = False
		      btn_set_present.Enabled = False
		      btn_set_print_songs.Enabled = False
		      btn_set_print_order.Enabled = False
		      btn_set_export.Enabled = False
		      btn_set_rename.Enabled = False
		      btn_set_delete.Enabled = False
		      btn_set_saveas.Enabled = False
		      mnu_file_print.Enabled = False
		      mnu_file_single_screen.Enabled = False
		      mnu_file_dual_screen.Enabled = False
		      mnu_file_preview_dual_screen.Enabled = False
		    End If
		    
		    If Status_InSetChanged Then Status_SetChanged = True
		    
		    If Status_SetChanged Then
		      btn_set_save.Enabled = True
		      mnu_file_save.Enabled = True
		    Else
		      btn_set_save.Enabled = False
		      mnu_file_save.Enabled = False
		    End If
		    
		    
		    
		    If Status_InSetOpen Then
		      // Move Up
		      If lst_set_items.ListIndex > 0 Then
		        btn_set_move_up.Enabled = True
		      Else
		        btn_set_move_up.Enabled = False
		      End If
		      // Move Down
		      If lst_set_items.ListIndex < lst_set_items.ListCount - 1 Then
		        btn_set_move_down.Enabled = True
		      Else
		        btn_set_move_down.Enabled = False
		      End If
		      
		      If groupType <> "style" Then
		        btn_set_presentitem.Enabled = True
		      Else
		        btn_set_presentitem.Enabled = False
		      End If
		      
		      btn_set_remove.Enabled = True
		      btn_set_copy.Enabled = True
		      Dim c As New Clipboard
		      btn_set_paste.Enabled = (c.RawDataAvailable(CopyTypes.SetSlides.MacType)) And (Left(c.RawData(CopyTypes.SetSlides.MacType), 12) = "<slide_group")
		      c.close
		    Else
		      btn_set_move_up.Enabled = False
		      btn_set_move_down.Enabled = False
		      btn_set_presentitem.Enabled = False
		      btn_set_remove.Enabled = False
		      btn_set_copy.Enabled = False
		      btn_set_paste.Enabled = False
		    End If
		    
		    If Status_InSetChanged Then
		      btn_set_store.Enabled = True
		      mnu_file_save.Enabled = True
		    Else
		      btn_set_store.Enabled = False
		    End If
		    
		    // Editor panel
		    // ============
		    
		    If Status_InSetEditable Then
		      
		      If Status_InSetSongEdit Then
		        // Song slide
		        edt_slide_name.SetUseState(SEditField.UseState.ReadOnly)
		        edt_slide_title.SetUseState(SEditField.UseState.ReadOnly)
		        edt_slide_subtitle.SetUseState(SEditField.UseState.ReadOnly)
		        edf_slide_slides.SetUseState(SEditField.UseState.ReadOnly)
		        edt_slide_notes.SetUseState(SEditField.UseState.Editable)
		        edt_slide_order.SetUseState(SEditField.UseState.Editable)
		        edt_slide_origorder.SetUseState(SEditField.UseState.ReadOnly)
		        edt_slide_folder.SetUseState(SEditField.UseState.ReadOnly)
		        edt_slide_auto_advance.SetUseState(SEditField.UseState.ReadOnly)
		        
		        chk_slide_loop.Enabled = False
		      Else
		        // Custom/Scripture slide
		        edt_slide_name.SetUseState(SEditField.UseState.Editable)
		        edt_slide_title.SetUseState(SEditField.UseState.Editable)
		        edt_slide_subtitle.SetUseState(SEditField.UseState.Editable)
		        edf_slide_slides.SetUseState(SEditField.UseState.Editable)
		        edt_slide_notes.SetUseState(SEditField.UseState.Editable)
		        edt_slide_order.SetUseState(SEditField.UseState.Empty)
		        edt_slide_origorder.SetUseState(SEditField.UseState.Empty)
		        edt_slide_folder.SetUseState(SEditField.UseState.Empty)
		        edt_slide_auto_advance.SetUseState(SEditField.UseState.Editable)
		        
		        chk_slide_loop.Enabled = True
		      End If
		      
		      chk_slide_print.Enabled = True
		      pop_slide_transition.Enabled = True
		      
		      btn_slide_ins_slide.Enabled = Not Status_InSetSongEdit
		      
		      chk_slide_style.Enabled = True
		      
		      If chk_slide_style.Value Then
		        If can_slide_style.Enabled <> True Then
		          can_slide_style.Enabled = True
		        End If
		      Else
		        If can_slide_style.Enabled <> False Then
		          can_slide_style.Enabled = False
		        End If
		      End If
		      
		      // Style slide
		      rad_style_change.Enabled = True
		      rad_style_revert.Enabled = True
		      If rad_style_change.Value = True Then
		        can_style_style.Enabled = True
		      Else
		        can_style_style.Enabled = False
		      End If
		      
		      // Image slide
		      edt_image_name.SetUseState(SEditField.UseState.Editable)
		      edt_image_title.SetUseState(SEditField.UseState.Editable)
		      edt_image_subtitle.SetUseState(SEditField.UseState.Editable)
		      chk_image_descriptions.Enabled = True
		      lst_image_images.Enabled = True
		      chk_image_fit_to_screen.Enabled = True
		      chk_image_fit_to_body.Enabled = True
		      chk_image_keepaspect.Enabled = chk_image_fit_to_body.Value Or chk_image_fit_to_screen.Value
		      chk_image_store_as_link.Enabled = True
		      edt_image_notes.SetUseState(SEditField.UseState.Editable)
		      btn_image_ins_image.Enabled = Not lst_image_images_multipleRowsSelected
		      btn_image_imp_image.Enabled = Not lst_image_images_multipleRowsSelected And (PresentationFactory.PowerPointAvailable() Or PresentationFactory.OpenOfficeAvailable())
		      btn_image_del_image.Enabled = True
		      btn_image_move_up.Enabled = True
		      btn_image_move_down.Enabled = True
		      edt_image_auto_advance.SetUseState(SEditField.UseState.Editable)
		      chk_image_loop.Enabled = True
		      chk_image_print.Enabled = True
		      pop_image_transition.Enabled = True
		      
		      chk_image_style.Enabled = True
		      If chk_image_style.Value Then
		        If can_image_style.Enabled <> True Then
		          can_image_style.Enabled = True
		        End If
		      Else
		        If can_image_style.Enabled <> False Then
		          can_image_style.Enabled = False
		        End If
		      End If
		      
		      // External slide
		      edt_external_name.SetUseState(SEditField.UseState.Editable)
		      // External slide - Presentation
		      edt_external_presentation_file.SetUseState(SEditField.UseState.Editable)
		      chk_external_loop_presentation.Enabled = True
		      'chk_external_embed_presentation.Enabled = True
		      // External slide - Videolan
		      rad_external_videolan_start.Enabled = True
		      lbl_external_videolan_mediafilename.Enabled = rad_external_videolan_start.Value
		      btn_external_videolan_mediafilename.Enabled = rad_external_videolan_start.Value
		      'chk_external_embed_mediafile.Enabled = True
		      If rad_external_videolan_start.Value = False Then chk_external_embed_mediafile.Enabled = False
		      If rad_external_videolan_start.Value Then
		        edt_external_videolan_mediafilename.SetUseState(SEditField.UseState.Editable)
		        edt_external_videolan_manual.SetUseState(SEditField.UseState.Editable)
		      Else
		        edt_external_videolan_mediafilename.SetUseState(SEditField.UseState.Empty)
		        edt_external_videolan_manual.SetUseState(SEditField.UseState.Empty)
		      End If
		      lbl_external_videolan_preset.Enabled = rad_external_videolan_start.Value
		      lst_external_videolan_preset.Enabled = rad_external_videolan_start.Value
		      lbl_external_videolan_manual.Enabled = rad_external_videolan_start.Value
		      chk_external_wait_for_videolan.Enabled = rad_external_videolan_start.Value
		      rad_external_videolan_stop.Enabled = True
		      rad_external_application_start.Enabled = True
		      lbl_external_application_filename.Enabled = rad_external_application_start.Value
		      If rad_external_application_start.Value Then
		        edt_external_application_filename.SetUseState(SEditField.UseState.Editable)
		        edt_external_application_parameters.SetUseState(SEditField.UseState.Editable)
		      Else
		        edt_external_application_filename.SetUseState(SEditField.UseState.Empty)
		        edt_external_application_parameters.SetUseState(SEditField.UseState.Empty)
		      End If
		      btn_external_application_filename.Enabled = rad_external_application_start.Value
		      lbl_external_application_parameters.Enabled = rad_external_application_start.Value
		      chk_external_wait_for_application.Enabled = rad_external_application_start.Value
		      rad_external_application_stop.Enabled = True
		      chk_external_loop.Enabled = True
		      chk_external_print.Enabled = True
		      edt_external_notes.SetUseState(SEditField.UseState.Editable)
		    Else
		      
		      If Status_InSetOpen Then
		        edt_slide_name.SetUseState(SEditField.UseState.ReadOnly)
		        edt_slide_title.SetUseState(SEditField.UseState.ReadOnly)
		        edt_slide_subtitle.SetUseState(SEditField.UseState.ReadOnly)
		        edf_slide_slides.SetUseState(SEditField.UseState.ReadOnly)
		        edt_slide_notes.SetUseState(SEditField.UseState.ReadOnly)
		        edt_slide_order.SetUseState(SEditField.UseState.ReadOnly)
		        edt_slide_origorder.SetUseState(SEditField.UseState.ReadOnly)
		        edt_slide_folder.SetUseState(SEditField.UseState.ReadOnly)
		        edt_slide_auto_advance.SetUseState(SEditField.UseState.ReadOnly)
		        chk_slide_loop.Enabled = False
		        chk_slide_print.Enabled = False
		        pop_slide_transition.Enabled = False
		      Else
		        edt_slide_name.SetUseState(SEditField.UseState.Empty)
		        edf_slide_slides.SetUseState(SEditField.UseState.Empty)
		        edt_slide_title.SetUseState(SEditField.UseState.Empty)
		        edt_slide_subtitle.SetUseState(SEditField.UseState.Empty)
		        edt_slide_auto_advance.SetUseState(SEditField.UseState.Empty)
		        edt_slide_order.SetUseState(SEditField.UseState.Empty)
		        edt_slide_origorder.SetUseState(SEditField.UseState.Empty)
		        edt_slide_folder.SetUseState(SEditField.UseState.Empty)
		        edt_slide_notes.SetUseState(SEditField.UseState.Empty)
		        chk_slide_loop.Enabled = False
		        chk_slide_print.Enabled = False
		        pop_slide_transition.Enabled = False
		        pop_slide_transition.ListIndex = 0
		        
		        can_slide_style.ClearStyleNode
		      End If
		      
		      // SHORTCUTS
		      btn_slide_ins_slide.Enabled = False
		      
		      chk_slide_style.Enabled = False
		      can_slide_style.Enabled = False
		      
		      // Style
		      rad_style_change.Enabled = False
		      rad_style_revert.Enabled = False
		      can_style_style.Enabled = False
		      
		      // Image slide
		      If Status_InSetOpen Then
		        edt_image_name.SetUseState(SEditField.UseState.ReadOnly)
		        edt_image_title.SetUseState(SEditField.UseState.ReadOnly)
		        edt_image_subtitle.SetUseState(SEditField.UseState.ReadOnly)
		        chk_image_descriptions.Enabled = False
		        lst_image_images.Enabled = False
		        chk_image_fit_to_screen.Enabled = False
		        chk_image_fit_to_body.Enabled = False
		        chk_image_keepaspect.Enabled = False
		        chk_image_store_as_link.Enabled = False
		        edt_image_notes.SetUseState(SEditField.UseState.ReadOnly)
		        edt_image_auto_advance.SetUseState(SEditField.UseState.ReadOnly)
		        chk_image_loop.Enabled = False
		        chk_image_print.Enabled = False
		        pop_image_transition.Enabled = False
		      Else
		        edt_image_name.SetUseState(SEditField.UseState.Empty)
		        edt_image_title.SetUseState(SEditField.UseState.Empty)
		        edt_image_subtitle.SetUseState(SEditField.UseState.Empty)
		        chk_image_descriptions.Enabled = False
		        lst_image_images.Enabled = False
		        lst_image_images.DeleteAllRows
		        chk_image_fit_to_screen.Enabled = False
		        chk_image_fit_to_body.Enabled = False
		        chk_image_keepaspect.Enabled = False
		        chk_image_store_as_link.Enabled = False
		        edt_image_notes.SetUseState(SEditField.UseState.Empty)
		        edt_image_auto_advance.SetUseState(SEditField.UseState.Empty)
		        chk_image_loop.Enabled = False
		        chk_image_print.Enabled = False
		        pop_image_transition.ListIndex = 0
		        
		        can_image_style.ClearStyleNode
		      End If
		      
		      chk_image_style.Enabled = False
		      can_image_style.Enabled = False
		      
		      btn_image_ins_image.Enabled = False
		      btn_image_imp_image.Enabled = False
		      btn_image_del_image.Enabled = False
		      btn_image_move_up.Enabled = False
		      btn_image_move_down.Enabled = False
		      
		      // External slide
		      If Status_InSetOpen Then
		        edt_external_name.SetUseState(SEditField.UseState.ReadOnly)
		        edt_external_presentation_file.SetUseState(SEditField.UseState.ReadOnly)
		        chk_external_loop_presentation.Enabled = False
		        chk_external_embed_presentation.Enabled = False
		        rad_external_videolan_start.Enabled = False
		        lbl_external_videolan_mediafilename.Enabled = False
		        btn_external_videolan_mediafilename.Enabled = False
		        edt_external_videolan_mediafilename.SetUseState(SEditField.UseState.ReadOnly)
		        chk_external_embed_mediafile.Enabled = False
		        lst_external_videolan_preset.Enabled = False
		        edt_external_videolan_manual.SetUseState(SEditField.UseState.ReadOnly)
		        chk_external_wait_for_videolan.Enabled = False
		        rad_external_videolan_stop.Enabled = False
		        rad_external_application_start.Enabled = False
		        btn_external_application_filename.Enabled = False
		        edt_external_application_filename.SetUseState(SEditField.UseState.ReadOnly)
		        edt_external_application_parameters.SetUseState(SEditField.UseState.ReadOnly)
		        chk_external_wait_for_application.Enabled = False
		        rad_external_application_stop.Enabled = False
		        chk_external_loop.Enabled = False
		        chk_external_print.Enabled = False
		        edt_external_notes.SetUseState(SEditField.UseState.ReadOnly)
		      Else
		        edt_external_name.SetUseState(SEditField.UseState.Empty)
		        edt_external_presentation_file.SetUseState(SEditField.UseState.Empty)
		        chk_external_loop_presentation.Enabled = False
		        chk_external_embed_presentation.Enabled = False
		        rad_external_videolan_start.Enabled = False
		        edt_external_videolan_mediafilename.SetUseState(SEditField.UseState.Empty)
		        chk_external_embed_mediafile.Enabled = False
		        edt_external_videolan_manual.SetUseState(SEditField.UseState.Empty)
		        chk_external_wait_for_videolan.Enabled = False
		        rad_external_videolan_stop.Enabled = False
		        rad_external_application_start.Enabled = False
		        edt_external_application_filename.SetUseState(SEditField.UseState.Empty)
		        edt_external_application_parameters.SetUseState(SEditField.UseState.Empty)
		        chk_external_wait_for_application.Enabled = False
		        rad_external_application_stop.Enabled = False
		        chk_external_loop.Enabled = False
		        chk_external_print.Enabled = True
		        edt_external_notes.SetUseState(SEditField.UseState.Empty)
		      End If
		    End If
		    
		  End If
		End Sub
	#tag EndMethod


	#tag Note, Name = Status Hierarchy
		SetOpen
		+ SetChanged
		+ InSetOpen
		   + InSetChanged
	#tag EndNote


	#tag Property, Flags = &h1
		Protected CurrentInSetItem As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentSet As XmlDocument
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentSetIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentSetName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentSong As XmlDocument
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentSongFolderPath As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentSongName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentSongObj As Song
	#tag EndProperty

	#tag Property, Flags = &h0
		DontUpdateSetItem As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Find As FindClass
	#tag EndProperty

	#tag Property, Flags = &h0
		FindFocus As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			This holds the pointer to the first song (usually the current song) involved in the active search.
			Allows wrapping search support.
		#tag EndNote
		Protected FindStartSong As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HSizer As HalfSizer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InSetNameCache As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected KeyedSearch As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastSearch As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastSetPane As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastSongPane As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lst_image_images_multipleRowsSelected As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_oldAnimationsEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_PreviewScreenRatio As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_Reordering As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			PowerPointApplication
		#tag EndNote
		PPT As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If m_PreviewScreenRatio = 0 Then
			    Dim presentScreen As Integer
			    Dim width, height As Integer
			    Dim xPresentSettings As XmlNode
			    
			    If App.MyPresentSettings <> Nil Then
			      xPresentSettings = App.MyPresentSettings.DocumentElement
			    End If
			    
			    If SmartML.GetValueB(xPresentSettings,"monitors\@force_4_3_preview",False) Then
			      m_PreviewScreenRatio = 4.0 / 3.0
			    ElseIf SmartML.GetValueB(xPresentSettings,"monitors\@force_16_9_preview",False) Then
			      m_PreviewScreenRatio = 16.0 / 9.0
			    Else
			      presentScreen = SmartML.GetValueN(xPresentSettings,"monitors\@present",False) - 1
			      If presentScreen < 0 Or presentScreen > OSScreenCount() - 1 Then presentScreen = 0
			      width = OSScreen(presentScreen).Width
			      height = OSScreen(presentScreen).Height
			      m_PreviewScreenRatio = width / height
			    End If
			  End If
			  Return m_PreviewScreenRatio
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  m_PreviewScreenRatio = value
			End Set
		#tag EndSetter
		Protected PreviewScreenRatio As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private SavedSongList() As Pair
	#tag EndProperty

	#tag Property, Flags = &h0
		saWin As SongActivity
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SongBackgroundsSectionOrder As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SongCache(0) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SongListIsFiltered As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Songs As FolderDB
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_Closing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_CurrentMode As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_InSetChanged As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_InSetEditable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Status_InSetLoading As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_InSetOpen As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_InSetSongEdit As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Status_InSongLoading As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_ProgramInitialized As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Status_SetChanged As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Status_SetOpen As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Status_SongChanged As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Status_SongOpen As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TempSet As XmlDocument
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowBounds As REALbasic.Rect
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowState As WindowState
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowStateBefore As WindowState
	#tag EndProperty


	#tag Constant, Name = ACTION_INTERLEAVE, Type = Double, Dynamic = False, Default = \"10001", Scope = Protected
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"12"
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"10"
	#tag EndConstant

	#tag Constant, Name = kFixedFont, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Courier"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Courier New"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"FreeMono"
	#tag EndConstant


#tag EndWindowCode

#tag Events btn_mode_songs_mode
	#tag Event
		Sub Action()
		  SetMode 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon midi_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_mode_sets_mode
	#tag Event
		Sub Action()
		  SetMode 1
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon background_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_sets_sets
	#tag Event
		Sub Change()
		  If Status_InSetLoading Then
		    Return
		  End If
		  
		  If Me.ListIndex < 0 Then
		    CurrentSetIndex = -1
		    lst_set_items.DeleteAllRows
		    Return
		  End If
		  
		  // Check if we have a sets folder if not try to create one
		  If App.CheckDocumentFolders(App.SETS_FOLDER) = App.NO_FOLDER Then
		    If App.DocsFolder <> Nil Then
		      InputBox.Message App.T.Translate("errors/create_sets_folder", App.DocsFolder.Child(App.STR_SETS).NativePath)
		      Me.ListIndex = -1
		      CurrentSetIndex = -1
		      Return
		    Else
		      MsgBox App.T.Translate("errors/no_docs_folder", "")
		    End If
		  End If
		  
		  // Ask if user wants to save
		  If Not ActionSetAskSave Then
		    If CurrentSetIndex >= 0 Then
		      pop_sets_sets.ListIndex = CurrentSetIndex
		    End If
		    Return  // User Canceled
		  End If
		  
		  CurrentSetIndex = pop_sets_sets.ListIndex
		  
		  App.MouseCursor = System.Cursors.Wait
		  lst_set_items.DeleteAllRows
		  If pop_sets_sets.ListIndex < 0 Or Len(pop_sets_sets.Text) <= 0 Then
		    App.MouseCursor = Nil
		    Return
		  End If
		  
		  Try
		    If Not LoadSet(Me.Text) Then
		      If Not App.MainWindowIsOpen Then
		        Me.SelectedRowIndex = -1
		      End If
		    End If
		  Catch error
		    If App.MainWindowIsOpen Then
		      Dim Popup As New ErrorPopup
		      Popup.SetDescription(error)
		      App.MouseCursor = Nil
		      Popup.ShowModal
		    Else
		      Raise Error
		    End If
		  End Try
		  App.MouseCursor = Nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/sets"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_sets_add
	#tag Event
		Sub Action()
		  ActionSetNew
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/sets/add"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon add_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_remove
	#tag Event
		Sub Action()
		  ActionInSetRemove False
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_item/remove"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon editdelete_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_move_down
	#tag Event
		Sub Action()
		  ActionInSetSwap(lst_set_items.SelectedRowIndex + 1)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_item/move_down"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon down_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_copy
	#tag Event
		Sub Action()
		  ActionInSetCopy
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_item/copy"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon editcopy_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_move_up
	#tag Event
		Sub Action()
		  ActionInSetSwap(lst_set_items.SelectedRowIndex - 1)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_item/move_up"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon up_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_paste
	#tag Event
		Sub Action()
		  ActionInSetPaste
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_item/paste"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon editcopy_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_store
	#tag Event
		Sub Action()
		  Call ActionInSetSave
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_item/store"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon filesave_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_presentitem
	#tag Event
		Sub Action()
		  Dim Item As Integer
		  
		  Item = lst_set_items.ListIndex '+ 1
		  
		  If Me.MenuItem = App.T.Translate("sets_mode/current_item/presentitem/single_screen/@caption") Then
		    ActionSetPresent PresentWindow.MODE_SINGLE_SCREEN, Item
		  ElseIf Me.MenuItem = App.T.Translate("sets_mode/current_item/presentitem/preview_dual_screen/@caption") Then
		    ActionSetPresent PresentWindow.MODE_PREVIEW, Item
		  ElseIf Me.MenuItem = App.T.Translate("sets_mode/current_item/presentitem/dual_screen/@caption") Then
		    If OSScreenCount() > 1 Then
		      ActionSetPresent PresentWindow.MODE_DUAL_SCREEN, Item
		    Else
		      InputBox.Message App.T.Translate("errors/no_multi_screen")
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub ConstructPopupMenu()
		  Me.DeletePopup
		  Me.AddPopupRow App.T.Translate("sets_mode/current_item/presentitem/single_screen/@caption")
		  
		  if OSScreenCount() > 1 Then
		    Me.AddPopupRow App.T.Translate("sets_mode/current_item/presentitem/dual_screen/@caption")
		  End If
		  
		  Me.AddPopupSeparator
		  Me.AddPopupRow App.T.Translate("sets_mode/current_item/presentitem/preview_dual_screen/@caption")
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_item/presentitem"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon background_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_delete
	#tag Event
		Sub Action()
		  ActionSetDelete
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_set/delete"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon editdelete_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_present
	#tag Event
		Sub Action()
		  If Me.MenuItem = App.T.Translate("sets_mode/current_set/present/single_screen/@caption") Then
		    ActionSetPresent PresentWindow.MODE_SINGLE_SCREEN
		  ElseIf Me.MenuItem = App.T.Translate("sets_mode/current_set/present/preview_dual_screen/@caption") Then
		    ActionSetPresent PresentWindow.MODE_PREVIEW
		  ElseIf Me.MenuItem = App.T.Translate("sets_mode/current_set/present/dual_screen/@caption") Then
		    If OSScreenCount() > 1 Then
		      ActionSetPresent PresentWindow.MODE_DUAL_SCREEN
		    Else
		      InputBox.Message App.T.Translate("errors/no_multi_screen")
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub ConstructPopupMenu()
		  Me.DeletePopup
		  Me.AddPopupRow App.T.Translate("sets_mode/current_set/present/single_screen/@caption")
		  
		  If OSScreenCount() > 1 Then
		    Me.AddPopupRow App.T.Translate("sets_mode/current_set/present/dual_screen/@caption")
		  End If
		  
		  Me.AddPopupSeparator
		  Me.AddPopupRow App.T.Translate("sets_mode/current_set/present/preview_dual_screen/@caption")
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_set/present"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon background_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_rename
	#tag Event
		Sub Action()
		  ActionSetRename
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_set/rename"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon redo_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_print_songs
	#tag Event
		Sub Action()
		  ActionSetPrint
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_set/print_songs"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon fileprint_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_print_order
	#tag Event
		Sub Action()
		  ActionSetPrintList
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_set/print_order"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon fileprint_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_save
	#tag Event
		Sub Action()
		  ActionSetSave
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_set/save"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon filesave_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_saveas
	#tag Event
		Sub Action()
		  Dim t As String
		  Dim old As String
		  Dim f, oldf As FolderItem
		  Dim i As Integer
		  old = pop_sets_sets.Text
		  
		  t = InputBox.Input(App.T.Translate("questions/rename/@caption", old), old)
		  If Len(t) > 0 Then
		    If Not FileUtils.IsSafeFileName(t) Then
		      InputBox.Message App.T.Translate("errors/bad_file_name", t)
		      Return
		    End If
		    
		    f = App.DocsFolder.Child("Sets").Child(t)
		    If f.Exists Then
		      InputBox.Message App.T.Translate("folderdb_errors/error[@code=3]", f.NativePath) ' already exists
		      Exit
		    End If
		    
		    oldf = App.DocsFolder.Child("Sets").Child(old)
		    If Not oldf.Exists Then
		      InputBox.Message App.T.Translate("folderdb_errors/error[@code=8]", oldf.NativePath) ' could not find file
		      Exit
		    End If
		    MainWindow.MouseCursor = System.Cursors.Wait
		    
		    CurrentSet.DocumentElement.SetAttribute("name", t)
		    
		    CurrentSetName = t
		    
		    f.Name = t
		    
		    Status_SetChanged = True
		    ActionSetSave 'save under the new name
		    
		    'i = pop_sets_sets.ListIndex
		    'pop_sets_sets.InsertRow i, t
		    'pop_sets_sets.Sort
		    'pop_sets_sets.ListIndex = i
		    
		    pop_sets_sets.DeleteAllRows
		    
		    LoadSets app.DocsFolder.Child("Sets")
		    
		    For i = 0 To pop_sets_sets.ListCount - 1
		      If pop_sets_sets.list(i) = t Then
		        pop_sets_sets.ListIndex = i
		        Exit
		      End If
		    Next i
		    MainWindow.MouseCursor = Nil
		    
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_set/saveas"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon filesave_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_export
	#tag Event
		Sub Action()
		  ActionSetExport
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/current_set/export"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon filesaveas_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_add_scripture
	#tag Event
		Sub Action()
		  App.DebugWriter.Write "MainWindow.btn_set_add_scripture.Action: Enter", 4
		  
		  ActionSetAddScripture
		  
		  App.DebugWriter.Write "MainWindow.btn_set_add_scripture.Action: Exit", 4
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/new_item/add_scripture"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon empty_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_add_slides
	#tag Event
		Sub Action()
		  Dim xgroups, newGroup As XmlNode
		  
		  xgroups = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True)
		  If lst_set_items.ListIndex >= 0 Then
		    newGroup = SmartML.InsertChild(xgroups, "slide_group", lst_set_items.ListIndex + 1)
		  Else
		    newGroup = SmartML.InsertChild(xgroups, "slide_group", lst_set_items.ListCount)
		  End If
		  
		  SmartML.SetValue newGroup, "@name", App.T.Translate("sets_mode/untitled/@caption")
		  SmartML.SetValue newGroup, "@type", "custom"
		  
		  ActionInSetAddSlide newGroup
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/new_item/add_slides"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon document_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_add_style
	#tag Event
		Sub Action()
		  Dim xgroups, newGroup As XmlNode
		  Dim Where As Integer
		  xgroups = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True)
		  If lst_set_items.ListIndex >= 0 Then
		    Where = lst_set_items.ListIndex + 1
		  Else
		    Where = lst_set_items.ListCount
		  End If
		  
		  newGroup = SmartML.InsertChild(xgroups, "slide_group", Where)
		  SmartML.SetValue newGroup, "@name", App.T.Translate("sets_mode/items/revert")
		  SmartML.SetValue newGroup, "@type", "style"
		  SmartML.SetValue newGroup, "@action", "revert"
		  
		  ActionInSetAddSlide newGroup
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/new_item/add_style"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon colorize_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_add_song
	#tag Event
		Sub Action()
		  ActionSetAddSong
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/new_item/add_song"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon midi_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_add_image
	#tag Event
		Sub Action()
		  Dim xgroups, newGroup As XmlNode
		  
		  xgroups = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True)
		  If lst_set_items.ListIndex >= 0 Then
		    newGroup = SmartML.InsertChild(xgroups, "slide_group", lst_set_items.ListIndex + 1)
		  Else
		    newGroup = SmartML.InsertChild(xgroups, "slide_group", lst_set_items.ListCount)
		  End If
		  
		  SmartML.SetValue newGroup, "@name", App.T.Translate("sets_mode/untitled/@caption")
		  SmartML.SetValue newGroup, "@type", "image"
		  
		  ActionInSetAddSlide newGroup
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/new_item/add_image"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon background_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_set_add_external
	#tag Event
		Sub Action()
		  Dim xgroups, newGroup As XmlNode
		  
		  xgroups = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True)
		  If lst_set_items.ListIndex >= 0 Then
		    newGroup = SmartML.InsertChild(xgroups, "slide_group", lst_set_items.ListIndex + 1)
		  Else
		    newGroup = SmartML.InsertChild(xgroups, "slide_group", lst_set_items.ListCount)
		  End If
		  
		  SmartML.SetValue newGroup, "@name", App.T.Translate("sets_mode/untitled/@caption")
		  SmartML.SetValue newGroup, "@type", "external"
		  
		  ActionInSetAddSlide newGroup
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "sets_mode/new_item/add_external"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon text_background_img
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_set_items
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #Pragma Unused column
		  If Not App.SlideStyleColorEnabled() Then Return False
		  
		  If row < 0 Or row >= me.ListCount() Then Return False
		  
		  If row = me.SelectedRowIndex Then Return False
		  
		  Dim BackColor As Color
		  
		  Select Case me.CellTag(row,0)
		  Case "song"
		    BackColor = App.SlideStyleColor("verse")
		  Case "custom"
		    BackColor = App.SlideStyleColor("custom")
		  Case "scripture"
		    BackColor = App.SlideStyleColor("scripture")
		  Case "style"
		    BackColor = App.SlideStyleColor("style")
		  Case "image"
		    BackColor = App.SlideStyleColor("image")
		  Case "external"
		    BackColor = App.SlideStyleColor("external")
		  Case Else
		    Return False
		  End Select
		  
		  If BackColor = Color.White Then
		    BackColor = Color.FillColor
		  End If
		  
		  g.ForeColor = BackColor
		  g.FillRect(0, 0, g.Width, g.Height)
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  Dim sDoc As XmlDocument
		  Dim resize As String
		  Dim image As StyleImage
		  Dim SlideSongStyle As XmlNode
		  Dim songPath As String
		  
		  Dim xgroup As XmlNode
		  Dim xslides As XmlNode
		  Dim s As String
		  Dim imagestring As String
		  Dim i As Integer
		  Dim groupType As String
		  
		  // Don't reload if same set item
		  If Me.ListIndex = CurrentInSetItem Then Return
		  
		  If DontUpdateSetItem Or m_Reordering Then
		    Return
		  End If
		  
		  // Ask if user wants to save
		  If Not ActionInSetAskSave Then
		    If CurrentInSetItem >= 0 Then
		      lst_set_items.ListIndex = CurrentInSetItem
		    End If
		    Return  // User Canceled
		  End If
		  
		  If Me.ListIndex < 0 Then
		    CurrentInSetItem = -1
		    
		    Status_InSetLoading = True
		    Status_InSetEditable = False  // keeps the status from Refresh Falseing for every change
		    
		    If pge_contents.Value <> 2 Then
		      pge_contents.Value = 2
		      LastSetPane = 2
		    End If
		    
		    ClearSetEditorFields()
		    
		    Status_InSetOpen = False
		    Status_InSetEditable = False
		    Status_InSetChanged = False
		    Status_InSetLoading = False
		    
		    EnableMenuItems
		    Return
		  End If
		  
		  Status_InSetEditable = False
		  Status_InSetSongEdit = False
		  CurrentInSetItem = lst_set_items.ListIndex
		  xgroup = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True).Child(Me.ListIndex)
		  If xgroup = Nil Then  // Prevent Nil object exception
		    lst_set_items.ListIndex = -1
		    Return
		  End If
		  InSetNameCache = SmartML.GetValue(xgroup, "@name")
		  groupType = SmartML.GetValue(xgroup, "@type", True)
		  Select Case groupType
		  Case "custom", "scripture"
		    If pge_contents.Value <> 2 Then
		      pge_contents.Value = 2
		      LastSetPane = 2
		    End If
		    
		    Status_InSetLoading = True
		    Status_InSetEditable = False  // keeps the status from Refresh Falseing for every change
		    
		    edt_slide_name.Text = SmartML.GetValue(xgroup, "@name")
		    edt_slide_title.Text = SmartML.GetValue(xgroup, "title")
		    edt_slide_subtitle.Text = SmartML.GetValue(xgroup, "subtitle")
		    edt_slide_notes.Text = SmartML.GetValue(xgroup, "notes")
		    chk_slide_loop.Value = SmartML.GetValueB(xgroup, "@loop", False)
		    chk_slide_print.Value = SmartML.GetValueB(xgroup, "@print", True, True)
		    pop_slide_transition.ListIndex = SmartML.GetValueN(xgroup, "@transition", False)
		    edt_slide_auto_advance.Text = Str(SmartML.GetValueN(xgroup, "@seconds", False))
		    edt_slide_order.Text = ""
		    edt_slide_origorder.Text = ""
		    edt_slide_folder.Text = ""
		    
		    If SmartML.GetNode(xgroup, "style", False) = Nil Then
		      chk_slide_style.Value = False
		      can_slide_style.ClearStyleNode
		      can_slide_style.ClearPreviewSlide
		    Else
		      chk_slide_style.Value = True
		      can_slide_style.PreviewSlide = SmartML.GetNode(xgroup, "slides/slide")
		      can_slide_style.SetStyleNode SmartML.GetNode(xgroup, "style")
		    End If
		    can_slide_style.SongStyle = False
		    ' can_slide_custom_style.Refresh False
		    s = ""
		    xslides = SmartML.GetNode(xgroup, "slides", True)
		    For i = 0 To xslides.ChildCount - 1
		      s = s + StringUtils.Trim(SmartML.GetValue(xslides.Child(i), "body", False), StringUtils.WhiteSpaces)
		      If i < xslides.ChildCount - 1 Then
		        s = s + SmartML.Newline + "---" + SmartML.Newline
		      End If
		    Next i
		    edf_slide_slides.Text = s
		    
		    Status_InSetOpen = True
		    Status_InSetEditable = True
		    Status_InSetChanged = False
		    Status_InSetLoading = False
		    
		  Case "song"
		    
		    If pge_contents.Value <> 2 Then pge_contents.Value = 2
		    
		    Status_InSetOpen = False
		    Status_InSetEditable = False
		    ClearSetEditorFields
		    Status_InSetOpen = True
		    Status_InSetLoading = True
		    
		    // Try to load the slide specific song style
		    SlideSongStyle = SmartML.GetNode(xgroup, "style", False)
		    If  SlideSongStyle = Nil Then
		      chk_slide_style.Value = False
		      can_slide_style.ClearStyleNode
		      can_slide_style.ClearPreviewSlide
		    Else
		      chk_slide_style.Value = True
		      can_slide_style.ClearPreviewSlide
		      can_slide_style.SetStyleNode SlideSongStyle
		    End If
		    can_slide_style.SongStyle = True
		    
		    sDoc = SetML.GetSong(xgroup, Songs, songPath)
		    If sDoc = Nil Then
		      // sDoc is Nil if either a FolderDB error or a SmartML error occured. The SmartML Error has been displayed already.
		      If Songs.ErrorCode <> 0 Then
		        s = SmartML.GetValue(xgroup, "@name", False, lst_set_items.Text)
		        songPath = SmartML.GetValue(xgroup, "@path", False, songPath)
		        InputBox.Message App.T.Translate("folderdb_errors/error[@code='"+Str(Songs.ErrorCode)+"']", Songs.CombinePath(songPath, s))
		      End If
		    Else
		      edf_slide_slides.Text = SmartML.GetValue(sDoc.DocumentElement, "lyrics", True).FormatLocalEndOfLine
		      edf_slide_slides.ColorizeBilingual()
		      edt_slide_title.Text = SmartML.GetValue(sDoc.DocumentElement, "title", True)
		      edt_slide_order.Text = SmartML.GetValue(xgroup, "@presentation", False)
		      edt_slide_origorder.Text = SmartML.GetValue(sDoc.DocumentElement, "presentation", False)
		      edt_slide_folder.Text = songPath
		      pop_slide_transition.ListIndex = SmartML.GetValueN(xgroup, "@transition", False)
		      edt_slide_notes.Text = SmartML.GetValue(xgroup, "notes", False)
		      
		      Status_InSetEditable = True  // for custom order
		      Status_InSetChanged = False
		      Status_InSetSongEdit = True
		    End If
		    
		    Status_InSetLoading = False
		    
		  Case "style"
		    Status_InSetLoading = True
		    Status_InSetEditable = False  // keeps the status from Refresh Falseing for every change
		    
		    If SmartML.GetValue(xgroup, "@action") = "new" Then
		      rad_style_change.Value = True
		    Else
		      rad_style_revert.Value = True
		    End If
		    can_style_style.SetStyleNode SmartML.GetNode(xgroup, "style")
		    can_style_style.SongStyle = True  // Hack: Not really a SongStyle, but this will allow the use of Subtitle Options
		    
		    Status_InSetOpen = True
		    Status_InSetEditable = True
		    Status_InSetChanged = False
		    Status_InSetLoading = False
		    If pge_contents.Value <> 3 Then
		      LastSetPane = 3
		      pge_contents.Value = 3
		    End If
		    
		  Case "image"
		    If pge_contents.Value <> 4 Then
		      pge_contents.Value = 4
		      LastSetPane = 4
		    End If
		    
		    Status_InSetLoading = True
		    Status_InSetEditable = False  // keeps the status from Refresh Falseing for every change
		    
		    Dim imageLink As Boolean = SmartML.GetValueB(xgroup, "@link", False, ImageDefaults.LinkToBackgroundsFolder)
		    
		    lst_image_images.DeleteAllRows
		    xslides = SmartML.GetNode(xgroup, "slides", True)
		    For i = 0 To xslides.ChildCount - 1
		      image = new StyleImage()
		      s = SmartML.GetValue(xslides.Child(i), "filename")
		      imagestring = SmartML.GetValue(xslides.Child(i), "image")
		      If imagestring = "" Then
		        Call image.SetImageFromFileName( s )
		      Else
		        Call image.SetImageFromString( imagestring )
		      End If
		      lst_image_images.AddImage( image )
		      lst_image_images.Cell( lst_image_images.LastIndex(), 1 ) = SmartML.GetValue(xslides.Child(i), "description")
		    Next i
		    
		    edt_image_name.Text = SmartML.GetValue(xgroup, "@name")
		    edt_image_title.Text = SmartML.GetValue(xgroup, "title")
		    edt_image_subtitle.Text = SmartML.GetValue(xgroup, "subtitle")
		    chk_image_descriptions.Value = SmartML.GetValueB(xgroup, "@descriptions_in_subtitle", False)
		    edt_image_notes.Text = SmartML.GetValue(xgroup, "notes")
		    chk_image_loop.Value = SmartML.GetValueB(xgroup, "@loop", False)
		    chk_image_print.Value = SmartML.GetValueB(xgroup, "@print", True, True)
		    pop_image_transition.ListIndex = SmartML.GetValueN(xgroup, "@transition", False)
		    edt_image_auto_advance.Text = Str(SmartML.GetValueN(xgroup, "@seconds", False))
		    
		    If SmartML.GetNode(xgroup, "style", False) = Nil Then
		      chk_image_style.Value = False
		      can_image_style.ClearStyleNode
		      can_image_style.ClearPreviewSlide
		    Else
		      chk_image_style.Value = True
		      can_image_style.PreviewSlide = GetImageSlideStylePreviewSlide(SmartML.GetNode(xgroup, "slides/slide"))
		      can_image_style.SetStyleNode SmartML.GetNode(xgroup, "style")
		    End If
		    
		    resize = SmartML.GetValue(xgroup, "@resize", False, "default")
		    chk_image_fit_to_screen.Value = (resize = "screen") Or (resize = "default" And ImageDefaults.ResizeToScreenArea)
		    chk_image_fit_to_body.Value = (resize = "body") Or (resize = "default" And ImageDefaults.ResizeToBodyArea)
		    chk_image_keepaspect.Value = SmartML.GetValueB(xgroup, "@keep_aspect", False, ImageDefaults.KeepAspectRatio)
		    chk_image_keepaspect.Enabled = chk_image_fit_to_screen.Value Or chk_image_fit_to_body.Value
		    chk_image_store_as_link.Value = imageLink
		    
		    Status_InSetOpen = True
		    Status_InSetEditable = True
		    Status_InSetChanged = False
		    Status_InSetLoading = False
		    
		  Case "external"
		    If pge_contents.Value <> 5 Then
		      pge_contents.Value = 5
		      LastSetPane = 5
		    End If
		    
		    Status_InSetLoading = True
		    Status_InSetEditable = False  // keeps the status from Refresh Falseing for every change
		    
		    edt_external_name.Text = SmartML.GetValue(xgroup, "@name")
		    
		    lst_external_videolan_preset.DeleteAllRows
		    For i = 0 To App.VideolanPresetList.Count()-1
		      lst_external_videolan_preset.AddRow App.VideolanPresetList.Key(i).StringValue
		    Next i
		    
		    Select Case SmartML.GetValue(xgroup, "@application")
		    Case "presentation"
		      btn_external_presentation.Stuck = True
		      btn_external_videolan.Stuck = False
		      btn_external_application.Stuck = False
		      pge_externals.Value = 1
		      
		      // Detect all presentation hosts at once, including progress indicator
		      PresentationFactory.DetectAllHosts()
		      rad_external_host_powerpoint.Enabled = PresentationFactory.PowerPointAvailable()
		      rad_external_host_pptview.Enabled = PresentationFactory.PPTViewAvailable()
		      rad_external_host_impress.Enabled = PresentationFactory.OpenOfficeAvailable()
		      
		      Select Case SmartML.GetValue(xgroup, "@host")
		      Case "ppt"
		        rad_external_host_powerpoint.Value = True
		      Case "pptview"
		        rad_external_host_pptview.Value = True
		      Case "impress"
		        rad_external_host_impress.Value = True
		      End Select
		      
		      edt_external_presentation_file.Text = SmartML.GetValue(xgroup, "@filename")
		      chk_external_loop_presentation.Value = SmartML.GetValueB(xgroup, "@loop_presentation")
		      chk_external_embed_presentation.Value = Not IsNull(SmartML.GetNode(xgroup, "file"))
		      chk_external_embed_presentation.Enabled = False
		      
		    Case "videolan"
		      btn_external_presentation.Stuck = False
		      btn_external_videolan.Stuck = True
		      btn_external_application.Stuck = False
		      pge_externals.Value = 2
		      
		      Select Case SmartML.GetValue(xgroup, "@action")
		      Case "start"
		        rad_external_videolan_start.Value = True
		      Case "stop"
		        rad_external_videolan_stop.Value = True
		      End Select
		      
		      edt_external_videolan_mediafilename.Text = SmartML.GetValue(xgroup, "@filename")
		      chk_external_embed_mediafile.Value = Not IsNull(SmartML.GetNode(xgroup, "file"))
		      chk_external_embed_mediafile.Enabled = False
		      
		      Dim videolanParams As String = SmartML.GetValue(xgroup, "@videolan_parameters")
		      lst_external_videolan_preset.ListIndex = -1
		      For i = 0 to lst_external_videolan_preset.ListCount()-1
		        If App.VideolanPresetList.Value(lst_external_videolan_preset.Cell(i, 0)) = videolanParams Then
		          lst_external_videolan_preset.ListIndex = i
		        End If
		      Next i
		      
		      If lst_external_videolan_preset.ListIndex = -1 Then
		        lst_external_videolan_preset.ListIndex = lst_external_videolan_preset.ListCount()-1
		      End If
		      edt_external_videolan_manual.Text = videolanParams
		      chk_external_wait_for_videolan.Value = SmartML.GetValueB(xgroup, "@wait_to_finish")
		      
		    Case "launch"
		      btn_external_presentation.Stuck = False
		      btn_external_videolan.Stuck = False
		      btn_external_application.Stuck = True
		      pge_externals.Value = 3
		      
		      Select Case SmartML.GetValue(xgroup, "@action")
		      Case "start"
		        rad_external_application_start.Value = True
		      Case "stop"
		        rad_external_application_stop.Value = True
		      End Select
		      edt_external_application_filename.Text = SmartML.GetValue(xgroup, "@app_filename")
		      edt_external_application_parameters.Text = SmartML.GetValue(xgroup, "@app_parameters")
		      chk_external_wait_for_application.Value = SmartML.GetValueB(xgroup, "@wait_to_finish")
		      
		    Else
		      // Clear fields for all externals
		      btn_external_presentation.Stuck = False
		      btn_external_videolan.Stuck = False
		      btn_external_application.Stuck = False
		      pge_externals.Value = 0
		      
		      rad_external_host_powerpoint.Value = False
		      rad_external_host_pptview.Value = False
		      rad_external_host_impress.Value = False
		      
		      rad_external_videolan_start.Value = False
		      rad_external_videolan_stop.Value = False
		      edt_external_videolan_mediafilename.Text = ""
		      lst_external_videolan_preset.ListIndex = -1
		      edt_external_videolan_manual.Text = ""
		      chk_external_wait_for_application.Value = True
		      
		      edt_external_presentation_file.Text = ""
		      chk_external_loop_presentation.Value = False
		      edt_external_application_filename.Text = ""
		      edt_external_application_parameters.Text = ""
		      chk_external_wait_for_application.Value = True
		      
		    End Select
		    
		    edt_external_notes.Text = SmartML.GetValue(xgroup, "notes")
		    chk_external_loop.Value = SmartML.GetValueB(xgroup, "@loop", False)
		    chk_external_print.Value = SmartML.GetValueB(xgroup, "@print", True, True)
		    
		    Status_InSetOpen = True
		    Status_InSetEditable = True
		    Status_InSetChanged = False
		    Status_InSetLoading = False
		    
		  Case Else
		    Status_InSetOpen = True
		    Status_InSetEditable = False
		    Status_InSetChanged = False
		    Status_InSetLoading = False
		  End Select
		  
		  EnableMenuItems
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Dim i As Integer
		  Dim path As String
		  Dim currentSetItem As XmlNode
		  //++
		  // June 2007, EMP
		  // Check that (a) item is a song, and (b) current song editor folder is same as or above
		  // the path to the song.
		  //--
		  currentSetItem = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups").Child(CurrentInSetItem)
		  If SmartML.GetValue(currentSetItem, "@type") <> "song" Then Return
		  path = SmartML.GetValue(currentSetItem, "@path")
		  
		  SetSongEditorPath(path)
		  
		  path = Songs.CellTagFormat(path)
		  If pop_sets_sets.ListIndex >= 0 Then
		    For i = 0 To lst_songs_songs.ListCount - 1
		      If lst_songs_songs.List(i) = InSetNameCache Then
		        If lst_songs_songs.CellTag(i, 0) = path Then
		          lst_songs_songs.ListIndex = i
		          SetMode 0
		          Exit
		        End If
		      End If
		    Next i
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean
		  #Pragma Unused parentRow
		  '++JRC
		  If Not m_Reordering Then
		    m_Reordering = True
		    ReorderSetItemList(lst_set_items.ListIndex, newPosition)
		    m_Reordering = False
		  End If
		  Return True 'We'll handle the reorder manually, workaround for bug #1827986
		  '--
		End Function
	#tag EndEvent
	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  #Pragma Unused drag
		  #Pragma Unused row
		  Return Not m_Reordering
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Dim i As Integer
		  If Asc(Key) = 27 Then 'Escape
		    KeyedSearch = "" 'Reset search string
		    Return True
		  End If
		  
		  // If a modifier key is pressed, let RealBasic handle it so menus, etc. will work properly
		  If Keyboard.CommandKey Or Keyboard.ControlKey Or Keyboard.OptionKey Then Return False
		  
		  Select Case Asc(Key)
		  Case 0 to 31, _ ' all kind of control characters
		    ASC_KEY_LEFT, _
		    ASC_KEY_RIGHT, _
		    ASC_KEY_UP, _
		    ASC_KEY_DOWN, _
		    ASC_KEY_PGDN, _
		    ASC_KEY_PGUP, _
		    ASC_KEY_HOME, _
		    ASC_KEY_END, _
		    ASC_KEY_RETURN, _
		    ASC_KEY_ENTER, _
		    ASC_KEY_ESCAPE, _
		    ASC_KEY_BACKSPACE, _
		    ASC_KEY_TAB, _
		    ASC_KEY_INSERT, _
		    ASC_KEY_DEL, _
		    ASC_KEY_F1 to ASC_KEY_F12
		    Return False
		  End Select
		  
		  Dim searchTxt As String = KeyedSearch + Key
		  tmr_lookup.Reset
		  For i = 0 To Me.ListCount - 1
		    If Me.List(i).BeginsWith(searchTxt,ComparisonOptions.CaseInsensitive,App.LocaleForSearch) Then
		      Me.ListIndex = i
		      KeyedSearch = searchTxt
		      Return True
		    End If
		  Next i
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  '++JRC
		  SetHelp "sets_mode/items"
		  '--
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  If Not App.SlideStyleColorEnabled() Then Return False
		  
		  If row < 0 Or row >= me.listCount() Then Return False
		  
		  If row = me.SelectedRowIndex Then Return False
		  
		  Dim BackColor As Color
		  
		  Select Case me.CellTag(row,0)
		  Case "song"
		    BackColor = App.SlideStyleColor("verse")
		  Case "custom"
		    BackColor = App.SlideStyleColor("custom")
		  Case "scripture"
		    BackColor = App.SlideStyleColor("scripture")
		  Case "style"
		    BackColor = App.SlideStyleColor("style")
		  Case "image"
		    BackColor = App.SlideStyleColor("image")
		  Case "external"
		    BackColor = App.SlideStyleColor("external")
		  Case Else
		    Return False
		  End Select
		  
		  If BackColor = Color.White Then
		    BackColor = Color.FillColor
		  End If
		  
		  If BackColor.Value < 0.5 Then
		    g.ForeColor = Color.White
		  Else
		    g.ForeColor = Color.Black
		  End If
		  
		  g.DrawString(Me.Cell(row, column), x, y)
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pop_songs_song_folders
	#tag Event
		Sub Change()
		  If Status_InSongLoading Then
		    Return
		  End If
		  
		  sch_songs_songs.Value = ""
		  SongListIsFiltered = False
		  
		  Dim f As FolderItem
		  f = FileUtils.RelativePathToFolderItem(App.DocsFolder.Child(App.STR_SONGS), Me.Text)
		  
		  If f = Nil Or Not f.Exists Then
		    If Me.Text = Songs.GetFilterAll() Or _
		      Me.Text = Songs.GetFilterMain() Then
		      // Check if we have a songs folder if not try to create one
		      If App.CheckDocumentFolders(App.SONGS_FOLDER) = App.NO_FOLDER Then
		        If App.DocsFolder <> Nil Then
		          InputBox.Message App.T.Translate("errors/create_songs_folder", App.DocsFolder.Child(App.STR_SONGS).NativePath)
		        Else
		          MsgBox App.T.Translate("errors/no_docs_folder", "")
		        End If
		        
		        Me.ListIndex = -1
		        Globals.OldFolderSel = -1
		      End If
		      
		    Else
		      If App.DocsFolder <> Nil Then
		        If InputBox.AskYN(App.T.Translate("questions/no_folder/@caption", App.DocsFolder.Child(App.STR_SONGS).NativePath + "\" + ReplaceAll(Me.Text, "/", "\"))) Then
		          If Not FileUtils.CreateFolderTree(App.DocsFolder.Child(App.STR_SONGS), Me.Text) Then
		            Me.ListIndex = -1
		            Globals.OldFolderSel = -1
		          End If
		        Else
		          Me.ListIndex = -1
		          Globals.OldFolderSel = -1
		        End If
		      Else
		        MsgBox App.T.Translate("errors/no_docs_folder", "")
		      End If
		      
		    End If
		  End If
		  
		  If Globals.OldFolderSel = Me.ListIndex Then
		    Return
		  End If
		  
		  Globals.OldFolderSel = Me.ListIndex
		  
		  // Ask if user wants to save
		  If Not ActionSongAskSave Then Return  // User Canceled
		  
		  App.MouseCursor = System.Cursors.Wait
		  Call Songs.GetFiles(Me.Text, lst_songs_songs)
		  edt_songs_curr_folder.Text = ""
		  Globals.CurrentSongFolder = Me.Text
		  App.MainPreferences.SetValue(prefs.kCurrentSongFolder, Me.Text)
		  App.MouseCursor = Nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/song_folders"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_revert
	#tag Event
		Sub Action()
		  ActionSongRevert True
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/selected_song/revert"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon undo_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_present
	#tag Event
		Sub Action()
		  If Me.MenuItem = App.T.Translate("songs_mode/selected_song/present/single_screen/@caption") Then
		    ActionSongPresent PresentWindow.MODE_SINGLE_SCREEN
		  ElseIf Me.MenuItem = App.T.Translate("songs_mode/selected_song/present/preview_dual_screen/@caption") Then
		    ActionSongPresent PresentWindow.MODE_PREVIEW
		  ElseIf Me.MenuItem = App.T.Translate("songs_mode/selected_song/present/dual_screen/@caption") Then
		    If OSScreenCount() > 1 Then
		      ActionSongPresent PresentWindow.MODE_DUAL_SCREEN
		    Else
		      InputBox.Message App.T.Translate("errors/no_multi_screen")
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub ConstructPopupMenu()
		  Me.DeletePopup
		  Me.AddPopupRow App.T.Translate("songs_mode/selected_song/present/single_screen/@caption")
		  
		  if OSScreenCount() > 1 Then
		    Me.AddPopupRow App.T.Translate("songs_mode/selected_song/present/dual_screen/@caption")
		  End If
		  
		  Me.AddPopupSeparator
		  Me.AddPopupRow App.T.Translate("songs_mode/selected_song/present/preview_dual_screen/@caption")
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/selected_song/present"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon background_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_save
	#tag Event
		Sub Action()
		  ActionSongSave
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/selected_song/save"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon filesave_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_print
	#tag Event
		Sub Action()
		  ActionSongPrint
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/selected_song/print"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon fileprint_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_rename
	#tag Event
		Sub Action()
		  ActionSongRename
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/selected_song/rename"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon redo_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_export
	#tag Event
		Sub Action()
		  ActionSongExport
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/selected_song/export"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon filesaveas_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_copy
	#tag Event
		Sub Action()
		  ActionSongCopy
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/selected_song/copy"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon editcopy_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_move
	#tag Event
		Sub Action()
		  '++JRC Removed the second prompt
		  ActionSongMove
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/selected_song/move"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon fileopen_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_delete
	#tag Event
		Sub Action()
		  ActionSongRemove
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/selected_song/delete"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon editdelete_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_songs_print
	#tag Event
		Sub Action()
		  ActionSongPrintAll
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/all_songs/print"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon fileprint_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_songs_export
	#tag Event
		Sub Action()
		  ActionSongExportAll
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/all_songs/export"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon filesaveas_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_songs_find
	#tag Event
		Sub Action()
		  Find
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/all_songs/find"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon find_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_create
	#tag Event
		Sub Action()
		  ActionSongNew
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/new_song/create"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon filenew_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_songs_song_folders_add
	#tag Event
		Sub Action()
		  ActionSongFolderAdd
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/song_folders/new"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon add_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_songs_song_folders_delete
	#tag Event
		Sub Action()
		  ActionSongFolderDelete
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/song_folders/delete"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon remove_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_songs_songs
	#tag Event
		Sub Change()
		  ActionSongTryChange(False)
		  
		  ResetWindowCursor(Self)
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  If column <> 0 Then Return False // Protection for the future: don't use this except for the song name column
		  
		  result = SortSongCmp(Me.CellValueAt(row1, column), Me.CellTagAt(row1, column).StringValue, _
		  Me.CellValueAt(row2, column), Me.CellTagAt(row2, column).StringValue)
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  //++
		  // Allow certain actions on the selected song
		  //--
		  If Me.SelCount <> 1 Then // Only allow this if a single song is selected
		    Return True
		  End If
		  
		  Dim mi As MenuItem
		  
		  mi = New MenuItem
		  mi.Name = "rename"
		  mi.Text = App.T.Translate("songs_mode/selected_song/rename/@caption")
		  base.Append mi
		  
		  mi = New MenuItem
		  mi.Name = "move"
		  mi.Text = App.T.Translate("songs_mode/selected_song/move/@caption")
		  base.Append mi
		  
		  mi = New MenuItem
		  mi.Name = "delete"
		  mi.Text = App.T.Translate("songs_mode/selected_song/delete/@caption")
		  base.Append mi
		  
		  mi = New MenuItem
		  mi.Name = "export"
		  mi.Text = App.T.Translate("songs_mode/selected_song/export/@caption")
		  base.Append mi
		  
		  mi = New MenuItem
		  mi.Name = "copy"
		  mi.Text = App.T.Translate("songs_mode/selected_song/copy/@caption")
		  base.Append mi
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Dim ret As Boolean = False
		  Select Case hitItem.Name
		    
		  Case "rename"
		    ActionSongRename
		    ret = True
		    
		  Case "move"
		    ActionSongMove
		    ret = True
		    
		  Case "delete"
		    ActionSongRemove
		    ret = True
		    
		  Case "export"
		    ActionSongExport
		    ret = True
		    
		  Case "copy"
		    ActionSongCopy
		    ret = True
		    
		  End Select
		  
		  Return ret
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  ActionSongTryChange(True)
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  tmr_lookup.Enabled = True
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Dim i As Integer
		  Dim NewKey As String
		  
		  
		  // Check for a modifier key being pressed...don't do anything if Control or Alt or Command is pressed
		  App.DebugWriter.Write "MainWindow.lst_songs_songs.KeyDown: Enter", 7
		  If Keyboard.CommandKey Or Keyboard.ControlKey Or Keyboard.OptionKey Then Return False
		  
		  // F5 key causes problem with accent insensitive search (F5 : Key 204, 'Ì')
		  // (who invented this most stupid interface where it is impossible to distinguish entered characters from special keys?
		  // It makes little sense to check for all of those special keys using Keyboard.AsyncKeyDown (which is missing from auto 
		  // complete, why?), and, as far as I know the only way to distinguish special keys from character)
		  Select Case Asc(Key)
		  Case 0 to 31, _ ' all kind of control characters
		    ASC_KEY_LEFT, _
		    ASC_KEY_RIGHT, _
		    ASC_KEY_UP, _
		    ASC_KEY_DOWN, _
		    ASC_KEY_PGDN, _
		    ASC_KEY_PGUP, _
		    ASC_KEY_HOME, _
		    ASC_KEY_END, _
		    ASC_KEY_RETURN, _
		    ASC_KEY_ENTER, _
		    ASC_KEY_ESCAPE, _
		    ASC_KEY_BACKSPACE, _
		    ASC_KEY_TAB, _
		    ASC_KEY_INSERT, _
		    ASC_KEY_DEL, _
		    ASC_KEY_F1 to ASC_KEY_F12
		    Return False
		  End Select
		  
		  App.DebugWriter.Write "MainWindow.lst_songs_songs.KeyDown: key = '" + key + "'", 7
		  NewKey = KeyedSearch + Key
		  App.DebugWriter.Write "MainWindow.lst_songs_songs.KeyDown: NewKey = " + NewKey, 7
		  
		  tmr_lookup.Reset
		  
		  For i = 0 To Me.ListCount - 1
		    If Me.List(i).BeginsWith(NewKey,ComparisonOptions.CaseInsensitive,App.LocaleForSearch) Then
		      Me.ListIndex = i
		      App.DebugWriter.Write "MainWindow.lst_songs_songs.KeyDown: Found match index, value: " + str(i) + " " + Me.List(i), 7
		      KeyedSearch = NewKey
		      Return True
		    End If
		  Next i
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  tmr_lookup.Enabled = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/songs"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Dim overRow As Integer
		  
		  overRow = Me.RowFromXY(X, Y)
		  
		  If overRow >= 0 And overRow <= Me.ListCount - 1 Then
		    Me.HelpTag = StringUtils.RTrim(Me.CellTag(overRow, 0), "/")
		  Else
		    Me.HelpTag = ""
		  End If
		  
		  Catch
		    Me.HelpTag = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_songs_curr_folder
	#tag Event
		Sub MouseEnter()
		  SetHelp "songs_mode/curr_folder"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sch_songs_songs
	#tag Event
		Sub Pressed()
		  DoSongSearch(Me.Value)
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChanged()
		  Select Case Me.Value.Len
		  Case 0
		    ClearSongSearch
		  Case Is >= 2
		    DoSongSearch(Me.Value, True)
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pge_contents
	#tag Event
		Sub Change()
		  If Me.Value = 6 And LastSongPane <> 6 Then // Song Backgrounds Editor
		    RefreshSongBackgroundsList
		  End If
		  If Me.value = 1 Then // Song Advanced Editor
		    FixLinuxLayout
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_style_change
	#tag Event
		Sub Action()
		  Dim slide_group As XmlNode
		  Dim styleNode As XmlNode
		  
		  If Status_InSetEditable Then
		    slide_group = SetML.GetSetItem(CurrentSet, lst_set_items.ListIndex+1)
		    SmartML.SetValue slide_group, "@action", "new"
		    SmartML.SetValue slide_group, "@name", App.T.Translate("sets_mode/items/style")
		    lst_set_items.List(lst_set_items.ListIndex) = setML.GetSlideGroupCaption(slide_group)
		    styleNode = SmartML.GetNode(slide_group, "style", True)
		    SongML.CloneStyle SmartML.GetNode(App.MyPresentSettings.DocumentElement, "default_style"), styleNode
		    can_style_style.SetStyleNode styleNode
		    Status_SetChanged = True
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "style_change/change"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_style_revert
	#tag Event
		Sub Action()
		  Dim slide_group As XmlNode
		  
		  If Status_InSetEditable Then
		    slide_group = SetML.GetSetItem(CurrentSet, lst_set_items.ListIndex+1)
		    SmartML.SetValue slide_group, "@action", "revert"
		    SmartML.SetValue slide_group, "@name", App.T.Translate("sets_mode/items/revert")
		    lst_set_items.List(lst_set_items.ListIndex) = SetML.GetSlideGroupCaption(slide_group)
		    SmartML.RemoveChildren slide_group
		    
		    can_style_style.ClearStyleNode
		    Status_InSetChanged = True
		    Status_SetChanged = True
		    EnableMenuItems
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "style_change/revert"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_style_style
	#tag Event
		Sub Action()
		  Status_SetChanged = True
		  Status_InSetChanged = True
		  EnableMenuItems
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "style_change/style"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_song_accidentals
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/transpose/using"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_song_transpose
	#tag Event
		Sub Change()
		  If Status_InSongLoading Or Not Status_SongOpen Then Return
		  
		  SmartML.SetValue CurrentSong.DocumentElement, "lyrics", edf_song_lyrics.Text.FormatUnixEndOfLine
		  
		  If MainWindow.pop_song_accidentals.ListIndex = 0 Then
		    SongML.Transpose CurrentSong, Val(Me.Text), True
		  Else
		    SongML.Transpose CurrentSong, Val(Me.Text), False
		  End If
		  edf_song_lyrics.Text = SmartML.GetValue(CurrentSong.DocumentElement, "lyrics").FormatLocalEndOfLine
		  Me.ListIndex = 6
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/transpose"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_song_author
	#tag Event
		Sub GotFocus()
		  FindFocus = 2
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/author"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edf_song_lyrics
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  If Me.Enabled Then
		    Dim State As Boolean
		    Dim m as MenuItem
		    Dim lines() As String
		    Dim caption As String
		    Dim txFound As Boolean
		    
		    State = GetSelectedLines(edf_song_lyrics, lines)
		    
		    caption = App.T.Translate("general_song_editor/interleave/@caption", txFound)
		    If Not txFound Then caption = "&Interleave lines"
		    m = New MenuItem(caption, ACTION_INTERLEAVE)
		    m.Enabled = State
		    base.Append(m)
		    
		    Return True
		  Else
		    Return False
		  End If
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If hitItem.Tag = ACTION_INTERLEAVE Then
		    Dim lines() As String
		    If GetSelectedLines(Me, lines, True) Then
		      If ActionSongInterleave(lines) Then
		        Me.SelText = Join(lines, SmartML.Newline.Left(1))
		      End If
		    End If
		    Return True
		  End If
		  
		  Return False
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  FindFocus = 6
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/lyrics"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		  
		  // we need recoloring if
		  // - a line within a bilingual section has been added or removed
		  // - a section header has been toggled regarding bilingual
		  //
		  // we don't really determine this, so we update if after text change
		  // - cursor is at start or end of a line
		  // - cursor is in section header line
		  // also we currently update the whole file, not the section only
		  
		  Dim CarretPos As Integer = Me.SelStart
		  Dim s As String
		  s = Me.Text.Mid(CarretPos, 2) // one character each to the left and right of the carret
		  If s.Len < 2 Or s.InStr(SmartML.Newline.Left(1)) <> 0 Then
		    Me.ColorizeBilingual
		  ElseIf Me.Text.Mid(Me.CharPosAtLineNum(Me.LineNumAtCharPos(CarretPos + 1)), 1) = "[" Then
		    // editing a section caption
		    Me.ColorizeBilingual
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_ins_section
	#tag Event
		Sub Action()
		  Dim s As String
		  If edf_song_lyrics.Enabled Then
		    s = InputBox.Input(App.T.Translate("general_song_editor/ins_section/section_name/@caption") + ":", "V1")
		    If Len(s) > 0 Then
		      If edf_song_lyrics.SelStart > 0 And Asc(Mid(edf_song_lyrics.Text, edf_song_lyrics.SelStart, 1)) <> 10 And Asc(Mid(edf_song_lyrics.Text, edf_song_lyrics.SelStart, 1)) <> 13 Then edf_song_lyrics.SelText = SmartML.Newline
		      edf_song_lyrics.SelText = "[" + s + "]" + SmartML.Newline
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/ins_section"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_detailed_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_ins_lyrics
	#tag Event
		Sub Action()
		  Dim s, t As String
		  Dim i As Integer
		  If edf_song_lyrics.Enabled Then
		    s = InputBox.Input(App.T.Translate("general_song_editor/ins_lyrics/number_of_lines/@caption") + ":", "1")
		    If Len(s) > 0 And Val(s) > 0 Then
		      If edf_song_lyrics.SelStart > 0 And Asc(Mid(edf_song_lyrics.Text, edf_song_lyrics.SelStart, 1)) <> 10 And Asc(Mid(edf_song_lyrics.Text, edf_song_lyrics.SelStart, 1)) <> 13 Then t = SmartML.Newline
		      For i = 1 To Val(s)
		        t = t + "." + SmartML.Newline + " " + SmartML.Newline
		      Next i
		      edf_song_lyrics.SelText = t
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/ins_lyrics"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_text_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_ins_multi_verse
	#tag Event
		Sub Action()
		  Dim s, t, u As String
		  Dim i, j As Integer
		  If edf_song_lyrics.Enabled Then
		    s = InputBox.Input(App.T.Translate("general_song_editor/ins_multi_verse/number_of_verses/@caption") + ":", "4")
		    If Len(s) > 0 And Val(s) > 0 Then
		      t = InputBox.Input(App.T.Translate("general_song_editor/ins_multi_verse/number_of_lines/@caption") + ":", "4")
		      If Len(t) > 0 And Val(t) > 0 Then
		        If edf_song_lyrics.SelStart > 0 And Asc(Mid(edf_song_lyrics.Text, edf_song_lyrics.SelStart, 1)) <> 10 And Asc(Mid(edf_song_lyrics.Text, edf_song_lyrics.SelStart, 1)) <> 13 Then u = SmartML.Newline
		        u = u + "[V]" + SmartML.Newline
		        For j = 1 To Val(t)
		          u = u + "." + SmartML.Newline
		          For i = 1 To Val(s)
		            u = u + Str(i) + SmartML.Newline
		          Next i
		        Next j
		        edf_song_lyrics.SelText = u
		      End If
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/ins_multi_verse"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_choose_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_show_general_editor
	#tag Event
		Sub Action()
		  pge_contents.Value = 0
		  LastSongPane = 0
		  Me.Refresh True ' False
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_text2_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_show_advanced_editor
	#tag Event
		Sub Action()
		  pge_contents.Value = 1
		  LastSongPane = 1
		  Me.Refresh True ' False
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_detailed2_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_song_ccli
	#tag Event
		Sub GotFocus()
		  FindFocus = 4
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/ccli"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_song_title
	#tag Event
		Sub GotFocus()
		  FindFocus = 1
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/title"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_add_link
	#tag Event
		Sub Action()
		  ActionSongAddLinked
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/add_link"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon add_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_remove_link
	#tag Event
		Sub Action()
		  ActionSongRemoveLinked
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/remove_link"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon remove_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_song_linked
	#tag Event
		Sub Change()
		  btn_song_remove_link.Enabled = (Me.ListIndex > -1) And (Me.ListIndex < Me.ListCount - 1)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  If Me.ListIndex() > -1 Then
		    
		    If  Status_SongChanged = True Then
		      // Ask if user wants to save
		      If Not ActionSongAskSave Then
		        Return
		      End if
		    End if
		    
		    Dim path As String = Me.Cell(Me.ListIndex(), 0)
		    Dim f As FolderItem = Songs.GetFile(path)
		    If f = Nil Then
		      InputBox.Message(App.T.Translate("folderdb_errors/error[@code='" + Str(Songs.ErrorCode) + "']", path))
		      Return
		    End If
		    
		    Call LoadSong(f, True)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/linked"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_song_hymn_number
	#tag Event
		Sub GotFocus()
		  FindFocus = 17
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/hymn_number"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_ins_page
	#tag Event
		Sub Action()
		  Dim s As String
		  If edf_song_lyrics.Enabled Then
		    If edf_song_lyrics.SelStart > 0 And Asc(Mid(edf_song_lyrics.Text, edf_song_lyrics.SelStart, 1)) <> 10 And Asc(Mid(edf_song_lyrics.Text, edf_song_lyrics.SelStart, 1)) <> 13 Then s = SmartML.Newline
		    s = s + "-!!" + SmartML.Newline
		    edf_song_lyrics.SelText = s
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/ins_page"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_newpage_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_ins_column
	#tag Event
		Sub Action()
		  Dim s As String
		  If edf_song_lyrics.Enabled Then
		    If edf_song_lyrics.SelStart > 0 And Asc(Mid(edf_song_lyrics.Text, edf_song_lyrics.SelStart, 1)) <> 10 And Asc(Mid(edf_song_lyrics.Text, edf_song_lyrics.SelStart, 1)) <> 13 Then s = SmartML.Newline
		    s = s + "---" + SmartML.Newline
		    edf_song_lyrics.SelText = s
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/ins_column"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_left_right_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_ins_comment
	#tag Event
		Sub Action()
		  Dim s, t As String
		  If edf_song_lyrics.Enabled Then
		    s = InputBox.Input(App.T.Translate("general_song_editor/ins_comment/@caption") + ":", "")
		    If Len(s) > 0 Then
		      If edf_song_lyrics.SelStart > 0 And Asc(Mid(edf_song_lyrics.Text, edf_song_lyrics.SelStart, 1)) <> 10 And Asc(Mid(edf_song_lyrics.Text, edf_song_lyrics.SelStart, 1)) <> 13 Then t = SmartML.Newline
		      t = t + ";" + s + SmartML.Newline
		      edf_song_lyrics.SelText = t
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/ins_comment"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_bottom_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_song_copyright
	#tag Event
		Sub GotFocus()
		  FindFocus = 3
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/copyright"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_show_backgrounds_editor
	#tag Event
		Sub Action()
		  pge_contents.Value = 6
		  LastSongPane = 6
		  Me.Refresh True ' False
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "backgrounds_song_editor"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon background_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_song_presentation
	#tag Event
		Sub GotFocus()
		  FindFocus = 5
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor/presentation"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  // fix for non-working Mask ">CCCCCCC"
		  Dim selStart As Integer
		  selStart = Me.SelStart
		  Me.Text = Uppercase(Me.Text)
		  Me.SelStart = selStart
		  
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Mask = "" // fix for non-working Mask ">CCCCCCC": this accepted control characters into the Text
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events chk_slide_print
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/print"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_slide_auto_advance
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/auto_advance"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events chk_slide_loop
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/loop"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_slide_style
	#tag Event
		Sub Action()
		  Dim xnode, xgroup, songStyle As XmlNode
		  Dim songDoc as XmlDocument
		  Dim dummy As String
		  
		  If Status_InSetEditable Then
		    xgroup = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True).Child(lst_set_items.ListIndex)
		    If Me.Value Then
		      can_slide_style.PreviewSlide = SmartML.GetNode(xgroup, "slides/slide")
		      
		      xnode = SmartML.GetNode(xgroup, "style", True)
		      If Lowercase(SmartML.GetValue(xgroup, "@type")) = "scripture" Then
		        SongML.CloneStyle SmartML.GetNode(App.MyPresentSettings.DocumentElement, "scripture_style"), xnode
		      ElseIf Lowercase(SmartML.GetValue(xgroup, "@type")) = "song" Then
		        songStyle = Nil
		        songDoc = SetML.GetSong(xgroup, Songs, dummy)
		        If songDoc <> Nil then
		          songStyle = SmartML.GetNode(songDoc.DocumentElement, "style", False)
		        End If
		        
		        If songStyle <> Nil Then
		          SongML.CloneStyle songStyle, xnode
		        Else
		          SongML.CloneStyle SmartML.GetNode(App.MyPresentSettings.DocumentElement, "default_style"), xnode
		        End If
		      Else
		        SongML.CloneStyle SmartML.GetNode(App.MyPresentSettings.DocumentElement, "default_style"), xnode
		      End If
		      
		      can_slide_style.SetStyleNode xnode
		      can_slide_style.ClearPreviewSlide
		    Else
		      xnode = SmartML.GetNode(xgroup, "style", False)
		      If xnode <> Nil Then SmartML.RemoveSelf xnode
		      can_slide_style.ClearStyleNode
		      can_slide_style.ClearPreviewSlide
		    End If
		    
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  '++JRC
		  SetHelp "slide_editor/style"
		  '--
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_slide_transition
	#tag Event
		Sub Change()
		  If Status_InSetEditable And Not Status_InSetLoading Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/transition"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_slide_origorder
	#tag Event
		Sub MouseEnter()
		  '++JRC
		  SetHelp "slide_editor/origorder"
		  '--
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_slide_order
	#tag Event
		Sub MouseEnter()
		  '++JRC
		  SetHelp "slide_editor/presentation"
		  '--
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  // fix for non-working Mask ">CCCCCCC"
		  Dim selStart As Integer
		  selStart = Me.SelStart
		  Me.Text = Uppercase(Me.Text)
		  Me.SelStart = selStart
		  
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Mask = "" // fix for non-working Mask ">CCCCCCC": this accepted control characters into the Text
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_slide_subtitle
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/subtitle"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_slide_title
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/title"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_slide_name
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/name"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edf_slide_slides
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/slides"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_slide_folder
	#tag Event
		Sub MouseEnter()
		  '++JRC
		  SetHelp "slide_editor/folder"
		  '--
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_slide_ins_slide
	#tag Event
		Sub Action()
		  Dim s As String
		  If edf_slide_slides.Enabled Then
		    If edf_slide_slides.SelStart > 0 And Asc(Mid(edf_slide_slides.Text, edf_slide_slides.SelStart, 1)) <> 10 And Asc(Mid(edf_slide_slides.Text, edf_slide_slides.SelStart, 1)) <> 13 Then s = SmartML.Newline
		    s = s + "---" + SmartML.Newline
		    edf_slide_slides.SelText = s
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/ins_slide"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_bottom_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_slide_notes
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/notes"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events can_slide_style
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/style"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_image_style
	#tag Event
		Sub Action()
		  Dim xnode, xgroup As XmlNode
		  Dim dummySlide As Boolean
		  
		  If Status_InSetEditable Then
		    xgroup = SmartML.GetNode(CurrentSet.DocumentElement, "slide_groups", True).Child(lst_set_items.ListIndex)
		    If Me.Value Then
		      // there might be no image added yet, which means we do have a slides element, but no slide element. Add one temporarily
		      If SmartML.GetNode(xgroup, "slides/slide") Is Nil Then
		        SmartML.SetValue(xgroup, "slides/slide","")
		        dummySlide = True
		      End If
		      can_image_style.PreviewSlide = GetImageSlideStylePreviewSlide(SmartML.GetNode(xgroup, "slides/slide"))
		      If dummySlide Then
		        SmartML.RemoveNode(xgroup, "slides/slide")
		      End If
		      
		      xnode = SmartML.GetNode(xgroup, "style", True)
		      If Lowercase(SmartML.GetValue(xgroup, "@type")) = "scripture" Then
		        SongML.CloneStyle SmartML.GetNode(App.MyPresentSettings.DocumentElement, "scripture_style"), xnode
		        can_image_style.SetStyleNode xnode
		      Else
		        SongML.CloneStyle SmartML.GetNode(App.MyPresentSettings.DocumentElement, "default_style"), xnode
		        can_image_style.SetStyleNode xnode
		      End If
		    Else
		      xnode = SmartML.GetNode(xgroup, "style", False)
		      If xnode <> Nil Then SmartML.RemoveSelf xnode
		      can_image_style.ClearStyleNode
		      can_image_style.ClearPreviewSlide
		    End If
		    
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  '++JRC
		  SetHelp "slide_editor/style"
		  '--
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_image_transition
	#tag Event
		Sub Change()
		  If Status_InSetEditable And Not Status_InSetLoading Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/transition"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_image_fit_to_screen
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    If Me.Value Then
		      chk_image_fit_to_body.Value = False
		    End If
		    If Not Me.Value And Not chk_image_fit_to_body.Value Then
		      chk_image_keepaspect.Enabled = False
		    Else
		      chk_image_keepaspect.Enabled = True
		    End If
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "image_slide/fit_to_screen"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_image_fit_to_body
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    If Me.Value Then
		      chk_image_fit_to_screen.Value = False
		    End If
		    If Not Me.Value And Not chk_image_fit_to_screen.Value Then
		      chk_image_keepaspect.Enabled = False
		    Else
		      chk_image_keepaspect.Enabled = True
		    End If
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "image_slide/fit_to_body"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_image_store_as_link
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "image_slide/store_as_link"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_image_keepaspect
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "image_slide/keepaspect"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_image_print
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/print"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_image_loop
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/loop"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_image_auto_advance
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/auto_advance"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events chk_image_descriptions
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "image_slide/descriptions"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_image_title
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/title"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events can_image_style
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  '++JRC
		  SetHelp "slide_editor/style"
		  '--
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_image_subtitle
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/subtitle"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_image_name
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/name"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_image_notes
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/notes"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_image_ins_image
	#tag Event
		Sub Action()
		  Dim f As FolderItem
		  Dim img As StyleImage
		  
		  #if TargetWin32
		    Dim row As Integer
		    Dim name As String
		    If App.LastImageFolder <> Nil Then
		      f = App.LastImageFolder
		    Else
		      f = SpecialFolder.Pictures
		    End If
		    Dim dlg As OpenDialog
		    dlg = New OpenDialog
		    dlg.InitialDirectory = f
		    dlg.MultiSelect = True
		    dlg.Filter = FileTypes.ImageFiles + ImageFileTypes.All + FileTypes.AllFiles
		    
		    f = dlg.ShowModal
		    
		    If f <> Nil Then
		      App.LastImageFolder = f.Parent
		      
		      row = lst_image_images.ListIndex
		      if row = lst_image_images.LastIndex Then row = -1
		      
		      For i As Integer = 0 To dlg.Count - 1
		        img = new StyleImage
		        f = dlg.Item(i)
		        If img.SetImageFromFile(f) Then
		          If row = -1 Then
		            lst_image_images.AddImage(img)
		          Else
		            row = row + 1
		            lst_image_images.InsertImage(row, img)
		          End If
		          name = f.Name
		          If( name.CountFields(".") > 0 ) Then
		            name = StringUtils.Chop(name, name.NthField(".", name.CountFields(".")).Len() + 1)
		          End If
		          lst_image_images.Cell(lst_image_images.LastIndex(), 1) = name
		          
		          Status_InSetChanged = True
		        End If
		      Next
		      
		      EnableMenuItems
		    End If
		  #else
		    f = SelectImageFile
		    If f <> Nil Then
		      img = new StyleImage
		      If img.SetImageFromFile( f ) Then
		        lst_image_images.AddImage( img )
		        lst_image_images.Cell( lst_image_images.LastIndex(), 1 ) = img.GetImageFilename()
		        
		        Status_InSetChanged = True
		        EnableMenuItems
		      End If
		    End If
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "image_slide/ins_image"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon add_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_image_del_image
	#tag Event
		Sub Action()
		  ActionInSetImageRemove
		  
		  EnableMenuItems
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "image_slide/del_image"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon remove_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_image_move_down
	#tag Event
		Sub Action()
		  // for a non-consecutive selection, let all non-selected rows up to one below the last selected one bubble up before all selected ones
		  Dim maxIdx As Integer = -1 'highest idx of an unselected row that needs to move
		  Dim idx As Integer
		  Dim selectedCount As Integer
		  Dim ok As Boolean
		  
		  idx = lst_image_images.ListIndex
		  selectedCount = lst_image_images.SelCount
		  While selectedCount > 1
		    idx = idx + 1
		    If lst_image_images.Selected(idx) Then
		      selectedCount = selectedCount - 1
		    Else
		      ok = lst_image_images.SwapRows(idx-1,idx)
		      lst_image_images.Selected(idx) = True
		      lst_image_images.Selected(idx-1) = False
		      maxIdx = idx-1
		    End If
		  Wend
		  If idx < lst_image_images.ListCount()-1 Then
		    ok = lst_image_images.SwapRows(idx,idx+1)
		    lst_image_images.Selected(idx+1) = True
		    lst_image_images.Selected(idx) = False
		    maxIdx = idx
		  End If
		  While maxIdx > lst_image_images.ListIndex
		    For idx = lst_image_images.ListIndex + 1 To maxIdx
		      If Not lst_image_images.Selected(idx) Then
		        ok = lst_image_images.SwapRows(idx-1,idx)
		        lst_image_images.Selected(idx) = True
		        lst_image_images.Selected(idx-1) = False
		      End If
		    Next
		    maxIdx = maxIdx-1
		  Wend
		  
		  If maxIdx >= 0 Then
		    
		    #if TargetWin32 then
		      Const LB_SETCARETINDEX = &H19E
		      
		      Declare Sub SendMessageW Lib "user32" (hwnd as Integer, msg as Integer, wParam as Integer, lParam as Boolean)
		      
		      // this message is not handled; additionally, the input focus should probably stay on the same item (by contents) as before
		      Dim focusedIndex As Integer
		      focusedIndex = lst_image_images.ListIndex
		      SendMessageW(Me.Handle, LB_SETCARETINDEX, focusedIndex, True)
		    #endif
		    
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "image_slide/move_down"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon down_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_image_move_up
	#tag Event
		Sub Action()
		  // move the first selected row one up if possible; then move all subsequent selected rows up as far as possible,
		  // pushing the non-selected rows to the end of a consecutive span of selected rows
		  Dim idx As Integer
		  Dim minIdx As Integer = -1 ' lowest index of unselected row that needs to move
		  Dim maxIdx As Integer ' highest index of selected row
		  Dim selectedCount As Integer
		  Dim ok As Boolean = False
		  Dim idxMove As Boolean
		  
		  idx = lst_image_images.ListIndex
		  selectedCount = lst_image_images.SelCount
		  minIdx = lst_image_images.LastIndex
		  If idx > 0 Then
		    minIdx = idx - 1
		  End If
		  While selectedCount > 0
		    If lst_image_images.Selected(idx) Then
		      selectedCount = selectedCount - 1
		      maxIdx = idx
		    ElseIf minIdx > idx Then
		      minIdx = idx
		    End If
		    idx = idx + 1
		  Wend
		  While minIdx < maxIdx
		    idx = minIdx
		    idxMove = True
		    While idx < maxIdx
		      If lst_image_images.Selected(idx + 1) Then
		        If idxMove Then
		          ok = lst_image_images.SwapRows(idx,idx+1)
		          lst_image_images.Selected(idx) = True
		          lst_image_images.Selected(idx+1) = False
		          If minIdx = idx Then minIdx = minIdx + 1
		        Else
		          idxMove = False
		        End If
		      Else
		        idxMove = True
		      End If
		      idx = idx + 1
		    Wend
		    If idxMove Then maxIdx = maxIdx - 1
		  Wend
		  
		  If ok Then
		    
		    #if TargetWin32 then
		      Const LB_SETCARETINDEX = &H19E
		      
		      Declare Sub SendMessageW Lib "user32" (hwnd as Integer, msg as Integer, wParam as Integer, lParam as Boolean)
		      
		      // this message is not handled; additionally, the input focus should probably stay on the same item (by contents) as before
		      Dim focusedIndex As Integer
		      focusedIndex = lst_image_images.ListIndex
		      SendMessageW(Me.Handle, LB_SETCARETINDEX, focusedIndex, True)
		    #endif
		    
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "image_slide/move_up"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon up_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_image_imp_image
	#tag Event
		Sub Action()
		  Dim dlg As New OpenDialog
		  Dim f As FolderItem
		  
		  If PresentationFactory.PowerPointAvailable() And PresentationFactory.OpenOfficeAvailable() Then
		    dlg.Filter = PresentationFileTypes.All
		  ElseIf PresentationFactory.PowerPointAvailable() Then
		    dlg.Filter = PresentationFileTypes.PPTFiles
		  ElseIf PresentationFactory.OpenOfficeAvailable() Then
		    dlg.Filter = PresentationFileTypes.ODPFiles + PresentationFileTypes.PPTFiles
		  Else
		    MsgBox(App.T.Translate("errors/presentations/nohost"))
		    Return
		  End If
		  
		  dlg.ActionButtonCaption = App.T.Translate("shared/select/@caption")
		  dlg.CancelButtonCaption = App.T.Translate("shared/cancel/@caption")
		  dlg.Title = App.T.Translate("questions/import_presentation/@caption")
		  dlg.PromptText = App.T.Translate("questions/import_presentation")
		  
		  f = dlg.ShowModal()
		  If Not IsNull(f) Then
		    Self.MouseCursor = System.Cursors.Wait
		    Dim oExtPres As iPresentation = PresentationFactory.GetOrCreate( f.NativePath, PresentationHost.Automatic, False )
		    If Not IsNull( oExtPres ) Then
		      
		      If oExtPres.CanPreview() Then
		        Dim img As StyleImage
		        Dim i, presentScreen, width, height As Integer
		        
		        presentScreen = SmartML.GetValueN(App.MyPresentSettings.DocumentElement, "monitors/@present") - 1
		        If presentScreen < 0 Or presentScreen + 1 > OSScreenCount() Then presentScreen = 0
		        width = OSScreen(presentScreen).Width
		        height = OSScreen(presentScreen).Height
		        
		        For i = 1 to oExtPres.SlideCount()
		          img = New StyleImage()
		          img.SetImage( oExtPres.PreviewSlide( i, width, height ) )
		          
		          lst_image_images.AddImage( img )
		          lst_image_images.Cell( lst_image_images.LastIndex(), 1 ) = oExtPres.SlideName( i )
		          
		          Status_InSetChanged = True
		        Next
		        
		        EnableMenuItems
		      Else
		        MsgBox(App.T.Translate("errors/presentations/unsupported_feature", oExtPres.HostName()))
		      End If
		    Else
		      MsgBox(App.T.Translate("errors/presentations/load_failed", f.NativePath ))
		    End If
		    Self.MouseCursor = Nil
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "image_slide/imp_image"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon powerpoint_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_image_images
	#tag Event
		Function CellKeyDown(row as Integer, column as Integer, key as String) As Boolean
		  #Pragma Unused row
		  #Pragma Unused column
		  #Pragma Unused key
		  Return Not Status_InSetEditable
		End Function
	#tag EndEvent
	#tag Event
		Sub CellTextChange(row as Integer, column as Integer)
		  #Pragma Unused row
		  #Pragma Unused column
		  Status_InSetChanged = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  If lst_image_images_multipleRowsSelected <> (Me.SelCount > 1) Then
		    lst_image_images_multipleRowsSelected = Not lst_image_images_multipleRowsSelected
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  Dim mnu As MenuItem
		  
		  If Me.SelCount = 1 Then
		    mnu = New MenuItem(App.T.Translate("image_slide/preview/@caption"), "preview")
		    base.Append(mnu)
		  End If
		  
		  If Me.SelCount <= 1 Then
		    mnu = New MenuItem(App.T.Translate("image_slide/ins_image/@caption"), "ins_image")
		    base.Append(mnu)
		    
		    mnu = New MenuItem(App.T.Translate("image_slide/imp_image/@caption"), "imp_image")
		    base.Append(mnu)
		  End If
		  
		  If Me.SelCount >= 1 Then
		    mnu = New MenuItem(App.T.Translate("image_slide/del_image/@caption"), "del_image")
		    base.Append(mnu)
		    
		    mnu = New MenuItem(App.T.Translate("image_slide/move_up/@caption"), "move_up")
		    base.Append(mnu)
		    
		    mnu = New MenuItem(App.T.Translate("image_slide/move_down/@caption"), "move_down")
		    base.Append(mnu)
		    
		    mnu = New MenuItem(App.T.Translate("main_menu/edit/selall/@caption"), "selall")
		    base.Append(mnu)
		  End If
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Dim img As StyleImage
		  Dim x As Integer
		  Dim y As Integer
		  Dim preview As ImagePreviewWindow
		  
		  Select Case hitItem.Tag
		  Case "ins_image"
		    btn_image_ins_image.PerformAction
		  Case "imp_image"
		    btn_image_imp_image.PerformAction
		  Case "del_image"
		    btn_image_del_image.PerformAction
		  Case "move_up"
		    btn_image_move_up.PerformAction
		  Case "move_down"
		    btn_image_move_down.PerformAction
		  Case "selall"
		    If Me.DoSelectAll Then
		    End If
		  Case "preview"
		    If Me.SelCount = 1 Then
		      For i As Integer = 0 To Me.ListCount - 1
		        If Me.Selected(i) Then
		          img = Me.GetImage(i)
		          Exit For
		        End If
		      Next
		    End If
		    If img = Nil Then Return False
		    x = Me.TrueWindow.Left + Me.MouseX
		    y = Me.TrueWindow.Top + Me.MouseY
		    preview = New ImagePreviewWindow
		    preview.ShowImageAt(img, x, y, Me.Cell(Me.ListIndex, 0))
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  #Pragma Unused action
		  Dim rejectdrop As Boolean
		  
		  rejectdrop = True
		  If Status_InSetEditable Then
		    If obj.PictureAvailable() Then
		      rejectdrop = False
		    ElseIf obj.FolderItemAvailable() Then
		      rejectdrop = ( Picture.Open(obj.FolderItem()) = Nil )
		    ElseIf obj.PrivateRawData("StIm")<>"" Then
		      rejectdrop = False
		    End If
		  End If
		  
		  Return rejectdrop
		  
		End Function
	#tag EndEvent
	#tag Event
		Function DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean
		  Status_InSetChanged = True
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub DropRowObject(obj As DragItem, action As Integer, row as Integer)
		  #Pragma Unused action
		  Dim image as StyleImage
		  Dim name As String
		  
		  If Status_InSetEditable Then
		    If obj.PictureAvailable() Then
		      image = new StyleImage()
		      image.SetImage( obj.Picture() )
		      If row = -1 Then
		        Me.AddImage( image )
		      Else
		        Me.InsertImage( row, image )
		      End If
		      
		      Status_InSetChanged = True
		    ElseIf obj.FolderItemAvailable() Then
		      Do
		        image = new StyleImage()
		        If image.SetImageFromFile( obj.FolderItem() ) Then
		          If row = -1 Then
		            Me.AddImage( image )
		          Else
		            Me.InsertImage( row, image )
		          End If
		          name = obj.FolderItem().Name
		          If( name.CountFields(".") > 0 ) Then
		            name = name.Left( name.Len() - name.NthField(".", name.CountFields(".")).Len() - 1 )
		          End If
		          Me.Cell( Me.LastIndex, 1 ) = name
		          
		          Status_InSetChanged = True
		        End If
		      Loop Until Not obj.NextItem()
		    End If
		    
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  If IsContextualClick And Me.Selected(Me.RowFromXY(x, y)) Then
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "image_slide/images"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.EnableDragReorder = True
		  
		  Me.AcceptPictureDrop
		  Me.AcceptFileDrop(ImageFileTypes.All)
		  Me.AcceptFileDrop "all"
		  
		  Me.ColumnType(1) = ListBox.TypeEditable
		  Me.Heading(-1) = ""
		  
		  lst_image_images_multipleRowsSelected = Me.SelCount > 1
		  
		  Me.ImageAspect = PreviewScreenRatio
		  If Me.ImageMargin = 0 Then
		    Me.ImageMargin = 2
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function SortColumn(column As Integer) As Boolean
		  Me.ColumnSortDirection( column ) = ListBox.SortNone
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_show_general_editor_2
	#tag Event
		Sub Action()
		  pge_contents.Value = 0
		  LastSongPane = 0
		  Me.Refresh True ' False
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_text2_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_song_time_sig
	#tag Event
		Sub Change()
		  If Status_SongOpen And Not Status_InSetLoading Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  FindFocus = 9
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/time_sig"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_song_capo_print
	#tag Event
		Sub Action()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/capo_print"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_song_style
	#tag Event
		Sub Action()
		  Dim xnode As XmlNode
		  
		  If Status_SongOpen Then
		    If Me.Value Then
		      xnode = SmartML.GetNode(CurrentSong.DocumentElement, "style", True)
		      SongML.CloneStyle SmartML.GetNode(App.MyPresentSettings.DocumentElement, "default_style"), xnode
		      can_song_style.SetStyleNode xnode
		    Else
		      xnode = SmartML.GetNode(CurrentSong.DocumentElement, "style", False)
		      If xnode <> Nil Then SmartML.RemoveSelf xnode
		      can_song_style.ClearStyleNode
		    End If
		    
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/style"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_show_advanced_editor_2
	#tag Event
		Sub Action()
		  pge_contents.Value = 1
		  LastSongPane = 1
		  Me.Refresh True ' False
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_detailed2_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_song_tempo
	#tag Event
		Sub Change()
		  If Status_SongOpen And Not Status_InSongLoading Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  FindFocus = 10
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/tempo"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events can_song_style
	#tag Event
		Sub Action()
		  Status_SongChanged = True
		  EnableMenuItems
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/style"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_song_key
	#tag Event
		Sub GotFocus()
		  FindFocus = 11
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/key"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_song_aka
	#tag Event
		Sub GotFocus()
		  FindFocus = 12
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/aka"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pop_song_capo
	#tag Event
		Sub Change()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  FindFocus = 8
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/capo"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_song_key_line
	#tag Event
		Sub GotFocus()
		  FindFocus = 13
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/key_line"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_song_user1
	#tag Event
		Sub GotFocus()
		  FindFocus = 14
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/user1"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_song_user2
	#tag Event
		Sub GotFocus()
		  FindFocus = 15
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/user2"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_song_user3
	#tag Event
		Sub GotFocus()
		  FindFocus = 16
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/user3"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pop_song_capo_accidentals
	#tag Event
		Sub Change()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/capo/using"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_song_themes
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  #Pragma Unused row
		  #Pragma Unused column
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  FindFocus = 7
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor/themes"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_show_backgrounds_editor_2
	#tag Event
		Sub Action()
		  pge_contents.Value = 6
		  LastSongPane = 6
		  Me.Refresh True ' False
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "backgrounds_song_editor"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon background_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_del_background
	#tag Event
		Sub Action()
		  ActionSongDeleteBackgroundImage()
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "backgrounds_song_editor/del_background"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon remove_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_add_background
	#tag Event
		Sub Action()
		  ActionSongAddBackgroundImage()
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "backgrounds_song_editor/add_background"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon add_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_song_background_as_text
	#tag Event
		Sub Action()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "backgrounds_song_editor/background_as_text"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_song_store_as_link
	#tag Event
		Sub Action()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "backgrounds_song_editor/store_as_link"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_song_keepaspect
	#tag Event
		Sub Action()
		  If Status_SongOpen Then
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "backgrounds_song_editor/keepaspect"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_song_fit_to_body
	#tag Event
		Sub Action()
		  If Status_SongOpen Then
		    If Me.Value Then
		      chk_song_fit_to_screen.Value = False
		    End If
		    If Not Me.Value And Not chk_song_fit_to_screen.Value Then
		      chk_song_keepaspect.Enabled = False
		    Else
		      chk_song_keepaspect.Enabled = True
		    End If
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "backgrounds_song_editor/fit_to_body"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_song_fit_to_screen
	#tag Event
		Sub Action()
		  If Status_SongOpen Then
		    If Me.Value Then
		      chk_song_fit_to_body.Value = False
		    End If
		    If Not Me.Value And Not chk_song_fit_to_body.Value Then
		      chk_song_keepaspect.Enabled = False
		    Else
		      chk_song_keepaspect.Enabled = True
		    End If
		    Status_SongChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "backgrounds_song_editor/fit_to_screen"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_show_advanced_editor_3
	#tag Event
		Sub Action()
		  pge_contents.Value = 1
		  LastSongPane = 1
		  Me.Refresh True ' False
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "advanced_song_editor"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_detailed2_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_show_general_editor_3
	#tag Event
		Sub Action()
		  pge_contents.Value = 0
		  LastSongPane = 0
		  Me.Refresh True ' False
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "general_song_editor"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon view_text2_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_song_show_backgrounds_editor_3
	#tag Event
		Sub Action()
		  pge_contents.Value = 6
		  LastSongPane = 6
		  Me.Refresh True ' False
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "backgrounds_song_editor"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon background_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_song_backgrounds
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  If row < -1 Or row > Me.LastRowIndex Then Return False
		  
		  If column = Me.ImageColumn Then
		    App.DebugWriter.Write(CurrentMethodName + ": Row" + Str(row) + " ImageColumn with according to g: " + Str(g.Width), 7)
		  End If
		  
		  // Autoadjust width according to column widths
		  Dim boxWidth As Integer
		  boxWidth = Min(Me.TargetWidth, Me.Parent.Left + Me.Parent.Width - Me.Left - 10)
		  If boxWidth <> Me.Width Then
		    App.DebugWriter.Write(CurrentMethodName + " Width changes from " + Str(Me.Width) + " to " + Str(boxWidth), 7)
		    Me.Width = boxWidth
		    Me.Parent.Invalidate(True)
		  End If
		  
		  Dim result As Boolean = False
		  
		  If Me.CellTagAt(row, 1).BooleanValue Then
		    Dim bg As Color
		    Dim tintColor As Color = Color.Red
		    Dim tintPct As Double = 0.2
		    If Me.Selected(row) Then
		      bg = Color.HighlightColor
		    Else
		      bg = Color.FillColor
		    End If
		    bg = RGB( _
		    Round(bg.Red * (1-tintPct) + tintColor.Red * tintPct), _
		    Round(bg.Green * (1-tintPct) + tintColor.Green * tintPct), _
		    Round(bg.Blue * (1-tintPct) + tintColor.Blue * tintPct))
		    g.DrawingColor = bg
		    g.FillRect 0, 0, g.Width, g.Height
		    
		    result = True
		  End If
		  
		  Select Case column
		    
		  Case 0, 1
		    Return result
		    
		  Case Else
		    g.ForeColor = FillColor
		    g.ClearRect 0, 0, g.Width, g.Height
		    g.FillRect 0, 0, g.Width, g.Height
		    Return True
		    
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  Dim rowIndex As Integer = Me.SelectedRowIndex
		  Dim lastRow As Integer = Me.LastRowIndex
		  btn_song_add_background.Enabled = (rowIndex > -1 And rowIndex <= lastRow)
		  Dim rowCount As Integer = Me.SelectedRowCount
		  Dim hasImage As Boolean = False
		  While rowCount > 0 And Not hasImage And rowIndex <= lastRow
		    If Me.Selected(rowIndex) then
		      hasImage = Me.HasImage(rowIndex)
		      rowCount = rowCount - 1
		    End If
		    rowIndex = rowIndex + 1
		  Wend
		  btn_song_del_background.Enabled = hasImage
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  Dim mnu As MenuItem
		  Dim img As StyleImage
		  Dim status As Boolean = False
		  Dim selectedRowCnt, selectedImgCnt As Integer
		  Dim cnt As Integer = 0
		  Dim i As Integer
		  
		  Try
		    selectedRowCnt = Me.SelCount
		    
		    // preview the item on which the context menu got activated, regardless it's selection status
		    If (x = -1 And y = -1) Or (x = 0 And y = 0) Then  // not called using mouse - docs vs. what I actually get (Xojo 2022r1.1 on Windows 8.1)
		      i = Me.SelectedRowIndex
		    Else
		      i = Me.RowFromXY(x, y)
		    End If
		    If i >= 0 Then
		      mnu = New MenuItem(App.T.Translate("image_slide/preview/@caption"), "preview," + Str(x) + "," + Str(y))
		      img = Me.CellTagAt(i, 0)
		    End If
		    If i >= 0 Or selectedRowCnt > 0 Then
		      mnu.Enabled = Not (IsNull(Img) Or IsNull(Img.GetImage))
		      base.Append(mnu)
		      status = True
		    End If
		    
		    If selectedRowCnt > 0 Then
		      For i = Me.SelectedRowIndex To Me.LastRowIndex
		        If Me.Selected(i) Then
		          img = Me.CellTagAt(i, 0)
		          If Not (IsNull(Img) Or IsNull(Img.GetImage)) Then
		            selectedImgCnt = selectedImgCnt + 1
		            If selectedImgCnt > 1 Then Exit  // we currently only want to know if 0, 1 or more are selected
		          End If
		          cnt = cnt + 1
		          If cnt = selectedRowCnt Then Exit  // no more selected rows
		        End If
		      Next i
		      
		      mnu = New MenuItem(App.T.Translate("backgrounds_song_editor/add_background/@caption"), "add")
		      mnu.Enabled = selectedRowCnt > 0
		      base.Append(mnu)
		      
		      mnu = New MenuItem(App.T.Translate("backgrounds_song_editor/del_background/@caption"), "del")
		      mnu.Enabled = selectedImgCnt > 0
		      base.Append(mnu)
		      
		      status = True
		    End If
		    base.Append(mnu_edit_selall)
		  Catch
		  End Try
		  Return status
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Dim img As StyleImage
		  Dim x As Integer
		  Dim y As Integer
		  Dim preview As ImagePreviewWindow
		  Dim status As Boolean = False
		  
		  Try
		    Select Case NthField(hitItem.Tag, ",", 1)
		    Case "preview"
		      If NthField(hitItem.Tag, ",", 2) <> "" And NthField(hitItem.Tag, ",", 3) <> "" Then
		        x = Val(NthField(hitItem.Tag, ",", 2))
		        y = Val(NthField(hitItem.Tag, ",", 3))
		        If (x = -1 And y = -1) Or (x = 0 And y = 0) Then
		          img = Me.GetImage(Me.SelectedRowIndex)
		          x = Me.TrueWindow.Left + Me.Left + Me.ColumnAt(0).WidthActual + Me.ColumnAt(1).WidthActual \ 2
		          y = Me.TrueWindow.Top + Me.Top + Me.HeaderHeight + (Me.SelectedRowIndex - Me.ScrollPosition) * Me.RowHeight + Me.RowHeight \ 2
		        Else
		          img = Me.GetImage(Me.RowFromXY(x, y))
		          x = Me.TrueWindow.Left + Me.Left + x
		          y = Me.TrueWindow.Top + Me.Top + y
		        End If
		      Else
		        img = Me.GetImage(Me.SelectedRowIndex)
		        x = Me.TrueWindow.Left + Me.MouseX
		        y = Me.TrueWindow.Top + Me.MouseY
		      End If
		      If img = Nil Then Return False
		      
		      preview = New ImagePreviewWindow
		      preview.ShowImageAt(img, x, y, Me.Cell(Me.ListIndex, 0))
		      status = True
		    Case "add"
		      ActionSongAddBackgroundImage()
		      
		      status = True
		    Case "del"
		      ActionSongDeleteBackgroundImage()
		      
		      status = True
		    Case Else
		      status = False
		    End Select
		  End Try
		  Return status
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Dim img As StyleImage
		  Dim preview As ImagePreviewWindow
		  Dim x As Integer
		  Dim y As Integer
		  Try
		    If Me.SelCount = 1 Then
		      For i As Integer = 0 To Me.ListCount - 1
		        If Me.Selected(i) Then
		          img = Me.GetImage(i)
		          Exit For
		        End If
		      Next
		    End If
		    If img = Nil Then Return
		    If IsNull(img.GetImage) Then Return
		    x = Me.TrueWindow.Left + Me.MouseX
		    y = Me.TrueWindow.Top + Me.MouseY
		    preview = New ImagePreviewWindow
		    preview.ShowImageAt(img, x, y, Me.Cell(Me.ListIndex, 0))
		  End Try
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.ImageAspect(True) = PreviewScreenRatio
		  If Me.ImageMargin = 0 Then
		    Me.ImageMargin = 2
		  End If
		  Me.HeaderType(0) = Listbox.HeaderTypes.NotSortable
		  
		  // I had problems with alternating column width in the ImageColumn (last column)
		  // according to g.Widht in the CellBackgroundPaint event as soon as the vertical
		  // scroll bar got visible on Windows
		  // I now turned AllowAutoHideScrollbars off in the layout. Turning it on here again
		  // does not suffer the same penalty
		  Me.AutoHideScrollbars = True
		  
		  Dim boxWidth As Integer = Min(Me.TargetWidth, Me.Parent.Left + Me.Parent.Width - Me.Left - 10)
		  If Me.Width <> boxWidth Then
		    Me.Width = boxWidth
		  End If
		  Me.ColumnAlignment(0) = Listbox.AlignCenter
		End Sub
	#tag EndEvent
	#tag Event
		Function ImagePaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  If Me.CellTagAt(row, 0) IsA StyleImage Then
		    Dim img As StyleImage = Me.CellTagAt(row, 0)
		    Dim m As Integer = Max(Me.ImageMargin \ 2, 1)
		    If IsNull(img.GetImage) Then // invalid image
		      App.DebugWriter.Write(CurrentMethodName + " Drawing image not found frame", 7)
		      g.ClearRect m, m, g.Width - 2 * m, g.Height - 2 * m
		      g.PenSize = Max(Me.ColumnAt(column).WidthActual \ 100, 2)
		      
		      Dim Filename As String = Img.GetImageFilename
		      If Not Filename.IsEmpty Then
		        Dim w, h, y As Double
		        
		        // try to get useful wordwrap for a file name with path
		        Dim r As New RegEx
		        Dim ro As New RegExOptions
		        r.SearchPattern = "([/:\\])"
		        r.ReplacementPattern = "\1" + &u200b  // ZERO WIDTH SPACE
		        ro.ReplaceAllMatches = True
		        r.Options = ro
		        Filename = r.Replace(Filename)
		        r.SearchPattern = " "
		        r.ReplacementPattern =  &u00a0  // NO-BREAK SPACE
		        Filename = r.Replace(Filename)
		        
		        App.TranslationFonts(2).OntoGraphics(g)  // font for label
		        If g.FontSize > 4 Then g.FontSize = g.FontSize - 1  // mimic nte
		        g.DrawingColor = Color.TextColor
		        
		        // set width, get height
		        w = g.Width - 4 * m - 2 * g.PenSize
		        h = g.TextHeight(Filename, w)
		        
		        // get useful vertical position
		        If h > g.Height - 4 * m - 2 * g.PenSize Then
		          // align to bottom
		          y = g.Height - 2 * m - g.PenSize - h + g.FontAscent
		        Else
		          // center
		          y = (g.Height - h) / 2 + g.FontAscent
		        End If
		        
		        g.DrawText(Filename, 2 * m + g.PenSize, y, w)
		      End If
		      
		      g.ForeColor = Color.Red
		      g.fillRect m, m, g.PenSize, g.Height - 2 * m // left
		      g.fillRect m, m, g.Width - 2 * m, g.PenSize // top
		      g.fillRect g.Width - m - g.PenSize, m, g.PenSize, g.Height - 2 * m // right
		      g.fillRect m, g.Height - m - g.PenSize, g.Width - 2 * m, g.PenSize // bottom
		      g.DrawLine g.PenSize / 2.0 + m, g.PenSize / 2.0 + m, g.Width - 2 * m - g.PenSize / 2.0, g.Height - 2 * m - (g.PenSize / 2.0)
		      Return True
		    End If
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events chk_external_loop
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/loop"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_external_name
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/name"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_external_notes
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/notes"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_external_presentation
	#tag Event
		Sub Action()
		  btn_external_presentation.Stuck = Not btn_external_presentation.Stuck
		  btn_external_videolan.Stuck = False
		  btn_external_application.Stuck = False
		  
		  If btn_external_presentation.Stuck Then
		    If pge_externals.Value <> 1 Then
		      
		      'Detect all presentation hosts at once, including progress indicator
		      PresentationFactory.DetectAllHosts()
		      rad_external_host_powerpoint.Enabled = PresentationFactory.PowerPointAvailable()
		      rad_external_host_pptview.Enabled = PresentationFactory.PPTViewAvailable()
		      rad_external_host_impress.Enabled = PresentationFactory.OpenOfficeAvailable()
		      
		      pge_externals.Value = 1
		    End If
		  Else
		    If pge_externals.Value <> 0 Then
		      pge_externals.Value = 0
		    End If
		  End If
		  
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "external_slide/presentation"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon powerpoint_img
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_external_application
	#tag Event
		Sub Action()
		  btn_external_presentation.Stuck = False
		  btn_external_videolan.Stuck = False
		  btn_external_application.Stuck = Not btn_external_application.Stuck
		  
		  If btn_external_application.Stuck() Then
		    If pge_externals.Value <> 3 Then
		      pge_externals.Value = 3
		    End If
		  Else
		    If pge_externals.Value <> 0 Then
		      pge_externals.Value = 0
		    End If
		  End If
		  
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "external_slide/application"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon white_background_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_external_videolan
	#tag Event
		Sub Action()
		  btn_external_presentation.Stuck = False
		  btn_external_videolan.Stuck = Not btn_external_videolan.Stuck
		  btn_external_application.Stuck = False
		  
		  If btn_external_videolan.Stuck() Then
		    If pge_externals.Value <> 2 Then
		      pge_externals.Value = 2
		    End If
		  Else
		    If pge_externals.Value <> 0 Then
		      pge_externals.Value = 0
		    End If
		  End If
		  
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "external_slide/videolan"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon videolan_img
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_external_loop_presentation
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_external_presentation_file
	#tag Event
		Sub Action()
		  Dim dlg As New OpenDialog
		  Dim f As FolderItem
		  
		  If PresentationFactory.PowerPointAvailable() And PresentationFactory.OpenOfficeAvailable() Then
		    dlg.Filter = PresentationFileTypes.All
		  ElseIf PresentationFactory.PowerPointAvailable() Or PresentationFactory.PPTViewAvailable() Then
		    dlg.Filter = PresentationFileTypes.PPTFiles
		  ElseIf PresentationFactory.OpenOfficeAvailable() Then
		    dlg.Filter = PresentationFileTypes.ODPFiles + PresentationFileTypes.PPTFiles
		  Else
		    MsgBox(App.T.Translate("errors/presentations/nohost"))
		    Return
		  End If
		  
		  dlg.ActionButtonCaption = App.T.Translate("shared/select/@caption")
		  dlg.CancelButtonCaption = App.T.Translate("shared/cancel/@caption")
		  dlg.Title = App.T.Translate("external_slide/presentation_file/@caption")
		  dlg.PromptText = App.T.Translate("external_slide/presentation_file")
		  
		  f = dlg.ShowModal()
		  If Not IsNull(f) Then
		    edt_external_presentation_file.Text = f.NativePath()
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "external_slide/presentation_settings/presentation_file"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon fileopen_img
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_external_host_impress
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_external_host_pptview
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_external_host_powerpoint
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_external_presentation_file
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    chk_external_embed_presentation.Enabled = True
		    
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events chk_external_embed_presentation
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_external_application_filename
	#tag Event
		Sub Action()
		  Dim dlg As New OpenDialog
		  Dim f As FolderItem
		  
		  dlg.Filter = "*.*"
		  dlg.ActionButtonCaption = App.T.Translate("shared/select/@caption")
		  dlg.CancelButtonCaption = App.T.Translate("shared/cancel/@caption")
		  dlg.Title = App.T.Translate("external_slide/application_settings/application_filename/@caption")
		  dlg.PromptText = App.T.Translate("external_slide/application_settings/application_filename")
		  
		  f = dlg.ShowModal()
		  If Not IsNull(f) Then
		    edt_external_application_filename.Text = f.NativePath()
		    
		    If Status_InSetEditable Then
		      Status_InSetChanged = True
		      EnableMenuItems
		    End If
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "external_slide/presentation_settings/presentation_file"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon fileopen_img
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_external_application_filename
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events edt_external_application_parameters
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events chk_external_wait_for_application
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_external_application_start
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_external_application_stop
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lst_external_videolan_preset
	#tag Event
		Sub Change()
		  If Status_InSetEditable Then
		    edt_external_videolan_manual.Text = App.VideolanPresetList.Lookup(lst_external_videolan_preset.Cell(lst_external_videolan_preset.ListIndex,0), "")
		    
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rad_external_videolan_start
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_external_videolan_mediafilename
	#tag Event
		Sub Action()
		  Dim dlg As New OpenDialog
		  Dim f As FolderItem
		  
		  dlg.Filter = FileTypes.AllFiles
		  dlg.ActionButtonCaption = App.T.Translate("shared/select/@caption")
		  dlg.CancelButtonCaption = App.T.Translate("shared/cancel/@caption")
		  dlg.Title = App.T.Translate("external_slide/videolan_settings/videolan_mediafilename/@caption")
		  dlg.PromptText = App.T.Translate("external_slide/videolan_settings/videolan_mediafilename")
		  
		  f = dlg.ShowModal()
		  If Not IsNull(f) Then
		    edt_external_videolan_mediafilename.Text = f.NativePath()
		    
		    If Status_InSetEditable Then
		      Status_InSetChanged = True
		      EnableMenuItems
		    End If
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "external_slide/presentation_settings/presentation_file"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetIcon fileopen_img
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_external_videolan_mediafilename
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    chk_external_embed_mediafile.Enabled = True
		    
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events rad_external_videolan_stop
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edt_external_videolan_manual
	#tag Event
		Sub TextChange()
		  If Status_InSetEditable Then
		    
		    Dim selected As Integer = -1
		    Dim manualItem As Integer = -1
		    Dim i As Integer
		    
		    For i = 0 to lst_external_videolan_preset.ListCount()-1
		      If App.VideolanPresetList.Value(lst_external_videolan_preset.Cell(i, 0)) = Me.Text Then
		        selected = i
		      ElseIf App.VideolanPresetList.Value(lst_external_videolan_preset.Cell(i, 0)) = "" Then
		        manualItem = i
		      End If
		    Next i
		    
		    If selected > -1 then
		      lst_external_videolan_preset.ListIndex = selected
		    Else
		      Status_InSetEditable = False 'Prevent updating of the parameter control because the preset selection changed
		      lst_external_videolan_preset.ListIndex = manualItem
		      Status_InSetEditable = True
		    End If
		    
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return HandleKeyDown(Key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events chk_external_wait_for_videolan
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_external_embed_mediafile
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chk_external_print
	#tag Event
		Sub Action()
		  If Status_InSetEditable Then
		    Status_InSetChanged = True
		    EnableMenuItems
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  SetHelp "slide_editor/print"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  SetHelp ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmr_lookup
	#tag Event
		Sub Action()
		  KeyedSearch = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events spl_main
	#tag Event
		Sub SplitterMoved(X As Integer, Y As Integer)
		  //++
		  // Save the current position to restore after the app restarts
		  //--
		  
		  App.MainPreferences.SetValueN(Prefs.kMainSplitterPosition, Me.Left)
		  HSizer.Resize
		End Sub
	#tag EndEvent
	#tag Event
		Sub Undocked(before As Boolean)
		  App.MainPreferences.SetValueN(Prefs.kMainSplitterDockedState, CType(Me.IsDockedPosition, Integer))
		End Sub
	#tag EndEvent
	#tag Event
		Sub Docked(before As Boolean)
		  App.MainPreferences.SetValueN(Prefs.kMainSplitterDockedState, CType(Me.IsDockedPosition, Integer))
		  App.MainPreferences.SetValueN(Prefs.kMainSplitterPosition, Me.PositionBeforeDock)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="DontUpdateSetItem"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FindFocus"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=false
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PPT"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Status_SetChanged"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Status_SongChanged"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Status_SongOpen"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SongListIsFiltered"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentSongFolderPath"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="WindowStateBefore"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="WindowState"
		EditorType="Enum"
		#tag EnumValues
			"0 - Normal"
			"1 - Maximized"
			"2 - Minimized"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="WindowState"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="WindowState"
		EditorType="Enum"
		#tag EnumValues
			"0 - Normal"
			"1 - Maximized"
			"2 - Minimized"
		#tag EndEnumValues
	#tag EndViewProperty
#tag EndViewBehavior
