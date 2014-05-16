MODULE IupMatrixEx ["iupmatrixex"];
IMPORT Iup := IupLib;

PROCEDURE [ccall] Open* ["IupMatrixExOpen"] ();
PROCEDURE [ccall] New*  ["IupMatrixEx"    ] ():  Iup.Handle;
PROCEDURE [ccall] Init* ["IupMatrixExInit"] (ih: Iup.Handle);

END IupMatrixEx.