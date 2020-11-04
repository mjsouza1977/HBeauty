unit Model.Terceirizadas.Servidor.HBeauty;

interface

uses Model.Terceirizada.HBeauty;

procedure ListaTerceirizadas(ARazao, AFantasia, ACNPJ, ATipoPesquisa : String; AId : Integer);
function CadastraTerceirizada(ATerceirizada : TModelTerceirizada) : Integer;

function AtualizaTerceirizada(ATerceirizada : TModelTerceirizada) : Boolean;

implementation

uses
  Model.Dados.Server.HBeauty, Data.FireDACJSONReflect,
  Controller.ClientModule.HBeauty;


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

function CadastraTerceirizada(ATerceirizada : TModelTerceirizada) : Integer;
begin
    Result := ControllerClientModule.ModelMetodosClient.CadastraTerceirizada(ATerceirizada.ID_TERCEIRIZADA, ATerceirizada.ENDERECO_TERCEIRIZADA.NRLOG,
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
