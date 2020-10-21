unit Units.Utils.ServerBeauty;

interface

uses
    System.SysUtils;


function StrToBolValue(AValue, ATrue, AFalse : String) : Boolean;
function BoolToStrValue(AValue : Boolean; AFalse, ATrue : String) : String;

implementation


function BoolToStrValue(AValue : Boolean; AFalse, ATrue: String) : String;
begin
    case AValue of
         True : Result := ATrue;
        False : Result := AFalse;
    end;
end;

function StrToBolValue(AValue, ATrue, AFalse : String) : Boolean;
begin

     if AValue = ATrue  then Result := True;
     if AValue = AFalse then Result := False;

end;



end.
