unit Model.Controle.ServerHBeauty;

interface

uses Model.Metodos.ServerHBeauty, Data.FireDACJSONReflect;


function CarregaControle : TFDJSONDataSets;



implementation

uses
  System.SysUtils, Controller.Conexao.HBeautyServer;



function CarregaControle : TFDJSONDataSets;
begin

    try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBCONTROLE');

        Result := TFDJSONDataSets.Create;
        TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
        ControllerConexao.qryQuery.Active := True;
    finally
        ControllerConexao.qryQuery.Close;
    end;

end;




end.
