unit Model.Metodos.Profissionais.Hablidades.ServerHBeauty;

interface

uses
  Data.FireDACJSONReflect;

function carregaHabilidades : TFDJSONDataSets;
function carregaHabilidadesProfissional(AAIdProfissional : Integer) : TFDJSONDataSets;

function cadastraHabilidadeProfissional(AIdHabilidade, AIdProfissional : Integer) : Boolean;
function cadastraHabilidade(ANomeHabilidade, ADescricaoHabilidade : String) : Integer;

function apagaHabilidadesProfissional(AIdProfissional: Integer) : Boolean;

function atualizaHabilidade(AIdHabilidade : Integer; ANomeHabilidade, ADescricaoHabilidade : String) : Boolean;


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

function carregaHabilidades : TFDJSONDataSets;
begin
    try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBHABILIDADES');

        Result := TFDJSONDataSets.Create;
        TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
        ControllerConexao.qryQuery.Active := True;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;


function cadastraHabilidade(ANomeHabilidade, ADescricaoHabilidade : String) : Integer;
begin

    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBHABILIDADES');
            ControllerConexao.qryQuery.SQL.Add('(NOME_HABILIDADE, DESCR_HABILIDADE) VALUES');
            ControllerConexao.qryQuery.SQL.Add('(:NOME_HABILIDADE, :DESCR_HABILIDADE)');
            ControllerConexao.qryQuery.ParamByName('NOME_HABILIDADE').AsString  := ANomeHabilidade;
            ControllerConexao.qryQuery.ParamByName('DESCR_HABILIDADE').AsString := ADescricaoHabilidade;
            ControllerConexao.qryQuery.ExecSQL;

            ControllerConexao.qryQuery.Open('SELECT GEN_ID(GEN_HBHABILIDADES_ID, 0) AS IDHABILIDADE FROM RDB$DATABASE');

            Result := ControllerConexao.qryQuery.FieldByName('IDHABILIDADE').AsInteger;

        finally
            ControllerConexao.qryQuery.Close;
        end;
    except
        Result := 0;
    end;

end;

function cadastraHabilidadeProfissional(AIdHabilidade, AIdProfissional : Integer) : Boolean;
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

            Result := True;
        finally
            ControllerConexao.qryQuery.Close;
        end;
    except
        Result := False;
    end;

end;

function atualizaHabilidade(AIdHabilidade : Integer; ANomeHabilidade, ADescricaoHabilidade : String) : Boolean;
begin
    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('UPDATE HBPROFISSIONAL SET');
            ControllerConexao.qryQuery.SQL.Add('NOME_HABILIDADE     = :NOMEHABILIDADE,');
            ControllerConexao.qryQuery.SQL.Add('DESCR_HABILIDADE    = :DESCRHABILIDADE');
            ControllerConexao.qryQuery.SQL.Add('WHERE ID_HABILIDADE = :IDHABILIDADE');
            ControllerConexao.qryQuery.ParamByName('NOMEHABILIDADE').AsString  := ANomeHabilidade;
            ControllerConexao.qryQuery.ParamByName('DESCRHABILIDADE').AsString := ADescricaoHabilidade;
            ControllerConexao.qryQuery.ParamByName('IDHABILIDADE').AsInteger   := AIdHabilidade;
            ControllerConexao.qryQuery.ExecSQL;

            Result := True;

        finally
            ControllerConexao.qryQuery.Close;
        end;
    except
        Result := False;
    end;

end;

function apagaHabilidadesProfissional(AIdProfissional: Integer) : Boolean;
begin
    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('DELETE FROM HBPROFXHABIL');
            ControllerConexao.qryQuery.SQL.Add('WHERE IDPROFIS_PROFXHABIL = :IDPROFIS_PROFXHABIL');
            ControllerConexao.qryQuery.ParamByName('IDPROFIS_PROFXHABIL').AsInteger := AIdProfissional;
            ControllerConexao.qryQuery.ExecSQL;

            Result := True;

        finally
            ControllerConexao.qryQuery.Close;
        end;
    except
        Result := False;
    end;
end;


end.
