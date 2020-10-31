unit Model.Profissionais.Servidor.HBeauty;

interface

uses
  Model.Profissionais.HBeauty, Model.Habilidades.HBeauty;

procedure ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AId : Integer);
function CadastraProfissional(AProfissional : TModelProfissionais) : Integer;
function AtualizaProfissional(AProfissional : TModelProfissionais): Boolean;

procedure carregaHabilidades;
procedure carregaHabilidadesProfissional(AAIdProfissional : Integer);
function cadastraHabilidade(AHabilidade : TModelHabilidades) : Integer;
function apagaHabilidadesProfissional(AIdProfissional: Integer) : Boolean;
function atualizaHabilidade(AHabilidade : TModelHabilidades) : Boolean;


implementation

uses
  Controller.ClientModule.HBeauty, Data.FireDACJSONReflect,
  Model.Dados.Server.HBeauty;

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
   ModelConexaoDados.memHabilidades.Active := False;
   ModelConexaoDados.memHabilidades.AppendData(TFDJSONDataSetsReader.GetListValue(dsHabilidadesProfissional, 0));
   ModelConexaoDados.memHabilidades.Active := True;
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
     Result := ControllerClientModule.ModelMetodosClient.atualizaHabilidade(AHabilidade.Idabilidade, AHabilidade.NomeHabilidade, AHabilidade.DescricaoHabilidade);
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

function CadastraProfissional(AProfissional : TModelProfissionais) : Integer;
begin

    Result := ControllerClientModule.ModelMetodosClient.CadastraProfissional(AProfissional.TERC_PROFIS, AProfissional.IDCARGO_PROFISS, AProfissional.IDEMPTER_PROFIS,
                                                                             AProfissional.ENDERECO_PROFIS.NRLOG, AProfissional.CODIGO_PROFIS, AProfissional.NOME_PROFIS,
                                                                             AProfissional.SOBRENOME_PROFIS, AProfissional.CPF_PROFIS, AProfissional.RG_PROFIS,
                                                                             AProfissional.ENDERECO_PROFIS.LOGRADOURO, AProfissional.ENDERECO_PROFIS.COMPLLOG,
                                                                             AProfissional.ENDERECO_PROFIS.BAIRROLOG, AProfissional.ENDERECO_PROFIS.CIDADELOG,
                                                                             AProfissional.ENDERECO_PROFIS.UFLOG, AProfissional.ENDERECO_PROFIS.CEP,
                                                                             AProfissional.SALARIO_PROFIS, AProfissional.COMISSAO_PROFIS);

end;

end.
