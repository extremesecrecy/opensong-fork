#! /usr/bin/env python3
import pyphen
import re
import os
import subprocess
from string import Template
from threading import Lock
from os import path
from .SongRecord import SongRecord

# Configuration
from .Keys import *
from .Translations import *
from .Logger import *

class HyphenSet:

    def __init__(self, language, customfolder):
        self.language         = language
        self.customhyphens    = {}
        self.modificationtime = None
        self.hyphenator       = None

        try:        
            if language in pyphen.LANGUAGES:
                self.hyphenator = pyphen.Pyphen(lang=language)
                self.customfile = path.join(customfolder, "custom-hyphen-" + language + ".txt")
            else:
                self.hyphenator = pyphen.Pyphen(file=language)
                pathpart, extension = path.splitext(language)
                self.customfile = path.join(pathpart, "-custom" + extension)
            if path.isfile(self.customfile):
                self.LoadCustomHyphen()
            else:
                LogKey(ERR_HYPHENSNOTFOUND, LogLevel.Warning, self.customfile)
        except Exception as ex:
            LogKey(ERR_INNITHYPHENS, LogLevel.Error, language, str(ex))

    def LoadCustomHyphen(self):
        try:
            self.customhyphens = {}
            self.modificationtime = os.stat(self.customfile).st_mtime
            with open(self.customfile) as file:
                for line in file.read().splitlines():
                    # Can be commented with a ;
                    if not line.startswith(";"):
                        parts = line.lower().split(maxsplit=1)
                        if len(parts) >= 2:
                            self.customhyphens[parts[0]] = parts[1]
            LogKey(TXT_LOADEDHYPHENS, LogLevel.Info, self.customfile)
        except Exception as ex:
            LogKey(ERR_LOADHYPHENS, LogLevel.Error, self.customfile, str(ex))

    def UpdateCustomHyphen(self):
        if self.modificationtime and os.stat(self.customfile).st_mtime != self.modificationtime:
            self.LoadCustomHyphen()
            return True
        return False

class LilyPondRenderer:

    def __init__(self, **kwargs):
        vars(self).update(kwargs)
        # Make sure the cache and work folders are there
        os.makedirs(self.workdir, exist_ok=True)
        os.makedirs(self.cachedir, exist_ok=True)
        self.LoadTemplate()
        self._pyphens             = {}
        self._lock                = Lock()
        self.latesthyphenfiledate = 0.0

    def LoadTemplate(self):
        ''' Pre-load the LilyPond template file. If there is no template file with that name yet,
            create one with some handy default content.
        '''
        if not path.isfile(self.lilypondtemplate):
            self.template = r"""\version "2.16.0"

% With 300 dpi, this will result in a 1920 x 1080 = Full HD image.
%#(set! paper-alist (cons '("Full-HD" . (cons (* 6.4 in) (* 3.6 in))) paper-alist))
%\paper { #(set-paper-size "Full-HD") print-page-number = ##f }

% With 400 dpi, this will result in a 1920 x 1080 = Full HD image with bigger scores.
% = 400dpi * 4.8" x 400dpi * 2.7" = 1920 x 1080
#(set! paper-alist (cons '("Full-HD" . (cons (* 4.8 in) (* 2.7 in))) paper-alist))
\paper { #(set-paper-size "Full-HD") print-page-number = ##f }

\header {
  title = \markup \fontsize #-3 \normal-text \italic \with-color #(rgb-color 0 0.2 1) "$osrtitle: $osrverse"
  copyright = "$osrcopyright"
  composer = "$osrauthor"
  tagline = ""
}

\score 
{
  <<
    \new Staff \new Voice = "verse"
    $osrnotes
    \new Lyrics \lyricsto "verse" 
    \lyricmode 
    { 
      \set fontSize = #2.8
      $osrlyrics
    } 
  >> 
}
"""
            os.makedirs(path.dirname(self.lilypondtemplate), exist_ok=True)
            with open(self.lilypondtemplate, "w", encoding="UTF8") as tfile:
                tfile.write(self.template)
        else:
            with open(self.lilypondtemplate) as file:
                self.template = file.read()

    def RenderToCache(self, song):
        command = ''
        try:
            # Replace the configurable items and call the LilyPond rendering command to render the files.
            verse = song.verse
            if verse.startswith('V'):
                verse = verse[1:]
            elif verse.startswith('C'):
                verse = Translate(TXT_CHORUS)
            
            # Optionally auto-hyphenate the lyrics. Disable auto-hyphen if already hyphened.
            hyphenlanguage = song.hyphen or self.defaulthyphenlanguage
            if hyphenlanguage and song.lyrics.find(' -- ') < 0:
                hyphenset = self.LoadHyphen(hyphenlanguage)
                lyrics    = self.HyphenLyrics(song.lyrics, hyphenset)
                song.hyphenfiledate = self.latesthyphenfiledate
            else:
                lyrics = song.lyrics

            # Create a lilypond file by replacing the special items in the template.
            lycontent = Template(self.template).safe_substitute(
                osrtitle=song.title, osrcopyright=song.copyright, osrauthor=song.composer,
                osrnotes=song.notes, osrverse=verse,              osrlyrics=lyrics)
            lilypondfile = path.join(self.workdir, song.md5 + ".ly")
            with open(lilypondfile, 'w', encoding="UTF8") as file:
                file.write(lycontent)

            # Run LilyPond to render the pages.
            command = self.lilypondcommand.format(lilypondfile=lilypondfile, workdir=self.workdir)
            try:
                LogText(subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT, universal_newlines=True))
                ok = True
            except subprocess.CalledProcessError as ex:
                LogKey(ERR_LILYPOND_FAILED, LogLevel.Error, command, ex.output)
                ok = False
            if not self.keeply:
                os.remove(lilypondfile)
            if not ok:
                return False

            # The rendering succeeded. Now pickup the files and rename and move them to desired name / location
            filenames = {}
            songfolder = song.GetSongFolder(self.cachedir)
            for pngfile in os.listdir(self.workdir):
                if pngfile.startswith(song.md5) and pngfile.endswith(".png"):
                    # remove the original filename + the .png extension and the optional '-page' part.
                    basename = pngfile[len(song.md5):-4]
                    if basename.startswith("-page"):
                        basename = basename[5:]
                    if len(basename) > 0:
                        filenames[int(basename)] = pngfile
                    else:
                        filenames[1] = pngfile
            for index in sorted(filenames.keys()):
                filename = filenames[index]
                newname  = song.MakeFileName(index)
                os.rename( path.join(self.workdir, filename), path.join(songfolder, newname) )
                song.files.append(newname)

            # Done. Mark the song as being available.
            song.status = SongRecord.STATUS_AVAILABLE
            return True

        except Exception as ex:
            LogKey(ERR_LILYPOND_FAILED, LogLevel.Error, command, str(ex))
            return False

    def UpdateHyphenFiles(self):
        for hyphenset in self._pyphens.values():
            if hyphenset.UpdateCustomHyphen():
                self.latesthyphenfiledate = max(self.latesthyphenfiledate, hyphenset.modificationtime)

    def LoadHyphen(self, language):
        ''' Load a hyphen language or file. Since the same renderer is used by multiple threads
            and we don't want to load a renderer dictionary for every thread, we must protect the loading.  '''
        with self._lock:
            hyphenset = self._pyphens.get(language)
            if not hyphenset:
                hyphenset = HyphenSet(language, self.customhyphenfolder)
                self._pyphens[language] = hyphenset
            else:
                hyphenset.UpdateCustomHyphen()
        if hyphenset.modificationtime:
            self.latesthyphenfiledate = max(self.latesthyphenfiledate, hyphenset.modificationtime)
        return hyphenset

    def _hyphenwords(self, words, hyphenset):
        ''' This hyphens a collection of words. Words with a ' in them are treated special. '''
        stripnext = False
        for word in words:
            if stripnext:
                word      = word.lstrip()
                stripnext = False
            
            if word:
                if (word[0].isalpha() or word[0] == "'") and word.find("_") < 0:
                    custom = hyphenset.customhyphens.get(word.lower())
                    if custom:
                        stripnext = custom.endswith("_")
                        # Simple first-letter-case support. Needs to be extended.
                        if word[0].isupper():
                            custom = custom[0].upper() + custom[1:]
                        yield custom
                    else:
                        # Not custom hyphened, split on the ' character that we left in to be able to custom-hyphen.
                        # We usually want the parts to be on separate notes, so we add a space between the parts.
                        # But when the part before or after the ' is only 1 character, we probably want to combine them,
                        # so we do NOT add a space in that case.
                        addspace = False
                        addapp   = False
                        for ncword in word.split("'"):
                            addspace = addspace and len(ncword) > 1
                            if addspace:
                                yield " "
                            if addapp:
                                yield "'"
                            else:
                                addapp = True
                            addspace = len(ncword) > 1
                            if hyphenset.hyphenator:
                                yield hyphenset.hyphenator.inserted(ncword, hyphen=' -- ')
                            else:
                                yield word
                else:
                    yield word

    def HyphenLyrics(self, lyrics, hyphenset):
        # return ''.join([self.customhyphen.get(word) or self.defaultpyphen.inserted(word, hyphen=' -- ') if word.isalpha() 
        #                 else word for word in re.findall(r'[^\w]+|\w+', lyrics)])
        # We do keep the ' character as part of the words, to allow them to be custom-hyphened.
        return ''.join(self._hyphenwords(re.findall(r"[^\w_']+|[\w_']+", lyrics), hyphenset))
