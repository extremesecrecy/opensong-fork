from .LilyPondRenderServerGUI import showgui
from .LilyPondRenderServer import startserver
from .LilyPondRenderServer import LilyPondRenderServer
from .Configuration import *

import argparse

def main():
    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter,
        description = configuration.appname + ' ' + configuration.version + ': ' + Translate(TXT_DESCRIPTION))
    parser.add_argument('-v', '--version',              action='version', version=configuration.version)
    parser.add_argument('-p', '--' + CFG_PORT,          type=int,
                                                        default=configuration.getint(CFG_SECTION_SERVER, CFG_PORT),
                                                        help='The port to use to listen to for OpenSong render commands')
    parser.add_argument(      '--' + CFG_HOST,          default=configuration.get(CFG_SECTION_SERVER, CFG_HOST),
                                                        help='The host to use when listening')
    parser.add_argument(      '--' + CFG_THREADS,       type=int,
                                                        default=configuration.getint(CFG_SECTION_SERVER, CFG_THREADS),
                                                        help='The amount or parallel worker threads for rendering.')
    parser.add_argument('-t', '--' + CFG_TEMPLATE,      default=configuration.get(CFG_SECTION_LILYPOND, CFG_TEMPLATE), 
                                                        help='The LilyPond template file used to create a .ly file for rendering with LilyPond. '
                                                             'Available substitutes within the file are: $osrtitle, $osrcopyright, $osrauthor, $osrnotes, $osrverse, $osrlyrics')
    parser.add_argument('-c', '--' + CFG_COMMAND,       default=configuration.get(CFG_SECTION_LILYPOND, CFG_COMMAND), 
                                                        help='The lilypond shell command to execute for rendering. Use {workdir} and {lilypondfile} to be substituted with the respective values.')
    parser.add_argument('-w', '--' + CFG_WORKDIR,       default=configuration.get(CFG_SECTION_LILYPOND, CFG_WORKDIR),
                                                        help='Folder used as temporary work directory for LilyPond')
    parser.add_argument('-s', '--' + CFG_CACHEDIR,      default=configuration.get(CFG_SECTION_LILYPOND, CFG_CACHEDIR),
                                                        help='Folder used as cache to store the generated images')
    parser.add_argument('-l', '--' + CFG_DEFAULTHYPHENLANGUAGE, default=configuration.get(CFG_SECTION_LILYPOND, CFG_DEFAULTHYPHENLANGUAGE),
                                                        help='Specify the default language to automatically hyphenate the songs. Can be overwritter per song with ;$hyphenlanguage=xx_XX')
    parser.add_argument(      '--' + CFG_KEEPLY,        action='store_true',
                                                        default=configuration.getboolean(CFG_SECTION_LILYPOND, CFG_KEEPLY),
                                                        help='Do not delete the .ly files from the workdir')
    parser.add_argument('-f', '--' + CFG_CUSTOMHYPHENFOLDER, default=configuration.get(CFG_SECTION_LILYPOND, CFG_CUSTOMHYPHENFOLDER),
                                                        help='Folder to seach for custom hyphen files with customized hyphenations per line. E.g.: overvloed o -- ver -- vloed')
    parser.add_argument(      '--' + CFG_LANGUAGE,      default=configuration.get(CFG_SECTION_GENERIC, CFG_LANGUAGE),
                                                        help='The language to use for the server')
    parser.add_argument('--hyphenlanguages',            action='store_true', default=False,
                                                        help='Do not start the server but give a list of available languages for autohyphen')
    parser.add_argument(      '--nogui',                action='store_true', default=False,
                                                        help='Don\'t display the GUI but directly start the server')
    args = parser.parse_args()
    configuration.SetArgs(**vars(args))

    if args.hyphenlanguages:
        LilyPondRenderServer.ListAutoHyphenLanguages()
    elif args.nogui:
        startserver(**vars(args))
    else:
        showgui()
