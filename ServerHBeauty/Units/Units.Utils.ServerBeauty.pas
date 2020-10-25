unit Units.Utils.ServerBeauty;

interface

uses
    System.SysUtils, FireDAC.Comp.Client;


function StrToBolValue(AValue, ATrue, AFalse : String) : Boolean;
function BoolToStrValue(AValue : Boolean; AFalse, ATrue : String) : String;
function QueryToLog(Q: TFDQuery): string;

implementation

uses
  Data.DB;

function QueryToLog(Q: TFDQuery): string;
var
  i: Integer;
  r: string;
begin
  Result := Q.SQL.Text;
  for i := 0 to Q.Params.Count - 1 do
      begin
         case Q.Params.Items[i].DataType of
             ftString, ftDate, ftDateTime: r := QuotedStr(Q.Params[i].AsString) else
             r := Q.Params[i].AsString;
          end;
              Result := StringReplace(Result, ':' + Q.Params.Items[i].Name, r,[rfReplaceAll]);
      end;
end;


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
