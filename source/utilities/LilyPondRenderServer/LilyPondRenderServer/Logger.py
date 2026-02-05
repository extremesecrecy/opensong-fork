import sys
from enum import Enum

from .Translations import *

class LogLevel(Enum):
    Error   = 1
    Warning = 2
    Info    = 3
    Debug   = 4

_logleveltekst = { LogLevel.Error  : 'Error',
                   LogLevel.Warning: 'Warning',
                   LogLevel.Info   : 'Info',
                   LogLevel.Debug  : 'Debug'}

def LogLevelToText(level):
    return _logleveltekst[level]

def DefaultLogger(text, level=LogLevel.Info):
    print(LogLevelToText(level) + ':', text, file = sys.stderr if level == LogLevel.Error else sys.stdout)

_logger = DefaultLogger

def SetLogger(newlogger):
    global _logger
    _logger = newlogger

def LogText(text, level=LogLevel.Info):
    _logger(text, level)

def LogKey(key, level=LogLevel.Info, *args):
    _logger(Translate(key).format(*args), level)
