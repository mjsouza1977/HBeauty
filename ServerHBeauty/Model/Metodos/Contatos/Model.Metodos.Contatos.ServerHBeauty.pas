unit Model.Metodos.Contatos.ServerHBeauty;

interface

uses
  Data.FireDACJSONReflect,
  System.SysUtils,
  Controller.Conexao.HBeautyServer;



function CarregaEmails(ATipoEmail : String; AIdTabEmail : Integer) : TFDJSONDataSets;
function CarregaTelefones(ATipoFone : String; AIdTabFone : Integer) : TFDJSONDataSets;

function CadastraEmail(AEmail, APrefixoTabela : String; AIdRegTab : Integer; ARestrito : Boolean) : Integer;
function CadastraTelefone(AFone, AContato, APrefixoTabela : String; AIdRegTab : Integer; AWhatsFone, ARestrito : Boolean) : Integer;


implementation

uses Units.Utils.ServerBeauty;

function CadastraEmail(AEmail, APrefixoTabela : String; AIdRegTab : Integer; ARestrito : Boolean) : Integer;
begin

  try
     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBEMAILS');
         ControllerConexao.qryQuery.SQL.Add('(EMAIL_EMAIL, NOMETAB_EMAIL, IDTAB_EMAIL, RESTRITO_EMAIL) VALUES');
         ControllerConexao.qryQuery.SQL.Add('(:EMAIL_EMAIL, :NOMETAB_EMAIL, :IDTAB_EMAIL, :RESTRITO_EMAIL)');
         ControllerConexao.qryQuery.ParamByName('EMAIL_EMAIL'   ).AsString  := AEmail;
         ControllerConexao.qryQuery.ParamByName('NOMETAB_EMAIL' ).AsString  := APrefixoTabela;
         ControllerConexao.qryQuery.ParamByName('IDTAB_EMAIL'   ).AsInteger := AIdRegTab;
         ControllerConexao.qryQuery.ParamByName('RESTRITO_EMAIL').AsString  := BoolToStrValue(ARestrito,'F','T');
         ControllerConexao.qryQuery.ExecSQL;

         ControllerConexao.qryQuery.Open('SELECT GEN_ID(GEN_HBEMAILS_ID, 0) AS IDEMAIL FROM RDB$DATABASE');
         Result := ControllerConexao.qryQuery.FieldByName('IDEMAIL').AsInteger;
     finally
         ControllerConexao.qryQuery.Close;
     end;
  except
        Result := 0;
  end;
end;


function CadastraTelefone(AFone, AContato, APrefixoTabela : String; AIdRegTab : Integer; AWhatsFone, ARestrito : Boolean) : Integer;
begin

  try
     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBTELEFONES');
         ControllerConexao.qryQuery.SQL.Add('(NR_FONE, CONTATO_FONE, NOMETAB_FONE, IDTAB_FONE, WHATS_FONE, RESTRITO_FONE) VALUES');
         ControllerConexao.qryQuery.SQL.Add('(:NR_FONE, :CONTATO_FONE, :NOMETAB_FONE, :IDTAB_FONE, :WHATS_FONE, :RESTRITO_FONE)');
         ControllerConexao.qryQuery.ParamByName('NR_FONE'      ).AsString  := AFone;
         ControllerConexao.qryQuery.ParamByName('CONTATO_FONE' ).AsString  := AContato;
         ControllerConexao.qryQuery.ParamByName('NOMETAB_FONE' ).AsString  := APrefixoTabela;
         ControllerConexao.qryQuery.ParamByName('IDTAB_FONE'   ).AsInteger := AIdRegTab;
         ControllerConexao.qryQuery.ParamByName('WHATS_FONE'   ).AsString  := BoolToStrValue(AWhatsFone,'F','T');
         ControllerConexao.qryQuery.ParamByName('RESTRITO_FONE').AsString  := BoolToStrValue(ARestrito,'F','T');
         ControllerConexao.qryQuery.ExecSQL;

         ControllerConexao.qryQuery.Open('SELECT GEN_ID(GEN_HBTELEFONES_ID, 0) AS IDTELEFONE FROM RDB$DATABASE');
         Result := ControllerConexao.qryQuery.FieldByName('IDTELEFONE').AsInteger;
     finally
         ControllerConexao.qryQuery.Close;
     end;
  except
        Result := 0;
  end;

end;

function CarregaTelefones(ATipoFone : String; AIdTabFone : Integer) : TFDJSONDataSets;
begin

    try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBTELEFONES');
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
