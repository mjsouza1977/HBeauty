unit Model.Metodos.Genericos.ServerHBeauty;

interface

function DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela : String) : String;

implementation


uses
  Controller.Conexao.HBeautyServer, System.SysUtils;



function DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela : String) : String;
begin

     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT ' + ACampoNome + ' FROM ' + ATabela);
         ControllerConexao.qryQuery.SQL.Add('WHERE ' + ACampoDocumento + ' = ' + QuotedStr(ADocumento));
         ControllerConexao.qryQuery.Open;

         Result := ControllerConexao.qryQuery.FieldByName(ACampoNome).AsString;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

end.
