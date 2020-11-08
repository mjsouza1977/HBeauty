unit Model.Metodos.Terceirizadas.ServerHBeauty;

interface

uses Controller.Conexao.HBeautyServer,
     Data.FireDACJSONReflect;

function ListaTerceirizadas(ARazao, AFantasia, ACNPJ, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
function CadastraTerceirizada(ANrLog : Integer; ACodigo, ARazao, AFantasia, ACNPJ, AIE,
                              ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String) : Integer;
function CarregaCamposTerceirizada(ACampos : String) : TFDJSONDataSets;
function AtualizaTerceirizada(AIdTerc, ANrLog : Integer; ACodigo, ARazao, AFantasia, ACNPJ, AIE,
                              ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String) : Boolean;

implementation

uses
  System.SysUtils, Units.Utils.ServerBeauty, Vcl.Dialogs;


function CarregaCamposTerceirizada(ACampos : String) : TFDJSONDataSets;
begin

     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT ' + ACampos + ' FROM HBTERCEIRIZADA');

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function ListaTerceirizadas(ARazao, AFantasia, ACNPJ, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
var
ASql : String;
begin
     try
         if ARazao <> '' then
            begin
                if ATipoPesquisa = 'Inicia'   then ASql := ASql + ' AND RAZAO_TERCEIRIZADA LIKE ' + QuotedStr(ARazao + '%');
                if ATipoPesquisa = 'Termina'  then ASql := ASql + ' AND RAZAO_TERCEIRIZADA LIKE ' + QuotedStr('%' + ARazao);
                if ATipoPesquisa = 'Contenha' then ASql := ASql + ' AND RAZAO_TERCEIRIZADA LIKE ' + QuotedStr('%' + ARazao + '%');
                if ATipoPesquisa = 'Igual'    then ASql := ASql + ' AND RAZAO_TERCEIRIZADA =    ' + QuotedStr(ARazao);
            end;
         if AFantasia <> '' then
            begin
                if ATipoPesquisa = 'Inicia'   then ASql := ASql + ' AND FANTASIA_TERCEIRIZADA LIKE ' + QuotedStr(AFantasia + '%');
                if ATipoPesquisa = 'Termina'  then ASql := ASql + ' AND FANTASIA_TERCEIRIZADA LIKE ' + QuotedStr('%' + AFantasia);
                if ATipoPesquisa = 'Contenha' then ASql := ASql + ' AND FANTASIA_TERCEIRIZADA LIKE ' + QuotedStr('%' + AFantasia + '%');
                if ATipoPesquisa = 'Igual'    then ASql := ASql + ' AND FANTASIA_TERCEIRIZADA =    ' + QuotedStr(AFantasia);
            end;

         if ACNPJ <> '' then
            begin
                if ATipoPesquisa = 'Inicia'   then ASql := ASql + ' AND CNPJ_TERCEIRIZADA LIKE ' + QuotedStr(ACNPJ + '%');
                if ATipoPesquisa = 'Termina'  then ASql := ASql + ' AND CNPJ_TERCEIRIZADA LIKE ' + QuotedStr('%' + ACNPJ);
                if ATipoPesquisa = 'Contenha' then ASql := ASql + ' AND CNPJ_TERCEIRIZADA LIKE ' + QuotedStr('%' + ACNPJ + '%');
                if ATipoPesquisa = 'Igual'    then ASql := ASql + ' AND CNPJ_TERCEIRIZADA =    ' + QuotedStr(ACNPJ);
            end;

         if AId > 0 then
            ASql := ASql + ' AND ID_TERCEIRIZADA = ' + AID.ToString;

         ASql := Copy(ASql,5, Length(ASql));

         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBTERCEIRIZADA');
         if ASql <> '' then
            ControllerConexao.qryQuery.SQL.Add('WHERE ' + ASql);

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function AtualizaTerceirizada(AIdTerc, ANrLog : Integer; ACodigo, ARazao, AFantasia, ACNPJ, AIE,
                              ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String) : Boolean;
begin

    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('UPDATE HBTERCEIRIZADA SET');
            ControllerConexao.qryQuery.SQL.Add('CODIGO_TERCEIRIZADA       = :CODIGO_TERCEIRIZADA,');
            ControllerConexao.qryQuery.SQL.Add('CNPJ_TERCEIRIZADA         = :CNPJ_TERCEIRIZADA,');
            ControllerConexao.qryQuery.SQL.Add('IE_TERCEIRIZADA           = :IE_TERCEIRIZADA,');
            ControllerConexao.qryQuery.SQL.Add('RAZAO_TERCEIRIZADA        = :RAZAO_TERCEIRIZADA,');
            ControllerConexao.qryQuery.SQL.Add('FANTASIA_TERCEIRIZADA     = :FANTASIA_TERCEIRIZADA,');
            ControllerConexao.qryQuery.SQL.Add('CEPLOG_TERCEIRIZADA       = :CEPLOG_TERCEIRIZADA,');
            ControllerConexao.qryQuery.SQL.Add('LOGLOG_TERCEIRIZADA       = :LOGLOG_TERCEIRIZADA,');
            ControllerConexao.qryQuery.SQL.Add('NRLOG_TERCEIRIZADA        = :NRLOG_TERCEIRIZADA,');
            ControllerConexao.qryQuery.SQL.Add('COMPLLOG_TERCEIRIZADA     = :COMPLLOG_TERCEIRIZADA,');
            ControllerConexao.qryQuery.SQL.Add('BAIRROLOG_TERCEIRIZADA    = :BAIRROLOG_TERCEIRIZADA,');
            ControllerConexao.qryQuery.SQL.Add('CIDADELOG_TERCEIRIZADA    = :CIDADELOG_TERCEIRIZADA,');
            ControllerConexao.qryQuery.SQL.Add('UFLOG_TERCEIRIZADA        = :UFLOG_TERCEIRIZADA');
            ControllerConexao.qryQuery.SQL.Add('WHERE ID_TERCEIRIZADA     = :ID_TERCEIRIZADA');

            ControllerConexao.qryQuery.ParamByName('CODIGO_TERCEIRIZADA'      ).AsString  := ACodigo;
            ControllerConexao.qryQuery.ParamByName('CNPJ_TERCEIRIZADA'        ).AsString  := ACNPJ;
            ControllerConexao.qryQuery.ParamByName('IE_TERCEIRIZADA'          ).AsString  := AIE;
            ControllerConexao.qryQuery.ParamByName('RAZAO_TERCEIRIZADA'       ).AsString  := ARazao;
            ControllerConexao.qryQuery.ParamByName('FANTASIA_TERCEIRIZADA'    ).AsString  := AFantasia;
            ControllerConexao.qryQuery.ParamByName('CEPLOG_TERCEIRIZADA'      ).AsString  := ACep;
            ControllerConexao.qryQuery.ParamByName('LOGLOG_TERCEIRIZADA'      ).AsString  := ALogradouro;
            ControllerConexao.qryQuery.ParamByName('NRLOG_TERCEIRIZADA'       ).AsInteger := ANrLog;
            ControllerConexao.qryQuery.ParamByName('COMPLLOG_TERCEIRIZADA'    ).AsString  := AComplemento;
            ControllerConexao.qryQuery.ParamByName('BAIRROLOG_TERCEIRIZADA'   ).AsString  := ABairro;
            ControllerConexao.qryQuery.ParamByName('CIDADELOG_TERCEIRIZADA'   ).AsString  := ACidade;
            ControllerConexao.qryQuery.ParamByName('UFLOG_TERCEIRIZADA'       ).AsString  := AUF;
            ControllerConexao.qryQuery.ParamByName('ID_TERCEIRIZADA'          ).AsInteger := AIdTerc;

            ControllerConexao.qryQuery.ExecSQL;
            Result := True;

        except
            Result := False;
        end;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;



function CadastraTerceirizada(ANrLog : Integer; ACodigo, ARazao, AFantasia, ACNPJ, AIE,
                              ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String) : Integer;
begin

     try

         try
             ControllerConexao.qryQuery.Close;
             ControllerConexao.qryQuery.SQL.Clear;
             ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBTERCEIRIZADA');
             ControllerConexao.qryQuery.SQL.Add('(CODIGO_TERCEIRIZADA, CNPJ_TERCEIRIZADA, IE_TERCEIRIZADA,');
             ControllerConexao.qryQuery.SQL.Add('RAZAO_TERCEIRIZADA, FANTASIA_TERCEIRIZADA, CEPLOG_TERCEIRIZADA, LOGLOG_TERCEIRIZADA,');
             ControllerConexao.qryQuery.SQL.Add('NRLOG_TERCEIRIZADA, COMPLLOG_TERCEIRIZADA, BAIRROLOG_TERCEIRIZADA,');
             ControllerConexao.qryQuery.SQL.Add('CIDADELOG_TERCEIRIZADA, UFLOG_TERCEIRIZADA) VALUES');
             ControllerConexao.qryQuery.SQL.Add('(:CODIGO_TERCEIRIZADA, :CNPJ_TERCEIRIZADA, :IE_TERCEIRIZADA,');
             ControllerConexao.qryQuery.SQL.Add(':RAZAO_TERCEIRIZADA, :FANTASIA_TERCEIRIZADA, :CEPLOG_TERCEIRIZADA, :LOGLOG_TERCEIRIZADA,');
             ControllerConexao.qryQuery.SQL.Add(':NRLOG_TERCEIRIZADA, :COMPLLOG_TERCEIRIZADA, :BAIRROLOG_TERCEIRIZADA,');
             ControllerConexao.qryQuery.SQL.Add(':CIDADELOG_TERCEIRIZADA, :UFLOG_TERCEIRIZADA)');

             ControllerConexao.qryQuery.ParamByName('CODIGO_TERCEIRIZADA'      ).AsString  := ACodigo;
             ControllerConexao.qryQuery.ParamByName('CNPJ_TERCEIRIZADA'        ).AsString  := ACNPJ;
             ControllerConexao.qryQuery.ParamByName('IE_TERCEIRIZADA'          ).AsString  := AIE;
             ControllerConexao.qryQuery.ParamByName('RAZAO_TERCEIRIZADA'       ).AsString  := ARazao;
             ControllerConexao.qryQuery.ParamByName('FANTASIA_TERCEIRIZADA'    ).AsString  := AFantasia;
             ControllerConexao.qryQuery.ParamByName('CEPLOG_TERCEIRIZADA'      ).AsString  := ACep;
             ControllerConexao.qryQuery.ParamByName('LOGLOG_TERCEIRIZADA'      ).AsString  := ALogradouro;
             ControllerConexao.qryQuery.ParamByName('NRLOG_TERCEIRIZADA'       ).AsInteger := ANrLog;
             ControllerConexao.qryQuery.ParamByName('COMPLLOG_TERCEIRIZADA'    ).AsString  := AComplemento;
             ControllerConexao.qryQuery.ParamByName('BAIRROLOG_TERCEIRIZADA'   ).AsString  := ABairro;
             ControllerConexao.qryQuery.ParamByName('CIDADELOG_TERCEIRIZADA'   ).AsString  := ACidade;
             ControllerConexao.qryQuery.ParamByName('UFLOG_TERCEIRIZADA'       ).AsString  := AUF;

             ControllerConexao.qryQuery.ExecSQL;

             ControllerConexao.qryQuery.Open('SELECT GEN_ID(GEN_HBTERCEIRIZADA_ID, 0) AS IDTERCEIRIZADA FROM RDB$DATABASE');
             Result := ControllerConexao.qryQuery.FieldByName('IDTERCEIRIZADA').AsInteger;
         except
             Result := 0;
         end;
     finally
         ControllerConexao.qryQuery.Close;
     end;
end;

end.
