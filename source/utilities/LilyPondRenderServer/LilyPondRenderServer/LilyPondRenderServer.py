#! /usr/bin/env python3

# Application environment
import appdirs
import locale
 
# Song render
from .LilyPondRender import LilyPondRenderer
from .SongManager import SongManager
from .SongRecord import SongRecord
from .RenderServer import ExternalRenderer

# Configuration
from .Logger import *
from .Configuration import *

# Misc
from threading import Thread
import pyphen
import socketserver
import xml.etree.ElementTree as ET
from os import path
import re

# We have a global renderer and song manager.
renderer = None
manager = None
server = None

class LilyPondRenderServer(ExternalRenderer):

    def __init__(self, socket):
        ExternalRenderer.__init__(self, socket)
        self.idreplacements = {}
        self.sheetcount     = 0

    def _GenerateSongSheets(self, slidesnode, songpath, name, lyrics, versestorender):
        ''' Adds slides to the 'slidenodes' collection for every verse in 'versestorender'. '''
        verses = {}
        customhyphen = None

        # Split the lyrics in verses (notes verses and lyric verses)
        lines = lyrics.splitlines()
        verseid = ''
        for line in lines:
            if line.startswith(';$hyphenlanguage='):            # This song has it's own hyphen language
                customhyphen = line[17:]
            elif line.startswith('[') and line.find(']') > 0:   # Start of a new verse
                verseid = line[1:line.find(']')]
                verses[verseid] = ''
            elif verseid and line.startswith(' ') and not line.startswith(' ||'):
                    verses[verseid] = verses[verseid] + line + '\n'

        # Create the songs and song sheets for each selected verse.
        for verseid in versestorender:
            if verseid in verses:
                # Lookup a notes verse to this lyric verse and create a song record for verse.
                lyrics      = verses[verseid]
                notes       = verses.get('N' + verseid) or verses.get('N') or ''
                song        = SongRecord(songpath, name, name, verseid, notes, lyrics)
                song.hyphen = customhyphen
                available, song = manager.GetOrSchedule(song)
                if available:
                    # Song already rendered, create slides for each image. In this case, the
                    # 'externalrenderid' points directly to the file.
                    index = 1
                    for filename in song.files:
                        songslide = ET.SubElement(slidesnode, 'slide', {'id':verseid, 'PresentationIndex':str(index), 
                            'externalrenderid':'file:' + path.join(renderer.cachedir, song.osfolder, filename) })
                        bodynode      = ET.SubElement(songslide, 'body')
                        bodynode.text = lyrics
                        index += 1
                else:
                    # Not rendered yet: create a stub-slide. In this case, the 'externalrenderid' contains
                    # a reference to the song, so we can look it up when we need to present the verse.
                    # The song will be rendered in the background (scheduled by 'manager.GetOrSchedule(song)')
                    songslide = ET.SubElement(slidesnode, 'slide', {'id':verseid, 'PresentationIndex':'1',
                        'externalrenderid':'song{0}:{1}'.format(self.sheetcount, song.md5) })
                    bodynode      = ET.SubElement(songslide, 'body')
                    bodynode.text = lyrics
                    self.sheetcount += 1
                    
    def DoPrepare(self, width, height, xmltext):
        ''' This is a call from OpenSong to prepare ourself when the presentation starts.
            We get the full presentation (xmltext) and the size in pixels of the screen to render
            on. In this case, we ignore the size because our template should already match this size.
            You can return any size image: OpenSong will scale it to fit the screen. But an exact
            match will give the best result.
            We see which songs contain notes and replace the slides in that group with our own and
            mark them for the external renderer (= add an 'externalrenderid').
        '''
        # Handy when debugging / building:
        # with open('presentation-opensong.xml', 'w') as presentationfile:
        #     print(xmltext, file=presentationfile)

        # Analyse the presentation, see which sheets we want to render and replace / mark these.
        tree = ET.XML(xmltext)  # From xml text to a nice tree.
        for slidegroup in tree.iterfind('slide_groups/slide_group[@type="song"]'):
            # We try to find the relative path of the song to mimic the same structure in the cache.
            songpath = ''
            pathnode = slidegroup.find('path')
            if pathnode is not None:
                songpath = pathnode.text or ''
                if songpath == '/' or songpath == '\\':
                    songpath = ''
            lyricsnode = slidegroup.find('lyrics')
            if lyricsnode is not None:
                lyrics = lyricsnode.text or ''
                if re.search(r'^\[N', lyrics, re.MULTILINE):    # Do we have notes in this song?
                    slidesnode = slidegroup.find('slides')
                    if slidesnode is not None:
                        # Get a list of all verses we need to present for this song.
                        verses = []
                        lastpresentationindex = None
                        for slide in slidesnode.iter():
                            presentationindex = slide.get('PresentationIndex')  # Each presentation index is one selected verse.
                            verse = slide.get('id')
                            if presentationindex != lastpresentationindex and verse:
                                verses.append(verse)
                                lastpresentationindex = presentationindex
                        # Throw away al existing sheets for the song and generate our own.
                        slidesnode.clear()
                        self._GenerateSongSheets(slidesnode, songpath, slidegroup.get('name',''), lyrics, verses)

        # Return the modified xml tree as xml text.
        return ET.tostring(tree, 'UTF-8')

    def DoRender(self, xmltext):
        ''' This is a call from OpenSong to render this specific sheet. The sheet is in the 'xmltext'. '''

        # The defaults of what we're going to return.
        command     = self.CMD_RENDER_RESULT_XML
        extrasheets = b''
        imagefile   = ''

        # Turn the xml into a nice tree and see what we've got...
        slide = ET.XML(xmltext)
        if slide is not None and slide.tag == 'slide':
            renderid = slide.get('externalrenderid', '')
            verseid  = slide.get('id', '')
            renderid = self.idreplacements.get(renderid, renderid)  # See furtheron in this method...
            # When the renderid starts with 'song', it was not available when the presentation started. Get it now.
            if renderid.startswith('song'):
                available, song = manager.GetOrRender(SongRecord(songid=renderid.split(':')[1]))
                if available:
                    extraslidesnode = ET.Element('slides')
                    index = 1
                    for filename in song.files:
                        fullname = path.join(renderer.cachedir, song.osfolder, filename)
                        if index == 1:
                            # We cannot change the externalrenderid field to 'file' because we return an image and
                            # not the XML. We keep an internal list of replacements, in case we need to render
                            # this sheet again. See above.
                            self.idreplacements[renderid] = 'file:' + fullname
                            imagefile = fullname # Return the first image.
                        else:
                            # We need more than one slide for the song. We couldn't know when the presentation
                            # was prepared. We use the option to return some extra slides to OpenSong and return
                            # the same slides we would have created during preparation.
                            songslide = ET.SubElement(extraslidesnode, 'slide', {'id':verseid, 'PresentationIndex':str(index), 
                                'externalrenderid':'file:' + fullname })
                            ET.SubElement(songslide, 'body')
                        index += 1
                    extrasheets = ET.tostring(extraslidesnode, 'UTF-8')
                # else PANIC! Somehow the renderer was not able to provide us with the song. We'll just
                # return an empty sheet (or add a creative '404' page here :-) )
            
            # For ids starting with 'file', we already had it when starting the presentation
            # and can immediately load and return the file.
            elif renderid.startswith('file:'):
                imagefile = renderid[5:]

        # Normally, we should have an image file here for this renderer. Alternatively, we could have
        # modified the xml (which is not done in this renderer) and return the modified xml.
        # For this renderer, when we failed, we just return the xml (=sheet) we got.
        if imagefile:
            command = self.CMD_RENDER_RESULT_IMG
            with  open(imagefile, "rb") as file:
                result = file.read()
        else:
            result = xmltext.encode()
        return command, result, extrasheets

    @staticmethod
    def GetAutoHyphenLanguages():
        return [language for language in pyphen.LANGUAGES]

    @staticmethod
    def ListAutoHyphenLanguages():
        for language in pyphen.LANGUAGES:
            print(language)

class LilyPondRendererHandler(socketserver.BaseRequestHandler):
    """
    The RequestHandler class for our server.

    It is instantiated once per connection to the server, and must
    override the handle() method to implement communication to the
    client.
    """

    def handle(self):
        global renderer
        LogText("Session started")
        renderer.UpdateHyphenFiles()
        renderserver = LilyPondRenderServer(self.request)
        # fork here!
        renderserver.Process()
        LogText("Session ended")

def startserver(sync=True, **kwargs):
    # The global ones!
    global renderer
    global manager
    global server
    renderer = LilyPondRenderer(**kwargs)
    manager  = SongManager(renderer, kwargs['threads'])

    # Create the server
    try:
        server = socketserver.TCPServer((kwargs['host'], kwargs['port']), LilyPondRendererHandler)

        # Activate the server; this will keep running until you
        # interrupt the program with Ctrl-C
        if sync:
            server.serve_forever()
        else:
            thread = Thread(target=server.serve_forever)
            thread.start()
        return True
    except Exception as ex:
        LogKey(ERR_STARTFAILED, LogLevel.Error, str(ex))
        stopserver()
        return False


def stopserver():
    global server
    global manager
    if server:
        server.shutdown()
        server.server_close()
        server = None
    if manager:
        manager.TerminateNicely()
        manager = None
