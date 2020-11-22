unit Model.Metodos.Profissionais.Cargos.ServerHBeauty;

interface

uses
     Data.FireDACJSONReflect,
     FireDAC.Stan.Param;

function carregaCargos : TFDJSONDataSets;
function pesquisaCargos(AIdCargo : Integer; ANomeCargo : String) : TFDJSONDataSets;
function cadastraCargo(ANomeCargo, ADescricaoCargo : String) : String;
function atualizaCargo(AIDCargo : Integer; ANomeCargo, ADescricaoCargo : String) : String;

implementation

uses
  Controller.Conexao.HBeautyServer, System.SysUtils;

function atualizaCargo(AIDCargo : Integer; ANomeCargo, ADescricaoCargo : String) : String;
begin
    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('UPDATE HBCARGO SET');
            ControllerConexao.qryQuery.SQL.Add('NOME_CARGO  = :NOME_CARGO,');
            ControllerConexao.qryQuery.SQL.Add('DESCR_CARGO = :DESCR_CARGO,');
            ControllerConexao.qryQuery.SQL.Add('LOCK        = :LOCK,');
            ControllerConexao.qryQuery.SQL.Add('IDUSULOCK   = :IDUSULOCK');
            ControllerConexao.qryQuery.SQL.Add('WHERE ID_CARGO = :ID_CARGO');

            ControllerConexao.qryQuery.ParamByName('NOME_CARGO' ).AsString  := ANomeCargo;
            ControllerConexao.qryQuery.ParamByName('DESCR_CARGO').AsString  := ADescricaoCargo;
            ControllerConexao.qryQuery.ParamByName('LOCK'       ).AsString  := 'F';
            ControllerConexao.qryQuery.ParamByName('IDUSULOCK'  ).AsInteger := 0;
            ControllerConexao.qryQuery.ParamByName('ID_CARGO'   ).AsInteger := AIDCargo;
            ControllerConexao.qryQuery.ExecSQL;
            Result := '';
        except on E:Exception do
            Result := E.Message;
        end;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

function cadastraCargo(ANomeCargo, ADescricaoCargo : String) : String;
begin
    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBCARGO');
            ControllerConexao.qryQuery.SQL.Add('(NOME_CARGO, DESCR_CARGO) VALUES');
            ControllerConexao.qryQuery.SQL.Add('(:NOME_CARGO, :DESCR_CARGO)');
            ControllerConexao.qryQuery.ParamByName('NOME_CARGO').AsString  := ANomeCargo;
            ControllerConexao.qryQuery.ParamByName('DESCR_CARGO').AsString := ADescricaoCargo;
            ControllerConexao.qryQuery.ExecSQL;
            Result := '';
        except on E:Exception do
            begin
                 Result := E.Message;
            end;
        end;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

function carregaCargos : TFDJSONDataSets;
begin

     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBCARGO');

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function pesquisaCargos(AIDCargo : Integer; ANomeCargo : String) : TFDJSONDataSets;
var
ASql : String;
begin
    try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBCARGO');

        if AIDCargo > 0 then ASql := ' AND ID_CARGO = ' + AIDCargo.ToString;
        if ANomeCargo <> '' then ASql := ASql + ' AND NOME_CARGO LIKE ' + QuotedStr(ANomeCargo + '%');

        ASql := Copy(ASql, 5, Length(ASql));

        if ASql <> '' then ControllerConexao.qryQuery.SQL.Add('WHERE ' + ASql);

        Result := TFDJSONDataSets.Create;
        TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
        ControllerConexao.qryQuery.Active := True;

    finally
        ControllerConexao.qryQuery.Close;
    end;

end;


end.
