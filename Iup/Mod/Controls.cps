MODULE IupControls ["iupcontrols"];
IMPORT Iup := IupLib;
CONST
	(* Used by IupColorbar *)
	IUP_PRIMARY*   = -1;
	IUP_SECONDARY* = -2;

PROCEDURE [ccall] Open*         ["IupControlsOpen" ] (): INTEGER;
PROCEDURE [ccall] Close*        ["IupControlsClose"] (); (* for backward compatibility only, does nothing since IUP 3. DEPRECATED. It will be removed in a future version.  *)  
PROCEDURE [ccall] Colorbar*     ["IupColorbar"     ] (): Iup.Handle;
PROCEDURE [ccall] Cells*        ["IupCells"        ] (): Iup.Handle;
PROCEDURE [ccall] ColorBrowser* ["IupColorBrowser" ] (): Iup.Handle;
PROCEDURE [ccall] Gauge*        ["IupGauge"        ] (): Iup.Handle;
PROCEDURE [ccall] Dial*         ["IupDial"         ] (type:   Iup.String): Iup.Handle;
PROCEDURE [ccall] Matrix*       ["IupMatrix"       ] (action: Iup.String): Iup.Handle;
PROCEDURE [ccall] MatrixList*   ["IupMatrixList"   ] (): Iup.Handle;

(* IupMatrix utilities (DEPRECATED, use IupSetAttributeId2 functions). It will be removed in a future version. *)
PROCEDURE [ccall] MatSetAttribute*   ["IupMatSetAttribute"  ] (ih: Iup.Handle; name: Iup.String; lin, col: INTEGER; value: Iup.String);
PROCEDURE [ccall] MatStoreAttribute* ["IupMatStoreAttribute"] (ih: Iup.Handle; name: Iup.String; lin, col: INTEGER; value: Iup.String);
PROCEDURE [ccall] MatGetAttribute*   ["IupMatGetAttribute"  ] (ih: Iup.Handle; name: Iup.String; lin, col: INTEGER): Iup.String;
PROCEDURE [ccall] MatGetInt*         ["IupMatGetInt"        ] (ih: Iup.Handle; name: Iup.String; lin, col: INTEGER): INTEGER;
PROCEDURE [ccall] MatGetFloat*       ["IupMatGetFloat"      ] (ih: Iup.Handle; name: Iup.String; lin, col: INTEGER): SHORTREAL;
PROCEDURE [ccall] MatSetfAttribute*  ["IupMatSetfAttribute" ] (ih: Iup.Handle; name: Iup.String; lin, col: INTEGER; format: Iup.String; null: Iup.Null);

END IupControls.