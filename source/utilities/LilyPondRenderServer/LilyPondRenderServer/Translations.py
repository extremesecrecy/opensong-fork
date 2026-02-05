from .Keys import *
import locale

translations = {
    'en_US' : {
        CFG_LANGUAGE             : 'Language (restart for the GUI)',
        CFG_START_WITH_SERVER    : 'Start the server when starting the application',
        CFG_PORT                 : 'Server port',
        CFG_HOST                 : 'Host name / IP',
        CFG_THREADS              : 'Number of worker threads',
        CFG_TEMPLATE             : 'Lilypond Template file',
        CFG_COMMAND              : 'Lilypond rendering command',
        CFG_WORKDIR              : 'Work directory for command',
        CFG_CACHEDIR             : 'Cache directory for results',
        CFG_CUSTOMHYPHENFOLDER   : 'Directory with custom hyphenation files',
        CFG_DEFAULTHYPHENLANGUAGE: 'Default hyphenation languate',
        CFG_KEEPLY               : 'Keep the intermediate lilypond files (debug)',
        GUI_GENERIC_SETTINGS     : 'Generic settings',
        GUI_SERVER_SETTINGS      : 'Server settings',
        GUI_LILYPOND_SETTINGS    : 'Lilypond settings',
        GUI_START_SERVER         : 'Start server',
        GUI_STARTED_SERVER       : 'Server started',
        GUI_STOP_SERVER          : 'Stop server',
        GUI_STOPED_SERVER        : 'Server stopped',
        GUI_SAVE_CONFIG          : 'Save configuration',
        TXT_DOCUMENTATION :'''This server renders OpenSong song sheets using Lilypond.

To enable this external renderer in OpenSong, check the following checkbox in OpenSong:
    Settings -> General -> System -> Enable external renderer

You specify a template .ly file where the usual notes, lyrics, etc. are replaced by a
special character sequences. While rendering, each verse of a song gets it's own .ly
file where the special character sequences are replaced with the actual data from Opensong.
You can use the following sequences in the template file to get replaced:
  $osrtitle : The song title field from OpenSong
  $osrcopyright : The copyright field from OpenSong
  $osrauthor : The author field from OpenSong
  $osrnotes : The notes for the verse
  $osrverse : The verse number ('V' stripped from the verse or 'C*' replaced with 'Chorus')
  $osrlyrics : The lyrics for the verse
You can ommit sequences and/or use them multiple times.

Within the song in OpenSong you specify the notes in Staff format used by Lilypond.
The default section for notes is called "[N]". The notes in this section will be used for
all verses without a specific notes section. You can override every verse in a song by adding
a [N<verse>] section. So [NV6] to specify notes only for verse 6 ("[V6]") or "[NC]" to specify
notes for the Chorus. If there is no line in the song starting with "[N", the renderer will
not be active for that song and leave the rendering to OpenSong, as usual.

The renderer will automatically split words into parts to be placed under the notes
(the Lilypond lyric format). For example "mention" will be written to the .ly file as
"men -- tion". This is done using the "pyphen" package, which in turn uses the OpenOffice
hyphenation dictionary and rules. These rules differ for each language. You can specify
the default language to use with the default hyphenation option. You can override this
language per song by adding the following line (with the correct language code)
anywhere in the song in OpenSong:
;$hyphenlanguage=en_US

There are some words that do not hyphen correct with the standard language rules.
Especially words that need hyphenation after the first character of the word.
You can include these words in a special file in you configuration folder. The name of
the file should be "custom-hyphen-<languagecode>.txt". For convenience, this file is 
re-read when it's changed while the server is running. A sample file for Dutch
("custom-hyphen-nl_NL.txt") is available.
Note: You can also influence the word placement with underscores in the lyrics.
You can also choose to do the word-splitting yourself and not use the auto-hyphen
feature. If anywhere in a verse the sequence " -- " is found, that verse is not
auto-hyphened.

Since rendering songs with Lilypond takes some time, which will probably too long
to do in real-time during your presentation, the server will start rendering songs
immediately after starting you presentation, in the order the presentation needs the results.
These results are saved in the cache folder. If you change a verse (notes or lyrics),
the cached version for that verse will automatically be invalidated. The caching does not support
updates to the cache by other applications when the server is running.
The cache is NOT invalidated when the template or custom hyphen file(s) change, however, changing
the custom hyphen file will trigger re-rendering of all songs rendered while the
active instance of the server was running.
The cache is preserved over sessions. So once rendered correctly, you won't need to render
the song the next time you use it (unless you cleared the cache or changed the song).

You can find some example files at
https://sourceforge.net/p/opensong/code/HEAD/tree/source/utilities/LilyPondRenderServer/SampleData/
''',
        TXT_DESCRIPTION          : 'External renderer for OpenSong using LilyPond to render songs with notes',
        TXT_LOADEDHYPHENS        : 'Loaded custom hyphen file "{0}"',
        TXT_CHORUS               : 'Chorus',
        ERR_INNITHYPHENS         : 'Failed initializing hyphenation for language "{0}": {1}',
        ERR_LOADHYPHENS          : 'Failed loading custom hyphen file "{0}": {1}',
        ERR_HYPHENSNOTFOUND      : 'Custom hyphen file "{0}" not found',
        ERR_LILYPOND_FAILED      : 'LilyPond rendering command "{0}" failed: {1}',
        ERR_STARTFAILED          : 'Failed starting the server: {0}'
    },
    'nl_NL' : {
        CFG_LANGUAGE             : 'Taal (herstart voor de GUI)',
        CFG_START_WITH_SERVER    : 'Start de server bij de start van het programma',
        CFG_PORT                 : 'Server poort',
        CFG_HOST                 : 'Host naam / IP',
        CFG_THREADS              : 'Aantal werker threads',
        CFG_TEMPLATE             : 'Lilypond Templatebestand',
        CFG_COMMAND              : 'Lilypond opmaakcommando',
        CFG_WORKDIR              : 'Werkfolder voor het commando',
        CFG_CACHEDIR             : 'Opslagfolder voor het resultaat',
        CFG_CUSTOMHYPHENFOLDER   : 'Folder met eigen woordafbreek bestanden',
        CFG_DEFAULTHYPHENLANGUAGE: 'Standaard woordafbreek taal',
        CFG_KEEPLY               : 'Tijdelijke lilypond bestanden bewaren (debug)',
        GUI_GENERIC_SETTINGS     : 'Algemene instellingen',
        GUI_SERVER_SETTINGS      : 'Server instellingen',
        GUI_LILYPOND_SETTINGS    : 'Lilypond instellingen',
        GUI_START_SERVER         : 'Start server',
        GUI_STARTED_SERVER       : 'Server gestart',
        GUI_STOP_SERVER          : 'Stop server',
        GUI_STOPED_SERVER        : 'Server gestopt',
        GUI_SAVE_CONFIG          : 'Configuratie opslaan',
        TXT_DOCUMENTATION :'''Deze server maakt OpenSong liederen op met Lilypond.

Vink onderstaande optie aan in OpenSong om deze externe renderer te gebruiken:
    Instellingen -> Algemene instellingen -> Systeem -> Externe renderer inschakelen

Je geeft een template .ly file op waarin de gebruikelijke noten, tekst, etc. zijn
vervangen door een speciale teken reeks. Bij het opmaken wordt er voor elke vers
een .ly file gemaakt waarin de speciale tekens worden vervangen door tekst uit
het OpenSong lied. Je kunt de volgende teken reeksen gebruiken:
  $osrtitle : Het lied titel veld uit OpenSong
  $osrcopyright : Het copyright veld uit OpenSong
  $osrauthor : Het auteur veld uit OpenSong
  $osrnotes : De noten voor het vers
  $osrverse : Het vers nummer (de 'V' wordt verwijderd, de 'C*' vervangen door 'Refrein')
  $osrlyrics : De tekst voor het vers
Je kunt reeksen weglaten en/of meerdere keren gebruiken.

In het OpenSong lied kun je de noten in het Staff formaat van Lilypond opgeven.
Het standaard noten 'vers' is "[N]". De noten in dit 'vers' worden voor alle verzen
gebruikt die geen eigen noten hebben. Je kun de noten per vers overschrijven door
een 'vers' toe te voegen met de naam "[N<verse>]". Dus "[NV6]" om vers 6 eigen noten te
geven of "[NC]" om het refrein eigen noten te geven. Als er in het lied nergens een 
regel is die met "[N" begint, is de server voor dat lied niet actief en wordt het
lied door OpenSong opgemaakt, zoals voorheen.

Het opmaak proces zal de woorden automatisch opsplitsen in het Lilypond lyric formaat
zodat de lettergrepen netjes onder de noten komen. Bijvoorbeeld "opmaak" zal als
"op -- maak" in de .ly file worden gezet. Hiervoor wordt gebruik gemaakt van het pakket
"pyphen", wat op zijn beurt gebruik maakt van de OpenOffice afbreek definities. Deze
definities verschillen per taal. Je kunt met de standaard afbreek taal aangeven welke
taal gebruikt moet worden. Ook kun je per lied de taal wijzigen door de volgende regel
ergens in de lied tekst op te nemen (met de gewenste taal):
;$hyphenlanguage=en_US

Er zijn woorden die niet automatisch goed worden afgebroken. Vooral woorden die na de
eerste letter afgebroken moeten worden. Deze woorden kun je opnemen in een eigen
afbreek woordenlijst. De file hiervoor moet in de instellingen folder staan en als
naam hebben: "custom-hyphen-<languagecode>.txt". Voor Nederlands is een voorbeeld
beschikbaar ("custom-hyphen-nl_NL.txt").
Overigens: met het liggende streepje ("_") kun je de woord plaatsing ook beinvloeden.
Je kunt er ook voor kiezen de opdeling in lettergrepen helemaal zelf te doen. Als
er ergens in het vers de tekst " -- " voorkomt, zal er niet automatisch gesplitst
worden.

Het opmaken met Lilypond kost wat tijd. Vermoedelijk meer dan wenselijk bij 'live'
presenteren. Daarom zal de server direct na het opstarten van een presentatie beginnen
met het opmaken van alle gebruikte verzen in de presentatie, in de volgorde waarin ze
nodig zijn. De resultaten worden opgeslagen in de cache folder. Wanneer je de tekst
of noten van een vers veranderd, wordt de versie in de cache automatisch ongeldig gemaakt
en zal het vers de volgende keer opnieuw opgemaakt worden. Het veranderen van de template
of de afbreek lijsten maakt de cache NIET ongeldig. Wel wordt tijdens het draaien
van de server de afbreek lijst automatisch opnieuw geladen als deze veranderd is.
Alle verzen die door deze instantie van de server opgemaakt zijn, zullen dan opnieuw
opgemaakt worden.
De cache blijft bewaard tussen sessies in. Wanneer een lied / vers dus eenmaal is
opgemaakt hoeft deze niet telkens opnieuw opgemaakt te worden wanneer het vers
later opnieuw gebruikt wordt.

Voorbeeld bestanden zijn te vinden op:
https://sourceforge.net/p/opensong/code/HEAD/tree/source/utilities/LilyPondRenderServer/SampleData/
''',
        TXT_DESCRIPTION          : 'External renderer voor OpenSong met gebruik van LilyPond om liederen met bladmuziek op te maken',
        TXT_LOADEDHYPHENS        : 'Bestand "{0}" met eigen woordafbrekingen geladen',
        TXT_CHORUS               : 'Refrein',
        ERR_INNITHYPHENS         : 'Het instellen van woordafbreking voor taal "{0}" is mislukt: {1}',
        ERR_LOADHYPHENS          : 'Het laden van woordafbrekingsbestand "{0}" is mislukt: {1}',
        ERR_HYPHENSNOTFOUND      : 'Woordafbrekingsbestand "{0}" is niet gevonden',
        ERR_LILYPOND_FAILED      : 'LilyPond opdracht "{0}" is mislukt: {1}',
        ERR_STARTFAILED          : 'Kan de server niet starten: {0}'
    }
}

default_translation = translations['en_US']

def GetLanguages():
    return [key for key in translations]

def SetTranslation(language):
    global translation
    translation = translations.get(language, translations['en_US'])

def Translate(key):
    return translation.get(key, default_translation.get(key, key))

languagecode, encoding = locale.getdefaultlocale()
SetTranslation(languagecode)
