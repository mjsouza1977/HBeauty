unit Model.Metodos.Imagens.ServerHBeauty;

interface

function GravaImagem(APrefixo, AExtensao : String) : Integer;



implementation

uses
  System.SysUtils,
  Controller.Conexao.HBeautyServer,
  Units.Utils.ServerBeauty;

function GravaImagem(APrefixo, AExtensao : String) : Integer;
begin

     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('');
         ControllerConexao.qryQuery.SQL.Add('');

     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

//begin
//
//    try
//        ControllerConexao.qryQuery.Close;
//        ControllerConexao.qryQuery.SQL.Clear;
//        ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBCONTROLE');
//
//        Result := TFDJSONDataSets.Create;
//        TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
//        ControllerConexao.qryQuery.Active := True;
//    finally
//        ControllerConexao.qryQuery.Close;
//    end;
//
//end;




end.
