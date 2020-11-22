unit Model.Metodos.Profissionais.Hablidades.ServerHBeauty;

interface

uses
  Data.FireDACJSONReflect;

function carregaHabilidadesProfissional(AAIdProfissional : Integer) : TFDJSONDataSets;
function cadastraHabilidadeProfissional(AIdHabilidade, AIdProfissional : Integer) : String;
function apagaHabilidadesProfissional(AIdProfissional: Integer) : String;


implementation

uses
  System.SysUtils, Controller.Conexao.HBeautyServer;

function carregaHabilidadesProfissional(AAIdProfissional : Integer) : TFDJSONDataSets;
begin
    try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBPROFXHABIL');
        ControllerConexao.qryQuery.SQL.Add('WHERE IDPROFIS_PROFXHABIL = :IDPROFIS_PROFXHABIL');
        ControllerConexao.qryQuery.ParamByName('IDPROFIS_PROFXHABIL').AsInteger := AAIdProfissional;

        Result := TFDJSONDataSets.Create;
        TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
        ControllerConexao.qryQuery.Active := True;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

function cadastraHabilidadeProfissional(AIdHabilidade, AIdProfissional : Integer) : String;
begin

    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBPROFXHABIL');
            ControllerConexao.qryQuery.SQL.Add('(IDPROFIS_PROFXHABIL, IDHABIL_PROFXHABIL) VALUES');
            ControllerConexao.qryQuery.SQL.Add('(:IDPROFIS_PROFXHABIL, :IDHABIL_PROFXHABIL)');
            ControllerConexao.qryQuery.ParamByName('IDPROFIS_PROFXHABIL').AsInteger := AIdProfissional;
            ControllerConexao.qryQuery.ParamByName('IDHABIL_PROFXHABIL').AsInteger  := AIdHabilidade;
            ControllerConexao.qryQuery.ExecSQL;

            Result := '';
        finally
            ControllerConexao.qryQuery.Close;
        end;
    except on E:Exception do
        Result := E.Message;
    end;

end;

function apagaHabilidadesProfissional(AIdProfissional: Integer) : String;
begin
    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('DELETE FROM HBPROFXHABIL');
            ControllerConexao.qryQuery.SQL.Add('WHERE IDPROFIS_PROFXHABIL = :IDPROFIS_PROFXHABIL');
            ControllerConexao.qryQuery.ParamByName('IDPROFIS_PROFXHABIL').AsInteger := AIdProfissional;
            ControllerConexao.qryQuery.ExecSQL;

            Result := '';

        finally
            ControllerConexao.qryQuery.Close;
        end;
    except on E:Exception do
        Result := E.Message;
    end;
end;


end.
