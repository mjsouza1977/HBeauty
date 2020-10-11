unit Units.Utils.HBeauty;

interface

uses Units.Consts.HBeauty, FMX.Objects;

function BooleanToString(ATrue, AFalse : String; AValue : Boolean) : String;
function StringToBool(ATrue, AFalse, AValue : String) : Boolean;
procedure CarregaImagemRessource(Image : TImage; NomeImagem : String);

implementation

uses
  Winapi.Windows, System.Classes;



function StringToBool(ATrue, AFalse, AValue : String) : Boolean;
begin
     if AValue = ATrue  then Result := True;
     if AValue = AFalse then Result := False;
end;

function BooleanToString(ATrue, AFalse : String; AValue : Boolean) : String;
begin
     case AValue of
          True : Result := ATrue;
         False : Result := AFalse;
     end;
end;

procedure CarregaImagemRessource(Image : TImage; NomeImagem : String);
var
InStream: TResourceStream;
begin

   InStream := TResourceStream.Create(HInstance, NomeImagem, RT_RCDATA);
   try
      Image.Bitmap.LoadFromStream(InStream);
   finally
      InStream.Free;
   end;

end;


end.
