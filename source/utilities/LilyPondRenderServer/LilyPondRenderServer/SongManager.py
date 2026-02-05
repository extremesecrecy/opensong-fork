#! /usr/bin/env python3
import time
import os
from threading import Thread
from threading import Lock
from queue import Queue
from .LilyPondRender import LilyPondRenderer
from .SongRecord import SongRecord

def worker(manager):
    while not manager._terminating:
        job = manager._jobs.get()
        if job is None:
            break
        job.run()

class RenderJob:
    def __init__(self, song, manager):
        self.song = song
        self.manager = manager
    
    def run(self):
        # It might already be rendered by someone else.
        if self.song.SafeSwitchStatus(SongRecord.STATUS_SCHEDULED, SongRecord.STATUS_RENDERING):
            self.manager._Render(self.song)

class SongManager:
    ''' Processes jobs in parallel.
    '''
    def __init__(self, renderer, threadcount):
        self.renderer     = renderer
        self._jobs        = Queue()
        self._workers     = []
        self._terminating = False
        self._songs       = {}
        self._songslock   = Lock()
        self._hyphenfiles = []

        # Kick the worker threads into the air.
        for i in range(threadcount):
            thread = Thread(target=worker, args=(self,))
            thread.start()
            self._workers.append(thread)

    def TerminateNicely(self):
        self._terminating = True
        for worker in self._workers:
            self._jobs.put(None)
        for worker in self._workers:
            worker.join()

    def _Register(self, song):
        with self._songslock:
            foundsong = self._songs.get(song.md5)
            if foundsong:
                # Rerender the song if the most recent hyphen file is newer then the last song rendering.
                if foundsong.hyphenfiledate and self.renderer.latesthyphenfiledate > foundsong.hyphenfiledate:
                    foundsong.SafeSwitchStatus(SongRecord.STATUS_AVAILABLE, SongRecord.STATUS_NOTAVAILABLE)
                return foundsong
            else:
                self._songs[song.md5] = song
                return song

    def _Unregister(self, md5):
        with self._songslock:
            if md5 in self._songs:
                del self._songs[md5]

    def _Render(self, song):
        # remove old versions from the cache, prior to generating a new one.
        song.files = []
        songfolder = song.GetSongFolder(self.renderer.cachedir)
        songprefix = song.MakeFileName()
        prefixlen  = len(songprefix)
        for filename in os.listdir(songfolder):
            if filename.startswith(songprefix):
                os.remove(os.path.join(songfolder, filename))
                filemd5 = filename[prefixlen:prefixlen+32]
                if filemd5 != song.md5:
                    self._Unregister(filemd5)

        success = self.renderer.RenderToCache(song)
        if success:
            song.SafeSwitchStatus(SongRecord.STATUS_RENDERING, SongRecord.STATUS_AVAILABLE)
        else:
            song.SafeSwitchStatus(SongRecord.STATUS_RENDERING, SongRecord.STATUS_ERROR)
        return success

    def GetOrSchedule(self, song):
        ''' Try to get a song. If it's available, it return true and you can use the requested song.
        If it's not available, the rendering will be scheduled.
        Returns a boolean that indicates if the song is readily available and the song record.
        '''
        song = self._Register(song)
        if not song.IsAvailable(self.renderer.cachedir):
            if song.SafeSwitchStatus(song.STATUS_NOTAVAILABLE, song.STATUS_SCHEDULED):
                self._jobs.put(RenderJob(song, self))
            return False, song
        else:
            return True, song

    def GetOrRender(self, song, timeout=5):
        ''' Get a song. If it's available, it returns immediately.
        If it's not available, the rendering will be performed immedetely in this thread.
        Returns a boolean that indicates if the song is readily available and the song record.
        '''
        song = self._Register(song)
        if not song.IsAvailable(self.renderer.cachedir):
            # We need it now, but it's not there yet. Render it here and now!
            if song.SafeSwitchStatus(song.STATUS_NOTAVAILABLE, song.STATUS_RENDERING) \
            or song.SafeSwitchStatus(song.STATUS_SCHEDULED, song.STATUS_RENDERING):
                success = self._Render(song)
                return success, song
            else:
                # A worker is already rendering the item. Go busy-waiting for the result (sorry...)
                timeout = timeout * 4 + 1
                while song.IsRendering():
                    timeout -= 1
                    if timeout == 0:
                        return False, song
                    time.sleep(0.25)
                return not song.IsError(), song
        return True, song
