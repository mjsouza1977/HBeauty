unit Model.Fornecedor.Servidor.HBeauty;

interface

uses Model.Dados.Server.HBeauty, Model.Fornecedor.HBeauty,
     Data.FireDACJSONReflect, FMX.Forms, Model.Genericos.Servidor.HBeauty;

function carregaFornecedores : TFDJSONDataSets;
function PesquisaFornecedores(ANome, APseudo, ACNPJ, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
function cadastraFornecedor(AFornecedor : TModelFornecedor; AForm : TForm) : String;
function atualizaFornecedores(AFornecedor : TModelFornecedor) : String;
procedure cadastraMarcaFornecedor(AIdForn, AIdMarca : Integer);
procedure limpaMarcaFornecedor(AIdForn : Integer);



implementation

uses
  Controller.ClientModule.HBeauty;

procedure limpaMarcaFornecedor(AIdForn : Integer);
begin
     ControllerClientModule.ModelMetodosClient.limpaMarcaFornecedor(AIdForn);
end;

procedure cadastraMarcaFornecedor(AIdForn, AIdMarca : Integer);
begin
    ControllerClientModule.ModelMetodosClient.cadastraMarcaFornecedor(AIdForn, AIdMarca);
end;

function carregaFornecedores : TFDJSONDataSets;
var
    dsFornecedores : TFDJSONDataSets;
begin
    dsFornecedores := ControllerClientModule.ModelMetodosClient.carregaFornecedores;
    Assert(TFDJSONDataSetsReader.GetListCount(dsFornecedores) = 1);
    ModelConexaoDados.memFornecedores.Active := False;
    ModelConexaoDados.memFornecedores.AppendData(TFDJSONDataSetsReader.GetListValue(dsFornecedores, 0));
    ModelConexaoDados.memFornecedores.Active := True;
end;

function PesquisaFornecedores(ANome, APseudo, ACNPJ, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
var
    dsFornecedores : TFDJSONDataSets;
begin
    dsFornecedores := ControllerClientModule.ModelMetodosClient.PesquisaFornecedores(ANome, APseudo, ACNPJ, ATipoPesquisa,  AId);
    Assert(TFDJSONDataSetsReader.GetListCount(dsFornecedores) = 1);
    ModelConexaoDados.memFornecedores.Active := False;
    ModelConexaoDados.memFornecedores.AppendData(TFDJSONDataSetsReader.GetListValue(dsFornecedores, 0));
    ModelConexaoDados.memFornecedores.Active := True;
end;

function cadastraFornecedor(AFornecedor : TModelFornecedor; AForm : TForm) : String;
begin
     DocumentoRepetido(AFornecedor.CNPJCPF_FORN, 'CNPJCPF_FORN', 'NOME_FORN', 'HBFORNECEDOR', AForm, 'CNPJ/CPF', 'O fornecedor ');
     Result := ControllerClientModule.ModelMetodosClient.cadastraFornecedor(AFornecedor.IDVEND_FORN, AFornecedor.ENDERECO.NRLOG, AFornecedor.IMAGENS.IDIMAGEM,
                                                                            AFornecedor.CNPJCPF_FORN,AFornecedor.IERG_FORN,
                                                                            AFornecedor.NOME_FORN, AFornecedor.PSEUDO_FORN, AFornecedor.ENDERECO.LOGRADOURO,
                                                                            AFornecedor.ENDERECO.COMPLLOG, AFornecedor.ENDERECO.BAIRROLOG,
                                                                            AFornecedor.ENDERECO.CEP, AFornecedor.ENDERECO.CIDADELOG,
                                                                            AFornecedor.ENDERECO.UFLOG);
end;

function atualizaFornecedores(AFornecedor : TModelFornecedor) : String;
begin
     Result := ControllerClientModule.ModelMetodosClient.atualizaFornecedores(AFornecedor.ID_FORN, AFornecedor.IDVEND_FORN, AFornecedor.ENDERECO.NRLOG,
                                                                              AFornecedor.IMAGENS.IDIMAGEM, AFornecedor.CNPJCPF_FORN,
                                                                              AFornecedor.IERG_FORN, AFornecedor.NOME_FORN, AFornecedor.PSEUDO_FORN,
                                                                              AFornecedor.ENDERECO.LOGRADOURO, AFornecedor.ENDERECO.COMPLLOG,
                                                                              AFornecedor.ENDERECO.BAIRROLOG, AFornecedor.ENDERECO.CEP,
                                                                              AFornecedor.ENDERECO.CIDADELOG, AFornecedor.ENDERECO.UFLOG);
end;




end.
