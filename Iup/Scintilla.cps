MODULE IupScintilla ["iup_scintilla"];
IMPORT Iup := IupLib;

PROCEDURE [ccall] Open* ["IupScintillaOpen"] ();
PROCEDURE [ccall] New*  ["IupScintilla"    ] (): Iup.Handle;

END IupScintilla.