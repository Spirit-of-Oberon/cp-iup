(**
 * IUP - A Portable User Interface Toolkit
 * Tecgraf: Computer Graphics Technology Group, PUC-Rio, Brazil
 * http://www.tecgraf.puc-rio.br/iup  mailto:iup@tecgraf.puc-rio.br
 *)
MODULE IupLib ["iup"];

CONST
    NAME* = "IUP - Portable User Interface";
    COPYRIGHT* = "Copyright (C) 1994-2014 Tecgraf, PUC-Rio.";
    DESCRIPTION* = "Multi-platform toolkit for building graphical user interfaces.";
    VERSION* = "3.10";
    VERSION_NUMBER* = 310000;
    VERSION_DATE* = "2014/01/17";
    
    (* Common Return Values *)

    ERROR*      =   1;
    NOERROR*    =   0;
    OPENED*     =  -1;
    INVALID*    =  -1;
    INVALID_ID* = -10;

    (* Callback Return Values *)

    IGNORE*    = -1;
    DEFAULT*   = -2;
    CLOSE_*    = -3;
    CONTINUE*  = -4;

    (* IupPopup and IupShowXY Parameter Values *)

    CENTER*        = 0FFFFH;  (* 65535 *)
    LEFT*          = 0FFFEH;  (* 65534 *)
    RIGHT*         = 0FFFDH;  (* 65533 *)
    MOUSEPOS*      = 0FFFCH;  (* 65532 *)
    CURRENT*       = 0FFFBH;  (* 65531 *)
    CENTERPARENT*  = 0FFFAH;  (* 65530 *)
    TOP*           = LEFT  ;
    BOTTOM*        = RIGHT ;

    (* SHOW_CB Callback Values *)

    SHOW*     = 0;
    RESTORE*  = 1;
    MINIMIZE* = 2;
    MAXIMIZE* = 3;
    HIDE*     = 4;

    (* SCROLL_CB Callback Values *)

    SBUP*      =  0;
    SBDN*      =  1;
    SBPGUP*    =  2;
    SBPGDN*    =  3;
    SBPOSV*    =  4;
    SBDRAGV*   =  5;
    SBLEFT*    =  6;
    SBRIGHT*   =  7;
    SBPGLEFT*  =  8;
    SBPGRIGHT* =  9;
    SBPOSH*    = 10;
    SBDRAGH*   = 11;

    (* Mouse Button Values and Macros *)

    BUTTON1* = '1';
    BUTTON2* = '2';
    BUTTON3* = '3';
    BUTTON4* = '4';
    BUTTON5* = '5';

    (* Pre-Defined Masks *)

    MASK_FLOAT*  = "[+/-]?(/d+/.?/d*|/./d+)";
    MASK_UFLOAT* = "(/d+/.?/d*|/./d+)";
    MASK_EFLOAT* = "[+/-]?(/d+/.?/d*|/./d+)([eE][+/-]?/d+)?";
    MASK_INT*    = "[+/-]?/d+";
    MASK_UINT*   = "/d+";

    (* IupGetParam Callback situations *)

    GETPARAM_OK*     = -1;
    GETPARAM_INIT*   = -2;
    GETPARAM_CANCEL* = -3;
    GETPARAM_HELP*   = -4;

    (* Record Input Modes *)

    RECBINARY* = 0;
    RECTEXT*   = 1;

TYPE
    Handle*      = POINTER TO LIMITED RECORD [untagged] END;
    HandleList*  = ARRAY OF Handle;
    String*      = POINTER TO ARRAY [untagged] OF SHORTCHAR;
    StringList*  = ARRAY OF String;    
    Pointer*     = POINTER TO EXTENSIBLE RECORD END;
    PointerList* = ARRAY OF Pointer;
    Callback*    = INTEGER;  
    Paramcb*     = PROCEDURE [ccall] (dialog: Handle; param_index: INTEGER; user_data: Pointer);
    Null*        = POINTER TO RECORD [untagged] END;    

(* MAIN API *)
    
PROCEDURE [ccall] Open*          ["IupOpen"         ] (VAR [nil] argc: INTEGER; VAR [nil] argv: POINTER TO StringList): INTEGER;
PROCEDURE [ccall] Close*         ["IupClose"        ];
PROCEDURE [ccall] ImageLibOpen*  ["IupImageLibOpen" ];
PROCEDURE [ccall] MainLoop*      ["IupMainLoop"     ] (): INTEGER;
PROCEDURE [ccall] LoopStep*      ["IupLoopStep"     ] (): INTEGER;
PROCEDURE [ccall] LoopStepWait*  ["IupLoopStepWait" ] (): INTEGER;
PROCEDURE [ccall] MainLoopLevel* ["IupMainLoopLevel"] (): INTEGER;
PROCEDURE [ccall] Flush*         ["IupFlush"        ];
PROCEDURE [ccall] ExitLoop*      ["IupExitLoop"     ];

PROCEDURE [ccall] RecordInput* ["IupRecordInput"  ] (filename: String; mode: INTEGER): INTEGER;
PROCEDURE [ccall] PlayInput*   ["IupPlayInput"    ] (filename: String): INTEGER;

PROCEDURE [ccall] Update*          ["IupUpdate"         ] (ih: Handle);
PROCEDURE [ccall] UpdateChildren*  ["IupUpdateChildren" ] (ih: Handle);
PROCEDURE [ccall] Redraw*          ["IupRedraw"         ] (ih: Handle; children: INTEGER);
PROCEDURE [ccall] Refresh*         ["IupRefresh"        ] (ih: Handle);
PROCEDURE [ccall] RefreshChildren* ["IupRefreshChildren"] (ih: Handle);

PROCEDURE [ccall] Help*       ["IupHelp"      ] (url:        String): INTEGER;
PROCEDURE [ccall] Load*       ["IupLoad"      ] (filename:   String): String;
PROCEDURE [ccall] LoadBuffer* ["IupLoadBuffer"] (buffer:      String): String;

PROCEDURE [ccall] Version*       ["IupVersion"      ] (): String;
PROCEDURE [ccall] VersionDate*   ["IupVersionDate"  ] (): String;
PROCEDURE [ccall] VersionNumber* ["IupVersionNumber"] (): INTEGER;

PROCEDURE [ccall] SetLanguage*   ["IupSetLanguage"  ] (lng: String);
PROCEDURE [ccall] GetLanguage*   ["IupGetLanguage"  ] (): String;
PROCEDURE [ccall] SetLanguageString*   ["IupSetLanguageString"  ] (name, str: String);
PROCEDURE [ccall] StoreLanguageString* ["IupStoreLanguageString"] (name, str: String);
PROCEDURE [ccall] GetLanguageString*   ["IupGetLanguageString"  ] (name: String): String;
PROCEDURE [ccall] SetLanguagePack*     ["IupSetLanguagePack"    ] (ih:   Handle);

PROCEDURE [ccall] Destroy*        ["IupDestroy"       ] (ih:    Handle);   
PROCEDURE [ccall] Detach*         ["IupDetach"        ] (child: Handle);
PROCEDURE [ccall] Append*         ["IupAppend"        ] (ih, child: Handle): Handle;
PROCEDURE [ccall] Insert*         ["IupInsert"        ] (ih, ref_child, child: Handle): Handle;
PROCEDURE [ccall] GetChild*       ["IupGetChild"      ] (ih: Handle; pos: INTEGER): Handle;
PROCEDURE [ccall] GetChildPos*    ["IupGetChildPos"   ] (ih, child: Handle): INTEGER;       
PROCEDURE [ccall] GetChildCount*  ["IupGetChildCount" ] (ih: Handle): INTEGER;          
PROCEDURE [ccall] GetNextChild*   ["IupGetNextChild"  ] (ih, child: Handle): Handle;       
PROCEDURE [ccall] GetBrother*     ["IupGetBrother"    ] (ih: Handle): Handle;  
PROCEDURE [ccall] GetParent*      ["IupGetParent"     ] (ih: Handle): Handle;  
PROCEDURE [ccall] GetDialog*      ["IupGetDialog"     ] (ih: Handle): Handle;  
PROCEDURE [ccall] GetDialogChild* ["IupGetDialogChild"] (ih: Handle; name: String): Handle;       
PROCEDURE [ccall] Reparent*       ["IupReparent"      ] (ih, new_parent, ref_child: Handle): INTEGER;

PROCEDURE [ccall] Popup*  ["IupPopup" ] (ih: Handle; x, y: INTEGER): INTEGER;
PROCEDURE [ccall] Show*   ["IupShow"  ] (ih: Handle): INTEGER;
PROCEDURE [ccall] ShowXY* ["IupShowXY"] (ih: Handle; x, y: INTEGER): INTEGER;
PROCEDURE [ccall] Hide*   ["IupHide"  ] (ih: Handle): INTEGER;
PROCEDURE [ccall] Map*    ["IupMap"   ] (ih: Handle): INTEGER;
PROCEDURE [ccall] Unmap*  ["IupUnmap" ] (ih: Handle);

PROCEDURE [ccall] ResetAttribute*   ["IupResetAttribute"  ] (ih: Handle; name: String);          
PROCEDURE [ccall] GetAllAttributes* ["IupGetAllAttributes"] (ih: Handle; names: StringList; n: INTEGER): INTEGER;
(*
PROCEDURE [ccall] SetAtt*         ["IupSetAtt"] (handle_name: String; ih: Handle; name: String; ...): Handle;*)
PROCEDURE [ccall] SetAttributes*  ["IupSetAttributes"] (ih: Handle; str:  String): Handle;
PROCEDURE [ccall] GetAttributes*  ["IupGetAttributes"] (ih: Handle): String;

PROCEDURE [ccall] SetAttribute*    ["IupSetAttribute"   ] (ih: Handle; name, value: String);
PROCEDURE [ccall] SetStrAttribute* ["IupSetStrAttribute"] (ih: Handle; name, value: String);
(*
PROCEDURE [ccall] SetStrf*  ["IupSetStrf" ] (ih: Handle; name, format: String; ...);*)
PROCEDURE [ccall] SetInt*   ["IupSetInt"  ] (ih: Handle; name: String; value: INTEGER);
PROCEDURE [ccall] SetFloat* ["IupSetFloat"] (ih: Handle; name: String; value: SHORTREAL);
PROCEDURE [ccall] SetRGB*   ["IupSetRGB"  ] (ih: Handle; name: String; r, g, b: SHORTCHAR);

PROCEDURE [ccall] GetAttribute* ["IupGetAttribute"  ] (ih: Handle; name: String): String;
PROCEDURE [ccall] GetInt*       ["IupGetInt"        ] (ih: Handle; name: String): INTEGER;  
PROCEDURE [ccall] GetInt2*      ["IupGetInt2"       ] (ih: Handle; name: String): INTEGER;      
PROCEDURE [ccall] GetIntInt*    ["IupGetIntInt"     ] (ih: Handle; name: String; i1, i2: INTEGER): INTEGER;      
PROCEDURE [ccall] GetFloat*     ["IupGetFloat"      ] (ih: Handle; name: String): SHORTREAL; 
PROCEDURE [ccall] GetRGB*       ["IupGetRGB"        ] (ih: Handle; name: String; VAR r, g, b: SHORTCHAR);

PROCEDURE [ccall] SetAttributeId*    ["IupSetAttributeId"   ] (ih: Handle; name: String; id: INTEGER; value: String);
PROCEDURE [ccall] SetStrAttributeId* ["IupSetStrAttributeId"] (ih: Handle; name: String; id: INTEGER; value: String);
(*
PROCEDURE [ccall] SetStrfId*  ["IupSetStrfId" ] (ih: Handle; name: String; id: INTEGER; value: format; ...);*)
PROCEDURE [ccall] SetIntId*   ["IupSetIntId"  ] (ih: Handle; name: String; id: INTEGER; value: INTEGER);
PROCEDURE [ccall] SetFloatId* ["IupSetFloatId"] (ih: Handle; name: String; id: INTEGER; value: SHORTREAL);
PROCEDURE [ccall] SetRGBId*   ["IupSetRGBId"  ] (ih: Handle; name: String; id: INTEGER; r, g, b: SHORTCHAR);

PROCEDURE [ccall] GetAttributeId* ["IupGetAttributeId"] (ih: Handle; name: String; id: INTEGER);     
PROCEDURE [ccall] GetIntId*       ["IupGetIntId"      ] (ih: Handle; name: String; id: INTEGER); 
PROCEDURE [ccall] GetFloatId*     ["IupGetFloatId"    ] (ih: Handle; name: String; id: INTEGER); 
PROCEDURE [ccall] GetRGBId*       ["IupGetRGBId"      ] (ih: Handle; name: String; id: INTEGER; VAR r, g, b: SHORTCHAR);

PROCEDURE [ccall] SetAttributeId2*    ["IupSetAttributeId2"   ] (ih: Handle; name: String; lin, col: INTEGER; value: String);
PROCEDURE [ccall] SetStrAttributeId2* ["IupSetStrAttributeId2"] (ih: Handle; name: String; lin, col: INTEGER; value: String);
(*
PROCEDURE [ccall] SetStrfId2*  ["IupSetStrfId2"  ] (ih: Handle; name: String; lin, col: INTEGER; value: format; ...);*)
PROCEDURE [ccall] SetIntId2*   ["IupSetIntId2"   ] (ih: Handle; name: String; lin, col: INTEGER; value: INTEGER);
PROCEDURE [ccall] SetFloatId2* ["IupSetFloatId2" ] (ih: Handle; name: String; lin, col: INTEGER; value: SHORTREAL);
PROCEDURE [ccall] SetRGBId2*   ["IupSetRGBId2"   ] (ih: Handle; name: String; lin, col: INTEGER; r, g, b: SHORTCHAR);

PROCEDURE [ccall] GetAttributeId2* ["IupGetAttributeId2"  ] (ih: Handle; name: String; lin, col: INTEGER);         
PROCEDURE [ccall] GetIntId2*       ["IupGetIntId2"        ] (ih: Handle; name: String; lin, col: INTEGER); 
PROCEDURE [ccall] GetFloatId2*     ["IupGetFloatId2"      ] (ih: Handle; name: String; lin, col: INTEGER);     
PROCEDURE [ccall] GetRGBId2*       ["IupGetRGBId2"        ] (ih: Handle; name: String; lin, col: INTEGER; VAR r, g, b: SHORTCHAR);

PROCEDURE [ccall] SetGlobal*    ["IupSetGlobal"  ] (name, value: String);   
PROCEDURE [ccall] SetStrGlobal* ["IupSetStrGlobal"] (name, value: String);
PROCEDURE [ccall] GetGlobal*    ["IupGetGlobal"  ] (name: String): String;

PROCEDURE [ccall] SetFocus*      ["IupSetFocus"     ] (ih: Handle): Handle; 
PROCEDURE [ccall] GetFocus*      ["IupGetFocus"     ] (): Handle; 
PROCEDURE [ccall] PreviousField* ["IupPreviousField"] (ih: Handle): Handle;     
PROCEDURE [ccall] NextField*     ["IupNextField"    ] (ih: Handle): Handle; 

PROCEDURE [ccall] GetCallback*   ["IupGetCallback" ] (ih: Handle; name: String): Callback;
PROCEDURE [ccall] SetCallback*   ["IupSetCallback" ] (ih: Handle; name: String; func: Callback): Callback;
(*
PROCEDURE [ccall] SetCallbacks*  ["IupSetCallbacks"] (ih: Handle; name: String; func: Callback; ...): Handle;*)

PROCEDURE [ccall] GetFunction*   ["IupGetFunction"  ] (name: String): Callback;
PROCEDURE [ccall] SetFunction*   ["IupSetFunction"  ] (name: String; func: Callback): Callback;

PROCEDURE [ccall] GetHandle*     ["IupGetHandle"    ] (name: String): Handle;  
PROCEDURE [ccall] SetHandle*     ["IupSetHandle"    ] (name: String; ih: Handle): Handle;  
PROCEDURE [ccall] GetAllNames*   ["IupGetAllNames"  ] (names: StringList; n: INTEGER): INTEGER;    
PROCEDURE [ccall] GetAllDialogs* ["IupGetAllDialogs"] (names: StringList; n: INTEGER): INTEGER;
PROCEDURE [ccall] GetName*       ["IupGetName"      ] (ih: Handle): String;

PROCEDURE [ccall] SetAttributeHandle*       ["IupSetAttributeHandle"      ] (ih: Handle; name: String; ih_named: Handle);             
PROCEDURE [ccall] GetAttributeHandle*       ["IupGetAttributeHandle"      ] (ih: Handle; name: String): Handle; 
            
PROCEDURE [ccall] GetClassName*             ["IupGetClassName"            ] (ih: Handle): String;       
PROCEDURE [ccall] GetClassType*             ["IupGetClassType"            ] (ih: Handle): String;       
PROCEDURE [ccall] GetAllClasses*            ["IupGetAllClasses"           ] (names: StringList; n: INTEGER): INTEGER;
PROCEDURE [ccall] GetClassAttributes*       ["IupGetClassAttributes"      ] (classname: String; names: StringList; n: INTEGER): INTEGER;  

PROCEDURE [ccall] GetClassCallbacks*        ["IupGetClassCallbacks"       ] (classname: String; names: StringList; n: INTEGER): INTEGER;
PROCEDURE [ccall] SaveClassAttributes*      ["IupSaveClassAttributes"     ] (ih: Handle);              
PROCEDURE [ccall] CopyClassAttributes*      ["IupCopyClassAttributes"     ] (src_ih, dst_ih: Handle);              
PROCEDURE [ccall] SetClassDefaultAttribute* ["IupSetClassDefaultAttribute"] (classname, name, value: String);                   
PROCEDURE [ccall] ClassMatch*               ["IupClassMatch"              ] (ih: Handle; classname: String): INTEGER;     
PROCEDURE [ccall] Create*                   ["IupCreate"                  ] (classname: String): Handle; 
PROCEDURE [ccall] Createv*                  ["IupCreatev"                 ] (classname: String; params: PointerList): Handle;  
PROCEDURE [ccall] Createp*                  ["IupCreatep"                 ] (classname: String; first: Pointer; null: Null): Handle;

(* ELEMENTS *)

PROCEDURE [ccall] Fill*        ["IupFill"       ] (): Handle;  
PROCEDURE [ccall] Radio*       ["IupRadio"      ] (child: Handle): Handle;   
PROCEDURE [ccall] Vbox*        ["IupVbox"       ] (child: Handle; null: Null): Handle;
PROCEDURE [ccall] Vboxv*       ["IupVboxv"      ] (children: HandleList): Handle;  
PROCEDURE [ccall] Zbox*        ["IupZbox"       ] (child: Handle; null: Null): Handle;
PROCEDURE [ccall] Zboxv*       ["IupZboxv"      ] (children: HandleList): Handle; 
PROCEDURE [ccall] Hbox*        ["IupHbox"       ] (child: Handle; null: Null): Handle;  
PROCEDURE [ccall] Hboxv*       ["IupHboxv"      ] (children: HandleList): Handle;
PROCEDURE [ccall] Normalizer*  ["IupNormalizer" ] (ih_first: Handle; null: Null): Handle;        
PROCEDURE [ccall] Normalizerv* ["IupNormalizerv"] (ih_list: HandleList): Handle;

PROCEDURE [ccall] Cbox*          ["IupCbox"         ] (child: Handle; null: Null): Handle;  
PROCEDURE [ccall] Cboxv*         ["IupCboxv"        ] (children: HandleList): Handle;
PROCEDURE [ccall] Sbox*          ["IupSbox"         ] (child: Handle): Handle;  
PROCEDURE [ccall] Split*         ["IupSplit"        ] (child1, child2: Handle): Handle;   
PROCEDURE [ccall] ScrollBox*     ["IupScrollBox"    ] (child: Handle): Handle; 
PROCEDURE [ccall] GridBox*       ["IupGridBox"      ] (child: Handle; null: Null): Handle; 
PROCEDURE [ccall] GridBoxv*      ["IupGridBoxv"     ] (children: HandleList): Handle;
PROCEDURE [ccall] Expander*      ["IupExpander"     ] (child: Handle): Handle;
PROCEDURE [ccall] DetachBox*     ["IupDetachBox"    ] (child: Handle): Handle;
PROCEDURE [ccall] BackgroundBox* ["IupBackgroundBox"] (child: Handle): Handle;
      
PROCEDURE [ccall] Frame*       ["IupFrame"      ] (child: Handle): Handle;

PROCEDURE [ccall] Image*       ["IupImage"      ] (width, height: INTEGER; pixmap: String): Handle;   
PROCEDURE [ccall] ImageRGB*    ["IupImageRGB"   ] (width, height: INTEGER; pixmap: String): Handle;      
PROCEDURE [ccall] ImageRGBA*   ["IupImageRGBA"  ] (width, height: INTEGER; pixmap: String): Handle; 

PROCEDURE [ccall] Item*        ["IupItem"       ] (title, action: String): Handle;  
PROCEDURE [ccall] Submenu*     ["IupSubmenu"    ] (title: String; child: Handle): Handle;     
PROCEDURE [ccall] Separator*   ["IupSeparator"  ] (): Handle;       
PROCEDURE [ccall] Menu*        ["IupMenu"       ] (child: Handle; null: Null): Handle;
PROCEDURE [ccall] Menuv*       ["IupMenuv"      ] (children: HandleList): Handle;

PROCEDURE [ccall] Button*      ["IupButton"     ] (title, action: String): Handle;    
PROCEDURE [ccall] Canvas*      ["IupCanvas"     ] (action: String): Handle;    
PROCEDURE [ccall] Dialog*      ["IupDialog"     ] (child: Handle): Handle;    
PROCEDURE [ccall] User*        ["IupUser"       ] (): Handle;  
PROCEDURE [ccall] Label*       ["IupLabel"      ] (title: String): Handle;   
PROCEDURE [ccall] List*        ["IupList"       ] (action: String): Handle;  
PROCEDURE [ccall] Text*        ["IupText"       ] (action: String): Handle;  
PROCEDURE [ccall] MultiLine*   ["IupMultiLine"  ] (action: String): Handle;       
PROCEDURE [ccall] Toggle*      ["IupToggle"     ] (title, action: String): Handle;    
PROCEDURE [ccall] Timer*       ["IupTimer"      ] (): Handle;   
PROCEDURE [ccall] Clipboard*   ["IupClipboard"  ] (): Handle;       
PROCEDURE [ccall] ProgressBar* ["IupProgressBar"] (): Handle;         
PROCEDURE [ccall] Val*         ["IupVal"        ] (type: String): Handle; 
PROCEDURE [ccall] Tabs*        ["IupTabs"       ] (child: Handle; null: Null): Handle;
PROCEDURE [ccall] Tabsv*       ["IupTabsv"      ] (children: HandleList): Handle;   
PROCEDURE [ccall] Tree*        ["IupTree"       ] (): Handle;
PROCEDURE [ccall] Link*        ["IupLink"       ] (url, title: String): Handle;

(* Old controls, use SPIN attribute of IupText *)
PROCEDURE [ccall] Spin*    ["IupSpin"   ] (): Handle;
PROCEDURE [ccall] Spinbox* ["IupSpinbox"] (child: Handle): Handle;

(* UTILITIES *)

(* IupImage utility *)
PROCEDURE [ccall] SaveImageAsText* ["IupSaveImageAsText"] (ih: Handle; file_name, format, name: String): INTEGER;

(* IupText and IupScintilla utilities *)
PROCEDURE [ccall] TextConvertLinColToPos* ["IupTextConvertLinColToPos"] (ih: Handle; lin, col: INTEGER; OUT pos: INTEGER);
PROCEDURE [ccall] TextConvertPosToLinCol* ["IupTextConvertPosToLinCol"] (ih: Handle; pos: INTEGER; OUT lin, col: INTEGER);

(* IupText, IupList, IupTree, IupMatrix and IupScintilla utility *)
PROCEDURE [ccall] ConvertXYToPos* ["IupConvertXYToPos"] (ih: Handle; x, y: INTEGER): INTEGER;

(* OLD names, kept for backward compatibility, will never be removed. *)
PROCEDURE [ccall] StoreGlobal*    ["IupStoreGlobal"   ] (name, value: String);
PROCEDURE [ccall] StoreAttribute* ["IupStoreAttribute"] (ih: Handle; name, value: String);
(*
PROCEDURE [ccall] SetfAttribute*     ["IupSetfAttribute"    ] (ih: Handle; name, format: String; ...);*)
PROCEDURE [ccall] StoreAttributeId*  ["IupStoreAttributeId" ] (ih: Handle; name: String; id: INTEGER; value: String);
(*
PROCEDURE [ccall] SetfAttributeId*   ["IupSetfAttributeId"  ] (ih: Handle; name: String; id: INTEGER; format: String; ...);*)
PROCEDURE [ccall] StoreAttributeId2* ["IupStoreAttributeId2"] (ih: Handle; name: String; lin, col: INTEGER; value: String);
(*
PROCEDURE [ccall] SetfAttributeId2*  ["IupSetfAttributeId2" ] (ih: Handle; name: String; lin, col: INTEGER; format: String; ...);*)

(* IupTree utilities *)
PROCEDURE [ccall] TreeSetUserId* ["IupTreeSetUserId"] (ih: Handle; id: INTEGER; userid: Pointer): INTEGER;
PROCEDURE [ccall] TreeGetUserId* ["IupTreeGetUserId"] (ih: Handle; id: INTEGER): Pointer;
PROCEDURE [ccall] TreeGetId*     ["IupTreeGetId"    ] (ih: Handle; userid: Pointer): INTEGER;
PROCEDURE [ccall] TreeSetAttributeHandle* ["IupTreeSetAttributeHandle"] (ih: Handle; name: String; id: INTEGER; ih_named: Handle);

(* DEPRECATED IupTree utilities, use Iup*AttributeId functions. It will be removed in a future version. *)
PROCEDURE [ccall] TreeSetAttribute*   ["IupTreeSetAttribute"  ] (ih: Handle; name: String; id: INTEGER; value: String);      
PROCEDURE [ccall] TreeStoreAttribute* ["IupTreeStoreAttribute"] (ih: Handle; name: String; id: INTEGER; value: String);       
PROCEDURE [ccall] TreeGetAttribute*   ["IupTreeGetAttribute"  ] (ih: Handle; name: String; id: INTEGER): String;      
PROCEDURE [ccall] TreeGetInt*         ["IupTreeGetInt"        ] (ih: Handle; name: String; id: INTEGER): INTEGER;
PROCEDURE [ccall] TreeGetFloat*       ["IupTreeGetFloat"      ] (ih: Handle; name: String; id: INTEGER): SHORTREAL;  
(*
PROCEDURE [ccall] TreeSetfAttribute*  ["IupTreeSetfAttribute" ] (ih: Handle; name: String; id: INTEGER; format: String; ...);*)

(* DEPRECATED callback management. It will be removed in a future version. *)
PROCEDURE [ccall] GetActionName* ["IupGetActionName"] (): String;

(* DEPRECATED font names. It will be removed in a future version.  *)
PROCEDURE [ccall] MapFont*    ["IupMapFont"   ] (iupfont:    String): String;
PROCEDURE [ccall] UnMapFont*  ["IupUnMapFont" ] (driverfont: String): String;

(* PRE-DEFINIDED DIALOGS *)

PROCEDURE [ccall] FileDlg*     ["IupFileDlg"    ] (): Handle;   
PROCEDURE [ccall] MessageDlg*  ["IupMessageDlg" ] (): Handle;       
PROCEDURE [ccall] ColorDlg*    ["IupColorDlg"   ] (): Handle;   
PROCEDURE [ccall] FontDlg*     ["IupFontDlg"    ] (): Handle;
PROCEDURE [ccall] ProgressDlg* ["IupProgressDlg"] (): Handle;

PROCEDURE [ccall] GetFile*    ["IupGetFile"   ] (arg: String): INTEGER;    
PROCEDURE [ccall] Message*    ["IupMessage"   ] (title, msg: String);    
(*
PROCEDURE [ccall] Messagef*   ["IupMessagef"  ] (title, format: String; ...): INTEGER;*)
PROCEDURE [ccall] Alarm*      ["IupAlarm"     ] (title, msg, b1, b2, b3: String): INTEGER;
(*
PROCEDURE [ccall] Scanf*      ["IupScanf"     ] (format: String, ...): INTEGER;*)
PROCEDURE [ccall] ListDialog* ["IupListDialog"] (type: INTEGER; title: String; size: INTEGER; list: StringList; op, max_col, max_lin: INTEGER; OUT marks: INTEGER): INTEGER;
PROCEDURE [ccall] GetText*    ["IupGetText"   ] (title, text: String): INTEGER;    
PROCEDURE [ccall] GetColor*   ["IupGetColor"  ] (x,y: INTEGER; VAR r, g, b: SHORTCHAR): INTEGER;

(*
PROCEDURE [ccall] GetParam*  ["IupGetParam"] (title: String; action: Paramcb; user_data: Pointer; format: String; ...): INTEGER;*)
PROCEDURE [ccall] GetParamv* ["IupGetParamv"] (title: String; action: Paramcb; user_data: Pointer; format: String; param_count, param_extra: INTEGER; param_data: PointerList): INTEGER;

PROCEDURE [ccall] LayoutDialog*            ["IupLayoutDialog"           ] (dialog: Handle): Handle;  
PROCEDURE [ccall] ElementPropertiesDialog* ["IupElementPropertiesDialog"] (elem: Handle): Handle;

BEGIN
END IupLib.

(******************************************************************************
* Copyright (C) 1994-2014 Tecgraf, PUC-Rio.
*
* Permission is hereby granted, free of charge, to any person obtaining
* a copy of this software and associated documentation files (the
* "Software"), to deal in the Software without restriction, including
* without limitation the rights to use, copy, modify, merge, publish,
* distribute, sublicense, and/or sell copies of the Software, and to
* permit persons to whom the Software is furnished to do so, subject to
* the following conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
******************************************************************************)