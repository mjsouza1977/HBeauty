unit Model.Metodos.Usuarios.ServerHBeauty;

interface

uses
  Data.FireDACJSONReflect;


function ValidaLogin(Usuario, Senha : String) : TFDJSONDataSets;



implementation

uses
  System.SysUtils, Controller.Conexao.HBeautyServer;

function ValidaLogin(Usuario, Senha : String) : TFDJSONDataSets;
begin

     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBUSUARIOS');
         ControllerConexao.qryQuery.SQL.Add('WHERE LOGIN_USU = ' + QuotedStr(Usuario));
         ControllerConexao.qryQuery.SQL.Add('AND SENHA = ' + QuotedStr(Senha));

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

end.
