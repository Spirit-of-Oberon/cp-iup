MODULE IupGLCanvas ["iupgl"];
IMPORT Iup := IupLib;

PROCEDURE [ccall] Open*        ["IupGLCanvasOpen" ] ();
PROCEDURE [ccall] New*         ["IupGLCanvas"     ] (action: Iup.String): Iup.Handle;
PROCEDURE [ccall] MakeCurrent* ["IupGLMakeCurrent"] (ih: Iup.Handle);
PROCEDURE [ccall] IsCurrent*   ["IupGLIsCurrent"  ] (ih: Iup.Handle): INTEGER;
PROCEDURE [ccall] SwapBuffers* ["IupGLSwapBuffers"] (ih: Iup.Handle);
PROCEDURE [ccall] Palette*     ["IupGLPalette"    ] (ih: Iup.Handle; index: INTEGER; r, g, b: SHORTREAL);
PROCEDURE [ccall] UseFont*     ["IupGLUseFont"    ] (ih: Iup.Handle; first, count, list_base: INTEGER);
PROCEDURE [ccall] Wait*        ["IupGLWait"       ] (gl: INTEGER);

END IupGLCanvas.