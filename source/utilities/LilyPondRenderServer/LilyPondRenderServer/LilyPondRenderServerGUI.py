from .LilyPondRenderServer import LilyPondRenderServer as svr
from .LilyPondRenderServer import startserver
from .LilyPondRenderServer import stopserver
from .Configuration import *
from .TkConfigWidgets import *
from .Logger import *

from tkinter import ttk
import tkinter as tk

from queue import Queue

class Application(tk.Frame):
    
    padsize = 3
    def __init__(self, master=None):
        tk.Frame.__init__(self, master)

        self.pack(fill=tk.BOTH, expand=tk.YES)
        self.actions = ActionsFrame(self)
        self.actions.pack(side=tk.TOP, fill=tk.BOTH, expand=tk.YES, pady=self.padsize)
        frame = GenericConfigurationFrame(self)
        frame.pack(side=tk.TOP, fill=tk.X, expand=tk.NO, padx=self.padsize, pady=self.padsize)
        frame = ServerConfigurationFrame(self)
        frame.pack(side=tk.TOP, fill=tk.X, expand=tk.NO, padx=self.padsize, pady=self.padsize)
        frame = LilyPondConfigurationFrame(self)
        frame.pack(side=tk.TOP, fill=tk.X, expand=tk.NO, padx=self.padsize, pady=self.padsize)
        root.geometry(configuration.get(CFG_SECTION_GENERIC, CFG_GEOMETRY))
        root.protocol("WM_DELETE_WINDOW", self.OnClose)

    def OnClose(self):
        stopserver()
        configuration.set(CFG_SECTION_GENERIC, CFG_GEOMETRY, root.geometry())
        configuration.WriteIfChanged()        
        root.destroy()

class ActionsFrame(tk.Frame):
    def __init__(self, master=None):
        tk.Frame.__init__(self, master)
        self.columnconfigure(0, weight=1)
        self.rowconfigure(1, weight=1)
        self.master = master

        # The main controls for 'daily' use
        frame = tk.Frame(self)
        frame.grid(row=0, column=0)
        self.btn_start = tk.Button(frame, text=Translate(GUI_START_SERVER), command=self.Start)
        self.btn_start.pack(side=tk.LEFT)
        self.btn_stop = tk.Button(frame, text=Translate(GUI_STOP_SERVER), command=self.Stop, state=tk.DISABLED)
        self.btn_stop.pack(side=tk.LEFT)
        # self.btn_save = tk.Button(frame, text=Translate(GUI_SAVE_CONFIG), command=self.SaveConfig, 
        #                           state=tk.NORMAL if config.changed else tk.DISABLED)
        # self.btn_save.pack(side=tk.LEFT)
        # config.on_changed_callback = lambda : self.btn_save.configure(state=tk.NORMAL)

        # Add a log area to the GUI
        frame = tk.Frame(self)
        frame.grid(row=1, column=0, padx=master.padsize, pady=master.padsize, sticky=tk.NSEW)
        self.txt_output = tk.Text(frame, wrap=tk.WORD, state=tk.DISABLED, height=4)
        self.txt_output.pack(side=tk.LEFT, fill=tk.BOTH, expand=tk.YES)
        self.txt_output.tag_config("error", foreground="red")
        scrollbar = tk.Scrollbar(frame)
        scrollbar.pack(side=tk.LEFT, fill=tk.Y)
        scrollbar.config(command=self.txt_output.yview)
        self.txt_output.config(yscrollcommand=scrollbar.set)
        self.txt_output_queue = Queue()
        SetLogger(self.Log)
        LogKey(Translate(TXT_DOCUMENTATION))
        self.after(0, self.update_txt_output)
        if configuration.getboolean(CFG_SECTION_GENERIC, CFG_START_WITH_SERVER):
            self.after(0, self.Start)

    def Start(self):
        self.btn_start.configure(state=tk.DISABLED)
        configuration.WriteIfChanged()        
        args = configuration.GetAsTypedDictionary(CFG_SECTION_SERVER, CFG_SECTION_LILYPOND)
        if startserver(sync=False, **args):
            LogKey(GUI_STARTED_SERVER)
            self.btn_stop.configure(state=tk.NORMAL)
        else:
            self.btn_start.configure(state=tk.NORMAL)

    def Stop(self):
        self.btn_stop.configure(state=tk.DISABLED)
        stopserver()
        LogKey(GUI_STOPED_SERVER)
        self.btn_start.configure(state=tk.NORMAL)

    # def SaveConfig(self):
    #     self.btn_save.configure(state=tk.DISABLED)
    #     self.configuration.set(CFG_SECTION_GENERIC, CFG_GEOMETRY, root.geometry())
    #     self.master.configuration.WriteIfChanged()        

    def update_txt_output(self):
        if not self.txt_output_queue.empty():
            widget = self.txt_output
            widget.configure(state=tk.NORMAL)
            while not self.txt_output_queue.empty():
                text, level = self.txt_output_queue.get()
                widget.insert(tk.END, text + '\n', ("error") if level == LogLevel.Error else ())
            widget.configure(state=tk.DISABLED)
            widget.see(tk.END)
            widget.update_idletasks()
        self.after(250, self.update_txt_output)

    def Log(self, text, level):
        self.txt_output_queue.put((text, level))

class GenericConfigurationFrame(tk.LabelFrame):
    def __init__(self, master=None):
        tk.LabelFrame.__init__(self, master, text=Translate(GUI_GENERIC_SETTINGS))
        self.columnconfigure(1, weight=1)
        gridrow = 0
        widget = ttk.Combobox(self, values=sorted(GetLanguages()))
        self.languagevariable = TkConfigStringVar(configuration, CFG_SECTION_GENERIC, CFG_LANGUAGE)
        self.languagevariable.trace('w', self.LanguageChanged)
        TkConfigEntry(self, Translate(CFG_LANGUAGE), gridrow, entrywidget=widget,
            textvariable=self.languagevariable, textlen=10)
        gridrow += 1
        widget = tk.Checkbutton(self, text=Translate(CFG_START_WITH_SERVER),
                                variable=TkConfigBooleanVar(configuration, CFG_SECTION_GENERIC, CFG_START_WITH_SERVER))
        widget.grid(row=gridrow, column=1, sticky=tk.W)

    def LanguageChanged(self, *args):
        SetTranslation(self.languagevariable.get())

class ServerConfigurationFrame(tk.LabelFrame):
    def __init__(self, master=None):
        tk.LabelFrame.__init__(self, master, text=Translate(GUI_SERVER_SETTINGS))
        self.columnconfigure(1, weight=1)
        gridrow = 0
        widget_entries = [ CFG_HOST, CFG_PORT, CFG_THREADS ]
        for configname in widget_entries:
            TkConfigEntry(self, Translate(configname), gridrow, textlen=20,
                textvariable=TkConfigStringVar(configuration, CFG_SECTION_SERVER, configname) )
            gridrow += 1

class LilyPondConfigurationFrame(tk.LabelFrame):
    def __init__(self, master=None):
        tk.LabelFrame.__init__(self, master, text=Translate(GUI_LILYPOND_SETTINGS))
        self.columnconfigure(1, weight=1)
        gridrow        = 0
        widget_entries = [  (CFG_COMMAND,            None), 
                            (CFG_TEMPLATE,           TkConfigEntry.Selection.File),
                            (CFG_WORKDIR,            TkConfigEntry.Selection.Folder),
                            (CFG_CACHEDIR,           TkConfigEntry.Selection.Folder),
                            (CFG_CUSTOMHYPHENFOLDER, TkConfigEntry.Selection.Folder) ]
        for configname, selection in widget_entries:
            TkConfigEntry(self, Translate(configname), gridrow, 
                textvariable=TkConfigStringVar(configuration, CFG_SECTION_LILYPOND, configname),
                fileselection=selection)
            gridrow += 1
        widget = ttk.Combobox(self, values=sorted(svr.GetAutoHyphenLanguages()) )
        TkConfigEntry(self, Translate(CFG_DEFAULTHYPHENLANGUAGE), gridrow, entrywidget=widget,
            textvariable = TkConfigStringVar(configuration, CFG_SECTION_LILYPOND, CFG_DEFAULTHYPHENLANGUAGE),
            textlen = 10)
        gridrow += 1
        widget = tk.Checkbutton(self, text=Translate(CFG_KEEPLY),
                                variable=TkConfigBooleanVar(configuration, CFG_SECTION_LILYPOND, CFG_KEEPLY))
        widget.grid(row=gridrow, column=1, sticky=tk.W)

root = tk.Tk()

def showgui():
    app = Application()
    app.master.title(configuration.appname + ' ' + configuration.version)
    app.mainloop()             
