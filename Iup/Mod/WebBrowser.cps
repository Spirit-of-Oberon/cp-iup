MODULE IupWebBrowser ["iupweb"];
IMPORT Iup := IupLib;

PROCEDURE [ccall] Open* ["IupWebBrowserOpen"] (): INTEGER;
PROCEDURE [ccall] New*  ["IupWebBrowser"    ] (): Iup.Handle;

END IupWebBrowser.