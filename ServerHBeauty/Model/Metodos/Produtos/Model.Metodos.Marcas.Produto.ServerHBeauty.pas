unit Model.Metodos.Marcas.Produto.ServerHBeauty;

interface

uses
     Data.FireDACJSONReflect,
     FireDAC.Stan.Param;

function carregaMarcas : TFDJSONDataSets;
function pesquisaMarcas(AIdMarca : Integer; AMarca : String) : TFDJSONDataSets;
function cadastraMarca(AMarca  : String) : String;
function atualizaMarca(AIDMarca : Integer; AMarca : String) : String;

implementation

uses
  Controller.Conexao.HBeautyServer, System.SysUtils;

function atualizaMarca(AIDMarca : Integer; AMarca : String) : String;
begin
    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('UPDATE HBMARCA SET');
            ControllerConexao.qryQuery.SQL.Add('MARCA_MARCA    = :MARCA_MARCA,');
            ControllerConexao.qryQuery.SQL.Add('LOCK           = :LOCK,');
            ControllerConexao.qryQuery.SQL.Add('IDUSULOCK      = :IDUSULOCK');
            ControllerConexao.qryQuery.SQL.Add('WHERE ID_MARCA = :ID_MARCA');

            ControllerConexao.qryQuery.ParamByName('MARCA_MARCA').AsString  := AMarca;
            ControllerConexao.qryQuery.ParamByName('LOCK'       ).AsString  := 'F';
            ControllerConexao.qryQuery.ParamByName('IDUSULOCK'  ).AsInteger := 0;
            ControllerConexao.qryQuery.ParamByName('ID_MARCA'   ).AsInteger := AIDMarca;
            ControllerConexao.qryQuery.ExecSQL;
            Result := '';
        except on E:Exception do
            Result := E.Message;
        end;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

function cadastraMarca(AMarca  : String) : String;
begin
    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBMARCA');
            ControllerConexao.qryQuery.SQL.Add('(MARCA_MARCA) VALUES');
            ControllerConexao.qryQuery.SQL.Add('(:MARCA_MARCA)');
            ControllerConexao.qryQuery.ParamByName('MARCA_MARCA').AsString  := AMarca;
            ControllerConexao.qryQuery.ExecSQL;

            Result := '';
        except on E:Exception do
            begin
                 Result := E.Message;
            end;
        end;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

function carregaMarcas : TFDJSONDataSets;
begin

     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBMARCA');
         ControllerConexao.qryQuery.SQL.Add('ORDER BY MARCA_MARCA');
         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function pesquisaMarcas(AIdMarca : Integer; AMarca : String) : TFDJSONDataSets;
var
ASql : String;
begin
    try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBMARCA');

        if AIdMarca > 0 then ASql := ' AND ID_MARCA = ' + AIdMarca.ToString;
        if AMarca <> '' then ASql := ASql + ' AND MARCA_MARCA LIKE ' + QuotedStr(AMarca + '%');

        ASql := Copy(ASql, 5, Length(ASql));

        if ASql <> '' then ControllerConexao.qryQuery.SQL.Add('WHERE ' + ASql);

        Result := TFDJSONDataSets.Create;
        TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
        ControllerConexao.qryQuery.Active := True;

    finally
        ControllerConexao.qryQuery.Close;
    end;

end;


end.
