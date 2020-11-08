unit Model.Terceirizadas.Servidor.HBeauty;

interface

uses Model.Terceirizada.HBeauty, Model.Genericos.Servidor.HBeauty, FMX.Forms;

procedure ListaTerceirizadas(ARazao, AFantasia, ACNPJ, ATipoPesquisa : String; AId : Integer);
function CadastraTerceirizada(ATerceirizada : TModelTerceirizada; AForm : TForm) : Integer;

function AtualizaTerceirizada(ATerceirizada : TModelTerceirizada) : Boolean;
procedure CarregaCamposTerceirizada(ACampos : String);


implementation

uses
  Model.Dados.Server.HBeauty, Data.FireDACJSONReflect,
  Controller.ClientModule.HBeauty, Winapi.Windows, FMX.Platform.Win,
  ACBrValidador;

procedure CarregaCamposTerceirizada(ACampos : String);
var
   dsCamposTerceirizada : TFDJSONDataSets;
begin
   dsCamposTerceirizada := ControllerClientModule.ModelMetodosClient.CarregaCamposTerceirizada(ACampos);
   Assert(TFDJSONDataSetsReader.GetListCount(dsCamposTerceirizada) = 1);
   ModelConexaoDados.memTerceirizada.Active := False;
   ModelConexaoDados.memTerceirizada.AppendData(TFDJSONDataSetsReader.GetListValue(dsCamposTerceirizada, 0));
   ModelConexaoDados.memTerceirizada.Active := True;
end;

procedure ListaTerceirizadas(ARazao, AFantasia, ACNPJ, ATipoPesquisa : String; AId : Integer);
var
   dsTerceirizada : TFDJSONDataSets;
begin
   dsTerceirizada := ControllerClientModule.ModelMetodosClient.ListaTerceirizadas(ARazao, AFantasia, ACNPJ, ATipoPesquisa, AId);
   Assert(TFDJSONDataSetsReader.GetListCount(dsTerceirizada) = 1);
   ModelConexaoDados.memTerceirizada.Active := False;
   ModelConexaoDados.memTerceirizada.AppendData(TFDJSONDataSetsReader.GetListValue(dsTerceirizada, 0));
   ModelConexaoDados.memTerceirizada.Active := True;
end;

function CadastraTerceirizada(ATerceirizada : TModelTerceirizada; AForm : TForm) : Integer;
begin

    DocumentoRepetido(ATerceirizada.CNPJ_TERCEIRIZADA, 'CNPJ_TERCEIRIZADA', 'FANTASIA_TERCEIRIZADA', 'HBTERCEIRIZADA', AForm);

    Result := ControllerClientModule.ModelMetodosClient.CadastraTerceirizada(ATerceirizada.ENDERECO_TERCEIRIZADA.NRLOG,
                                                                             ATerceirizada.CODIGO_TERCEIRIZADA, ATerceirizada.RAZAO_TERCEIRIZADA,
                                                                             ATerceirizada.FANTASIA_TERCEIRIZADA, ATerceirizada.CNPJ_TERCEIRIZADA,
                                                                             ATerceirizada.IE_TERCEIRIZADA, ATerceirizada.ENDERECO_TERCEIRIZADA.LOGRADOURO,
                                                                             ATerceirizada.ENDERECO_TERCEIRIZADA.COMPLLOG, ATerceirizada.ENDERECO_TERCEIRIZADA.BAIRROLOG,
                                                                             ATerceirizada.ENDERECO_TERCEIRIZADA.CIDADELOG, ATerceirizada.ENDERECO_TERCEIRIZADA.UFLOG,
                                                                             ATerceirizada.ENDERECO_TERCEIRIZADA.CEP);
end;

function AtualizaTerceirizada(ATerceirizada : TModelTerceirizada) : Boolean;
begin
     Result := ControllerClientModule.ModelMetodosClient.AtualizaTerceirizada(ATerceirizada.ID_TERCEIRIZADA, ATerceirizada.ENDERECO_TERCEIRIZADA.NRLOG,
                                                                              ATerceirizada.CODIGO_TERCEIRIZADA, ATerceirizada.RAZAO_TERCEIRIZADA,
                                                                              ATerceirizada.FANTASIA_TERCEIRIZADA, ATerceirizada.CNPJ_TERCEIRIZADA,
                                                                              ATerceirizada.IE_TERCEIRIZADA, ATerceirizada.ENDERECO_TERCEIRIZADA.LOGRADOURO,
                                                                              ATerceirizada.ENDERECO_TERCEIRIZADA.COMPLLOG, ATerceirizada.ENDERECO_TERCEIRIZADA.BAIRROLOG,
                                                                              ATerceirizada.ENDERECO_TERCEIRIZADA.CIDADELOG, ATerceirizada.ENDERECO_TERCEIRIZADA.UFLOG,
                                                                              ATerceirizada.ENDERECO_TERCEIRIZADA.CEP);
end;

end.
