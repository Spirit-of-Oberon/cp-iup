MODULE IupCd ["iupcd"];
IMPORT IupLib, Cd := CdLib;

PROCEDURE [ccall] ContextIup* ["cdContextIup"] (): Cd.Context;

END IupCd.