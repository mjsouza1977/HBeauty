unit Model.Metodos.Habilidades.ServerHBeauty;

interface

implementation

function carregaHabilidades : TFDJSONDataSets;

uses
  Data.FireDACJSONReflect, Controller.Conexao.HBeautyServer;

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

end.
