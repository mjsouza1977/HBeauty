unit Model.Vendedor.Servidor.HBeauty;

interface

uses
  Data.FireDACJSONReflect, Model.Vendedores.HBeauty, FMX.Forms, Model.Genericos.Servidor.HBeauty;


function carregaVendedores : TFDJSONDataSets;
function PesquisaVendedor(ANome, ACPF, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
function cadastraVendedor(AVendedor : TModelVendedor; AForm : TForm) : Integer;
function atualizaVendedor(AVendedor : TModelVendedor) : String;


implementation

uses
  Controller.ClientModule.HBeauty, Model.Dados.Server.HBeauty, System.SysUtils;

function carregaVendedores : TFDJSONDataSets;
var
    dsVendedores : TFDJSONDataSets;
begin
    dsVendedores := ControllerClientModule.ModelMetodosClient.carregaVendedores;
    Assert(TFDJSONDataSetsReader.GetListCount(dsVendedores) = 1);
    ModelConexaoDados.memVendedores.Active := False;
    ModelConexaoDados.memVendedores.AppendData(TFDJSONDataSetsReader.GetListValue(dsVendedores, 0));
    ModelConexaoDados.memVendedores.Active := True;
end;

function PesquisaVendedor(ANome, ACPF, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
var
    dsVendedores : TFDJSONDataSets;
begin
    dsVendedores := ControllerClientModule.ModelMetodosClient.PesquisaVendedor(ANome, ACPF, ATipoPesquisa, AId);
    Assert(TFDJSONDataSetsReader.GetListCount(dsVendedores) = 1);
    ModelConexaoDados.memVendedores.Active := False;
    ModelConexaoDados.memVendedores.AppendData(TFDJSONDataSetsReader.GetListValue(dsVendedores, 0));
    ModelConexaoDados.memVendedores.Active := True;
end;

function cadastraVendedor(AVendedor : TModelVendedor; AForm : TForm) : Integer;
var
ARes : String;
begin
    DocumentoRepetido(AVendedor.CPF_VEND, 'CPF_VEND', 'NOME_VEND', 'HBVENDEDOR', AForm, 'CPF', 'O vendedor ');
    ARes := ControllerClientModule.ModelMetodosClient.cadastraVendedor(AVendedor.ENDERECO_VEND.NRLOG, AVendedor.CPF_VEND, AVendedor.RG_VEND,
                                                                       AVendedor.NOME_VEND, AVendedor.SOBRENOME_VEND, AVendedor.ENDERECO_VEND.LOGRADOURO,
                                                                       AVendedor.ENDERECO_VEND.COMPLLOG, AVendedor.ENDERECO_VEND.BAIRROLOG,
                                                                       AVendedor.ENDERECO_VEND.CEP, AVendedor.ENDERECO_VEND.CIDADELOG,
                                                                       AVendedor.ENDERECO_VEND.UFLOG);
    try
        StrToInt(ARes);
        Result := ARes.ToInteger;
    except
        Result := 0;
    end;
end;

function atualizaVendedor(AVendedor : TModelVendedor) : String;
begin
     Result := ControllerClientModule.ModelMetodosClient.atualizaVendedor(AVendedor.ID_VEND, AVendedor.ENDERECO_VEND.NRLOG, AVendedor.CPF_VEND, AVendedor.RG_VEND,
                                                                          AVendedor.NOME_VEND, AVendedor.SOBRENOME_VEND, AVendedor.ENDERECO_VEND.LOGRADOURO,
                                                                          AVendedor.ENDERECO_VEND.COMPLLOG, AVendedor.ENDERECO_VEND.BAIRROLOG,
                                                                          AVendedor.ENDERECO_VEND.CEP, AVendedor.ENDERECO_VEND.CIDADELOG,
                                                                          AVendedor.ENDERECO_VEND.UFLOG);
end;


end.
