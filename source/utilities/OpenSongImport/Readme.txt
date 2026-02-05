Readme for OSI (OpenSong Import)

Although I have tested this safely on my own machine, use this program at your own risk.

This program is designed to import different text files and convert them into OpenSong format.
It will allow you to create your own import rules and pointers to different sections, then import and export files one at a time or a whole batch of files.  The export will place the songs directly in the OpenSong\Songs folder under My Documents (or allow you to select the correct path).  If the songs already exist a warning will be displayed but the file will not be overwritten.
After importing songs, you will need to select Settings/Refresh Songs Folder from OpenSong to see the new songs.
This program will only handle text based files, not binary files like pdf, doc, ppt, etc.

There is an OSI.ini file included which has formats for all the songs in the Samples folder.
When you first run OSI, it will create a new OSI.ini file in %appdata%\OpenSong Import.
After running OSI, close it down and you can copy over the included OSI.ini (or paste the relavent sections you want).  Yes, you can type %appdata% in explorer, or browse to C:\Documents and Settings\<your user name>\Application Data\OpenSong Import.

Quick step through:
Select the File Format you wish to import.
Click Open File and select the file required.
OSI will import the selected song into a string list on the left.

Under the import parsing you can define options that are only used when the file is imported:
   A string to force a new line
   Option to strip blank lines
   Search strings to be replaced with another string
      (if replacing a single string ignore the suffix)
      (the replace string may be blank)

On the right is a string list of the different sections in OpenSong and how to find them in the imported file.  Select a section an the Section area will allow you to change the location of the section.  A section may be:
   Not Used		This section will not be written to OpenSong
   Fixed String
   Line Number		Section is always on the same line
   Lines after Item	Section is a fixed number of lines after another section
   Prefix / Suffix	Section can be located by a Prefix and/or Suffix

The Lyric Section requires a location of where the lyrics start, and also has options to locate the different sections.  The string entered must exist at the start of a line.  The Verse OR chorus prefix may be blank if there is no header used.  A blank line will signal the end of a lyric section.

There is also an option to manage importing of chords, although these may need realigning to the correct words after importing.

Use Preview Output to test the definition and display a preview of the output in the bottom right edit box, or double click any item in the Section list box to see it's preview.  The preview is also updated with each change you make to the Section items.


Please report any suggestions, comments or problems to wrwessel@hotmail.com or build on the source code (compiled with Delphi 6 personal edition).

Wayne Wessel
