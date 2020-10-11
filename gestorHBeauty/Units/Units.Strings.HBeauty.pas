unit Units.Strings.HBeauty;

interface

uses
    IdHashMessageDigest;

function RemoveAcento(aText : string) : string;
function CriptografaMD5(const ASenha : String) : String;
function ApenasNumeros(const S: string): string;

implementation

uses
  System.SysUtils;

function ApenasNumeros(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9']) then
    {$ELSE}
    if vText^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + vText^;

    Inc(vText);
  end;
end;

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
    ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸Ò˝¿¬ ‘€√’¡…Õ”⁄«‹—›';
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
