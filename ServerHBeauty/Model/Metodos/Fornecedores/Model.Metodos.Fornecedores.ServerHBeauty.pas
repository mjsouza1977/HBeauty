unit Model.Metodos.Fornecedores.ServerHBeauty;

interface

uses
     Data.FireDACJSONReflect,
     FireDAC.Stan.Param;

function carregaFornecedores : TFDJSONDataSets;
function PesquisaFornecedores(ANome, APseudo, ACNPJ, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
function cadastraFornecedor(AIdVendFor, ANrLog, AIDLogoForn : Integer; ACodigo, ACNPJCPF, AIERG, ANome, APseudo, ALog, ACompl, ABairro, ACep, ACidade, AUF : String) : String;
function atualizaFornecedores(AIdForn, AIdVendFor, ANrLog, AIDLogoForn : Integer; ACodigo, ACNPJCPF, AIERG, ANome, APseudo, ALog, ACompl, ABairro, ACep, ACidade, AUF : String) : String;

procedure cadastraMarcaFornecedor(AIdForn, AIdMarca : Integer);
procedure limpaMarcaFornecedor(AIdForn : Integer);


implementation

uses
  Controller.Conexao.HBeautyServer, System.SysUtils;

procedure limpaMarcaFornecedor(AIdForn : Integer);
begin

    try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('DELETE FROM HBFORNXMARCA');
        ControllerConexao.qryQuery.SQL.Add('WHERE IDFORN_FORNXMARCA = :IDFORN_FORNXMARCA');
        ControllerConexao.qryQuery.ParamByName('IDFORN_FORNXMARCA' ).AsInteger := AIdForn;
        ControllerConexao.qryQuery.ExecSQL;
    finally
       ControllerConexao.qryQuery.Close;
    end;

end;

procedure cadastraMarcaFornecedor(AIdForn, AIdMarca : Integer);
begin

    try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBFORNXMARCA');
        ControllerConexao.qryQuery.SQL.Add('(IDFORN_FORNXMARCA, IDMARCA_FORNXMARCA) VALUES');
        ControllerConexao.qryQuery.SQL.Add('(:IDFORN_FORNXMARCA, :IDMARCA_FORNXMARCA)');
        ControllerConexao.qryQuery.ParamByName('IDFORN_FORNXMARCA' ).AsInteger := AIdForn;
        ControllerConexao.qryQuery.ParamByName('IDMARCA_FORNXMARCA').AsInteger := AIdMarca;
        ControllerConexao.qryQuery.ExecSQL;
    finally
       ControllerConexao.qryQuery.Close;
    end;

end;

function atualizaFornecedores(AIdForn, AIdVendFor, ANrLog, AIDLogoForn : Integer; ACodigo, ACNPJCPF, AIERG, ANome, APseudo, ALog, ACompl, ABairro, ACep, ACidade, AUF : String) : String;
begin
    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('UPDATE HBFORNECEDOR SET'               );
            ControllerConexao.qryQuery.SQL.Add('CODIGO_FORN        = :CODIGO_FORN,'    );
            ControllerConexao.qryQuery.SQL.Add('NOME_FORN          = :NOME_FORN,'      );
            ControllerConexao.qryQuery.SQL.Add('PSEUDO_FORN        = :PSEUDO_FORN,'    );
            ControllerConexao.qryQuery.SQL.Add('CNPJCPF_FORN       = :CNPJCPF_FORN,'   );
            ControllerConexao.qryQuery.SQL.Add('IERG_FORN          = :IERG_FORN,'      );
            ControllerConexao.qryQuery.SQL.Add('LOGRADOURO_FORN    = :LOGRADOURO_FORN,');
            ControllerConexao.qryQuery.SQL.Add('NRLOG_FORN         = :NRLOG_FORN,'     );
            ControllerConexao.qryQuery.SQL.Add('COMPLLOG_FORN      = :COMPLLOG_FORN,'  );
            ControllerConexao.qryQuery.SQL.Add('BAILOG_FORN        = :BAILOG_FORN,'    );
            ControllerConexao.qryQuery.SQL.Add('CIDLOG_FORN        = :CIDLOG_FORN,'    );
            ControllerConexao.qryQuery.SQL.Add('UFLOG_FORN         = :UFLOG_FORN,'     );
            ControllerConexao.qryQuery.SQL.Add('CEPLOG_FORN        = :CEPLOG_FORN,'    );
            ControllerConexao.qryQuery.SQL.Add('LOCK               = :LOCK,'           );
            ControllerConexao.qryQuery.SQL.Add('IDUSULOCK          = :IDUSULOCK,'      );
            ControllerConexao.qryQuery.SQL.Add('IDVEND_FORN        = :IDVEND_FORN,'    );
            ControllerConexao.qryQuery.SQL.Add('IDLOGO_FORN        = :IDLOGO_FORN'     );
            ControllerConexao.qryQuery.SQL.Add('WHERE ID_FORN      = :ID_FORN'         );
            ControllerConexao.qryQuery.ParamByName('CODIGO_FORN'    ).AsString  := ACodigo;
            ControllerConexao.qryQuery.ParamByName('NOME_FORN'      ).AsString  := ANome;
            ControllerConexao.qryQuery.ParamByName('PSEUDO_FORN'    ).AsString  := APseudo;
            ControllerConexao.qryQuery.ParamByName('CNPJCPF_FORN'   ).AsString  := ACNPJCPF;
            ControllerConexao.qryQuery.ParamByName('IERG_FORN'      ).AsString  := AIERG;
            ControllerConexao.qryQuery.ParamByName('LOGRADOURO_FORN').AsString  := ALog;
            ControllerConexao.qryQuery.ParamByName('NRLOG_FORN'     ).AsInteger := ANrLog;
            ControllerConexao.qryQuery.ParamByName('COMPLLOG_FORN'  ).AsString  := ACompl;
            ControllerConexao.qryQuery.ParamByName('BAILOG_FORN'    ).AsString  := ABairro;
            ControllerConexao.qryQuery.ParamByName('CIDLOG_FORN'    ).AsString  := ACidade;
            ControllerConexao.qryQuery.ParamByName('UFLOG_FORN'     ).AsString  := AUF;
            ControllerConexao.qryQuery.ParamByName('CEPLOG_FORN'    ).AsString  := ACep;
            ControllerConexao.qryQuery.ParamByName('LOCK'           ).AsString  := 'F';
            ControllerConexao.qryQuery.ParamByName('IDUSULOCK'      ).AsInteger := 0;
            ControllerConexao.qryQuery.ParamByName('IDVEND_FORN'    ).AsInteger := AIdVendFor;
            ControllerConexao.qryQuery.ParamByName('ID_FORN'        ).AsInteger := AIdForn;
            ControllerConexao.qryQuery.ParamByName('IDLOGO_FORN'    ).AsInteger := AIDLogoForn;

            ControllerConexao.qryQuery.ExecSQL;

            Result := '';
        except on E:Exception do
            Result := E.Message;
        end;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

function cadastraFornecedor(AIdVendFor, ANrLog, AIDLogoForn : Integer; ACodigo, ACNPJCPF, AIERG, ANome, APseudo, ALog, ACompl, ABairro, ACep, ACidade, AUF : String) : String;
begin
    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBFORNECEDOR');
            ControllerConexao.qryQuery.SQL.Add('(CODIGO_FORN, NOME_FORN, PSEUDO_FORN, CNPJCPF_FORN, IERG_FORN,');
            ControllerConexao.qryQuery.SQL.Add('LOGRADOURO_FORN, NRLOG_FORN, COMPLLOG_FORN, BAILOG_FORN,');
            ControllerConexao.qryQuery.SQL.Add('CIDLOG_FORN, UFLOG_FORN, CEPLOG_FORN, LOCK, IDUSULOCK, IDVEND_FORN, IDLOGO_FORN) VALUES');
            ControllerConexao.qryQuery.SQL.Add('(:CODIGO_FORN, :NOME_FORN, :PSEUDO_FORN, :CNPJCPF_FORN, :IERG_FORN,');
            ControllerConexao.qryQuery.SQL.Add(':LOGRADOURO_FORN, :NRLOG_FORN, :COMPLLOG_FORN, :BAILOG_FORN,');
            ControllerConexao.qryQuery.SQL.Add(':CIDLOG_FORN, :UFLOG_FORN, :CEPLOG_FORN, :LOCK, :IDUSULOCK, :IDVEND_FORN, :IDLOGO_FORN)');
            ControllerConexao.qryQuery.ParamByName('CODIGO_FORN'    ).AsString  := ACodigo;
            ControllerConexao.qryQuery.ParamByName('NOME_FORN'      ).AsString  := ANome;
            ControllerConexao.qryQuery.ParamByName('PSEUDO_FORN'    ).AsString  := APseudo;
            ControllerConexao.qryQuery.ParamByName('CNPJCPF_FORN'   ).AsString  := ACNPJCPF;
            ControllerConexao.qryQuery.ParamByName('IERG_FORN'      ).AsString  := AIERG;
            ControllerConexao.qryQuery.ParamByName('LOGRADOURO_FORN').AsString  := ALog;
            ControllerConexao.qryQuery.ParamByName('NRLOG_FORN'     ).AsInteger := ANrLog;
            ControllerConexao.qryQuery.ParamByName('COMPLLOG_FORN'  ).AsString  := ACompl;
            ControllerConexao.qryQuery.ParamByName('BAILOG_FORN'    ).AsString  := ABairro;
            ControllerConexao.qryQuery.ParamByName('CIDLOG_FORN'    ).AsString  := ACidade;
            ControllerConexao.qryQuery.ParamByName('UFLOG_FORN'     ).AsString  := AUF;
            ControllerConexao.qryQuery.ParamByName('CEPLOG_FORN'    ).AsString  := ACep;
            ControllerConexao.qryQuery.ParamByName('LOCK'           ).AsString  := 'F';
            ControllerConexao.qryQuery.ParamByName('IDUSULOCK'      ).AsInteger := 0;
            ControllerConexao.qryQuery.ParamByName('IDVEND_FORN'    ).AsInteger := AIdVendFor;
            ControllerConexao.qryQuery.ParamByName('IDLOGO_FORN'    ).AsInteger := AIDLogoForn;
            ControllerConexao.qryQuery.ExecSQL;

            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('SELECT ID_FORN FROM HBFORNECEDOR WHERE CNPJCPF_FORN = ' + QuotedStr(ACNPJCPF));
            ControllerConexao.qryQuery.Open;

            Result := ControllerConexao.qryQuery.FieldByName('ID_FORN').AsString;
        except on E:Exception do
            begin
                 Result := E.Message;
            end;
        end;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

function carregaFornecedores : TFDJSONDataSets;
begin

     try
         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT i.*, f.*, v.NOME_VEND, v.SOBRENOME_VEND FROM HBFORNECEDOR f');
         ControllerConexao.qryQuery.SQL.Add('LEFT JOIN HBIMAGENS i');
         ControllerConexao.qryQuery.SQL.Add('ON (f.IDLOGO_FORN = i.IDIMAGEM)');
         ControllerConexao.qryQuery.SQL.Add('INNER JOIN HBVENDEDOR v');
         ControllerConexao.qryQuery.SQL.Add('ON (f.IDVEND_FORN = v.ID_FORN');
         ControllerConexao.qryQuery.SQL.Add('ORDER BY f.NOME_FORN');

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
         ControllerConexao.qryQuery.Active := True;
     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function PesquisaFornecedores(ANome, APseudo, ACNPJ, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
var
ASql : String;
begin
     try
         if ANome <> '' then
            begin
                if ATipoPesquisa = 'Inicia'   then ASql := ASql + ' AND NOME_FORN LIKE ' + QuotedStr(ANome + '%');
                if ATipoPesquisa = 'Termina'  then ASql := ASql + ' AND NOME_FORN LIKE ' + QuotedStr('%' + ANome);
                if ATipoPesquisa = 'Contenha' then ASql := ASql + ' AND NOME_FORN LIKE ' + QuotedStr('%' + ANome + '%');
                if ATipoPesquisa = 'Igual'    then ASql := ASql + ' AND NOME_FORN =    ' + QuotedStr(ANome);
            end;
         if APseudo <> '' then
            begin
                if ATipoPesquisa = 'Inicia'   then ASql := ASql + ' AND PSEUDO_FORN LIKE ' + QuotedStr(APseudo + '%');
                if ATipoPesquisa = 'Termina'  then ASql := ASql + ' AND PSEUDO_FORN LIKE ' + QuotedStr('%' + APseudo);
                if ATipoPesquisa = 'Contenha' then ASql := ASql + ' AND PSEUDO_FORN LIKE ' + QuotedStr('%' + APseudo + '%');
                if ATipoPesquisa = 'Igual'    then ASql := ASql + ' AND PSEUDO_FORN =    ' + QuotedStr(APseudo);
            end;

         if ACNPJ <> '' then
            begin
                if ATipoPesquisa = 'Inicia'   then ASql := ASql + ' AND CNPJCPF_FORN LIKE ' + QuotedStr(ACNPJ + '%');
                if ATipoPesquisa = 'Termina'  then ASql := ASql + ' AND CNPJCPF_FORN LIKE ' + QuotedStr('%' + ACNPJ);
                if ATipoPesquisa = 'Contenha' then ASql := ASql + ' AND CNPJCPF_FORN LIKE ' + QuotedStr('%' + ACNPJ + '%');
                if ATipoPesquisa = 'Igual'    then ASql := ASql + ' AND CNPJCPF_FORN =    ' + QuotedStr(ACNPJ);
            end;

         if AId > 0 then
            ASql := ASql + ' AND ID_FORN = ' + AID.ToString;

         ASql := Copy(ASql,5, Length(ASql));

         ControllerConexao.qryQuery.Close;
         ControllerConexao.qryQuery.SQL.Clear;
         ControllerConexao.qryQuery.SQL.Add('SELECT * FROM HBFORNECEDOR');
         ControllerConexao.qryQuery.SQL.Add('LEFT JOIN HBIMAGENS');
         ControllerConexao.qryQuery.SQL.Add('ON (HBFORNECEDOR.IDLOGO_FORN = HBIMAGENS.IDIMAGEM)');

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


