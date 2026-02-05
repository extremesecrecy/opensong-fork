#tag Window
Begin ContainerControl ColorPaletteArea
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   False
   Height          =   300
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   210
   Begin PopupMenu pop_palette
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
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   81
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   129
   End
   Begin Label lbl_palette
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Palette"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   81
   End
   Begin ScrollBar scr_palette
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   False
      Enabled         =   False
      Height          =   272
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   193
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   100
      MinimumValue    =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   28
      Transparent     =   False
      Value           =   0
      Visible         =   False
      Width           =   17
   End
   Begin ColorPaletteCanvas cnv_palette
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   270
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      SampleHeight    =   0
      SampleWidth     =   0
      Scope           =   0
      ScrollY         =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   29
      Transparent     =   False
      Visible         =   True
      Width           =   192
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawingColor = Color.DarkBevelColor
		  g.DrawRectangle(0, cnv_palette.Top - 1, Width, cnv_palette.Height + 2)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddPaletteByName(name As String, caption As String = "", ParamArray palCaption As String)
		  Dim pal() As Color
		  
		  Select Case Name
		  Case "CGA"
		    AddPaletteName(name, caption)
		    
		    pal.Add(&c000000)
		    pal.Add(&c0000AA)
		    pal.Add(&c00AA00)
		    pal.Add(&c00AAAA)
		    pal.Add(&cAA0000)
		    pal.Add(&cAA00AA)
		    pal.Add(&cAAAA00)
		    pal.Add(&cAAAAAA)
		    pal.Add(&c555555)
		    pal.Add(&c0000FF)
		    pal.Add(&c00FF00)
		    pal.Add(&c00FFFF)
		    pal.Add(&cFF0000)
		    pal.Add(&cFF00FF)
		    pal.Add(&cFFFF00)
		    pal.Add(&cFFFFFF)
		    AddPaletteColors(pal)
		    
		  Case "MatchingColors"
		    Dim c As Color
		    
		    If caption = "" Then caption = "Matching Colors"
		    AddPaletteName(name, caption)
		    
		    
		    If palCaption.Ubound >= 0 Then
		      caption = palCaption(0)
		    Else
		      caption = "Complementary"
		    End If
		    Me.AddPaletteCaption(caption)
		    pal.Add(c)
		    pal.Add(c)
		    Me.AddPaletteColors(pal)
		    
		    Redim pal(-1)
		    If palCaption.Ubound >= 1 Then
		      caption = palCaption(1)
		    Else
		      caption = "Triadic"
		    End If
		    Me.AddPaletteCaption(caption)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    Me.AddPaletteColors(pal)
		    
		    Redim pal(-1)
		    If palCaption.Ubound >= 2 Then
		      caption = palCaption(2)
		    Else
		      caption = "Tetradic"
		    End If
		    Me.AddPaletteCaption(caption)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    Me.AddPaletteColors(pal)
		    Redim pal(-1)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    Me.AddPaletteColors(pal)
		    
		    Redim pal(-1)
		    If palCaption.Ubound >= 3 Then
		      caption = palCaption(3)
		    Else
		      caption = "Analogous"
		    End If
		    Me.AddPaletteCaption(caption)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    Me.AddPaletteColors(pal)
		    
		    Redim pal(-1)
		    If palCaption.Ubound >= 4 Then
		      caption = palCaption(4)
		    Else
		      caption = "Neutral"
		    End If
		    Me.AddPaletteCaption(caption)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    Me.AddPaletteColors(pal)
		    
		    Redim pal(-1)
		    If palCaption.Ubound >= 5 Then
		      caption = palCaption(5)
		    Else
		      caption = "Shades"
		    End If
		    Me.AddPaletteCaption(caption)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    Me.AddPaletteColors(pal)
		    
		    Redim pal(-1)
		    If palCaption.Ubound >= 6 Then
		      caption = palCaption(6)
		    Else
		      caption = "Tintes"
		    End If
		    Me.AddPaletteCaption(caption)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    Me.AddPaletteColors(pal)
		    
		    Redim pal(-1)
		    If palCaption.Ubound >= 7 Then
		      caption = palCaption(7)
		    Else
		      caption = "Tones"
		    End If
		    Me.AddPaletteCaption(caption)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    pal.Add(c)
		    Me.AddPaletteColors(pal)
		    
		  Case "Standard"
		    // taken from LibreOffice
		    // vsf 2018-01-09, using dave eddy <bahamas10> implementation of Gossett & Chen algorithm https://bahamas10.github.io/ryb/about.html
		    // regenerated a RYB => RGB sequence for the RYB Hues at: 0, tints at 191, 153, 115, 77 and shades at -51, -102, -153, -204
		    // Color naming RYB Hues: primary: Red, Yellow, Blue; secondary: Orange, Green, Purple; tertiary: Magenta, Indigo, Teal, Lime, Gold, Brick as found https://en.wikipedia.org/wiki/Tertiary_color
		    
		    If caption = "" Then caption = name
		    Me.AddPaletteName(name, caption)
		    
		    // Gray palette from black to white
		    Redim pal(-1)
		    pal.Add(&c000000)  // Black
		    pal.Add(&c111111)  // Dark Gray 4
		    pal.Add(&c1c1c1c)  // Dark Gray 3
		    pal.Add(&c333333)  // Dark Gray 2
		    pal.Add(&c666666)  // Dark Gray 1
		    pal.Add(&c808080)  // Gray
		    pal.Add(&c999999)  // Light Gray 1
		    pal.Add(&cb2b2b2)  // Light Gray 2
		    pal.Add(&ccccccc)  // Light Gray 3
		    pal.Add(&cdddddd)  // Light Gray 4
		    pal.Add(&ceeeeee)  // Light Gray 5
		    pal.Add(&cffffff)  // White
		    Me.AddPaletteColors(pal)
		    
		    // Base hues
		    // 0 brightness
		    Redim pal(-1)
		    pal.Add(&cffff00)  // Yellow
		    pal.Add(&cffbf00)  // Gold
		    pal.Add(&cff8000)  // Orange
		    pal.Add(&cff4000)  // Brick
		    pal.Add(&cff0000)  // Red
		    pal.Add(&cbf0041)  // Magenta
		    pal.Add(&c800080)  // Purple
		    pal.Add(&c55308d)  // Indigo
		    pal.Add(&c2a6099)  // Blue
		    pal.Add(&c158466)  // Teal
		    pal.Add(&c00a933)  // Green
		    pal.Add(&c81d41a)  // Lime
		    Me.AddPaletteColors(pal)
		    
		    // +191 brightness, 75% tint
		    Redim pal(-1)
		    pal.Add(&cffffd7)  // Light Yellow 4
		    pal.Add(&cfff5ce)  // Light Gold 4
		    pal.Add(&cffdbb6)  // Light Orange 4
		    pal.Add(&cffd8ce)  // Light Brick 4
		    pal.Add(&cffd7d7)  // Light Red 4
		    pal.Add(&cf7d1d5)  // Light Magenta 4
		    pal.Add(&ce0c2cd)  // Light Purple 4
		    pal.Add(&cdedce6)  // Light Indigo 4
		    pal.Add(&cdee6ef)  // Light Blue 4
		    pal.Add(&cdee7e5)  // Light Teal 4
		    pal.Add(&cdde8cb)  // Light Green 4
		    pal.Add(&cf6f9d4)  // Light Lime 4
		    Me.AddPaletteColors(pal)
		    
		    // +153 brightness, 60% tint
		    Redim pal(-1)
		    pal.Add(&cffffa6)  // Light Yellow 3
		    pal.Add(&cffe994)  // Light Gold 3
		    pal.Add(&cffb66c)  // Light Orange 3
		    pal.Add(&cffaa95)  // Light Brick 3
		    pal.Add(&cffa6a6)  // Light Red 3
		    pal.Add(&cec9ba4)  // Light Magenta 3
		    pal.Add(&cbf819e)  // Light Purple 3
		    pal.Add(&cb7b3ca)  // Light Indigo 3
		    pal.Add(&cb4c7dc)  // Light Blue 3
		    pal.Add(&cb3cac7)  // Light Teal 3
		    pal.Add(&cafd095)  // Light Green 3
		    pal.Add(&ce8f2a1)  // Light Lime 3
		    Me.AddPaletteColors(pal)
		    
		    // +115 brightness, 45% tint
		    Redim pal(-1)
		    pal.Add(&cffff6d)  //Light Yellow 2
		    pal.Add(&cffde59)  // Light Gold 2
		    pal.Add(&cff972f)  // Light Orange 2
		    pal.Add(&cff7b59)  // Light Brick 2
		    pal.Add(&cff6d6d)  // Light Red 2
		    pal.Add(&ce16173)  // Light Magenta 2
		    pal.Add(&ca1467e)  // Light Purple 2
		    pal.Add(&c8e86ae)  // Light Indigo 2
		    pal.Add(&c85a4c5)  // Light Blue 2
		    pal.Add(&c81aca6)  // Light Teal 2
		    pal.Add(&c77bc65)  // Light Green 2
		    pal.Add(&cd4ea6b)  // Light Lime 2
		    Me.AddPaletteColors(pal)
		    
		    // +77 brightness, 30% tint
		    Redim pal(-1)
		    pal.Add(&cffff38)  // Light Yellow 1
		    pal.Add(&cffd428)  // Light Gold 1
		    pal.Add(&cff860d)  // Light Orange 1
		    pal.Add(&cff5429)  // Light Brick 1
		    pal.Add(&cff3838)  // Light Red 1
		    pal.Add(&cd62e4e)  // Light Magenta 1
		    pal.Add(&c8d1d75)  // Light Purple 1
		    pal.Add(&c6b5e9b)  // Light Indigo 1
		    pal.Add(&c5983b0)  // Light Blue 1
		    pal.Add(&c50938a)  // Light Teal 1
		    pal.Add(&c3faf46)  // Light Green 1
		    pal.Add(&cbbe33d)  // Light Lime 1
		    Me.AddPaletteColors(pal)
		    
		    // -51 brightness, 20% shade
		    Redim pal(-1)
		    pal.Add(&ce6e905)  // Dark Yellow 1
		    pal.Add(&ce8a202)  // Dark Gold 1
		    pal.Add(&cea7500)  // Dark Orange 1
		    pal.Add(&ced4c05)  // Dark Brick 1
		    pal.Add(&cf10d0c)  // Dark Red 1
		    pal.Add(&ca7074b)  // Dark Magenta 1
		    pal.Add(&c780373)  // Dark Purple 1
		    pal.Add(&c5b277d)  // Dark Indigo 1
		    pal.Add(&c2e5d8c)  // Dark Blue 1
		    pal.Add(&c168253)  // Dark Teal 1
		    pal.Add(&c069a2e)  // Dark Green 1
		    pal.Add(&c5eb91e)  // Dark Lime 1
		    Me.AddPaletteColors(pal)
		    
		    // -102 brightness, 40% shade -->
		    Redim pal(-1)
		    pal.Add(&cacb20c)  // Dark Yellow 2
		    pal.Add(&cb47804)  // Dark Gold 2
		    pal.Add(&cb85c00)  // Dark Orange 2
		    pal.Add(&cbe480a)  // Dark Brick 2
		    pal.Add(&cc9211e)  // Dark Red 2
		    pal.Add(&c861141)  // Dark Magenta 2
		    pal.Add(&c650953)  // Dark Purple 2
		    pal.Add(&c55215b)  // Dark Indigo 2
		    pal.Add(&c355269)  // Dark Blue 2
		    pal.Add(&c1e6a39)  // Dark Teal 2
		    pal.Add(&c127622)  // Dark Green 2
		    pal.Add(&c468a1a)  // Dark Lime 2
		    Me.AddPaletteColors(pal)
		    
		    // -153 brightness, 60% shade
		    Redim pal(-1)
		    pal.Add(&c706e0c)  // Dark Yellow 3
		    pal.Add(&c784b04)  // Dark Gold 3
		    pal.Add(&c7b3d00)  // Dark Orange 3
		    pal.Add(&c813709)  // Dark Brick 3
		    pal.Add(&c8d281e)  // Dark Red 3
		    pal.Add(&c611729)  // Dark Magenta 3
		    pal.Add(&c4e102d)  // Dark Purple 3
		    pal.Add(&c481d32)  // Dark Indigo 3
		    pal.Add(&c383d3c)  // Dark Blue 3
		    pal.Add(&c28471f)  // Dark Teal 3
		    pal.Add(&c224b12)  // Dark Green 3
		    pal.Add(&c395511)  // Dark Lime 3
		    Me.AddPaletteColors(pal)
		    
		    // -204 brightness, 80% shade -->
		    Redim pal(-1)
		    pal.Add(&c443205)  // Dark Yellow 4
		    pal.Add(&c472702)  // Dark Gold 4
		    pal.Add(&c492300)  // Dark Orange 4
		    pal.Add(&c4b2204)  // Dark Brick 4
		    pal.Add(&c50200c)  // Dark Red 4
		    pal.Add(&c41190d)  // Dark Magenta 4
		    pal.Add(&c3b160e)  // Dark Purple 4
		    pal.Add(&c3a1a0f)  // Dark Indigo 4
		    pal.Add(&c362413)  // Dark Blue 4
		    pal.Add(&c302709)  // Dark Teal 4
		    pal.Add(&c2e2706)  // Dark Green 4
		    pal.Add(&c342a06)  // Dark Lime 4
		    Me.AddPaletteColors(pal)
		    
		  Case Else
		    Raise New OutOfBoundsException("Unknown Name " + Name)
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPaletteCaption(Text As String)
		  Dim data() As Variant = PaletteData(PaletteData.Ubound)
		  data.Add(Text)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPaletteColors(c() As Color)
		  Dim data() As Variant = PaletteData(PaletteData.Ubound)
		  
		  Dim pal() As Color
		  Redim pal(c.Ubound)
		  For i As Integer = 0 To c.Ubound
		    pal(i) = c(i)
		  Next i
		  
		  data.Add(pal)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPaletteName(Name As String, caption As String = "")
		  PaletteNames.Add(Name)
		  Dim empty() As Variant
		  PaletteData.Add(empty)
		  If caption = "" Then caption = Name
		  pop_palette.AddRow(caption)
		  pop_palette.RowTagAt(pop_palette.LastAddedRowIndex) = Name
		  If pop_palette.SelectedRowIndex = -1 Then
		    pop_palette.SelectedRowIndex = pop_palette.LastAddedRowIndex
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetActivePaletteName() As String
		  Dim Index As Integer = pop_palette.SelectedRowIndex
		  If Index = -1 Or Index > pop_palette.LastRowIndex Then
		    Return ""
		  Else
		    Return PaletteNames(Index)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDynamicPalette(Index As Integer) As Boolean
		  Return Index = PaletteNames.IndexOf("MatchingColors")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadPalett(Index As Integer)
		  cnv_palette.ClearPalette
		  If Index >= 0 And Index <= PaletteData.Ubound Then
		    UpdateDynamicPalette(Index)
		    
		    Dim data() As Variant = PaletteData(Index)
		    For i As Integer = 0 To data.Ubound
		      If data(i).IsArray Then
		        cnv_palette.AddColors(data(i))
		      Else
		        cnv_palette.AddCaption(data(i).StringValue)
		      End If
		    Next i
		  End If
		  cnv_palette.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MouseWheelY(deltaY as Integer) As Integer
		  // scroll by single lines, ignore the OS's setting
		  If WheelFactor = 0 Then WheelFactor = Abs(deltaY)
		  If deltaY Mod WheelFactor <> 0 Then
		    If deltaY Mod 2 = 0 And WheelFactor Mod 2 = 0 Then
		      WheelFactor = WheelFactor \ 2
		    ElseIf deltaY Mod 3 = 0 And WheelFactor Mod 3 = 0 Then
		      WheelFactor = WheelFactor \ 3
		    ElseIf deltaY Mod 5 = 0 And WheelFactor Mod 5 = 0 Then
		      WheelFactor = WheelFactor \ 5
		    Else
		      WheelFactor = 1
		    End If
		  End If
		  Return deltaY \ WheelFactor
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PaletteColor(ByRef c As Color) As Boolean
		  Dim row, col As Integer
		  row = cnv_palette.CurrentCell.X
		  col = cnv_palette.CurrentCell.Y
		  If row = -1 Or col = -1 Then
		    row = cnv_palette.SelectedCell.X
		    col = cnv_palette.SelectedCell.Y
		  End If
		  Return cnv_palette.ColorAtRowCol(row, col, c)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveGrey(c As Color, g As Integer) As Color
		  // Determine how much of Grey(g) is contained in c and remove it
		  // g is in the range 0..255
		  
		  // Black (K) = minimum of C,M,Y
		  // CyanCMYK = (C - K)/(1 - K)
		  // MagentaCMYK = (M - K)/(1 - K)
		  // YellowCMYK = (Y - K)/(1 - K)
		  Dim ck, cb, cg, cgb As Integer
		  Dim rd, gn, bl As Double
		  
		  ck = Min(255 - c.red, 255 - c.Green, 255 - c.Blue)  // black in c
		  cb = Min(c.red, c.Green, c.Blue)  // white in c
		  
		  // grey(g) in c
		  If g = 0 Then
		    cg = 255 * (ck / (255 - g))
		  ElseIf g = 255 Then
		    cg = 255 * (cb / g)
		  Else
		    cg = 255 * Min(ck / (255 - g), cb / g)
		  End If
		  
		  If cg > 255 Then Break
		  
		  cgb = Round(cg * g / 255)
		  
		  rd = Round((c.Red - cgb) * (255 / (255 - cg)))
		  gn = Round((c.Green - cgb) * (255 / (255 - cg)))
		  bl = Round((c.Blue - cgb) * (255 / (255 - cg)))
		  If rd > 255 Then Break
		  If gn > 255 Then Break
		  If bl > 255 Then Break
		  Return RGB(rd, gn, bl)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetActivePalette(Name As String, Index As Integer = -1)
		  If Index = -1 And Name <> "" Then
		    Index = PaletteNames.IndexOf(Name)
		  End If
		  If Index >= 0 And Index <= pop_palette.LastRowIndex Then
		    If Index = pop_palette.SelectedRowIndex Then
		      LoadPalett(Index)
		    Else
		      pop_palette.SelectedRowIndex = Index
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetColor(SelectedColor As Color)
		  Dim c As Color
		  
		  BaseColor = SelectedColor
		  If IsDynamicPalette(pop_palette.SelectedRowIndex) Then
		    Dim Cell() As REALbasic.Point
		    Cell.Add cnv_palette.SelectedCell
		    Cell.Add cnv_palette.CurrentCell
		    
		    LoadPalett(pop_palette.SelectedRowIndex)
		    
		    If cnv_palette.ColorAtRowCol( Cell(0).X, Cell(0).Y, c) Then cnv_palette.SelectedCell = Cell(0)
		    If cnv_palette.ColorAtRowCol( Cell(1).X, Cell(1).Y, c) Then cnv_palette.CurrentCell = Cell(1)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateDynamicPalette(idx As Integer)
		  Dim data() As Variant
		  Dim pal() As Color
		  Dim k As Integer = -1
		  Dim s As Double
		  Dim c As Color
		  
		  If Not IsDynamicPalette(idx) Then
		    Return
		  End If
		  
		  data = PaletteData(idx)
		  For i As Integer = 0 To data.Ubound
		    If data(i).IsArray Then
		      k = k + 1
		      pal = data(i)
		      Select Case k
		      Case 6
		        c = RemoveGrey(BaseColor, 0)
		      Case 7
		        c = RemoveGrey(BaseColor, 255)
		      Case 8
		        c = RemoveGrey(BaseColor, 127)
		      End Select
		      For j As Integer = 0 To pal.Ubound
		        Select Case k
		        Case 0  // complementary
		          If j = 0 Then
		            pal(j) = BaseColor
		          Else
		            s = BaseColor.Hue + 0.5
		            If s >= 1.0 Then s = s - 1.0
		            pal(j) = HSV(s, BaseColor.Saturation, BaseColor.Value)
		          End If
		        Case 1  // triadic
		          s = BaseColor.Hue + (j Mod 3) / 3
		          If s >= 1 Then s = s - 1
		          pal(j) = HSV(s, BaseColor.Saturation, BaseColor.Value)
		        Case 2  // tetradic
		          s = (((j Mod 4 + 1) \ 2) * 2 + (j Mod 4) \ 2) / 6  // produces 0 1/3 1/2 5/6 | 0° 120° 180° 300°
		          s = BaseColor.Hue + s
		          If s >= 1 Then s = s - 1
		          pal(j) = HSV(s, BaseColor.Saturation, BaseColor.Value)
		        Case 3  // tetradic reversed
		          s = ((j Mod 4) + (j Mod 4) \ 2) / 6  // produces 0 1/6 1/2 2/3 | 0° 60° 180° 240°
		          s = BaseColor.Hue + s
		          If s >= 1 Then s = s - 1
		          pal(j) = HSV(s, BaseColor.Saturation, BaseColor.Value)
		        Case 4  // analogous
		          s = BaseColor.Hue + ((j - pal.Ubound \ 2) Mod 12) / 12
		          If s >= 1 Then s = s - 1
		          pal(j) = HSV(s, BaseColor.Saturation, BaseColor.Value)
		        Case 5  // analogous
		          s = BaseColor.Hue + ((j - pal.Ubound \ 2) Mod 24) / 24
		          If s >= 1 Then s = s - 1
		          pal(j) = HSV(s, BaseColor.Saturation, BaseColor.Value)
		        Case 6  // shades
		          s = (j / pal.Ubound)
		          pal(j) = RGB(s * c.Red, s * c.Green, s * c.Blue)
		        Case 7  // tintes
		          s = (j / pal.Ubound)
		          pal(j) = RGB(Min(s * c.Red + (1 - s) * 255, 255), Min(s * c.Green + (1 - s) * 255, 255), Min(s * c.Blue + (1 - s) * 255, 255))
		        Case 8  // tones
		          s = (j / pal.Ubound)
		          pal(j) = RGB(Min(s * c.Red + (1 - s) * 127, 255), Min(s * c.Green + (1 - s) * 127, 255), Min(s * c.Blue + (1 - s) * 127, 255))
		        End Select
		      Next j
		    End If
		  Next i
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action(SelectedColor As Color, Chosen As Boolean)
	#tag EndHook


	#tag Note, Name = Description
		This is a complex control with a ColorPaletteCanvas and some additional controls
		It allows you to select between the available palettes, which you should add before using
		Any palette has a name, an optional caption that is added to the pulldown menu and the 
		colors, which you can organise into rows, if you wish. If the given rows are longer than 
		the configured with of the control, the rows are wrapped around.
		Each row can have an optional caption, which will be shown in the palette area as a title
		there are some built-in palettes, which you add using the function AddPaletteByName (see
		there for what is predefined).
		The built-in palette MatchingColors is special in that it updates dynamically in order to
		show colors that are related to a BaseColor in a way that generally is considerd to give 
		a well balanced, pleasing result when used together.
		
	#tag EndNote


	#tag Property, Flags = &h0
		BaseColor As Color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PaletteData() As Variant
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PaletteNames() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected WheelFactor As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events pop_palette
	#tag Event
		Sub Change()
		  LoadPalett(Me.ListIndex)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scr_palette
	#tag Event
		Sub ValueChanged()
		  cnv_palette.ScrollY = Me.Value \ 10
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  If deltaY <> 0 Then
		    Me.Value = Me.Value + MouseWheelY(deltaY) * Me.LineStep
		    Return true
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events cnv_palette
	#tag Event
		Sub Action(c As Color, chosen As Boolean)
		  RaiseEvent Action(c, chosen)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ContentSizeChange(Width As Integer, Height As Integer)
		  If Height > Me.Height Then
		    scr_palette.Enabled = True
		    scr_palette.Value = 0
		    scr_palette.LineStep = 100
		    scr_palette.PageStep = 300
		    scr_palette.MinimumValue = 0
		    scr_palette.MaximumValue = (Height - Me.Height) * 10
		    scr_palette.Visible = True
		    scr_palette.AllowLiveScrolling = true
		  Else
		    scr_palette.Value = 0
		    scr_palette.Visible = False
		    scr_palette.Enabled = False
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  If deltaY <> 0 Then
		    scr_palette.Value = scr_palette.Value + MouseWheelY(deltaY) * scr_palette.LineStep
		    Return true
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub ScrollToXY(X As Integer, Y As Integer)
		  scr_palette.Value = Y * 10
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
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
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
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
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BaseColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
