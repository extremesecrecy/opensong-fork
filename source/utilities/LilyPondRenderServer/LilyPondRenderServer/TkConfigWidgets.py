# Generic python imports
from enum import Enum
from os.path import *

# TkInter imports
import tkinter as tk
from tkinter.filedialog  import askopenfilename
from tkinter.filedialog  import askdirectory

class TkConfigStringVar(tk.StringVar):
    def __init__(self, configuration, section, entry):
        tk.StringVar.__init__(self)
        self.configuration = configuration
        self.section       = section
        self.entry         = entry
        self.set(configuration[section][entry])
        self.trace('w', self.vartrace)
    
    def set(self, value):
        if self.configuration[self.section][self.entry] != value:
            self.configuration[self.section][self.entry] = value
            self.configuration.SetChanged()
        if self.get() != value:
            tk.StringVar.set(self, value)

    def vartrace(self, *args):
        self.set(self.get())

class TkConfigBooleanVar(tk.BooleanVar):
    def __init__(self, configuration, section, entry):
        tk.BooleanVar.__init__(self)
        self.configuration = configuration
        self.section       = section
        self.entry         = entry
        self.set(configuration.getboolean(section, entry))
        self.trace('w', self.vartrace)
    
    def set(self, value):
        if self.configuration[self.section][self.entry] != str(value):
            self.configuration[self.section][self.entry] = str(value)
            self.configuration.SetChanged()
        if self.get() != value:
            tk.BooleanVar.set(self, value)

    def vartrace(self, *args):
        self.set(self.get())

class TkConfigEntry:
    """ Creates a combination of 3 widgets: Label, entry and path selection button.
    These can be used to let the user enter or select a path. The buttons are put
    in the grid layout at the specified row, starting at the startcolumn. Each
    widget is put in a separate column (so +0, +1 and +2).
    """

    class Selection(Enum):
        File = 1
        Folder = 2

    def __init__(self, master, label=None, row=0, startcolumn=0, text=None, textvariable=None, pad=3, 
                 entrywidget=None, fileselection=None, textlen=None):
        if label:
            self.label = tk.Label(master, text=label)
            self.label.grid(row=row, column=startcolumn, sticky=tk.W)
        if entrywidget:
            self.entry = entrywidget
        else:
            self.entry = tk.Entry(master)
        if textlen:
            sticky = tk.W
            self.entry.config(width=textlen)
        else:
            sticky = tk.W + tk.E
        self.entry.grid(row=row, column=startcolumn+1, pady=pad, sticky=sticky)
        if textvariable:
            self.entry.config(textvariable=textvariable)
        if text:
            self.entry.insert(0, text)
            self.entry.xview_moveto(1.0)
        if fileselection:
            self.select = tk.Button(master, text='...',
                command = self.DoSelectFile if fileselection == TkConfigEntry.Selection.File else self.DoSelectFolder)
            self.select.grid(row=row, column=startcolumn+2, padx=(0, pad), pady=pad)

    def DoSelectFile(self):
        entry = self.entry.get()
        name = askopenfilename(initialdir=dirname(entry), initialfile=basename(entry), title=self.label.cget('text'))
        if name:
            self.entry.delete(0, tk.END)
            self.entry.insert(0,name)
            self.entry.xview_moveto(1.0)  

    def DoSelectFolder(self):
        name = askdirectory(initialdir=self.entry.get(), title=self.label.cget('text'))
        if name:
            self.entry.delete(0, tk.END)
            self.entry.insert(0,name)
            self.entry.xview_moveto(1.0)  

