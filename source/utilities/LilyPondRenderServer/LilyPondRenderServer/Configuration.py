from .ConfigurationFile import *
from .Keys import *
from .Translations import *

from os import path
import appdirs
import locale
import multiprocessing
import sys

class Configuration(ConfigurationFile):

    def __init__(self):
        ConfigurationFile.__init__(self)
        
        self.appname   = 'LilyPondRenderer'
        self.appauthor = 'OpenSong'
        self.version   = "1.0.1"

        cachedir  = appdirs.user_cache_dir(appname=self.appname, appauthor=self.appauthor)
        configdir = appdirs.user_config_dir(appname=self.appname, appauthor=self.appauthor)
        hyphendir = configdir
        languagecode, encoding = locale.getdefaultlocale()

        if sys.platform == 'linux':
            hyphendir = r"/opt/OpenSong/OpenSong Defaults/Settings"

        # For easy conversion into a dictionary compatible with ArgumentParser, we
        # specify specific getters for some entries. They're used by GetAsTypedDictionary().
        self.getters = {
            CFG_START_WITH_SERVER: ConfigParser.getboolean,
            CFG_PORT             : ConfigParser.getint,
            CFG_THREADS          : ConfigParser.getint,
            CFG_KEEPLY           : ConfigParser.getboolean
        }

        # Set the defaults
        self[CFG_SECTION_GENERIC] = {
            CFG_LANGUAGE         : languagecode,
            CFG_START_WITH_SERVER: 'True',
            CFG_GEOMETRY         : ''
        }
        self[CFG_SECTION_SERVER] = {
            CFG_PORT   : '8083',
            CFG_HOST   : 'localhost',
            CFG_THREADS:  max(multiprocessing.cpu_count() - 1, 1)
        }
        self[CFG_SECTION_LILYPOND] = {
            CFG_TEMPLATE             : path.join(configdir, 'Template.ly'),
            CFG_COMMAND              : 'cd "{workdir}" ; lilypond -ddelete-intermediate-files --png -dresolution=400 "{lilypondfile}"',
            CFG_WORKDIR              : path.join(cachedir, 'workdir'),
            CFG_CACHEDIR             : cachedir,
            CFG_CUSTOMHYPHENFOLDER   : hyphendir,
            CFG_DEFAULTHYPHENLANGUAGE: languagecode,
            CFG_KEEPLY               : 'False'
        }

        # for windows: cd "{workdir}" & "C:\Program Files (x86)\LilyPond\usr\bin\lilypond.exe" -ddelete-intermediate-files --png -dresolution=400 "{lilypondfile}"

        self.LoadOrCreate(path.join(configdir, 'settings.cfg'))
        SetTranslation(self.get(CFG_SECTION_GENERIC, CFG_LANGUAGE))

configuration = Configuration()
