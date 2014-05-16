MODULE IupPPlot ["iup_pplot"];
IMPORT Iup := IupLib;

PROCEDURE [ccall] Open*            ["IupPPlotOpen"           ] ();
PROCEDURE [ccall] New*             ["IupPPlot"               ] ():  Iup.Handle;
PROCEDURE [ccall] Begin*           ["IupPPlotBegin"          ] (ih: Iup.Handle; strXdata: INTEGER);
PROCEDURE [ccall] Add*             ["IupPPlotAdd"            ] (ih: Iup.Handle; x, y: SHORTREAL);
PROCEDURE [ccall] AddStr*          ["IupPPlotAddStr"         ] (ih: Iup.Handle; x: Iup.String; y: SHORTREAL);
PROCEDURE [ccall] End*             ["IupPPlotEnd"            ] (ih: Iup.Handle): INTEGER;
PROCEDURE [ccall] InsertStr*       ["IupPPlotInsertStr"      ] (ih: Iup.Handle; index, sample_index: INTEGER; x: Iup.String; y: SHORTREAL);
PROCEDURE [ccall] Insert*          ["IupPPlotInsert"         ] (ih: Iup.Handle; index, sample_index: INTEGER; x, y: SHORTREAL);
PROCEDURE [ccall] InsertStrPoints* ["IupPPlotInsertStrPoints"] (ih: Iup.Handle; index, sample_index: INTEGER; x: Iup.StringList; VAR y: SHORTREAL; count: INTEGER);
PROCEDURE [ccall] InsertPoints*    ["IupPPlotInsertPoints"   ] (ih: Iup.Handle; index, sample_index: INTEGER; VAR x, y: SHORTREAL; count: INTEGER);
PROCEDURE [ccall] AddPoints*       ["IupPPlotAddPoints"      ] (ih: Iup.Handle; index: INTEGER; VAR x, y: SHORTREAL; count: INTEGER);
PROCEDURE [ccall] AddStrPoints*    ["IupPPlotAddStrPoints"   ] (ih: Iup.Handle; index: INTEGER; x: Iup.StringList; VAR y: SHORTREAL; count: INTEGER);
PROCEDURE [ccall] Transform*       ["IupPPlotTransform"      ] (ih: Iup.Handle; x, y: SHORTREAL; VAR ix, iy: INTEGER);
PROCEDURE [ccall] TransformTo*     ["IupPPlotTransformTo"    ] (ih: Iup.Handle; x, y: INTEGER; VAR rx, ry: SHORTREAL);
PROCEDURE [ccall] PaintTo*         ["IupPPlotPaintTo"        ] (ih: Iup.Handle; cnv: Iup.Pointer);

END IupPPlot.