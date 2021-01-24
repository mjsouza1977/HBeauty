unit Model.Metodos.Profissionais.ServerHBeauty;

interface

uses Controller.Conexao.HBeautyServer,
     Data.FireDACJSONReflect,
     FireDAC.Stan.Param;

function ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AIDTerceirizada, AId : Integer) : TFDJSONDataSets;
function CadastraProfissional(ATerceirizado : Boolean; AIdCargo, AIdEmpTer, ANrLog : Integer; ANome, ASobreNome, ACPF, ARG,
                              ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep, APathOriginal : String; ASalario, AComissao : Currency) : Integer;

function AtualizaProfissional(ATerceirizado : Boolean; AIdProfiss, AIdCargo, AIdEmpTer, ANrLog : Integer; ANome, ASobreNome, ACPF, ARG,
                              ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String; ASalario, AComissao : Currency) : String;

function CarregaProfissionalTerceirizado(AIdTerceirizado : Integer) : TFDJSONDataSets;
function CarregaCamposProfissionais(ACampos : String) : TFDJSONDataSets;
function AtualizaFotoProfissional(AIDProfissional, AIdFoto : Integer) : String;

implementation

uses
  System.SysUtils, Units.Utils.ServerBeauty, Vcl.Dialogs, Model.Metodos.Imagens.ServerHBeauty;

function CarregaCamposProfissionais(ACampos : String) : TFDJSONDataSets;
begin

     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT ' + ACampos + ' FROM HBPROFISSIONAIS');
         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AIDTerceirizada, AId : Integer) : TFDJSONDataSets;
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

         if AIDTerceirizada > 0 then
            ASql := ASql + ' AND IDEMPTER_PROFIS = ' + AIDTerceirizada.ToString;

         ASql := Copy(ASql,5, Length(ASql));

         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBPROFISSIONAIS');
         ControllerConexao.qryQuery.SQL.Add('LEFT JOIN HBIMAGENS');
         ControllerConexao.qryQuery.SQL.Add('ON (HBPROFISSIONAIS.IDFOTO_PROFIS = HBIMAGENS.IDIMAGEM)');
         ControllerConexao.qryQuery.SQL.Add('LEFT JOIN HBTERCEIRIZADA');
         ControllerConexao.qryQuery.SQL.Add('ON (HBPROFISSIONAIS.IDEMPTER_PROFIS = HBTERCEIRIZADA.ID_TERCEIRIZADA)');
         ControllerConexao.qryQuery.SQL.Add('LEFT JOIN HBCARGO');
         ControllerConexao.qryQuery.SQL.Add('ON (HBPROFISSIONAIS.IDCARGO_PROFIS = HBCARGO.ID_CARGO)');


         if ASql <> '' then
            ControllerConexao.qryQuery.SQL.Add('WHERE ' + ASql);

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function CarregaProfissionalTerceirizado(AIdTerceirizado : Integer) : TFDJSONDataSets;
begin

     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBPROFISSIONAIS');
         ControllerConexao.qryQuery.SQL.Add('WHERE IDEMPTER_PROFIS = ' + AIdTerceirizado.ToString);

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;

     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function AtualizaProfissional(ATerceirizado : Boolean; AIdProfiss, AIdCargo, AIdEmpTer, ANrLog : Integer; ANome, ASobreNome, ACPF, ARG,
                              ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String; ASalario, AComissao : Currency) : String;
begin

    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('UPDATE HBPROFISSIONAIS SET');
            ControllerConexao.qryQuery.SQL.Add('IDCARGO_PROFIS     = :IDCARGO_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('IDEMPTER_PROFIS    = :IDEMPTER_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('NOME_PROFIS        = :NOME_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('SOBRENOME_PROFIS   = :SOBRENOME_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('CPF_PROFIS         = :CPF_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('RG_PROFIS          = :RG_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('TERC_PROFIS        = :TERC_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('SALARIO_PROFIS     = :SALARIO_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('COMISSAO_PROFIS    = :COMISSAO_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('LOGRADOURO_PROFIS  = :LOGRADOURO_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('NRLOG_PROFIS       = :NRLOG_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('COMPLLOG_PROFIS    = :COMPLLOG_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('BAIRROLOG_PROFIS   = :BAIRROLOG_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('CIDADELOG_PROFIS   = :CIDADELOG_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('UFLOG_PROFIS       = :UFLOG_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('CEP_PROFIS         = :CEP_PROFIS,');
            ControllerConexao.qryQuery.SQL.Add('IDUSULOCK          = :IDUSULOCK,');
            ControllerConexao.qryQuery.SQL.Add('LOCK               = :LOCK');
            ControllerConexao.qryQuery.SQL.Add('WHERE ID_PROFIS    = :ID_PROFIS');

            ControllerConexao.qryQuery.ParamByName('IDCARGO_PROFIS'   ).AsInteger  := AIdCargo;
            ControllerConexao.qryQuery.ParamByName('IDEMPTER_PROFIS'  ).AsInteger  := AIdEmpTer;
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
            ControllerConexao.qryQuery.ParamByName('ID_PROFIS'        ).AsInteger  := AIdProfiss;
            ControllerConexao.qryQuery.ParamByName('IDUSULOCK'        ).AsInteger  := 0;
            ControllerConexao.qryQuery.ParamByName('LOCK'             ).AsString   := 'F';
            ControllerConexao.qryQuery.ExecSQL;
            ControllerConexao.fdTransacao.Commit;
            Result := '';

        except on E:Exception do
            Result := E.Message;
        end;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

procedure InseriFotoProfissional(AIDProfissional : Integer; APathOriginal : String);
begin
     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('UPDATE HBPROFISSIONAIS SET');
         ControllerConexao.qryQuery.SQL.Add('IDFOTO_PROFIS = ' + GravaImagem(AIDProfissional, 'PES', '.JPG', '', 'PRF', APathOriginal).ToString);
         ControllerConexao.qryQuery.SQL.Add('WHERE ID_PROFIS = ' + AIDProfissional.ToString);
         ControllerConexao.qryQuery.ExecSQL;
     finally
         ControllerConexao.qryQuery.Close;
     end;
end;

function AtualizaFotoProfissional(AIDProfissional, AIdFoto : Integer) : String;
begin
     try
         try
             ControllerConexao.qryQuery.Close;
             ControllerConexao.qryQuery.SQL.Clear;
             ControllerConexao.qryQuery.SQL.Add('UPDATE HBPROFISSIONAIS SET');
             ControllerConexao.qryQuery.SQL.Add('IDFOTO_PROFIS = ' + AIdFoto.ToString);
             ControllerConexao.qryQuery.SQL.Add('WHERE ID_PROFIS = ' + AIDProfissional.ToString);
             ControllerConexao.qryQuery.ExecSQL;

             ControllerConexao.qryQuery.Close;
             ControllerConexao.qryQuery.SQL.Clear;
             ControllerConexao.qryQuery.SQL.Add('SELECT IDIMAGEM, NOMEFILEIMAGEM FROM HBIMAGENS');
             ControllerConexao.qryQuery.SQL.Add('WHERE IDIMAGEM = ' + AIdFoto.ToString);
             ControllerConexao.qryQuery.Open;
             Result := ControllerConexao.qryQuery.FieldByName('NOMEFILEIMAGEM').AsString;
         except
             Result := '';
         end;
     finally
         ControllerConexao.qryQuery.Close;
     end;
end;

function CadastraProfissional(ATerceirizado : Boolean; AIdCargo, AIdEmpTer, ANrLog : Integer; ANome, ASobreNome, ACPF, ARG,
                              ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep, APathOriginal : String; ASalario, AComissao : Currency) : Integer;
var
AID : Integer;
begin
     try

         try
             ControllerConexao.qryQuery.Close;
             ControllerConexao.qryQuery.SQL.Clear;
             ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBPROFISSIONAIS');
             ControllerConexao.qryQuery.SQL.Add('(IDCARGO_PROFIS, IDEMPTER_PROFIS, NOME_PROFIS,');
             ControllerConexao.qryQuery.SQL.Add('SOBRENOME_PROFIS, CPF_PROFIS, RG_PROFIS, TERC_PROFIS, SALARIO_PROFIS,');
             ControllerConexao.qryQuery.SQL.Add('COMISSAO_PROFIS, LOGRADOURO_PROFIS, NRLOG_PROFIS, COMPLLOG_PROFIS,');
             ControllerConexao.qryQuery.SQL.Add('BAIRROLOG_PROFIS, CIDADELOG_PROFIS, UFLOG_PROFIS, CEP_PROFIS) VALUES');
             ControllerConexao.qryQuery.SQL.Add('(:IDCARGO_PROFIS, :IDEMPTER_PROFIS, :NOME_PROFIS,');
             ControllerConexao.qryQuery.SQL.Add(':SOBRENOME_PROFIS, :CPF_PROFIS, :RG_PROFIS, :TERC_PROFIS, :SALARIO_PROFIS,');
             ControllerConexao.qryQuery.SQL.Add(':COMISSAO_PROFIS, :LOGRADOURO_PROFIS, :NRLOG_PROFIS, :COMPLLOG_PROFIS,');
             ControllerConexao.qryQuery.SQL.Add(':BAIRROLOG_PROFIS, :CIDADELOG_PROFIS, :UFLOG_PROFIS, :CEP_PROFIS)');

             ControllerConexao.qryQuery.ParamByName('IDCARGO_PROFIS'   ).AsInteger  := AIdCargo;
             ControllerConexao.qryQuery.ParamByName('IDEMPTER_PROFIS'  ).AsInteger  := AIdEmpTer;
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
             AID    := ControllerConexao.qryQuery.FieldByName('IDPROFISSIONAL').AsInteger;
             InseriFotoProfissional(AID, APathOriginal);
             Result := AID;
         except
             Result := 0;
         end;
     finally
         ControllerConexao.qryQuery.Close;
     end;
end;

end.
