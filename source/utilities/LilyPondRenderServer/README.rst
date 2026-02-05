A rendering server for OpenSong using LilyPond to render songs with musical notes
---------------------------------------------------------------------------------

**Prerequisites**: LilyPond, Python 3.4+

This is an external rendering server for OpenSong 2.2+ which renders songs with musical
notes from OpenSong directly to the presentation using LilyPond. The style and format
to be used is described in a LilyPond template file. This way, you can completely customize
the way you want your songe & notes to be rendered.

The latest distributions can be found in the
https://sourceforge.net/p/opensong/code/HEAD/tree/source/utilities/LilyPondRenderServer/dist
folder

Install on any platform with:

    pip3 install LilyPondRenderServer-0.5.2-py3-none-any.whl

On some platforms it's pip instead of pip3.

For Linus, you can use the .deb package to automatically install the Renderer with
all dependencies.

Documentation
-------------

This server renders OpenSong song sheets using Lilypond.

To enable this external renderer in OpenSong, check the following checkbox in OpenSong:
    Settings -> General -> System -> Enable external renderer

You specify a template .ly file where the usual notes, lyrics, etc. are replaced by a
special character sequences. While rendering, each verse of a song gets it's own .ly
file where the special character sequences are replaced with the actual data from Opensong.
You can use the following sequences in the template file to get replaced:

*  $osrtitle : The song title field from OpenSong
*  $osrcopyright : The copyright field from OpenSong
*  $osrauthor : The author field from OpenSong
*  $osrnotes : The notes for the verse
*  $osrverse : The verse number ('V' stripped from the verse or 'C*' replaced with 'Chorus')
*  $osrlyrics : The lyrics for the verse

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
the file should be "custom-hyphen-<languagecode>.txt". For convenience, this file
is re-read when it's changed while the server is running. A sample file for Dutch
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
The cache is NOT invalidated when the template or custom hyphen file(s) change.
The cache is preserved over sessions. So once rendered correctly, you won't need to render
the song the next time you use it (unless you cleared the cache or changed the song).

You can find some example files at
https://sourceforge.net/p/opensong/code/HEAD/tree/source/utilities/LilyPondRenderServer/SampleData/
