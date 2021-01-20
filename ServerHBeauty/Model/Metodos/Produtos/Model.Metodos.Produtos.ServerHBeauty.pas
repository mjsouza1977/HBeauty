unit Model.Metodos.Produtos.ServerHBeauty;

interface

uses
     Data.FireDACJSONReflect,
     FireDAC.Stan.Param;

function pesquisaProdutos(APesquisa, ATipoPesquisa, ACampoPesquisa, ACampoOrdem : String; AIDProduto : Integer) : TFDJSONDataSets;
function cadastraProduto(AIDForn, AIDMarca : Integer; ACodBarras, ADescrProduto, AEmb, AUnd, AObsProd, AMedidaDose, ACCest, ACFiscal, AOrientacao, ADetalhes, AInformacoes : String;
                         ACusto, AVenda, APromo, APeso, ADose, ALarg, AAlt, AComp : Currency) : String;
function atualizaProduto(AIDProd, AIDForn, AIDMarca : Integer; ACodBarras, ADescrProduto, AEmb, AUnd, AObsProd, AMedidaDose, ACCest, ACFiscal, AOrientacao,
                         ADetalhes, AInformacoes : String; ACusto, AVenda, APromo, APeso, ADose, ALarg, AAlt, AComp : Currency) : String;

implementation

uses
  Controller.Conexao.HBeautyServer, System.SysUtils;


function pesquisaProdutos(APesquisa, ATipoPesquisa, ACampoPesquisa, ACampoOrdem : String; AIDProduto : Integer) : TFDJSONDataSets;
var
ASql : String;
begin
    try
        if ATipoPesquisa = 'Inicia'   then ASql := 'WHERE ' + ACampoPesquisa + ' LIKE ' + QuotedStr(APesquisa + '%');
        if ATipoPesquisa = 'Termina'  then ASql := 'WHERE ' + ACampoPesquisa + ' LIKE ' + QuotedStr('%' + APesquisa);
        if ATipoPesquisa = 'Contenha' then ASql := 'WHERE ' + ACampoPesquisa + ' LIKE ' + QuotedStr('%' + APesquisa + '%');
        if ATipoPesquisa = 'Igual'    then ASql := 'WHERE ' + ACampoPesquisa + ' =    ' + QuotedStr(APesquisa);
        if ATipoPesquisa = 'Lista'    then ASql := '';

        if AIDProduto > 0             then ASql := 'WHERE ID_PROD = ' + AIDProduto.ToString;

        ASql := ASql + ' ORDER BY ' + ACampoOrdem;

        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT p.*, f.NOME_FORN, m.MARCA_MARCA FROM HBPRODUTO p');
        ControllerConexao.qryQuery.SQL.Add('LEFT JOIN HBFORNECEDOR f');
        ControllerConexao.qryQuery.SQL.Add('ON (p.IDFORN_PROD = f.ID_FORN)');
        ControllerConexao.qryQuery.SQL.Add('LEFT JOIN HBMARCA m');
        ControllerConexao.qryQuery.SQL.Add('ON (p.IDMARCA_PROD = m.ID_MARCA)');

        Result := TFDJSONDataSets.Create;
        TFDJSONDataSetsWriter.ListAdd(Result, ControllerConexao.qryQuery);
        ControllerConexao.qryQuery.Active := True;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

function cadastraProduto(AIDForn, AIDMarca : Integer; ACodBarras, ADescrProduto, AEmb, AUnd, AObsProd, AMedidaDose, ACCest, ACFiscal, AOrientacao, ADetalhes, AInformacoes : String;
                         ACusto, AVenda, APromo, APeso, ADose, ALarg, AAlt, AComp : Currency) : String;
begin

     try
         try
             ControllerConexao.qryQuery.Close;
             ControllerConexao.qryQuery.SQL.Clear;
             ControllerConexao.qryQuery.SQL.Add('INSERT INTO HBPRODUTO');
             ControllerConexao.qryQuery.SQL.Add('(IDFORN_PROD, IDMARCA_PROD, CODIGOBARRAS_PROD, DESCR_PROD, EMB_PROD,');
             ControllerConexao.qryQuery.SQL.Add('UND_PROD, MEDIDADOSE_PROD, CCEST_PROD, CLSSFISCAL_PROD, OBS_PROD,');
             ControllerConexao.qryQuery.SQL.Add('PRCUSTO_PROD, PRVENDA_PROD, PRPROMO_PROD, PESO_PROD, DOSE_PROD,');
             ControllerConexao.qryQuery.SQL.Add('LARGURA_PROD, ALTURA_PROD, COMPR_PROD, ORIENT_PROD, DETALHES_PROD, INFO_PROD) VALUES');
             ControllerConexao.qryQuery.SQL.Add('(:IDFORN_PROD, :IDMARCA_PROD, :CODIGOBARRAS_PROD, :DESCR_PROD, :EMB_PROD,');
             ControllerConexao.qryQuery.SQL.Add(':UND_PROD, :MEDIDADOSE_PROD, :CCEST_PROD, :CLSSFISCAL_PROD, :OBS_PROD,');
             ControllerConexao.qryQuery.SQL.Add(':PRCUSTO_PROD, :PRVENDA_PROD, :PRPROMO_PROD, :PESO_PROD, :DOSE_PROD,');
             ControllerConexao.qryQuery.SQL.Add(':LARGURA_PROD, :ALTURA_PROD, :COMPR_PROD, :ORIENT_PROD, :DETALHES_PROD, :INFO_PROD)');

             ControllerConexao.qryQuery.ParamByName('IDFORN_PROD'      ).AsInteger  := AIDForn;
             ControllerConexao.qryQuery.ParamByName('IDMARCA_PROD'     ).AsInteger  := AIDMarca;
             ControllerConexao.qryQuery.ParamByName('CODIGOBARRAS_PROD').AsString   := ACodBarras;
             ControllerConexao.qryQuery.ParamByName('DESCR_PROD'       ).AsString   := ADescrProduto;
             ControllerConexao.qryQuery.ParamByName('EMB_PROD'         ).AsString   := AEmb;
             ControllerConexao.qryQuery.ParamByName('UND_PROD'         ).AsString   := AUnd;
             ControllerConexao.qryQuery.ParamByName('MEDIDADOSE_PROD'  ).AsString   := AMedidaDose;
             ControllerConexao.qryQuery.ParamByName('CCEST_PROD'       ).AsString   := ACCest;
             ControllerConexao.qryQuery.ParamByName('CLSSFISCAL_PROD'  ).AsString   := ACFiscal;
             ControllerConexao.qryQuery.ParamByName('OBS_PROD'         ).AsString   := AObsProd;
             ControllerConexao.qryQuery.ParamByName('ORIENT_PROD'      ).AsString   := AOrientacao;
             ControllerConexao.qryQuery.ParamByName('DETALHES_PROD'    ).AsString   := ADetalhes;
             ControllerConexao.qryQuery.ParamByName('INFO_PROD'        ).AsString   := AInformacoes;
             ControllerConexao.qryQuery.ParamByName('PRCUSTO_PROD'     ).AsCurrency := ACusto;
             ControllerConexao.qryQuery.ParamByName('PRVENDA_PROD'     ).AsCurrency := AVenda;
             ControllerConexao.qryQuery.ParamByName('PRPROMO_PROD'     ).AsCurrency := APromo;
             ControllerConexao.qryQuery.ParamByName('PESO_PROD'        ).AsCurrency := APeso;
             ControllerConexao.qryQuery.ParamByName('DOSE_PROD'        ).AsCurrency := ADose;
             ControllerConexao.qryQuery.ParamByName('LARGURA_PROD'     ).AsCurrency := ALarg;
             ControllerConexao.qryQuery.ParamByName('ALTURA_PROD'      ).AsCurrency := AAlt;
             ControllerConexao.qryQuery.ParamByName('COMPR_PROD'       ).AsCurrency := AComp;

             ControllerConexao.qryQuery.ExecSQL;

             ControllerConexao.qryQuery.Close;
             ControllerConexao.qryQuery.SQL.Clear;
             ControllerConexao.qryQuery.SQL.Add('SELECT MAX(ID_PROD) AS IDPRODUTO FROM HBPRODUTO');
             ControllerConexao.qryQuery.Open;

             Result := ControllerConexao.qryQuery.FieldByName('IDPRODUTO').AsString;

         except on E:Exception do
             begin
                 Result := E.Message;
             end;
         end;

     finally
         ControllerConexao.qryQuery.Close;
     end;

end;

function atualizaProduto(AIDProd, AIDForn, AIDMarca : Integer; ACodBarras, ADescrProduto, AEmb, AUnd, AObsProd, AMedidaDose, ACCest, ACFiscal, AOrientacao,
                         ADetalhes, AInformacoes : String; ACusto, AVenda, APromo, APeso, ADose, ALarg, AAlt, AComp : Currency) : String;
begin

    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('UPDATE HBPRODUTO SET');
            ControllerConexao.qryQuery.SQL.Add('IDFORN_PROD       = :IDFORN_PROD,'      );
            ControllerConexao.qryQuery.SQL.Add('IDMARCA_PROD      = :IDMARCA_PROD,'     );
            ControllerConexao.qryQuery.SQL.Add('CODIGOBARRAS_PROD = :CODIGOBARRAS_PROD,');
            ControllerConexao.qryQuery.SQL.Add('DESCR_PROD        = :DESCR_PROD,'       );
            ControllerConexao.qryQuery.SQL.Add('EMB_PROD          = :EMB_PROD,'         );
            ControllerConexao.qryQuery.SQL.Add('UND_PROD          = :UND_PROD,'         );
            ControllerConexao.qryQuery.SQL.Add('ORIENT_PROD       = :ORIENT_PROD,'      );
            ControllerConexao.qryQuery.SQL.Add('OBS_PROD          = :OBS_PROD,'         );
            ControllerConexao.qryQuery.SQL.Add('PRCUSTO_PROD      = :PRCUSTO_PROD,'     );
            ControllerConexao.qryQuery.SQL.Add('PRVENDA_PROD      = :PRVENDA_PROD,'     );
            ControllerConexao.qryQuery.SQL.Add('PRPROMO_PROD      = :PRPROMO_PROD,'     );
            ControllerConexao.qryQuery.SQL.Add('PESO_PROD         = :PESO_PROD,'        );
            ControllerConexao.qryQuery.SQL.Add('DOSE_PROD         = :DOSE_PROD,'        );
            ControllerConexao.qryQuery.SQL.Add('MEDIDADOSE_PROD   = :MEDIDADOSE_PROD,'  );
            ControllerConexao.qryQuery.SQL.Add('CCEST_PROD        = :CCEST_PROD,'       );
            ControllerConexao.qryQuery.SQL.Add('CLSSFISCAL_PROD   = :CLSSFISCAL_PROD,'  );
            ControllerConexao.qryQuery.SQL.Add('INFO_PROD         = :INFO_PROD,'        );
            ControllerConexao.qryQuery.SQL.Add('DETALHES_PROD     = :DETALHES_PROD,'    );
            ControllerConexao.qryQuery.SQL.Add('LARGURA_PROD      = :LARGURA_PROD,'     );
            ControllerConexao.qryQuery.SQL.Add('ALTURA_PROD       = :ALTURA_PROD,'      );
            ControllerConexao.qryQuery.SQL.Add('COMPR_PROD        = :COMPR_PROD'        );
            ControllerConexao.qryQuery.SQL.Add('WHERE ID_PROD     = :ID_PROD'           );

            ControllerConexao.qryQuery.ParamByName('ID_PROD'          ).AsInteger  := AIDProd;
            ControllerConexao.qryQuery.ParamByName('IDFORN_PROD'      ).AsInteger  := AIDForn;
            ControllerConexao.qryQuery.ParamByName('IDMARCA_PROD'     ).AsInteger  := AIDMarca;
            ControllerConexao.qryQuery.ParamByName('CODIGOBARRAS_PROD').AsString   := ACodBarras;
            ControllerConexao.qryQuery.ParamByName('DESCR_PROD'       ).AsString   := ADescrProduto;
            ControllerConexao.qryQuery.ParamByName('EMB_PROD'         ).AsString   := AEmb;
            ControllerConexao.qryQuery.ParamByName('UND_PROD'         ).AsString   := AUnd;
            ControllerConexao.qryQuery.ParamByName('MEDIDADOSE_PROD'  ).AsString   := AMedidaDose;
            ControllerConexao.qryQuery.ParamByName('CCEST_PROD'       ).AsString   := ACCest;
            ControllerConexao.qryQuery.ParamByName('CLSSFISCAL_PROD'  ).AsString   := ACFiscal;
            ControllerConexao.qryQuery.ParamByName('OBS_PROD'         ).AsString   := AObsProd;
            ControllerConexao.qryQuery.ParamByName('ORIENT_PROD'      ).AsString   := AOrientacao;
            ControllerConexao.qryQuery.ParamByName('DETALHES_PROD'    ).AsString   := ADetalhes;
            ControllerConexao.qryQuery.ParamByName('INFO_PROD'        ).AsString   := AInformacoes;
            ControllerConexao.qryQuery.ParamByName('PRCUSTO_PROD'     ).AsCurrency := ACusto;
            ControllerConexao.qryQuery.ParamByName('PRVENDA_PROD'     ).AsCurrency := AVenda;
            ControllerConexao.qryQuery.ParamByName('PRPROMO_PROD'     ).AsCurrency := APromo;
            ControllerConexao.qryQuery.ParamByName('PESO_PROD'        ).AsCurrency := APeso;
            ControllerConexao.qryQuery.ParamByName('DOSE_PROD'        ).AsCurrency := ADose;
            ControllerConexao.qryQuery.ParamByName('LARGURA_PROD'     ).AsCurrency := ALarg;
            ControllerConexao.qryQuery.ParamByName('ALTURA_PROD'      ).AsCurrency := AAlt;
            ControllerConexao.qryQuery.ParamByName('COMPR_PROD'       ).AsCurrency := AComp;
            ControllerConexao.qryQuery.ExecSQL;

            Result := '';

        except on E : Exception do
            Result := E.Message;
        end;

    finally
        ControllerConexao.qryQuery.Close;
    end;

end;


end.
