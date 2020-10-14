unit Model.Metodos.Profissionais.ServerHBeauty;

interface

uses Controller.Conexao.HBeautyServer,
     Data.FireDACJSONReflect;

function ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
function CadastraProfissional(ATerceirizado : Boolean; AIdCargo, AIdEmpTer, ANrLog : Integer; ACodigo, ANome, ASobreNome, ACPF, ARG,
                              ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String; ASalario, AComissao : Currency) : Integer;

implementation

uses
  System.SysUtils, Units.Utils.ServerBeauty;

function ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
var
ASql : String;
begin
     try
         if ANome <> '' then
            begin
                if ATipoPesquisa = 'Inicia'   then ASql := ASql + ' AND NOME_PROFIS LIKE ' + QuotedStr(ANome + '%');
                if ATipoPesquisa = 'Termina'  then ASql := ASql + ' AND NOME_PROFIS LIKE ' + QuotedStr('%' + ANome);
                if ATipoPesquisa = 'Contenha' then ASql := ASql + ' AND NOME_PROFIS LIKE ' + QuotedStr('%' + ANome + '%');
                if ATipoPesquisa = 'Igual'    then ASql := ASql + ' AND NOME_PROFIS =    ' + QuotedStr(ANome);
            end;

         if ACPF <> '' then
            begin
                if ATipoPesquisa = 'Inicia'   then ASql := ASql + ' AND CPF_PROFIS LIKE ' + QuotedStr(ACPF + '%');
                if ATipoPesquisa = 'Termina'  then ASql := ASql + ' AND CPF_PROFIS LIKE ' + QuotedStr('%' + ACPF);
                if ATipoPesquisa = 'Contenha' then ASql := ASql + ' AND CPF_PROFIS LIKE ' + QuotedStr('%' + ACPF + '%');
                if ATipoPesquisa = 'Igual'    then ASql := ASql + ' AND CPF_PROFIS =    ' + QuotedStr(ACPF);
            end;

         if AId > 0 then
            ASql := ASql + ' AND ID_PROFIS = ' + AID.ToString;

         ASql := Copy(ASql,5, Length(ASql));

         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBPROFISSIONAIS');
         if ASql <> '' then
            ControllerConexao.qryQuery.SQL.Add('WHERE ' + ASql);

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function CadastraProfissional(ATerceirizado : Boolean; AIdCargo, AIdEmpTer, ANrLog : Integer; ACodigo, ANome, ASobreNome, ACPF, ARG,
                              ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String; ASalario, AComissao : Currency) : Integer;

begin

     try

         try
             ControllerConexao.qryQuery.Close;
             ControllerConexao.qryQuery.SQL.Clear;
             ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBPROFISSIONAIS');
             ControllerConexao.qryQuery.SQL.Add('(IDCARGO_PROFIS, IDEMPTER_PROFIS, CODIGO_PROFIS, NOME_PROFIS,');
             ControllerConexao.qryQuery.SQL.Add('SOBRENOME_PROFIS, CPF_PROFIS, RG_PROFIS, TERC_PROFIS, SALARIO_PROFIS,');
             ControllerConexao.qryQuery.SQL.Add('COMISSAO_PROFIS, LOGRADOURO_PROFIS, NRLOG_PROFIS, COMPLLOG_PROFIS,');
             ControllerConexao.qryQuery.SQL.Add('BAIRROLOG_PROFIS, CIDADELOG_PROFIS, UFLOG_PROFIS, CEP_PROFIS) VALUES');
             ControllerConexao.qryQuery.SQL.Add('(:IDCARGO_PROFIS, :IDEMPTER_PROFIS, :CODIGO_PROFIS, :NOME_PROFIS,');
             ControllerConexao.qryQuery.SQL.Add(':SOBRENOME_PROFIS, :CPF_PROFIS, :RG_PROFIS, :TERC_PROFIS, :SALARIO_PROFIS,');
             ControllerConexao.qryQuery.SQL.Add(':COMISSAO_PROFIS, :LOGRADOURO_PROFIS, :NRLOG_PROFIS, :COMPLLOG_PROFIS,');
             ControllerConexao.qryQuery.SQL.Add(':BAIRROLOG_PROFIS, :CIDADELOG_PROFIS, :UFLOG_PROFIS, :CEP_PROFIS)');

             ControllerConexao.qryQuery.ParamByName('IDCARGO_PROFIS'   ).AsInteger  := AIdCargo;
             ControllerConexao.qryQuery.ParamByName('IDEMPTER_PROFIS'  ).AsInteger  := AIdEmpTer;
             ControllerConexao.qryQuery.ParamByName('CODIGO_PROFIS'    ).AsString   := ACodigo;
             ControllerConexao.qryQuery.ParamByName('NOME_PROFIS'      ).AsString   := ANome;
             ControllerConexao.qryQuery.ParamByName('SOBRENOME_PROFIS' ).AsString   := ASobreNome;
             ControllerConexao.qryQuery.ParamByName('CPF_PROFIS'       ).AsString   := ACPF;
             ControllerConexao.qryQuery.ParamByName('RG_PROFIS'        ).AsString   := ARG;
             ControllerConexao.qryQuery.ParamByName('TERC_PROFIS'      ).AsBoolean  := ATerceirizado;
             ControllerConexao.qryQuery.ParamByName('SALARIO_PROFIS'   ).AsCurrency := ASalario;
             ControllerConexao.qryQuery.ParamByName('COMISSAO_PROFIS'  ).AsCurrency := AComissao;
             ControllerConexao.qryQuery.ParamByName('LOGRADOURO_PROFIS').AsString   := ALogradouro;
             ControllerConexao.qryQuery.ParamByName('NRLOG_PROFIS'     ).AsInteger  := ANrLog;
             ControllerConexao.qryQuery.ParamByName('COMPLLOG_PROFIS'  ).AsString   := AComplemento;
             ControllerConexao.qryQuery.ParamByName('BAIRROLOG_PROFIS' ).AsString   := ABairro;
             ControllerConexao.qryQuery.ParamByName('CIDADELOG_PROFIS' ).AsString   := ACidade;
             ControllerConexao.qryQuery.ParamByName('UFLOG_PROFIS'     ).AsString   := AUF;
             ControllerConexao.qryQuery.ParamByName('CEP_PROFIS'       ).AsString   := ACep;

             ControllerConexao.qryQuery.ExecSQL;

             ControllerConexao.qryQuery.Open('SELECT GEN_ID(GEN_HBPROFISSIONAIS_ID, 0) AS IDPROFISSIONAL FROM RDB$DATABASE');
             Result := ControllerConexao.qryQuery.FieldByName('IDPROFISSIONAL').AsInteger;
         except
             Result := 0;
         end;
     finally
         ControllerConexao.qryQuery.Close;
     end;
end;

end.
