MODULE IupTuioClient ["iuptuio"];
IMPORT Iup := IupLib;

PROCEDURE [ccall] Open* ["IupTuioOpen"  ] (): INTEGER;
PROCEDURE [ccall] New*  ["IupTuioClient"] (port: INTEGER): Iup.Handle;

END IupTuioClient.