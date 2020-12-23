unit Units.Strings.HBeauty;

interface

uses
    IdHashMessageDigest;

function RemoveAcento(aText : string) : string;
function CriptografaMD5(const ASenha : String) : String;
function ApenasNumeros(const Str:String):String;
function ApenasLetras(const Str:String):String;
function isNumeric(Value : String) : Boolean;

const
    IntegerSet = [#33..#47,#58..#255] ;
    StringSet = [#46..#57];

implementation

uses
  System.SysUtils, System.Classes;

function isNumeric(Value : String) : Boolean;
begin
    try
        StrToint(Value);
        Result := True;
    except
        Result := False;
    end;
end;


function ApenasLetras(const Str:String):String;
var
   _Separators: TSysCharSet;
   lista: TStrings;
begin

    _Separators := StringSet;
    lista := TStringList.Create;

    try
        ExtractStrings(_Separators,[],pchar(str),lista);
        lista.StrictDelimiter := True;
        lista.QuoteChar := #0;
        result := StringReplace(lista.DelimitedText, lista.Delimiter, EmptyStr, [rfReplaceAll]);
    finally
         lista.Free;
    end;
end;

function ApenasNumeros(const Str:String):String;
var
   _Separators: TSysCharSet;
   lista: TStrings;
begin

    _Separators := IntegerSet;
    lista := TStringList.Create;

    try
        ExtractStrings(_Separators,[],pchar(str),lista);
        lista.StrictDelimiter := True;
        lista.QuoteChar := #0;
        result := StringReplace(lista.DelimitedText, lista.Delimiter, EmptyStr, [rfReplaceAll]);
    finally
         lista.Free;
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
