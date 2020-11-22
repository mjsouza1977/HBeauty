unit Model.Metodos.Habilidades.ServerHBeauty;

interface

uses
    Data.FireDACJSONReflect, Units.Utils.ServerBeauty;

function carregaHabilidades : TFDJSONDataSets;
function atualizaHabilidades(AIdHabilidade, AIdCargoHabilidade : Integer; AHabilidade, ADescricao : String) : String;
function cadastraHabilidade(AIDCargoHabilidade : Integer; AHabilidade, ADescricao : String) : String;
function pesquisaHabilidade(AIDHabilidade, AIDCargo : Integer; ANomeHabilidade : String) : TFDJSONDataSets;


implementation

uses
  Controller.Conexao.HBeautyServer, System.SysUtils;

function pesquisaHabilidade(AIDHabilidade, AIDCargo : Integer; ANomeHabilidade : String) : TFDJSONDataSets;
var
ASql : String;
begin
    try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT c.NOME_CARGO, h.* FROM HBHABILIDADES h');
        ControllerConexao.qryQuery.SQL.Add('INNER JOIN HBCARGO c');
        ControllerConexao.qryQuery.SQL.Add('ON h.IDCARGO_HABILIDADE = c.ID_CARGO');

        if AIDHabilidade > 0 then ASql := ' AND ID_HABILIDADE = ' + AIDHabilidade.ToString;
        if AIDCargo > 0 then ASql := ' AND IDCARGO_HABILIDADE = ' + AIDCargo.ToString;
        if ANomeHabilidade <> '' then ASql := ASql + ' AND NOME_HABILIDADE LIKE ' + QuotedStr(ANomeHabilidade + '%');

        ASql := Copy(ASql, 5, Length(ASql));

        if ASql <> '' then ControllerConexao.qryQuery.SQL.Add('WHERE ' + ASql);

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
         ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBHABILIDADES h');
         ControllerConexao.qryQuery.SQL.Add('INNER JOIN HBCARGO c');
         ControllerConexao.qryQuery.SQL.Add('ON h.IDCARGO_HABILIDADE = c.ID_CARGO');
         ControllerConexao.qryQuery.SQL.Add('ORDER BY NOME_HABILIDADE');

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;

     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function atualizaHabilidades(AIdHabilidade, AIdCargoHabilidade : Integer; AHabilidade, ADescricao : String) : String;
begin

     try
         try
             ControllerConexao.qryQuery.Close;
             ControllerConexao.qryQuery.SQL.Clear;
             ControllerConexao.qryQuery.SQL.Add('UPDATE HBHABILIDADES SET');
             ControllerConexao.qryQuery.SQL.Add('NOME_HABILIDADE     = :NOME_HABILIDADE,');
             ControllerConexao.qryQuery.SQL.Add('DESCR_HABILIDADE    = :DESCR_HABILIDADE,');
             ControllerConexao.qryQuery.SQL.Add('IDCARGO_HABILIDADE  = :IDCARGO_HABILIDADE,');
             ControllerConexao.qryQuery.SQL.Add('LOCK                = :LOCK,');
             ControllerConexao.qryQuery.SQL.Add('IDUSULOCK           = :IDUSULOCK');
             ControllerConexao.qryQuery.SQL.Add('WHERE ID_HABILIDADE = :IDHABILIDADE');
             ControllerConexao.qryQuery.ParamByName('NOME_HABILIDADE'   ).AsString  := AHabilidade;
             ControllerConexao.qryQuery.ParamByName('DESCR_HABILIDADE'  ).AsString  := ADescricao;
             ControllerConexao.qryQuery.ParamByName('LOCK'              ).AsString  := 'F';
             ControllerConexao.qryQuery.ParamByName('IDUSULOCK'         ).AsInteger := 0;
             ControllerConexao.qryQuery.ParamByName('IDHABILIDADE'      ).AsInteger := AIdHabilidade;
             ControllerConexao.qryQuery.ParamByName('IDCARGO_HABILIDADE').AsInteger := AIdCargoHabilidade;
             ControllerConexao.qryQuery.ExecSQL;
             Result := '';
         except on E:Exception do
             Result := E.Message;
         end;

     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function cadastraHabilidade(AIDCargoHabilidade : Integer; AHabilidade, ADescricao : String) : String;
begin

     try
         try
             ControllerConexao.qryQuery.Close;
             ControllerConexao.qryQuery.SQL.Clear;
             ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBHABILIDADES');
             ControllerConexao.qryQuery.SQL.Add('(IDCARGO_HABILIDADE, NOME_HABILIDADE, DESCR_HABILIDADE) VALUES');
             ControllerConexao.qryQuery.SQL.Add('(:IDCARGO_HABILIDADE, :NOME_HABILIDADE, :DESCR_HABILIDADE)');
             ControllerConexao.qryQuery.ParamByName('NOME_HABILIDADE').AsString     := AHabilidade;
             ControllerConexao.qryQuery.ParamByName('DESCR_HABILIDADE').AsString    := ADescricao;
             ControllerConexao.qryQuery.ParamByName('IDCARGO_HABILIDADE').AsInteger := AIDCargoHabilidade;
             ControllerConexao.qryQuery.ExecSQL;
             Result := '';
         except on E:Exception do
             Result := E.Message;
         end;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

end.
