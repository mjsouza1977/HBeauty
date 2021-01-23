unit Model.Produtos.Servidor.HBeauty;

interface

uses Model.Produtos.HBeauty, Data.FireDACJSONReflect;

function pesquisaProdutos(APesquisa, ATipoPesquisa, ACampoPesquisa, ACampoOrdem : String; AIDProduto : Integer = 0) : TFDJSONDataSets;
function cadastraProduto(AProduto : TModelProdutos) : String;
function atualizaProduto(AProduto : TModelProdutos) : String;

implementation

uses
  Controller.ClientModule.HBeauty,
  Model.Dados.Server.HBeauty,
  Units.Strings.HBeauty;

//function atualizaProduto(AIDProd, AIDForn, AIDMarca : Integer; ACodBarras, ADescrProduto, AEmb, AUnd, AObsProd, AMedidaDose, ACCest, ACFiscal, AOrientacao,
//                         ADetalhes, AInformacoes : String; ACusto, AVenda, APromo, APeso, ADose, ALarg, AAlt, AComp : Currency) : String;
function atualizaProduto(AProduto : TModelProdutos) : String;
begin
     Result := ControllerClientModule.ModelMetodosClient.atualizaProduto(AProduto.ID_PROD, AProduto.IDFORN_PROD, AProduto.IDMARCA_PROD, AProduto.CODIGOBARRAS_PROD,
                                                                         AProduto.DESCR_PROD, AProduto.EMB_PROD, AProduto.UND_PROD, AProduto.OBS_PROD,
                                                                         AProduto.MEDIDADOSE_PROD, AProduto.CCEST_PROD, AProduto.CLSSFISCAL_PROD,
                                                                         AProduto.ORIENT_PROD, AProduto.DETALHES_PROD, AProduto.INFO_PROD, AProduto.PRCUSTO_PROD,
                                                                         AProduto.PRVENDA_PROD, AProduto.PRPROMO_PROD, AProduto.PESO_PROD, AProduto.DOSE_PROD,
                                                                         AProduto.LARGURA_PROD, AProduto.ALTURA_PROD, AProduto.COMPR_PROD);
end;


function pesquisaProdutos(APesquisa, ATipoPesquisa, ACampoPesquisa, ACampoOrdem : String; AIDProduto : Integer = 0) : TFDJSONDataSets;
var
    dsProdutos : TFDJSONDataSets;
begin
    dsProdutos := ControllerClientModule.ModelMetodosClient.pesquisaProdutos(APesquisa, ATipoPesquisa, ACampoPesquisa, ACampoOrdem, AIDProduto);
    Assert(TFDJSONDataSetsReader.GetListCount(dsProdutos) = 1);
    ModelConexaoDados.memProdutos.Active := False;
    ModelConexaoDados.memProdutos.AppendData(TFDJSONDataSetsReader.GetListValue(dsProdutos, 0));
    ModelConexaoDados.memProdutos.Active := True;
end;

function cadastraProduto(AProduto : TModelProdutos) : String;
begin

     Result := ControllerClientModule.ModelMetodosClient.cadastraProduto(AProduto.IDFORN_PROD, AProduto.IDMARCA_PROD, AProduto.CODIGOBARRAS_PROD,
                                                                         AProduto.DESCR_PROD, AProduto.EMB_PROD, AProduto.UND_PROD, AProduto.OBS_PROD,
                                                                         AProduto.MEDIDADOSE_PROD, AProduto.CCEST_PROD, AProduto.CLSSFISCAL_PROD,
                                                                         AProduto.ORIENT_PROD, AProduto.DETALHES_PROD, AProduto.INFO_PROD, AProduto.PRCUSTO_PROD,
                                                                         AProduto.PRVENDA_PROD, AProduto.PRPROMO_PROD, AProduto.PESO_PROD, AProduto.DOSE_PROD,
                                                                         AProduto.LARGURA_PROD, AProduto.ALTURA_PROD, AProduto.COMPR_PROD);

end;

end.
