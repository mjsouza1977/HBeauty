unit Model.Profissionais.Servidor.HBeauty;

interface

uses
  Model.Profissionais.HBeauty, Model.Habilidades.HBeauty, Model.Genericos.Servidor.HBeauty,
  FMX.Forms;

procedure ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AId : Integer);
function CadastraProfissional(AProfissional : TModelProfissionais; AForm : TForm) : Integer;
function AtualizaProfissional(AProfissional : TModelProfissionais): Boolean;

procedure carregaHabilidades;
procedure carregaHabilidadesProfissional(AAIdProfissional : Integer);
function cadastraHabilidade(AHabilidade : TModelHabilidades) : Integer;
function apagaHabilidadesProfissional(AIdProfissional: Integer) : Boolean;
function atualizaHabilidade(AHabilidade : TModelHabilidades) : Boolean;
function cadastraHabilidadeProfissional(AIdHabilidade, AIdProfissional: Integer): Boolean;
procedure CarregaProfissionalTerceirizado(AIdTerceirizado: Integer);
procedure CarregaCamposProfissional(ACampos : String);
function AtualizaFotoProfissional(AIDProfissional, AIdFoto : Integer) : String;


implementation

uses
  Controller.ClientModule.HBeauty, Data.FireDACJSONReflect,
  Model.Dados.Server.HBeauty;

function AtualizaFotoProfissional(AIDProfissional, AIdFoto : Integer) : String;
begin
    Result := ControllerClientModule.ModelMetodosClient.AtualizaFotoProfissional(AIDProfissional, AIdFoto);
end;

procedure CarregaCamposProfissional(ACampos : String);
var
   dsCamposProfissional : TFDJSONDataSets;
begin
   dsCamposProfissional := ControllerClientModule.ModelMetodosClient.CarregaCamposProfissional(ACampos);
   Assert(TFDJSONDataSetsReader.GetListCount(dsCamposProfissional) = 1);
   ModelConexaoDados.memTerceirizada.Active := False;
   ModelConexaoDados.memTerceirizada.AppendData(TFDJSONDataSetsReader.GetListValue(dsCamposProfissional, 0));
   ModelConexaoDados.memTerceirizada.Active := True;
end;

function cadastraHabilidadeProfissional(AIdHabilidade, AIdProfissional: Integer): Boolean;
begin
    Result := ControllerClientModule.ModelMetodosClient.cadastraHabilidadeProfissional(AIdHabilidade, AIdProfissional);
end;

procedure CarregaProfissionalTerceirizado(AIdTerceirizado: Integer);
var
   dsProfissionalTerceirizado : TFDJSONDataSets;
begin
   dsProfissionalTerceirizado := ControllerClientModule.ModelMetodosClient.CarregaProfissionalTerceirizado(AIdTerceirizado);
   Assert(TFDJSONDataSetsReader.GetListCount(dsProfissionalTerceirizado) = 1);
   ModelConexaoDados.memProfissionais.Active := False;
   ModelConexaoDados.memProfissionais.AppendData(TFDJSONDataSetsReader.GetListValue(dsProfissionalTerceirizado, 0));
   ModelConexaoDados.memProfissionais.Active := True;
end;

procedure carregaHabilidades;
var
   dsHabilidades : TFDJSONDataSets;
begin
   dsHabilidades := ControllerClientModule.ModelMetodosClient.carregaHabilidades;
   Assert(TFDJSONDataSetsReader.GetListCount(dsHabilidades) = 1);
   ModelConexaoDados.memHabilidades.Active := False;
   ModelConexaoDados.memHabilidades.AppendData(TFDJSONDataSetsReader.GetListValue(dsHabilidades, 0));
   ModelConexaoDados.memHabilidades.Active := True;
end;

procedure carregaHabilidadesProfissional(AAIdProfissional : Integer);
var
   dsHabilidadesProfissional : TFDJSONDataSets;
begin
   dsHabilidadesProfissional := ControllerClientModule.ModelMetodosClient.carregaHabilidadesProfissional(AAIdProfissional);
   Assert(TFDJSONDataSetsReader.GetListCount(dsHabilidadesProfissional) = 1);
   ModelConexaoDados.memHbilXProfis.Active := False;
   ModelConexaoDados.memHbilXProfis.AppendData(TFDJSONDataSetsReader.GetListValue(dsHabilidadesProfissional, 0));
   ModelConexaoDados.memHbilXProfis.Active := True;
end;

function cadastraHabilidade(AHabilidade : TModelHabilidades) : Integer;
begin
   Result := ControllerClientModule.ModelMetodosClient.cadastraHabilidade(AHabilidade.NomeHabilidade, AHabilidade.DescricaoHabilidade);
end;

function apagaHabilidadesProfissional(AIdProfissional: Integer) : Boolean;
begin
     Result := ControllerClientModule.ModelMetodosClient.apagaHabilidadesProfissional(AIdProfissional);
end;

function atualizaHabilidade(AHabilidade : TModelHabilidades) : Boolean;
begin
     Result := ControllerClientModule.ModelMetodosClient.atualizaHabilidade(AHabilidade.IdHabilidade, AHabilidade.NomeHabilidade, AHabilidade.DescricaoHabilidade);
end;


function AtualizaProfissional(AProfissional : TModelProfissionais): Boolean;
begin
    Result := ControllerClientModule.ModelMetodosClient.AtualizaProfissional(AProfissional.TERC_PROFIS, AProfissional.ID_PROFIS, AProfissional.IDCARGO_PROFISS,
                                                                             AProfissional.IDEMPTER_PROFIS, AProfissional.ENDERECO_PROFIS.NRLOG,
                                                                             AProfissional.CODIGO_PROFIS, AProfissional.NOME_PROFIS, AProfissional.SOBRENOME_PROFIS,
                                                                             AProfissional.CPF_PROFIS, AProfissional.RG_PROFIS, AProfissional.ENDERECO_PROFIS.LOGRADOURO,
                                                                             AProfissional.ENDERECO_PROFIS.COMPLLOG, AProfissional.ENDERECO_PROFIS.BAIRROLOG,
                                                                             AProfissional.ENDERECO_PROFIS.CIDADELOG, AProfissional.ENDERECO_PROFIS.UFLOG,
                                                                             AProfissional.ENDERECO_PROFIS.CEP, AProfissional.SALARIO_PROFIS, AProfissional.COMISSAO_PROFIS);

end;

procedure ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AId : Integer);
var
   PesquisaProfissionais : TFDJSONDataSets;
begin

   PesquisaProfissionais := ControllerClientModule.ModelMetodosClient.ListaProfissionais(ANome, ACPF, ATipoPesquisa, AID);
   Assert(TFDJSONDataSetsReader.GetListCount(PesquisaProfissionais) = 1);
   ModelConexaoDados.memProfissionais.Active := False;
   ModelConexaoDados.memProfissionais.AppendData(TFDJSONDataSetsReader.GetListValue(PesquisaProfissionais, 0));
   ModelConexaoDados.memProfissionais.Active := True;


end;

function CadastraProfissional(AProfissional : TModelProfissionais; AForm : TForm) : Integer;
begin

    DocumentoRepetido(AProfissional.CPF_PROFIS, 'CPF_PROFIS', 'NOME_PROFIS', 'HBPROFISSIONAIS', AForm);
    Result := ControllerClientModule.ModelMetodosClient.CadastraProfissional(AProfissional.TERC_PROFIS, AProfissional.IDCARGO_PROFISS, AProfissional.IDEMPTER_PROFIS,
                                                                             AProfissional.ENDERECO_PROFIS.NRLOG, AProfissional.CODIGO_PROFIS, AProfissional.NOME_PROFIS,
                                                                             AProfissional.SOBRENOME_PROFIS, AProfissional.CPF_PROFIS, AProfissional.RG_PROFIS,
                                                                             AProfissional.ENDERECO_PROFIS.LOGRADOURO, AProfissional.ENDERECO_PROFIS.COMPLLOG,
                                                                             AProfissional.ENDERECO_PROFIS.BAIRROLOG, AProfissional.ENDERECO_PROFIS.CIDADELOG,
                                                                             AProfissional.ENDERECO_PROFIS.UFLOG, AProfissional.ENDERECO_PROFIS.CEP,
                                                                             AProfissional.SALARIO_PROFIS, AProfissional.COMISSAO_PROFIS);

end;

end.
