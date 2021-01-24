unit Model.Profissionais.Servidor.HBeauty;

interface

uses
  Model.Profissionais.HBeauty, Model.Genericos.Servidor.HBeauty,
  FMX.Forms, Data.FireDACJSONReflect, Model.Cargos.HBeauty;

procedure ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AIDTerceirizada, AId : Integer);
function CadastraProfissional(AProfissional : TModelProfissionais; AForm : TForm; APathOriginal : String) : Integer;
function AtualizaProfissional(AProfissional : TModelProfissionais): String;

procedure CarregaProfissionalTerceirizado(AIdTerceirizado: Integer);
procedure CarregaCamposProfissional(ACampos : String);
function AtualizaFotoProfissional(AIDProfissional, AIdFoto : Integer) : String;

procedure carregaHabilidades;
function carregaCargos : TFDJSONDataSets;
function pesquisaCargos(AIdCargo : Integer; ANomeCargo : String) : TFDJSONDataSets;
function cadastraCargo(ACargo : TModelCargos) : String;
function atualizaCargo(ACargo : TModelCargos) : String;

implementation

uses
  Controller.ClientModule.HBeauty,
  Model.Dados.Server.HBeauty;

function cadastraCargo(ACargo : TModelCargos) : String;
begin
     Result := ControllerClientModule.ModelMetodosClient.cadastraCargo(ACargo.NOME_CARGO, ACargo.DESCR_CARGO);
end;

function atualizaCargo(ACargo : TModelCargos) : String;
begin
     Result := ControllerClientModule.ModelMetodosClient.atualizaCargo(ACargo.ID_CARGO, ACargo.NOME_CARGO, ACargo.DESCR_CARGO);
end;

function pesquisaCargos(AIdCargo : Integer; ANomeCargo : String) : TFDJSONDataSets;
var
    dsCargos : TFDJSONDataSets;
begin
    dsCargos := ControllerClientModule.ModelMetodosClient.pesquisaCargos(AIdCargo, ANomeCargo);
    Assert(TFDJSONDataSetsReader.GetListCount(dsCargos) = 1);
    ModelConexaoDados.memCargos.Active := False;
    ModelConexaoDados.memCargos.AppendData(TFDJSONDataSetsReader.GetListValue(dsCargos, 0));
    ModelConexaoDados.memCargos.Active := True;
end;

function carregaCargos : TFDJSONDataSets;
var
    dsCargos : TFDJSONDataSets;
begin
    dsCargos := ControllerClientModule.ModelMetodosClient.carregaCargos;
    Assert(TFDJSONDataSetsReader.GetListCount(dsCargos) = 1);
    ModelConexaoDados.memCargos.Active := False;
    ModelConexaoDados.memCargos.AppendData(TFDJSONDataSetsReader.GetListValue(dsCargos, 0));
    ModelConexaoDados.memCargos.Active := True;
end;

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

function cadastraHabilidadeProfissional(AIdHabilidade, AIdProfissional: Integer): String;
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

function AtualizaProfissional(AProfissional : TModelProfissionais): String;
begin
    Result := ControllerClientModule.ModelMetodosClient.AtualizaProfissional(AProfissional.TERC_PROFIS, AProfissional.ID_PROFIS, AProfissional.IDCARGO_PROFISS,
                                                                             AProfissional.IDEMPTER_PROFIS, AProfissional.ENDERECO_PROFIS.NRLOG,
                                                                             AProfissional.NOME_PROFIS, AProfissional.SOBRENOME_PROFIS,
                                                                             AProfissional.CPF_PROFIS, AProfissional.RG_PROFIS, AProfissional.ENDERECO_PROFIS.LOGRADOURO,
                                                                             AProfissional.ENDERECO_PROFIS.COMPLLOG, AProfissional.ENDERECO_PROFIS.BAIRROLOG,
                                                                             AProfissional.ENDERECO_PROFIS.CIDADELOG, AProfissional.ENDERECO_PROFIS.UFLOG,
                                                                             AProfissional.ENDERECO_PROFIS.CEP, AProfissional.SALARIO_PROFIS, AProfissional.COMISSAO_PROFIS);

end;

procedure ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AIDTerceirizada, AId : Integer);
var
   PesquisaProfissionais : TFDJSONDataSets;
begin

   PesquisaProfissionais := ControllerClientModule.ModelMetodosClient.ListaProfissionais(ANome, ACPF, ATipoPesquisa, AIDTerceirizada, AID);
   Assert(TFDJSONDataSetsReader.GetListCount(PesquisaProfissionais) = 1);
   ModelConexaoDados.memProfissionais.Active := False;
   ModelConexaoDados.memProfissionais.AppendData(TFDJSONDataSetsReader.GetListValue(PesquisaProfissionais, 0));
   ModelConexaoDados.memProfissionais.Active := True;


end;

function CadastraProfissional(AProfissional : TModelProfissionais; AForm : TForm; APathOriginal : String) : Integer;
begin

    DocumentoRepetido(AProfissional.CPF_PROFIS, 'CPF_PROFIS', 'NOME_PROFIS', 'HBPROFISSIONAIS', AForm, 'CNPJ', 'O profissional ');
    Result := ControllerClientModule.ModelMetodosClient.CadastraProfissional(AProfissional.TERC_PROFIS, AProfissional.IDCARGO_PROFISS, AProfissional.IDEMPTER_PROFIS,
                                                                             AProfissional.ENDERECO_PROFIS.NRLOG, AProfissional.NOME_PROFIS,
                                                                             AProfissional.SOBRENOME_PROFIS, AProfissional.CPF_PROFIS, AProfissional.RG_PROFIS,
                                                                             AProfissional.ENDERECO_PROFIS.LOGRADOURO, AProfissional.ENDERECO_PROFIS.COMPLLOG,
                                                                             AProfissional.ENDERECO_PROFIS.BAIRROLOG, AProfissional.ENDERECO_PROFIS.CIDADELOG,
                                                                             AProfissional.ENDERECO_PROFIS.UFLOG, AProfissional.ENDERECO_PROFIS.CEP, APathOriginal,
                                                                             AProfissional.SALARIO_PROFIS, AProfissional.COMISSAO_PROFIS);

end;

end.
