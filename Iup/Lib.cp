MODULE IupLib ["iup.dll"];

CONST
    NAME = "IUP - Portable User Interface";
    COPYRIGHT = "Copyright (C) 1994-2012 Tecgraf, PUC-Rio.";
    DESCRIPTION = "Multi-platform toolkit for building graphical user interfaces.";
    VERSION = "3.7";  (* bug fixes are reported only by IupVersion functions *)
    VERSION_NUMBER = 307000;
    VERSION_DATE = "2012/11/29";  (* does not include bug fix releases *)
    
TYPE
    Ihandle*      = POINTER TO LIMITED RECORD [untagged] END;
    IhandleList*  = ARRAY OF Ihandle;
    Istring*      = POINTER TO ARRAY [untagged] OF SHORTCHAR;
    IstringList*  = ARRAY OF Istring;    
    Ipointer*     = POINTER TO EXTENSIBLE RECORD END;
    IpointerList* = ARRAY OF Ipointer;
    Icallback*    = INTEGER;  
    Iparamcb*     = PROCEDURE [ccall] (dialog: Ihandle; param_index: INTEGER; user_data: Ipointer);
    Inull*        = POINTER TO RECORD [untagged] END;    

(* MAIN API *)
    
PROCEDURE [ccall] Open*          ["IupOpen"         ] (VAR [nil] argc: INTEGER; VAR [nil] argv: POINTER TO IstringList): INTEGER;
PROCEDURE [ccall] Close*         ["IupClose"        ];
PROCEDURE [ccall] ImageLibOpen*  ["IupImageLibOpen" ];
PROCEDURE [ccall] MainLoop*      ["IupMainLoop"     ] (): INTEGER;
PROCEDURE [ccall] LoopStep*      ["IupLoopStep"     ] (): INTEGER;
PROCEDURE [ccall] LoopStepWait*  ["IupLoopStepWait" ] (): INTEGER;
PROCEDURE [ccall] MainLoopLevel* ["IupMainLoopLevel"] (): INTEGER;
PROCEDURE [ccall] Flush*         ["IupFlush"        ];
PROCEDURE [ccall] ExitLoop*      ["IupExitLoop"     ];

PROCEDURE [ccall] RecordInput* ["IupRecordInput"  ] (filename: Istring; mode: INTEGER): INTEGER;
PROCEDURE [ccall] PlayInput*   ["IupPlayInput"    ] (filename: Istring): INTEGER;

PROCEDURE [ccall] Update*          ["IupUpdate"         ] (ih: Ihandle);
PROCEDURE [ccall] UpdateChildren*  ["IupUpdateChildren" ] (ih: Ihandle);
PROCEDURE [ccall] Redraw*          ["IupRedraw"         ] (ih: Ihandle; children: INTEGER);
PROCEDURE [ccall] Refresh*         ["IupRefresh"        ] (ih: Ihandle);
PROCEDURE [ccall] RefreshChildren* ["IupRefreshChildren"] (ih: Ihandle);

PROCEDURE [ccall] MapFont*    ["IupMapFont"   ] (iupfont:    Istring): Istring;
PROCEDURE [ccall] UnMapFont*  ["IupUnMapFont" ] (driverfont: Istring): Istring;
PROCEDURE [ccall] Help*       ["IupHelp"      ] (url:        Istring): INTEGER;
PROCEDURE [ccall] Load*       ["IupLoad"      ] (filename:   Istring): Istring;
PROCEDURE [ccall] LoadBuffer* ["IupLoadBuffer"] (buffer:      Istring): Istring;

PROCEDURE [ccall] Version*       ["IupVersion"      ] (): Istring;
PROCEDURE [ccall] VersionDate*   ["IupVersionDate"  ] (): Istring;
PROCEDURE [ccall] VersionNumber* ["IupVersionNumber"] (): INTEGER;
PROCEDURE [ccall] SetLanguage*   ["IupSetLanguage"  ] (lng: Istring);
PROCEDURE [ccall] GetLanguage*   ["IupGetLanguage"  ] (): Istring;

PROCEDURE [ccall] Destroy*        ["IupDestroy"       ] (ih:    Ihandle);   
PROCEDURE [ccall] Detach*         ["IupDetach"        ] (child: Ihandle);
PROCEDURE [ccall] Append*         ["IupAppend"        ] (ih, child: Ihandle): Ihandle;
PROCEDURE [ccall] Insert*         ["IupInsert"        ] (ih, ref_child, child: Ihandle): Ihandle;
PROCEDURE [ccall] GetChild*       ["IupGetChild"      ] (ih: Ihandle; pos: INTEGER): Ihandle;
PROCEDURE [ccall] GetChildPos*    ["IupGetChildPos"   ] (ih, child: Ihandle): INTEGER;       
PROCEDURE [ccall] GetChildCount*  ["IupGetChildCount" ] (ih: Ihandle): INTEGER;          
PROCEDURE [ccall] GetNextChild*   ["IupGetNextChild"  ] (ih, child: Ihandle): Ihandle;       
PROCEDURE [ccall] GetBrother*     ["IupGetBrother"    ] (ih: Ihandle): Ihandle;  
PROCEDURE [ccall] GetParent*      ["IupGetParent"     ] (ih: Ihandle): Ihandle;  
PROCEDURE [ccall] GetDialog*      ["IupGetDialog"     ] (ih: Ihandle): Ihandle;  
PROCEDURE [ccall] GetDialogChild* ["IupGetDialogChild"] (ih: Ihandle; name: Istring): Ihandle;       
PROCEDURE [ccall] Reparent*       ["IupReparent"      ] (ih, new_parent, ref_child: Ihandle): INTEGER;

PROCEDURE [ccall] Popup*  ["IupPopup" ] (ih: Ihandle; x, y: INTEGER): INTEGER;
PROCEDURE [ccall] Show*   ["IupShow"  ] (ih: Ihandle): INTEGER;
PROCEDURE [ccall] ShowXY* ["IupShowXY"] (ih: Ihandle; x, y: INTEGER): INTEGER;
PROCEDURE [ccall] Hide*   ["IupHide"  ] (ih: Ihandle): INTEGER;
PROCEDURE [ccall] Map*    ["IupMap"   ] (ih: Ihandle): INTEGER;
PROCEDURE [ccall] Unmap*  ["IupUnmap" ] (ih: Ihandle);

PROCEDURE [ccall] SetAttribute*   ["IupSetAttribute"  ] (ih: Ihandle; name, value: Istring);         
PROCEDURE [ccall] StoreAttribute* ["IupStoreAttribute"] (ih: Ihandle; name, value: Istring);         
PROCEDURE [ccall] SetAttributes*  ["IupSetAttributes" ] (ih: Ihandle; str:  Istring): Ihandle;          
PROCEDURE [ccall] GetAttribute*   ["IupGetAttribute"  ] (ih: Ihandle; name: Istring): Istring;          
PROCEDURE [ccall] GetAttributes*  ["IupGetAttributes" ] (ih: Ihandle): Istring;          
PROCEDURE [ccall] GetInt*         ["IupGetInt"        ] (ih: Ihandle; name: Istring): INTEGER;  
PROCEDURE [ccall] GetInt2*        ["IupGetInt2"       ] (ih: Ihandle; name: Istring): INTEGER;      
PROCEDURE [ccall] GetIntInt*      ["IupGetIntInt"     ] (ih: Ihandle; name: Istring; i1, i2: INTEGER): INTEGER;      
PROCEDURE [ccall] GetFloat*       ["IupGetFloat"      ] (ih: Ihandle; name: Istring): SHORTREAL;      
(*
PROCEDURE [ccall] SetfAttribute*    ["IupSetfAttribute"   ] (ih: Ihandle; name, format: Istring; ...);*)
PROCEDURE [ccall] ResetAttribute*   ["IupResetAttribute"  ] (ih: Ihandle; name: Istring);          
PROCEDURE [ccall] GetAllAttributes* ["IupGetAllAttributes"] (ih: Ihandle; names: IstringList; n: INTEGER): INTEGER;
(*
PROCEDURE [ccall] SetAtt*           ["IupSetAtt"          ] (handle_name: Istring; ih: Ihandle; name: Istring; ...): Ihandle;*)

PROCEDURE [ccall] SetAttributeId*    ["IupSetAttributeId"   ] (ih: Ihandle; name: Istring; id: INTEGER; value: Istring);     
PROCEDURE [ccall] StoreAttributeId*  ["IupStoreAttributeId" ] (ih: Ihandle; name: Istring; id: INTEGER; value: Istring);         
PROCEDURE [ccall] GetAttributeId*    ["IupGetAttributeId"   ] (ih: Ihandle; name: Istring; id: INTEGER);     
PROCEDURE [ccall] GetFloatId*        ["IupGetFloatId"       ] (ih: Ihandle; name: Istring; id: INTEGER); 
PROCEDURE [ccall] GetIntId*          ["IupGetIntId"         ] (ih: Ihandle; name: Istring; id: INTEGER); 
(*
PROCEDURE [ccall] SetfAttributeId*   ["IupSetfAttributeId"  ] (ih: Ihandle; name: Istring; id: INTEGER; format: Istring; ...);*)

PROCEDURE [ccall] SetAttributeId2*   ["IupSetAttributeId2"  ] (ih: Ihandle; name: Istring; lin, col: INTEGER; value: Istring);         
PROCEDURE [ccall] StoreAttributeId2* ["IupStoreAttributeId2"] (ih: Ihandle; name: Istring; lin, col: INTEGER; value: Istring);         
PROCEDURE [ccall] GetAttributeId2*   ["IupGetAttributeId2"  ] (ih: Ihandle; name: Istring; lin, col: INTEGER);         
PROCEDURE [ccall] GetIntId2*         ["IupGetIntId2"        ] (ih: Ihandle; name: Istring; lin, col: INTEGER); 
PROCEDURE [ccall] GetFloatId2*       ["IupGetFloatId2"      ] (ih: Ihandle; name: Istring; lin, col: INTEGER);     
(*
PROCEDURE [ccall] SetfAttributeId2*  ["IupSetfAttributeId2" ] (ih: Ihandle; name: Istring; lin, col: INTEGER; format: Istring; ...);*)

PROCEDURE [ccall] SetGlobal*   ["IupSetGlobal"  ] (name, value: Istring);   
PROCEDURE [ccall] StoreGlobal* ["IupStoreGlobal"] (name, value: Istring);       
PROCEDURE [ccall] GetGlobal*   ["IupGetGlobal"  ] (name: Istring): Istring;

PROCEDURE [ccall] SetFocus*      ["IupSetFocus"     ] (ih: Ihandle): Ihandle; 
PROCEDURE [ccall] GetFocus*      ["IupGetFocus"     ] (): Ihandle; 
PROCEDURE [ccall] PreviousField* ["IupPreviousField"] (ih: Ihandle): Ihandle;     
PROCEDURE [ccall] NextField*     ["IupNextField"    ] (ih: Ihandle): Ihandle; 

PROCEDURE [ccall] GetCallback*   ["IupGetCallback" ] (ih: Ihandle; name: Istring): Icallback;
PROCEDURE [ccall] SetCallback*   ["IupSetCallback" ] (ih: Ihandle; name: Istring; func: Icallback): Icallback;
(*
PROCEDURE [ccall] SetCallbacks*  ["IupSetCallbacks"] (ih: Ihandle; name: Istring; func: Icallback; ...): Ihandle;*)

PROCEDURE [ccall] GetFunction*   ["IupGetFunction"  ] (name: Istring): Icallback;
PROCEDURE [ccall] SetFunction*   ["IupSetFunction"  ] (name: Istring; func: Icallback): Icallback;
PROCEDURE [ccall] GetActionName* ["IupGetActionName"] (): Istring;

PROCEDURE [ccall] GetHandle*     ["IupGetHandle"    ] (name: Istring): Ihandle;  
PROCEDURE [ccall] SetHandle*     ["IupSetHandle"    ] (name: Istring; ih: Ihandle): Ihandle;  
PROCEDURE [ccall] GetAllNames*   ["IupGetAllNames"  ] (names: IstringList; n: INTEGER): INTEGER;    
PROCEDURE [ccall] GetAllDialogs* ["IupGetAllDialogs"] (names: Istring; n: INTEGER): INTEGER;
PROCEDURE [ccall] GetName*       ["IupGetName"      ] (ih: Ihandle): Istring;

PROCEDURE [ccall] SetAttributeHandle*       ["IupSetAttributeHandle"      ] (ih: Ihandle; name: Istring; ih_named: Ihandle);             
PROCEDURE [ccall] GetAttributeHandle*       ["IupGetAttributeHandle"      ] (ih: Ihandle; name: Istring): Ihandle; 
            
PROCEDURE [ccall] GetClassName*             ["IupGetClassName"            ] (ih: Ihandle): Istring;       
PROCEDURE [ccall] GetClassType*             ["IupGetClassType"            ] (ih: Ihandle): Istring;       
PROCEDURE [ccall] GetAllClasses*            ["IupGetAllClasses"           ] (names: IstringList; n: INTEGER): INTEGER;
PROCEDURE [ccall] GetClassAttributes*       ["IupGetClassAttributes"      ] (classname: Istring; names: IstringList; n: INTEGER): INTEGER;  

PROCEDURE [ccall] GetClassCallbacks*        ["IupGetClassCallbacks"       ] (classname: Istring; names: IstringList; n: INTEGER): INTEGER;
PROCEDURE [ccall] SaveClassAttributes*      ["IupSaveClassAttributes"     ] (ih: Ihandle);              
PROCEDURE [ccall] CopyClassAttributes*      ["IupCopyClassAttributes"     ] (src_ih, dst_ih: Ihandle);              
PROCEDURE [ccall] SetClassDefaultAttribute* ["IupSetClassDefaultAttribute"] (classname, name, value: Istring);                   
PROCEDURE [ccall] ClassMatch*               ["IupClassMatch"              ] (ih: Ihandle; classname: Istring): INTEGER;     
PROCEDURE [ccall] Create*                   ["IupCreate"                  ] (classname: Istring): Ihandle; 
PROCEDURE [ccall] Createv*                  ["IupCreatev"                 ] (classname: Istring; params: IpointerList): Ihandle;  
PROCEDURE [ccall] Createp*                  ["IupCreatep"                 ] (classname: Istring; first: Ipointer; null: Inull): Ihandle;

(* ELEMENTS *)

PROCEDURE [ccall] Fill*        ["IupFill"       ] (): Ihandle;  
PROCEDURE [ccall] Radio*       ["IupRadio"      ] (child: Ihandle): Ihandle;   
PROCEDURE [ccall] Vbox*        ["IupVbox"       ] (child: Ihandle; null: Inull): Ihandle;
PROCEDURE [ccall] Vboxv*       ["IupVboxv"      ] (children: IhandleList): Ihandle;  
PROCEDURE [ccall] Zbox*        ["IupZbox"       ] (child: Ihandle; null: Inull): Ihandle;
PROCEDURE [ccall] Zboxv*       ["IupZboxv"      ] (children: IhandleList): Ihandle; 
PROCEDURE [ccall] Hbox*        ["IupHbox"       ] (child: Ihandle; null: Inull): Ihandle;  
PROCEDURE [ccall] Hboxv*       ["IupHboxv"      ] (children: IhandleList): Ihandle;
PROCEDURE [ccall] Normalizer*  ["IupNormalizer" ] (ih_first: Ihandle; null: Inull): Ihandle;        
PROCEDURE [ccall] Normalizerv* ["IupNormalizerv"] (ih_list: IhandleList): Ihandle;

PROCEDURE [ccall] Cbox*        ["IupCbox"       ] (child: Ihandle; null: Inull): Ihandle;  
PROCEDURE [ccall] Cboxv*       ["IupCboxv"      ] (children: IhandleList): Ihandle;
PROCEDURE [ccall] Sbox*        ["IupSbox"       ] (child: Ihandle): Ihandle;  
PROCEDURE [ccall] Split*       ["IupSplit"      ] (child1, child2: Ihandle): Ihandle;   
PROCEDURE [ccall] ScrollBox*   ["IupScrollBox"  ] (child: Ihandle): Ihandle; 
      
PROCEDURE [ccall] Frame*       ["IupFrame"      ] (child: Ihandle): Ihandle;

PROCEDURE [ccall] Image*       ["IupImage"      ] (width, height: INTEGER; pixmap: Istring): Ihandle;   
PROCEDURE [ccall] ImageRGB*    ["IupImageRGB"   ] (width, height: INTEGER; pixmap: Istring): Ihandle;      
PROCEDURE [ccall] ImageRGBA*   ["IupImageRGBA"  ] (width, height: INTEGER; pixmap: Istring): Ihandle; 

PROCEDURE [ccall] Item*        ["IupItem"       ] (title, action: Istring): Ihandle;  
PROCEDURE [ccall] Submenu*     ["IupSubmenu"    ] (title: Istring; child: Ihandle): Ihandle;     
PROCEDURE [ccall] Separator*   ["IupSeparator"  ] (): Ihandle;       
PROCEDURE [ccall] Menu*        ["IupMenu"       ] (child: Ihandle; null: Inull): Ihandle;
PROCEDURE [ccall] Menuv*       ["IupMenuv"      ] (children: IhandleList): Ihandle;

PROCEDURE [ccall] Button*      ["IupButton"     ] (title, action: Istring): Ihandle;    
PROCEDURE [ccall] Canvas*      ["IupCanvas"     ] (action: Istring): Ihandle;    
PROCEDURE [ccall] Dialog*      ["IupDialog"     ] (child: Ihandle): Ihandle;    
PROCEDURE [ccall] User*        ["IupUser"       ] (): Ihandle;  
PROCEDURE [ccall] Label*       ["IupLabel"      ] (title: Istring): Ihandle;   
PROCEDURE [ccall] List*        ["IupList"       ] (action: Istring): Ihandle;  
PROCEDURE [ccall] Text*        ["IupText"       ] (action: Istring): Ihandle;  
PROCEDURE [ccall] MultiLine*   ["IupMultiLine"  ] (action: Istring): Ihandle;       
PROCEDURE [ccall] Toggle*      ["IupToggle"     ] (title, action: Istring): Ihandle;    
PROCEDURE [ccall] Timer*       ["IupTimer"      ] (): Ihandle;   
PROCEDURE [ccall] Clipboard*   ["IupClipboard"  ] (): Ihandle;       
PROCEDURE [ccall] ProgressBar* ["IupProgressBar"] (): Ihandle;         
PROCEDURE [ccall] Val*         ["IupVal"        ] (type: Istring): Ihandle; 
PROCEDURE [ccall] Tabs*        ["IupTabs"       ] (child: Ihandle; null: Inull): Ihandle;
PROCEDURE [ccall] Tabsv*       ["IupTabsv"      ] (children: IhandleList): Ihandle;   
PROCEDURE [ccall] Tree*        ["IupTree"       ] (): Ihandle;

(* Deprecated controls use SPIN attribute of IupText *)
PROCEDURE [ccall] Spin*    ["IupSpin"   ] (): Ihandle;
PROCEDURE [ccall] Spinbox* ["IupSpinbox"] (child: Ihandle): Ihandle;

(* IupImage utility *)
PROCEDURE [ccall] SaveImageAsText* ["IupSaveImageAsText"] (ih: Ihandle; file_name, format, name: Istring): INTEGER;

(* IupText utilities *)
PROCEDURE [ccall] TextConvertLinColToPos* ["IupTextConvertLinColToPos"] (ih: Ihandle; lin, col: INTEGER; OUT pos: INTEGER);
PROCEDURE [ccall] TextConvertPosToLinCol* ["IupTextConvertPosToLinCol"] (ih: Ihandle; pos: INTEGER; OUT lin, col: INTEGER);

(* IupText, IupList and IupTree utility *)
PROCEDURE [ccall] ConvertXYToPos* ["IupConvertXYToPos"] (ih: Ihandle; x, y: INTEGER): INTEGER;

(* IupTree utilities *)
PROCEDURE [ccall] TreeSetUserId* ["IupTreeSetUserId"] (ih: Ihandle; id: INTEGER; userid: Ipointer): INTEGER;
PROCEDURE [ccall] TreeGetUserId* ["IupTreeGetUserId"] (ih: Ihandle; id: INTEGER): Ipointer;
PROCEDURE [ccall] TreeGetId* ["IupTreeGetId"] (ih: Ihandle; userid: Ipointer): INTEGER;

(* Deprecated IupTree utilities, use Iup*AttributeId functions *)
PROCEDURE [ccall] TreeSetAttribute*   ["IupTreeSetAttribute"  ] (ih: Ihandle; name: Istring; id: INTEGER; value: Istring);      
PROCEDURE [ccall] TreeStoreAttribute* ["IupTreeStoreAttribute"] (ih: Ihandle; name: Istring; id: INTEGER; value: Istring);       
PROCEDURE [ccall] TreeGetAttribute*   ["IupTreeGetAttribute"  ] (ih: Ihandle; name: Istring; id: INTEGER): Istring;      
PROCEDURE [ccall] TreeGetInt*         ["IupTreeGetInt"        ] (ih: Ihandle; name: Istring; id: INTEGER): INTEGER;
PROCEDURE [ccall] TreeGetFloat*       ["IupTreeGetFloat"      ] (ih: Ihandle; name: Istring; id: INTEGER): SHORTREAL;  
(*
PROCEDURE [ccall] TreeSetfAttribute*      ["IupTreeSetfAttribute"     ] (ih: Ihandle; name: Istring; id: INTEGER; format: Istring; ...);*)
PROCEDURE [ccall] TreeSetAttributeHandle* ["IupTreeSetAttributeHandle"] (ih: Ihandle; a: Istring; id: INTEGER; ih_named: Ihandle);

(* PRE-DEFINIDED DIALOGS *)

PROCEDURE [ccall] FileDlg*    ["IupFileDlg"   ] (): Ihandle;   
PROCEDURE [ccall] MessageDlg* ["IupMessageDlg"] (): Ihandle;       
PROCEDURE [ccall] ColorDlg*   ["IupColorDlg"  ] (): Ihandle;   
PROCEDURE [ccall] FontDlg*    ["IupFontDlg"   ] (): Ihandle;

PROCEDURE [ccall] GetFile*    ["IupGetFile"   ] (arg: Istring): INTEGER;    
PROCEDURE [ccall] Message*    ["IupMessage"   ] (title, msg: Istring);    
(*
PROCEDURE [ccall] Messagef*   ["IupMessagef"  ] (title, format: Istring; ...): INTEGER;*)
PROCEDURE [ccall] Alarm*      ["IupAlarm"     ] (title, msg, b1, b2, b3: Istring): INTEGER;
(*
PROCEDURE [ccall] Scanf*      ["IupScanf"     ] (format: Istring, ...): INTEGER;*)
PROCEDURE [ccall] ListDialog* ["IupListDialog"] (type: INTEGER; title: Istring; size: INTEGER; list: IstringList; op, max_col, max_lin: INTEGER; OUT marks: INTEGER): INTEGER;
PROCEDURE [ccall] GetText*    ["IupGetText"   ] (title, text: Istring): INTEGER;    
PROCEDURE [ccall] GetColor*   ["IupGetColor"  ] (x,y: INTEGER; r, g, b: Istring): INTEGER;

(*
PROCEDURE [ccall] GetParam*  ["IupGetParam"] (title: Istring; action: Iparamcb; user_data: Ipointer; format: Istring; ...): INTEGER;*)
PROCEDURE [ccall] GetParamv* ["IupGetParamv"] (title: Istring; action: Iparamcb; user_data: Ipointer; format: Istring; param_count, param_extra: INTEGER; param_data: IpointerList): INTEGER;

PROCEDURE [ccall] LayoutDialog*            ["IupLayoutDialog"           ] (dialog: Ihandle): Ihandle;  
PROCEDURE [ccall] ElementPropertiesDialog* ["IupElementPropertiesDialog"] (elem: Ihandle): Ihandle;

BEGIN
END IupLib.