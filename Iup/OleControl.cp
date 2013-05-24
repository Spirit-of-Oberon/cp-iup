MODULE IupOleControl ["iupole"];
IMPORT Iup := IupLib;

PROCEDURE [ccall] Open* ["IupOleControlOpen"] (): INTEGER;
PROCEDURE [ccall] New*  ["IupOleControl"    ] (progid: Iup.String): Iup.Handle;

END IupOleControl.