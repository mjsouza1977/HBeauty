unit Units.Strings.HBeauty;

interface

uses
    IdHashMessageDigest;

function RemoveAcento(aText : string) : string;
function CriptografaMD5(const ASenha : String) : String;

implementation

function CriptografaMD5(const ASenha : String) : String;
var
   idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
     Result := idmd5.HashStringAsHex(ASenha);
  finally
     idmd5.Free;
  end;
end;



function RemoveAcento(aText : string) : string;
const
    ComAcento = 'àâêôûãõáéíóúçüñıÀÂÊÔÛÃÕÁÉÍÓÚÇÜÑİ';
    SemAcento = 'aaeouaoaeioucunyAAEOUAOAEIOUCUNY';
var
    i: Cardinal;
begin;

    for i := 1 to Length(aText) do

    if (Pos(aText[i], ComAcento) <> 0) then
        aText[i] := SemAcento[ Pos(aText[i], ComAcento)];

    Result := aText;

end;

end.
