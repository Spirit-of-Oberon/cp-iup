MODULE IupIm ["im"];
IMPORT Iup := IupLib, Im := ImLib;

PROCEDURE [ccall] LoadImage* ["IupLoadImage"] (file_name: Iup.String): Iup.Handle;
PROCEDURE [ccall] SaveImage* ["IupSaveImage"] (ih: Iup.Handle; file_name, format: Iup.String): INTEGER;
PROCEDURE [ccall] GetNativeHandleImage* ["IupGetNativeHandleImage"] (handle: Iup.Pointer): Im.Image;
PROCEDURE [ccall] GetImageNativeHandle* ["IupGetImageNativeHandle"] (image: Im.Image): Iup.Pointer;

END IupIm.