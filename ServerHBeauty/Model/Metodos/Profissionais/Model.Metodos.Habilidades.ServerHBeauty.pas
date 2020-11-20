unit Model.Metodos.Habilidades.ServerHBeauty;

interface

uses
    Data.FireDACJSONReflect;

function carregaHabilidades : TFDJSONDataSets;
function atualizaHabilidades(AIdHabilidade : Integer; AHabilidade, ADescricao : String) : Boolean;
function cadastraHabilidade(AHabilidade, ADescricao : String) : Boolean;


implementation

uses
  Controller.Conexao.HBeautyServer;

function carregaHabilidades : TFDJSONDataSets;
begin

     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBHABILIDADES');
         ControllerConexao.qryQuery.SQL.Add('ORDER BY NOME_HABILIDADE');

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;

     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function atualizaHabilidades(AIdHabilidade : Integer; AHabilidade, ADescricao : String) : Boolean;
begin

     try
         try
             ControllerConexao.qryQuery.Close;
             ControllerConexao.qryQuery.SQL.Clear;
             ControllerConexao.qryQuery.SQL.Add('UPDATE HBHABILIDADES SET');
             ControllerConexao.qryQuery.SQL.Add('NOME_HABILIDADE     = :NOME_HABILIDADE,');
             ControllerConexao.qryQuery.SQL.Add('DESCR_HABILIDADE    = :DESCR_HABILIDADE,');
             ControllerConexao.qryQuery.SQL.Add('LOCK                = :LOCK,');
             ControllerConexao.qryQuery.SQL.Add('IDUSULOCKI          = :IDUSULOCK');
             ControllerConexao.qryQuery.SQL.Add('WHERE ID_HABILIDADE = :IDHABILIDADE');
             ControllerConexao.qryQuery.ParamByName('NOME_HABILIDADE' ).AsString  := AHabilidade;
             ControllerConexao.qryQuery.ParamByName('DESCR_HABILIDADE').AsString  := ADescricao;
             ControllerConexao.qryQuery.ParamByName('LOCK'            ).AsString  := 'F';
             ControllerConexao.qryQuery.ParamByName('IDUSULOCK'       ).AsInteger := 0;
             ControllerConexao.qryQuery.ParamByName('IDHABILIDADE'    ).AsInteger := AIdHabilidade;
             ControllerConexao.qryQuery.ExecSQL;
             Result := True;
         except
             Result := False;
         end;

     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function cadastraHabilidade(AHabilidade, ADescricao : String) : Boolean;
begin

     try
         try
             ControllerConexao.qryQuery.Close;
             ControllerConexao.qryQuery.SQL.Clear;
             ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBHABILIDADES');
             ControllerConexao.qryQuery.SQL.Add('(NOME_HABILIDADE, DESCR_HABILIDADE) VALUES');
             ControllerConexao.qryQuery.SQL.Add('(:NOME_HABILIDADE, :DESCR_HABILIDADE)');
             ControllerConexao.qryQuery.ParamByName('NOME_HABILIDADE').AsString  := AHabilidade;
             ControllerConexao.qryQuery.ParamByName('DESCR_HABILIDADE').AsString := ADescricao;
             ControllerConexao.qryQuery.ExecSQL;
             Result := True;
         except
             Result := False;
         end;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

end.
