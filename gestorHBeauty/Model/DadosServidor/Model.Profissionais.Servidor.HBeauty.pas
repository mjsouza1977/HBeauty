unit Model.Profissionais.Servidor.HBeauty;

interface

uses
  Model.Profissionais.HBeauty;

procedure ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AId : Integer);
function CadastraProfissional(ATerceirizado : Boolean; AIdCargo, AIdEmpTer, ANrLog : Integer; ACodigo, ANome, ASobreNome, ACPF, ARG,
                              ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String; ASalario, AComissao : Currency) : Integer;

implementation

uses
  Controller.ClientModule.HBeauty, Data.FireDACJSONReflect,
  Model.Dados.Server.HBeauty;

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

function CadastraProfissional(ATerceirizado : Boolean; AIdCargo, AIdEmpTer, ANrLog : Integer; ACodigo, ANome, ASobreNome, ACPF, ARG,
                              ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String; ASalario, AComissao : Currency) : Integer;
begin

    Result := ControllerClientModule.ModelMetodosClient.CadastraProfissional(ATerceirizado, AIdCargo, AIdEmpTer, ANrLog, ACodigo, ANome, ASobreNome, ACPF, ARG,
                                                                             ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep, ASalario, AComissao);

end;

end.
