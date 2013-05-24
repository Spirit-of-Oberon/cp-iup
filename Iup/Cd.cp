MODULE IupCd ["iupcd"];
IMPORT IupLib, Cd := CdLib;

PROCEDURE [ccall] Context* ["cdContextIup"] (): Cd.Context;

END IupCd.