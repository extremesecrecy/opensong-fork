#tag Menu
Begin Menu SongPickerMenu
   Begin MenuItem mnu_bar_file
      SpecialMenu = 0
      Text = "&File$"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem mnu_file_close
         SpecialMenu = 0
         Text = "Close$"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem mnu_bar_edit
      SpecialMenu = 0
      Text = "&Edit$"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem mnu_edit_cut
         SpecialMenu = 0
         Text = "Cu&t$"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem mnu_edit_copy
         SpecialMenu = 0
         Text = "&Copy$"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem mnu_copy_paste
         SpecialMenu = 0
         Text = "&Paste$"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem mnu_edit_clear
         SpecialMenu = 0
         Text = "&Delete$"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditSeparator2
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem mnu_edit_selall
         SpecialMenu = 0
         Text = "Select &All$"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem mnu_edit_find
         SpecialMenu = 0
         Text = "&Find$"
         Index = -2147483648
         ShortcutKey = "F"
         Shortcut = "Cmd+F"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem mnu_edit_find_next
         SpecialMenu = 0
         Text = "FindNext$"
         Index = -2147483648
         ShortcutKey = "G"
         Shortcut = "Cmd+G"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
   End
End
#tag EndMenu
