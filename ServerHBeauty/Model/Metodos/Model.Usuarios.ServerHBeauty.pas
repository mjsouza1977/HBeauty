unit Model.Usuarios.ServerHBeauty;

interface

uses
  Data.FireDACJSONReflect, Utils.Query.HBeautyServer;


function ValidaLogin(Usuario, Senha : String) : TFDJSONDataSets;


var
   FQuery : TUtilsQuery;

implementation

uses
  System.SysUtils;

function ValidaLogin(Usuario, Senha : String) : TFDJSONDataSets;
begin

     try
         FQuery := TUtilsQuery.Create;
         FQuery.Close;
         FQuery.SQL.Clear;
         FQuery.SQL.Add('SELECT * FROM HBUSUARIOS');
         FQuery.SQL.Add('WHERE LOGIN_USU = ' + QuotedStr(Usuario));
         FQuery.SQL.Add('AND SENHA = ' + QuotedStr(Senha));

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, FQuery);
         FQuery.Active := True;
     finally
         FreeAndNil(FQuery);
     end;

end;

end.
