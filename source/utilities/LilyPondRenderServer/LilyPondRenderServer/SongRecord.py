#! /usr/bin/env python3
import hashlib
import os
from os import path
from threading import Lock
from datetime import datetime

class SongRecord:
    ''' Fully describes content and files that makeup one verse of an opensong verse.
    The format for the png files that makeup the song is:
        <osfile>$<verse>$<16-char-md5>$<3-digit-count>.png
    '''

    # Status codes
    STATUS_UNKNOWN      = 0
    STATUS_NOTAVAILABLE = 1
    STATUS_AVAILABLE    = 2
    STATUS_SCHEDULED    = 3
    STATUS_RENDERING    = 4
    STATUS_ERROR        = 5

    # filename = <0:osfile>$<1:verse>$<2:16-char-md5>$<3:3-digit-count>.png
    BASE_FILE_FORMAT = "{0:.200}${1}$"
    FULL_FILE_FORMAT = "{0:.200}${1}${2}${3:03d}.png"

    # Global stuff. Could be 'per song', but this should be OK too.
    _statuslock = Lock()

    def __init__(self, osfolder="", osfile="", title="", verse="", notes="", lyrics="", composer="", copyright="", songid=None):

        if songid:
            self.md5     = songid
            self._status = self.STATUS_UNKNOWN
        else:
            # Input fields
            self.osfolder       = osfolder
            self.osfile         = osfile
            self.title          = title
            self.copyright      = copyright
            self.composer       = composer
            self.notes          = notes
            self.verse          = verse
            self.lyrics         = lyrics
            self.hyphenfiledate = None

            # Processingfields
            self.InitializeStatus()

    def SafeSwitchStatus(self, fromstatus, tostatus):
        ''' Do a thread-safe Switch from an expected fromstatus to tostatus. If the current status
        is not the fromstatus, no switch will take place. Return True if switched, false otherwise.
        '''
        with SongRecord._statuslock:
            if self._status == fromstatus:
                self._status = tostatus
                return True
        return False

    def InitializeStatus(self):
        self.files   = []
        self._status = self.STATUS_UNKNOWN
        self.osfile  = self.osfile.replace("$","")
        self.verse   = self.verse.replace("$","")
        md5 = hashlib.md5()
        md5.update(self.title.encode())
        md5.update(self.copyright.encode())
        md5.update(self.composer.encode())
        md5.update(self.notes.encode())
        md5.update(self.verse.encode())
        md5.update(self.lyrics.encode())
        self.md5 = md5.hexdigest()

    def GetSongFolder(self, rootdir):
        songfolder = os.path.join(rootdir, self.osfolder)
        os.makedirs(songfolder, exist_ok=True)
        return songfolder

    def MakeFileName(self, index=0):
        if index == 0:
            return self.BASE_FILE_FORMAT.format(self.osfile, self.verse)
        else:
            return self.FULL_FILE_FORMAT.format(self.osfile, self.verse, self.md5, index)

    def IsAvailable(self, cachedir):
        with SongRecord._statuslock:
            if self._status == self.STATUS_AVAILABLE:
                return True
            elif self._status != self.STATUS_UNKNOWN:
                return False
        return self.LoadFromCache(cachedir)

    def IsRendering (self):
        with SongRecord._statuslock:
            return self._status == self.STATUS_RENDERING

    def IsError (self):
        with SongRecord._statuslock:
            return self._status == self.STATUS_ERROR

    def LoadFromCache(self, cachedir):
        if self.SafeSwitchStatus(self.STATUS_UNKNOWN, self.STATUS_RENDERING):
            songfolder = self.GetSongFolder(cachedir)
            self.files = []
            count = 1
            while True:
                songfile = self.MakeFileName(count)
                if not path.isfile( path.join(songfolder, songfile) ):
                    break
                self.files.append(songfile)
                count += 1
            if len(self.files) > 0:
                self.SafeSwitchStatus(self.STATUS_RENDERING, self.STATUS_AVAILABLE)
                return True
            self.SafeSwitchStatus(self.STATUS_RENDERING, self.STATUS_NOTAVAILABLE)
        return False
