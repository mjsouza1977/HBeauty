unit Units.Utils.ServerBeauty;

interface

uses
    System.SysUtils,
    FireDAC.Comp.Client,
    FireDAC.Stan.Param,
    System.Classes;


function StrToBolValue(AValue, ATrue, AFalse : String) : Boolean;
function BoolToStrValue(AValue : Boolean; AFalse, ATrue : String) : String;
function QueryToLog(Q: TFDQuery): string;
function GeraNomeImagem(APrefixo, AExtensao : String) : String;

implementation

uses
  Data.DB, Controller.Conexao.HBeautyServer;

function GeraNomeImagem(APrefixo, AExtensao : String) : String;
var
ANomeFile : String;
ARepetido : Boolean;
begin

     try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT NOMEIMAGEM FROM HBIMAGENS');
        ControllerConexao.qryQuery.SQL.Add('WHERE NOMEIMAGEM = :NOMEIMAGEM');

        ARepetido := True;
        While ARepetido do
            begin
                Randomize;
                ANomeFile := APrefixo + FormatFloat('0000000', Random(9999999)) + '.' + AExtensao;

                ControllerConexao.qryQuery.Close;
                ControllerConexao.qryQuery.ParamByName('NOMEIMAGEM').AsString := QuotedStr(ANomeFile);
                ControllerConexao.qryQuery.Open;
                if ControllerConexao.qryQuery.RecordCount > 0 then
                    ARepetido := False else
                    ARepetido := True;
            end;

     finally
        Result := ANomeFile;
        ControllerConexao.qryQuery.Close;
     end;


end;

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
var
ARes : Boolean;
begin
     ARes := False;

     if AValue = ATrue  then ARes := True;
     if AValue = AFalse then ARes := False;

     Result := ARes;

end;



end.
