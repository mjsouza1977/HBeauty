unit Model.Vendedor.Servidor.HBeauty;

interface

uses
  Data.FireDACJSONReflect, Model.Vendedores.HBeauty;


function carregaVendedores : TFDJSONDataSets;
function PesquisaVendedor(ANome, ACPF, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
function cadastraVendedor(AVendedor : TModelVendedor) : String;
function atualizaVendedor(AVendedor : TModelVendedor) : String;


implementation

uses
  Controller.ClientModule.HBeauty, Model.Dados.Server.HBeauty;

function carregaVendedores : TFDJSONDataSets;
var
    dsVendedores : TFDJSONDataSets;
begin
    dsVendedores := ControllerClientModule.ModelMetodosClient.carregaVendedores;
    Assert(TFDJSONDataSetsReader.GetListCount(dsVendedores) = 1);
    ModelConexaoDados.memFornecedores.Active := False;
    ModelConexaoDados.memFornecedores.AppendData(TFDJSONDataSetsReader.GetListValue(dsVendedores, 0));
    ModelConexaoDados.memFornecedores.Active := True;
end;

function PesquisaVendedor(ANome, ACPF, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
var
    dsVendedores : TFDJSONDataSets;
begin
    dsVendedores := ControllerClientModule.ModelMetodosClient.PesquisaVendedor(ANome, ACPF, ATipoPesquisa, AId);
    Assert(TFDJSONDataSetsReader.GetListCount(dsVendedores) = 1);
    ModelConexaoDados.memFornecedores.Active := False;
    ModelConexaoDados.memFornecedores.AppendData(TFDJSONDataSetsReader.GetListValue(dsVendedores, 0));
    ModelConexaoDados.memFornecedores.Active := True;
end;

function cadastraVendedor(AVendedor : TModelVendedor) : String;
begin
    Result := ControllerClientModule.ModelMetodosClient.cadastraVendedor(AVendedor.ENDERECO_VEND.NRLOG, AVendedor.CPF_VEND, AVendedor.RG_VEND,
                                                                         AVendedor.NOME_VEND, AVendedor.ENDERECO_VEND.LOGRADOURO,
                                                                         AVendedor.ENDERECO_VEND.COMPLLOG, AVendedor.ENDERECO_VEND.BAIRROLOG,
                                                                         AVendedor.ENDERECO_VEND.CEP, AVendedor.ENDERECO_VEND.CIDADELOG,
                                                                         AVendedor.ENDERECO_VEND.UFLOG);
end;

function atualizaVendedor(AVendedor : TModelVendedor) : String;
begin
     Result := ControllerClientModule.ModelMetodosClient.atualizaVendedor(AVendedor.ID_VEND, AVendedor.ENDERECO_VEND.NRLOG, AVendedor.CPF_VEND, AVendedor.RG_VEND,
                                                                          AVendedor.NOME_VEND, AVendedor.ENDERECO_VEND.LOGRADOURO,
                                                                          AVendedor.ENDERECO_VEND.COMPLLOG, AVendedor.ENDERECO_VEND.BAIRROLOG,
                                                                          AVendedor.ENDERECO_VEND.CEP, AVendedor.ENDERECO_VEND.CIDADELOG,
                                                                          AVendedor.ENDERECO_VEND.UFLOG);
end;


end.
