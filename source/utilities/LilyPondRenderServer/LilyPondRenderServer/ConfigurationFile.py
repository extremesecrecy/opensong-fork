from configparser import ConfigParser
from pathlib import Path

class ConfigurationFile(ConfigParser):

    def __init__(self, on_changed_callback=None):
        ConfigParser.__init__(self, allow_no_value=True)

        # For easy conversion into a dictionary compatible with ArgumentParser, we
        # can specify specific getters for some entries. They're used by GetAsTypedDictionary().
        self.getters = {}
        self.changed = True
        self.on_changed_callback = on_changed_callback

    def LoadOrCreate(self, settingsfile):
        ''' Load from file, if it exists. Otherwise, create.'''
        self.file = Path(settingsfile)
        if not self.file.exists():
            self.file.parent.mkdir(parents=True)
        if self.file.is_file():
            with self.file.open() as file:
                self.read_file(file)
            self.changed = False
        else:
            self.WriteIfChanged()

    def WriteIfChanged(self):
        if self.changed:
            with self.file.open(mode='w') as file:
                self.write(file)
            self.changed = False

    def GetAsTypedDictionary(self, *vargs):
        ''' Returns the configuration entries for all specified sections. Uses the
            getters optionally specified in the "getters" member list. '''
        result = {}
        for section in vargs:
            for key in self[section]:
                result[key] = self.getters.get(key, ConfigParser.get)(self, section, key)
        return result

    def set(self, section, option, value):
        value = str(value)
        if self.get(section, option, fallback=None) != value:
            ConfigParser.set(self, section, option, value)
            self.SetChanged()

    def SetChanged(self):
        if not self.changed:
            self.changed = True
            if self.on_changed_callback:
                self.on_changed_callback()
    
    def SetArgs(self, **kwargs):
        ''' Transfers values from the arguments to the settings. Section names ignored.
            Only the option name in the section is compared against the argument name.'''
        for section in self.sections():
            for option in self.options(section):
                if option in kwargs:
                    self.set(section, option, kwargs[option])
