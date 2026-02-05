import socketserver
import struct
import sys

from .Logger import *

class ExternalRenderer:
    """
    Extenal renderer processes (render) requests from OpenSong.
    This is a 'proof of concept' renderer.
    """

    PROCESS_TIMEOUT = 1.0
    PROTOCOL_ID = b'OSV1'
    CMD_PREPARE = 2
    CMD_RENDER = 3
    CMD_END_PRESENT = 4
    CMD_PREPARE_RESULT = 2000
    CMD_RENDER_RESULT_XML = 3001
    CMD_RENDER_RESULT_IMG = 3003
    TAG_EXTERNAL_RENDER_ID = 'externalrenderid'

    def __init__(self, socket):
        self._mSocket = socket
        self._mCommandHandlers = {
            self.CMD_PREPARE : self.Prepare,
            self.CMD_RENDER : self.Render,
            self.CMD_END_PRESENT : self.EndPresent
        }

    def DoPrepare(self, width, height, xmltext):
        return xmltext.encode()

    def Prepare(self, payload):
        """
        Send by OpenSong when the presentation is prepared.

        You can optionally modify the presentation and send it back to OpenSong.
        If you send an empty presentation back, the original will be used.
        You have to mark all sheets you want to render yourself with the 'externalrenderid' tag,
        otherwise Render() will not be called for that sheet.
        Hints:
        * You can already start rendering in the background now!
        * You can add your own xml to the presentation. OpenSong will ignore but preserve that.
          For example, add unique IDs (tags) to sheets you render in the background
          (or cached after rendering) so you can easily find them back when OpenSong
          requests for the sheet.
        * You can add sheets or whole sections to the presentation here.
        * You can replace text that's going to be static during the presentation.
        * You can use the comment field for parameters... :-)

        Incomming message format:
            <4-byte presentation width>
            <2-byte presentation height>
            <UTF-8 xml presentation>
        Reply message format:
            <UTF-8 xml presentation>
        """
        try:
            width, height = struct.unpack('!hh', payload[0:4])
            xmltext = payload[4:].decode()
            xmlresult = self.DoPrepare(width, height, xmltext)

            # Send the result:
            self.Reply(self.CMD_PREPARE_RESULT, xmlresult)
            return True
        except Exception as ex:
            LogText("Prepare failed: " + str(ex))
            return False

    def DoRender(self, xmltext):
        return self.CMD_RENDER_RESULT_XML, xmltext.encode(), b''

    def Render(self, payload):
        """
        Send by OpenSong when a sheet needs to be rendered by us.
        
        This is only called for sheets with the 'externalrenderid' tag. You get the
        xml for only this sheet. You can reply with either the rendered image,
        or xml which will be rendered by OpenSong.
        Optionally, you can send back XML for extra sheets you want to be added after the
        current sheet. Might you discover you need more space to render...

        Incomming message format:
            <UTF-8 xml sheet>

        Reply message format:
            <4 byte length of data to be rendered>
            <image data or UTF-8 sheet xml to be rendered>
            <UTF-8 xml for extra sheets>
        """
        try:
            xmltext = payload.decode()
            command, result, extrasheets = self.DoRender(xmltext)

            # Send the result:
            msg = struct.pack('!i', len(result)) + result
            msg += extrasheets
            self.Reply(command, msg)
            return True
        except Exception as ex:
            LogText("Render failed: " + str(ex))
            return False

    def EndPresent(self, payload):
        """
        Send by OpenSong when the presentation ends.
        You can cleanup your resources now.
        No arguments, no reply.
        """
        return False # Will close the socket and thus close this renderer.

    def _ReadExact(self, size):
        result = self._mSocket.recv(size)
        while len(result) < size:
            data  = self._mSocket.recv(size - len(result))
            if len(data) == 0 : return data
            result += data
        return result
        
    def Reply(self, command, payload):
        self._mSocket.send(self.PROTOCOL_ID)
        self._mSocket.send(struct.pack('!hhi', self.msgid, command, len(payload)))
        self._mSocket.sendall(payload)

    def Process(self):
        """
        Processes messages on this socket.
        Returns true to continue, false to quit on this socket.
        <4 byte protocol ID>, to check if we're really comunicating to OpenSong.
        <2 byte MSG ID>, Used for message synchronisation, if OpenSong timed out.
        <2 byte command>
        <4 bytes total bytes following>
        <payload (size: [total bytes following] )>
        """
        self._mSocket.settimeout(None)   # Block
        keepgoing = True
        while keepgoing:
            header = self._ReadExact(12)
            if len(header) == 0:
                LogText('Other side closed the socket.')
                return # Socket closed.
            if header[0:4] != self.PROTOCOL_ID:
                LogText('Other side is not a supported OpenSong protocol.', LogLevel.Error)
                return # No OpenSong.
            self.msgid, command, msgsize = struct.unpack('!hhi', header[4:12])
            payload = b''
            if msgsize > 0:
                payload = self._ReadExact(msgsize)
                if len(payload) == 0:
                    LogText('Other closed the socket while reading a message.', LogLevel.Error)
                    return # Socket closed.
            try:
                if command in self._mCommandHandlers:
                    keepgoing = self._mCommandHandlers[command](payload)
                else:
                    LogText('Invalid command received: ' + str(command), LogLevel.Error)
            except OSError as ex:
                LogText('Renderer error: ' + str(ex), LogLevel.Error)

class ExternalRendererHandler(socketserver.BaseRequestHandler):
    """
    The RequestHandler class for our server.

    It is instantiated once per connection to the server, and must
    override the handle() method to implement communication to the
    client.
    """

    def handle(self):
        LogText("Session started")
        renderer = ExternalRenderer(self.request)
        # fork here!
        renderer.Process()
        LogText("Session ended")

if __name__ == "__main__":
    HOST, PORT = "localhost", 4444

    # Create the server
    server = socketserver.TCPServer((HOST, PORT), ExternalRendererHandler)

    # Activate the server; this will keep running until you
    # interrupt the program with Ctrl-C
    server.serve_forever()
