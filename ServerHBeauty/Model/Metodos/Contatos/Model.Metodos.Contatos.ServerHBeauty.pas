unit Model.Metodos.Contatos.ServerHBeauty;

interface

uses
  Data.FireDACJSONReflect,
  System.SysUtils,
  Controller.Conexao.HBeautyServer;



function CarregaEmails(ATipoEmail : String; AIdTabEmail : Integer) : TFDJSONDataSets;
function CarregaTelefones(ATipoFone : String; AIdTabFone : Integer) : TFDJSONDataSets;


implementation


function CarregaTelefones(ATipoFone : String; AIdTabFone : Integer) : TFDJSONDataSets;
begin

    try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBTELEFONE');
        ControllerConexao.qryQuery.SQL.Add('WHERE NOMETAB_FONE = ' + QuotedStr(ATipoFone));
        ControllerConexao.qryQuery.SQL.Add('AND IDTAB_FONE = ' + AIdTabFone.ToString);
        Result := TFDJSONDataSets.Create;
        TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
        ControllerConexao.qryQuery.Active := True;
    finally
        ControllerConexao.qryQuery.Close;
    end;

end;

function CarregaEmails(ATipoEmail : String; AIdTabEmail : Integer) : TFDJSONDataSets;
begin
    try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBEMAILS');
        ControllerConexao.qryQuery.SQL.Add('WHERE NOMETAB_EMAIL = ' + QuotedStr(ATipoEmail));
        ControllerConexao.qryQuery.SQL.Add('AND IDTAB_EMAIL = ' + AIdTabEmail.ToString);
        Result := TFDJSONDataSets.Create;
        TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
        ControllerConexao.qryQuery.Active := True;
    finally
        ControllerConexao.qryQuery.Close;
    end;

end;

end.
