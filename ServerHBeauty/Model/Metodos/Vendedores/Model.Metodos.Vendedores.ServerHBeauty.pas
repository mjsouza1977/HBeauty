unit Model.Metodos.Vendedores.ServerHBeauty;

interface

uses
     Data.FireDACJSONReflect,
     FireDAC.Stan.Param;

function carregaVendedores : TFDJSONDataSets;
function PesquisaVendedor(ANome, ACPF, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
function cadastraVendedor(ANrLog : Integer; ACPF, ARG, ANome, ALog, ACompl, ABairro, ACep, ACidade, AUF : String) : String;
function atualizaVendedor(AIdVend, ANrLog : Integer; ACPF, ARG, ANome, ALog, ACompl, ABairro, ACep, ACidade, AUF : String) : String;

implementation

uses
  Controller.Conexao.HBeautyServer, System.SysUtils;

function atualizaVendedor(AIdVend, ANrLog : Integer; ACPF, ARG, ANome, ALog, ACompl, ABairro, ACep, ACidade, AUF : String) : String;
begin
    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('UPDATE HBVENDEDOR SET'         );
            ControllerConexao.qryQuery.SQL.Add('NOME_VEND     = :NOME_VEND,'   );
            ControllerConexao.qryQuery.SQL.Add('RG_VEND       = :RG_VEND,'     );
            ControllerConexao.qryQuery.SQL.Add('CPF_VEND      = :CPF_VEND,'    );
            ControllerConexao.qryQuery.SQL.Add('LOG_VEND      = :LOG_VEND,'    );
            ControllerConexao.qryQuery.SQL.Add('NRLOG_VEND    = :NRLOG_VEND,'  );
            ControllerConexao.qryQuery.SQL.Add('COMPLOG_VEND  = :COMPLOG_VEND,');
            ControllerConexao.qryQuery.SQL.Add('BAILOG_VEND   = :BAILOG_VEND,' );
            ControllerConexao.qryQuery.SQL.Add('CEPLOG_VEND   = :CEPLOG_VEND,' );
            ControllerConexao.qryQuery.SQL.Add('CIDLOG_VEND   = :CIDLOG_VEND,' );
            ControllerConexao.qryQuery.SQL.Add('UFLOG_VEND    = :UFLOG_VEND,'  );
            ControllerConexao.qryQuery.SQL.Add('LOCK          = :LOCK,'        );
            ControllerConexao.qryQuery.SQL.Add('IDUSULOCK     = :IDUSULOCK'    );
            ControllerConexao.qryQuery.SQL.Add('WHERE ID_VEND = :ID_VEND'      );
            ControllerConexao.qryQuery.ParamByName('NOME_VEND'   ).AsString  := ANome;
            ControllerConexao.qryQuery.ParamByName('RG_VEND'     ).AsString  := ARG;
            ControllerConexao.qryQuery.ParamByName('CPF_VEND'    ).AsString  := ACPF;
            ControllerConexao.qryQuery.ParamByName('LOG_VEND'    ).AsString  := ALog;
            ControllerConexao.qryQuery.ParamByName('NRLOG_VEND'  ).AsInteger := ANrLog;
            ControllerConexao.qryQuery.ParamByName('COMPLOG_VEND').AsString  := ACompl;
            ControllerConexao.qryQuery.ParamByName('BAILOG_VEND' ).AsString  := ABairro;
            ControllerConexao.qryQuery.ParamByName('CEPLOG_VEND' ).AsString  := ACep;
            ControllerConexao.qryQuery.ParamByName('CIDLOG_VEND' ).AsString  := ACidade;
            ControllerConexao.qryQuery.ParamByName('UFLOG_VEND'  ).AsString  := AUf;
            ControllerConexao.qryQuery.ParamByName('LOCK'        ).AsString  := 'F';
            ControllerConexao.qryQuery.ParamByName('IDUSULOCK'   ).AsInteger := 0;
            ControllerConexao.qryQuery.ParamByName('ID_VEND'     ).AsInteger := AIdVend;

            Result := '';
        except on E:Exception do
            Result := E.Message;
        end;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

function cadastraVendedor(ANrLog : Integer; ACPF, ARG, ANome, ALog, ACompl, ABairro, ACep, ACidade, AUF : String) : String;
begin
    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBVENDEDOR');
            ControllerConexao.qryQuery.SQL.Add('(NOME_VEND, RG_VEND, CPF_VEND, LOG_VEND, NRLOG_VEND,');
            ControllerConexao.qryQuery.SQL.Add('COMPLOG_VEND, BAILOG_VEND, CEPLOG_VEND, CIDLOG_VEND,');
            ControllerConexao.qryQuery.SQL.Add('UFLOG_VEND ,LOCK ,IDUSULOCK) VALUES');
            ControllerConexao.qryQuery.SQL.Add('(:NOME_VEND, :RG_VEND, :CPF_VEND, :LOG_VEND, :NRLOG_VEND,');
            ControllerConexao.qryQuery.SQL.Add(':COMPLOG_VEND, :BAILOG_VEND, :CEPLOG_VEND, :CIDLOG_VEND,');
            ControllerConexao.qryQuery.SQL.Add(':UFLOG_VEND ,:LOCK ,:IDUSULOCK)');
            ControllerConexao.qryQuery.ParamByName('NOME_VEND'   ).AsString  := ANome;
            ControllerConexao.qryQuery.ParamByName('RG_VEND'     ).AsString  := ARG;
            ControllerConexao.qryQuery.ParamByName('CPF_VEND'    ).AsString  := ACPF;
            ControllerConexao.qryQuery.ParamByName('LOG_VEND'    ).AsString  := ALog;
            ControllerConexao.qryQuery.ParamByName('NRLOG_VEND'  ).AsInteger := ANrLog;
            ControllerConexao.qryQuery.ParamByName('COMPLOG_VEND').AsString  := ACompl;
            ControllerConexao.qryQuery.ParamByName('BAILOG_VEND' ).AsString  := ABairro;
            ControllerConexao.qryQuery.ParamByName('CEPLOG_VEND' ).AsString  := ACep;
            ControllerConexao.qryQuery.ParamByName('CIDLOG_VEND' ).AsString  := ACidade;
            ControllerConexao.qryQuery.ParamByName('UFLOG_VEND'  ).AsString  := AUf;
            ControllerConexao.qryQuery.ParamByName('LOCK'        ).AsString  := 'F';
            ControllerConexao.qryQuery.ParamByName('IDUSULOCK'   ).AsInteger := 0;
            ControllerConexao.qryQuery.ExecSQL;

            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('SELECT ID_VEND FROM HBVENDEDOR FROM CPF_VEND = ' + QuotedStr(ACPF));
            ControllerConexao.qryQuery.Open;
            Result := ControllerConexao.qryQuery.FieldByName('ID_VEND').AsString;
        except on E:Exception do
            begin
                 Result := E.Message;
            end;
        end;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

function carregaVendedores : TFDJSONDataSets;
begin

     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBVENDEDOR');
         ControllerConexao.qryQuery.SQL.Add('ORDER BY NOME_VEND');

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function PesquisaVendedor(ANome, ACPF, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
var
ASql : String;
begin
     try
         if ANome <> '' then
            begin
                if ATipoPesquisa = 'Inicia'   then ASql := ASql + ' AND NOME_VEND LIKE ' + QuotedStr(ANome + '%');
                if ATipoPesquisa = 'Termina'  then ASql := ASql + ' AND NOME_VEND LIKE ' + QuotedStr('%' + ANome);
                if ATipoPesquisa = 'Contenha' then ASql := ASql + ' AND NOME_VEND LIKE ' + QuotedStr('%' + ANome + '%');
                if ATipoPesquisa = 'Igual'    then ASql := ASql + ' AND NOME_VEND =    ' + QuotedStr(ANome);
            end;

         if ACPF <> '' then
            begin
                if ATipoPesquisa = 'Inicia'   then ASql := ASql + ' AND CPF_VEND ' + QuotedStr(ACPF + '%');
                if ATipoPesquisa = 'Termina'  then ASql := ASql + ' AND CPF_VEND LIKE ' + QuotedStr('%' + ACPF);
                if ATipoPesquisa = 'Contenha' then ASql := ASql + ' AND CPF_VEND LIKE ' + QuotedStr('%' + ACPF + '%');
                if ATipoPesquisa = 'Igual'    then ASql := ASql + ' AND CPF_VEND =    ' + QuotedStr(ACPF);
            end;

         if AId > 0 then
            ASql := ASql + ' AND CPF_VEND = ' + AID.ToString;

         ASql := Copy(ASql,5, Length(ASql));

         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBVENDEDOR');
         if ASql <> '' then
            ControllerConexao.qryQuery.SQL.Add('WHERE ' + ASql);

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;


end.

