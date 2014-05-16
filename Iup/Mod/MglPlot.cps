MODULE IupMglPlot ["iup_mglplot"];
IMPORT Iup := IupLib;

PROCEDURE [ccall] Open*           ["IupMglPlotOpen"          ] ();
PROCEDURE [ccall] New*            ["IupMglPlot"              ] (): Iup.Handle;
PROCEDURE [ccall] Begin*          ["IupMglPlotBegin"         ] (ih: Iup.Handle; dim: INTEGER);
PROCEDURE [ccall] Add1D*          ["IupMglPlotAdd1D"         ] (ih: Iup.Handle; name: Iup.String; y: SHORTREAL);
PROCEDURE [ccall] Add2D*          ["IupMglPlotAdd2D"         ] (ih: Iup.Handle; x, y: SHORTREAL);
PROCEDURE [ccall] Add3D*          ["IupMglPlotAdd3D"         ] (ih: Iup.Handle; x, y, z: SHORTREAL);
PROCEDURE [ccall] End*            ["IupMglPlotEnd"           ] (ih: Iup.Handle): INTEGER;
PROCEDURE [ccall] NewDataSet*     ["IupMglPlotNewDataSet"    ] (ih: Iup.Handle; dim: INTEGER): INTEGER;
PROCEDURE [ccall] Insert1D*       ["IupMglPlotInsert1D"      ] (ih: Iup.Handle; ds_index, sample_index: INTEGER; names: Iup.StringList; VAR y: SHORTREAL; count: INTEGER);
PROCEDURE [ccall] Insert2D*       ["IupMglPlotInsert2D"      ] (ih: Iup.Handle; ds_index, sample_index: INTEGER; VAR x, y: SHORTREAL; count: INTEGER);
PROCEDURE [ccall] Insert3D*       ["IupMglPlotInsert3D"      ] (ih: Iup.Handle; ds_index, sample_index: INTEGER; VAR x, y, z: SHORTREAL; count: INTEGER);
PROCEDURE [ccall] Set1D*          ["IupMglPlotSet1D"         ] (ih: Iup.Handle; ds_index: INTEGER; names: Iup.StringList; VAR y: SHORTREAL; count: INTEGER);
PROCEDURE [ccall] Set2D*          ["IupMglPlotSet2D"         ] (ih: Iup.Handle; ds_index: INTEGER; VAR x, y: SHORTREAL; count: INTEGER);
PROCEDURE [ccall] Set3D*          ["IupMglPlotSet3D"         ] (ih: Iup.Handle; ds_index: INTEGER; VAR x, y, z: SHORTREAL; count: INTEGER);
PROCEDURE [ccall] SetFormula*     ["IupMglPlotSetFormula"    ] (ih: Iup.Handle; ds_index: INTEGER; formulaX, formulaY, formulaZ: Iup.String; count: INTEGER);
PROCEDURE [ccall] SetData*        ["IupMglPlotSetData"       ] (ih: Iup.Handle; ds_index: INTEGER; VAR data: SHORTREAL; count_x, count_y, count_z: INTEGER);
PROCEDURE [ccall] LoadData*       ["IupMglPlotLoadData"      ] (ih: Iup.Handle; ds_index: INTEGER; filename: Iup.String; count_x, count_y, count_z: INTEGER);
PROCEDURE [ccall] SetFromFormula* ["IupMglPlotSetFromFormula"] (ih: Iup.Handle; ds_index: INTEGER; formula: Iup.String; count_x, count_y, count_z: INTEGER);
PROCEDURE [ccall] Transform*      ["IupMglPlotTransform"     ] (ih: Iup.Handle; x, y, z: SHORTREAL; VAR ix, iy: INTEGER);
PROCEDURE [ccall] TransformXYZ*   ["IupMglPlotTransformXYZ"  ] (ih: Iup.Handle; ix, iy: INTEGER; VAR x, y, z: SHORTREAL);
PROCEDURE [ccall] DrawMark*       ["IupMglPlotDrawMark"      ] (ih: Iup.Handle; x, y, z: SHORTREAL);
PROCEDURE [ccall] DrawLine*       ["IupMglPlotDrawLine"      ] (ih: Iup.Handle; x1, y1, z1, x2, y2, z2: SHORTREAL);
PROCEDURE [ccall] DrawText*       ["IupMglPlotDrawText"      ] (ih: Iup.Handle; text: Iup.String; x, y, z: SHORTREAL);
PROCEDURE [ccall] PaintTo*        ["IupMglPlotPaintTo"       ] (ih: Iup.Handle; format: Iup.String; w, h: INTEGER; dpi: SHORTREAL; data: Iup.Pointer);

END IupMglPlot.