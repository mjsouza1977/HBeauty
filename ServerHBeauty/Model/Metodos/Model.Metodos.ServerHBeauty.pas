unit Model.Metodos.ServerHBeauty;

interface

uses System.SysUtils, System.Classes, System.Json,
     Datasnap.DSServer, Datasnap.DSAuth,
     Data.FireDACJSONReflect,
     Controller.Conexao.HBeautyServer,
     Model.Metodos.Usuarios.ServerHBeauty,
     Model.Metodos.Profissionais.ServerHBeauty;

type
{$METHODINFO ON}
  TModelMetodos = class(TDataModule)
  private

  public
    function CadastraTelefone(AFone, AContato, APrefixoTabela : String; AIdRegTab : Integer; AWhatsFone, ARestrito : Boolean) : Integer;
    function CadastraEmail(AEmail, APrefixoTabela : String; AIdRegTab : Integer; ARestrito : Boolean) : Integer;
    function CarregaEmails(ATipoEmail : String; AIdTabEmail : Integer) : TFDJSONDataSets;
    function CarregaTelefones(ATipoFone : String; AIdTabFone : Integer) : TFDJSONDataSets;
    function ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
    function CarregaControle : TFDJSONDataSets;
    function ValidaLogin(Usuario, Senha : String) : TFDJSONDataSets;
    function CadastraProfissional(ATerceirizado : Boolean; AIdCargo, AIdEmpTer, ANrLog : Integer; ACodigo, ANome, ASobreNome, ACPF, ARG,
                                  ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String; ASalario, AComissao : Currency) : Integer;

  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils, Model.Metodos.Controle.ServerHBeauty, Model.Metodos.Contatos.ServerHBeauty;



{ TModelMetodos }

function TModelMetodos.ValidaLogin(Usuario, Senha : String) : TFDJSONDataSets;
begin
    Result := Model.Metodos.Usuarios.ServerHBeauty.ValidaLogin(Usuario, Senha);
end;

function TModelMetodos.CadastraEmail(AEmail, APrefixoTabela: String; AIdRegTab: Integer; ARestrito: Boolean): Integer;
begin
     Result := Model.Metodos.Contatos.ServerHBeauty.CadastraEmail(AEmail, APrefixoTabela, AIdRegTab, ARestrito);
end;

function TModelMetodos.CadastraProfissional(ATerceirizado : Boolean; AIdCargo, AIdEmpTer, ANrLog : Integer; ACodigo, ANome, ASobreNome, ACPF, ARG,
                                            ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String; ASalario, AComissao : Currency) : Integer;
begin
    Result := Model.Metodos.Profissionais.ServerHBeauty.CadastraProfissional(ATerceirizado, AIdCargo, AIdEmpTer, ANrLog, ACodigo, ANome, ASobreNome,
                                                                             ACPF, ARG, ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep, ASalario, AComissao);
end;

function TModelMetodos.CadastraTelefone(AFone, AContato, APrefixoTabela: String; AIdRegTab: Integer; AWhatsFone, ARestrito: Boolean): Integer;
begin
     Result := Model.Metodos.Contatos.ServerHBeauty.CadastraTelefone(AFone, AContato, APrefixoTabela, AIdRegTab, AWhatsFone, ARestrito);
end;

function TModelMetodos.CarregaControle: TFDJSONDataSets;
begin
     Result := Model.Metodos.Controle.ServerHBeauty.CarregaControle;
end;


function TModelMetodos.CarregaEmails(ATipoEmail: String; AIdTabEmail: Integer): TFDJSONDataSets;
begin
     Result := Model.Metodos.Contatos.ServerHBeauty.CarregaEmails(ATipoEmail, AIdTabEmail);
end;

function TModelMetodos.CarregaTelefones(ATipoFone: String; AIdTabFone: Integer): TFDJSONDataSets;
begin
     Result := Model.Metodos.Contatos.ServerHBeauty.CarregaTelefones(ATipoFone, AIdTabFone);
end;

function TModelMetodos.ListaProfissionais(ANome, ACPF, ATipoPesquisa: String; AId: Integer): TFDJSONDataSets;
begin
     Result := Model.Metodos.Profissionais.ServerHBeauty.ListaProfissionais(ANome, ACPF, ATipoPEsquisa, AId);
end;

end.

