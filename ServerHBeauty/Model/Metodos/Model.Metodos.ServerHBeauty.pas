unit Model.Metodos.ServerHBeauty;

interface

uses System.SysUtils, System.Classes, System.Json,
     Datasnap.DSServer, Datasnap.DSAuth,
     Data.FireDACJSONReflect,
     Controller.Conexao.HBeautyServer,
     Model.Metodos.Usuarios.ServerHBeauty,
     Model.Metodos.Profissionais.ServerHBeauty,
     Model.Metodos.Profissionais.Hablidades.ServerHBeauty, Model.Metodos.Terceirizadas.ServerHBeauty, Model.Metodos.Genericos.ServerHBeauty,
  Model.Metodos.Habilidades.ServerHBeauty, Model.Metodos.Profissionais.Cargos.ServerHBeauty;

type
{$METHODINFO ON}
  TModelMetodos = class(TDataModule)
  private

  public
    function CarregaProfissionalTerceirizado(AIdTerceirizado : Integer) : TFDJSONDataSets;
    function AtualizaEmail(AEmail : String; AIdEmail : Integer; ARestrito : Boolean) : String;
    function AtualizaTelefone(AFone, AContato : String; AIdTelefone : Integer; AWhatsFone, ARestrito : Boolean) : String;
    function CadastraTelefone(AFone, AContato, APrefixoTabela : String; AIdRegTab : Integer; AWhatsFone, ARestrito : Boolean) : Integer;
    function CadastraEmail(AEmail, APrefixoTabela : String; AIdRegTab : Integer; ARestrito : Boolean) : Integer;
    function CarregaEmails(ATipoEmail : String; AIdTabEmail : Integer) : TFDJSONDataSets;
    function CarregaTelefones(ATipoFone : String; AIdTabFone : Integer) : TFDJSONDataSets;
    function ListaProfissionais(ANome, ACPF, ATipoPesquisa : String; AIDTerceirizada, AId : Integer) : TFDJSONDataSets;
    function CarregaControle : TFDJSONDataSets;
    function ValidaLogin(Usuario, Senha : String) : TFDJSONDataSets;
    function CadastraProfissional(ATerceirizado : Boolean; AIdCargo, AIdEmpTer, ANrLog : Integer; ACodigo, ANome, ASobreNome, ACPF, ARG,
                                  ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String; ASalario, AComissao : Currency) : Integer;
    function AtualizaProfissional(ATerceirizado : Boolean; AIdProfiss, AIdCargo, AIdEmpTer, ANrLog : Integer; ACodigo, ANome, ASobreNome, ACPF, ARG,
                                  ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String; ASalario, AComissao : Currency) : String;
    function ListaTerceirizadas(ARazao, AFantasia, ACNPJ, ATipoPesquisa : String; AId : Integer) : TFDJSONDataSets;
    function CadastraTerceirizada(ANrLog : Integer; ACodigo, ARazao, AFantasia, ACNPJ, AIE,
                                  ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String) : Integer;
    function AtualizaTerceirizada(AIdTerc, ANrLog : Integer; ACodigo, ARazao, AFantasia, ACNPJ, AIE,
                                  ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep : String) : String;
    function CarregaCamposTerceirizada(ACampos : String) : TFDJSONDataSets;
    function CarregaCamposProfissional(ACampos : String) : TFDJSONDataSets;
    function DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela : String) : String;
    function ManipulaEstadoRegistro(ABloqueia : Boolean; AIdUsuario, AIdRegistro : Integer; ACampoID, ATabela : String) : Boolean;
    function GravaImagem(APrefixo, AExtensao : String) : Integer;
    function AtualizaImagem(AIDImagem : Integer) : String;
    function AtualizaFotoProfissional(AIDProfissional, AIdFoto : Integer) : String;

    function pesquisaHabilidade(AIDHabilidade, AIDCargo : Integer; ANomeHabilidade : String) : TFDJSONDataSets;
    function carregaHabilidades : TFDJSONDataSets;
    function atualizaHabilidades(AIdHabilidade, AIdCargoHabilidade : Integer; AHabilidade, ADescricao : String) : String;
    function cadastraHabilidade(AIDCargoHabilidade : Integer; AHabilidade, ADescricao : String) : String;

    function carregaHabilidadesProfissional(AAIdProfissional : Integer) : TFDJSONDataSets;
    function cadastraHabilidadeProfissional(AIdHabilidade, AIdProfissional : Integer) : String;
    function apagaHabilidadesProfissional(AIdProfissional: Integer) : String;
    function carregaCargos : TFDJSONDataSets;
    function pesquisaCargos(AIdCargo : Integer; ANomeCargo : String) : TFDJSONDataSets;
    function cadastraCargo(ANomeCargo, ADescricaoCargo : String) : String;
    function atualizaCargo(AIDCargo : Integer; ANomeCargo, ADescricaoCargo : String) : String;


  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils, Model.Metodos.Controle.ServerHBeauty, Model.Metodos.Contatos.ServerHBeauty, Model.Metodos.Imagens.ServerHBeauty;



{ TModelMetodos }

function TModelMetodos.carregaHabilidades : TFDJSONDataSets;
begin
     Result := Model.Metodos.Habilidades.ServerHBeauty.carregaHabilidades;
end;

function TModelMetodos.carregaHabilidadesProfissional(AAIdProfissional: Integer): TFDJSONDataSets;
begin
     Result := Model.Metodos.Profissionais.Hablidades.ServerHBeauty.carregaHabilidadesProfissional(AAIdProfissional);
end;

function TModelMetodos.atualizaHabilidades(AIdHabilidade, AIdCargoHabilidade : Integer; AHabilidade, ADescricao : String) : String;
begin
     Result := Model.Metodos.Habilidades.ServerHBeauty.atualizaHabilidades(AIdHabilidade, AIdCargoHabilidade, AHabilidade, ADescricao);
end;

function TModelMetodos.cadastraHabilidade(AIDCargoHabilidade : Integer; AHabilidade, ADescricao : String) : String;
begin
     Result := Model.Metodos.Habilidades.ServerHBeauty.cadastraHabilidade(AIDCargoHabilidade, AHabilidade, ADescricao);
end;

function TModelMetodos.DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela : String) : String;
begin
    Result := Model.Metodos.Genericos.ServerHBeauty.DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela);
end;

function TModelMetodos.GravaImagem(APrefixo, AExtensao: String): Integer;
begin
    Result := Model.Metodos.Imagens.ServerHBeauty.GravaImagem(APrefixo, AExtensao);
end;

function TModelMetodos.ValidaLogin(Usuario, Senha : String) : TFDJSONDataSets;
begin
    Result := Model.Metodos.Usuarios.ServerHBeauty.ValidaLogin(Usuario, Senha);
end;

function TModelMetodos.apagaHabilidadesProfissional(AIdProfissional: Integer): String;
begin
     Result := Model.Metodos.Profissionais.Hablidades.ServerHBeauty.apagaHabilidadesProfissional(AIdProfissional);
end;

function TModelMetodos.atualizaCargo(AIDCargo: Integer; ANomeCargo, ADescricaoCargo: String): String;
begin
     Result := Model.Metodos.Profissionais.Cargos.ServerHBeauty.atualizaCargo(AIDCargo, ANomeCargo, ADescricaoCargo);
end;

function TModelMetodos.AtualizaEmail(AEmail : String; AIdEmail : Integer; ARestrito: Boolean): String;
begin
     Result := Model.Metodos.Contatos.ServerHBeauty.AtualizaEmail(AEmail, AIdEmail,  ARestrito);
end;

function TModelMetodos.AtualizaFotoProfissional(AIDProfissional, AIdFoto : Integer) : String;
begin
     Result := Model.Metodos.Profissionais.ServerHBeauty.AtualizaFotoProfissional(AIDProfissional, AIdFoto);
end;

function TModelMetodos.AtualizaImagem(AIDImagem: Integer): String;
begin
    Result := Model.Metodos.Imagens.ServerHBeauty.AtualizaImagem(AIDImagem)
end;

function TModelMetodos.AtualizaProfissional(ATerceirizado: Boolean; AIdProfiss, AIdCargo, AIdEmpTer, ANrLog: Integer; ACodigo, ANome, ASobreNome, ACPF, ARG, ALogradouro,
  AComplemento, ABairro, ACidade, AUF, ACep: String; ASalario, AComissao: Currency): String;
begin
     Result := Model.Metodos.Profissionais.ServerHBeauty.AtualizaProfissional(ATerceirizado, AIdProfiss, AIdCargo, AIdEmpTer, ANrLog, ACodigo, ANome, ASobreNome,
                                                                              ACPF, ARG, ALogradouro, AComplemento, ABairro, ACidade, AUF, ACep, ASalario, AComissao);
end;

function TModelMetodos.AtualizaTelefone(AFone, AContato : String; AIdTelefone : Integer; AWhatsFone, ARestrito: Boolean): String;
begin
     Result := Model.Metodos.Contatos.ServerHBeauty.AtualizaTelefone(AFone, AContato, AIdTelefone, AWhatsFone, ARestrito);
end;

function TModelMetodos.AtualizaTerceirizada(AIdTerc, ANrLog: Integer; ACodigo, ARazao, AFantasia, ACNPJ, AIE, ALogradouro, AComplemento, ABairro, ACidade, AUF,
  ACep: String): String;
begin
     Result := Model.Metodos.Terceirizadas.ServerHBeauty.AtualizaTerceirizada(AIdTerc, ANrLog, ACodigo, ARazao, AFantasia, ACNPJ, AIE, ALogradouro, AComplemento, ABairro, ACidade, AUF,  ACep);
end;

function TModelMetodos.cadastraCargo(ANomeCargo, ADescricaoCargo: String): String;
begin
     Result := Model.Metodos.Profissionais.Cargos.ServerHBeauty.cadastraCargo(ANomeCargo, ADescricaoCargo);
end;

function TModelMetodos.CadastraEmail(AEmail, APrefixoTabela: String; AIdRegTab: Integer; ARestrito: Boolean): Integer;
begin
     Result := Model.Metodos.Contatos.ServerHBeauty.CadastraEmail(AEmail, APrefixoTabela, AIdRegTab, ARestrito);
end;

function TModelMetodos.cadastraHabilidadeProfissional(AIdHabilidade, AIdProfissional: Integer): String;
begin
     Result:= Model.Metodos.Profissionais.Hablidades.ServerHBeauty.cadastraHabilidadeProfissional(AIdHabilidade, AIdProfissional);
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

function TModelMetodos.CadastraTerceirizada(ANrLog: Integer; ACodigo, ARazao, AFantasia, ACNPJ, AIE, ALogradouro, AComplemento, ABairro, ACidade, AUF,  ACep: String): Integer;
begin
     Result := MOdel.Metodos.Terceirizadas.ServerHBeauty.CadastraTerceirizada(ANrLog, ACodigo, ARazao, AFantasia, ACNPJ, AIE, ALogradouro,
                                                                              AComplemento, ABairro, ACidade, AUF, ACep);
end;

function TModelMetodos.CarregaCamposProfissional(ACampos: String): TFDJSONDataSets;
begin
     Result := Model.Metodos.Profissionais.ServerHBeauty.CarregaCamposProfissionais(ACampos);
end;

function TModelMetodos.CarregaCamposTerceirizada(ACampos: String): TFDJSONDataSets;
begin
     Result:= Model.Metodos.Terceirizadas.ServerHBeauty.CarregaCamposTerceirizada(ACampos);
end;

function TModelMetodos.carregaCargos: TFDJSONDataSets;
begin
     Result := Model.Metodos.Profissionais.Cargos.ServerHBeauty.carregaCargos;
end;

function TModelMetodos.CarregaControle: TFDJSONDataSets;
begin
     Result := Model.Metodos.Controle.ServerHBeauty.CarregaControle;
end;


function TModelMetodos.CarregaEmails(ATipoEmail: String; AIdTabEmail: Integer): TFDJSONDataSets;
begin
     Result := Model.Metodos.Contatos.ServerHBeauty.CarregaEmails(ATipoEmail, AIdTabEmail);
end;

function TModelMetodos.CarregaProfissionalTerceirizado(AIdTerceirizado: Integer): TFDJSONDataSets;
begin
     Result := Model.Metodos.Profissionais.ServerHBeauty.CarregaProfissionalTerceirizado(AIdTerceirizado);
end;

function TModelMetodos.CarregaTelefones(ATipoFone: String; AIdTabFone: Integer): TFDJSONDataSets;
begin
     Result := Model.Metodos.Contatos.ServerHBeauty.CarregaTelefones(ATipoFone, AIdTabFone);
end;

function TModelMetodos.ListaProfissionais(ANome, ACPF, ATipoPesquisa: String; AIDTerceirizada, AId: Integer): TFDJSONDataSets;
begin
     Result := Model.Metodos.Profissionais.ServerHBeauty.ListaProfissionais(ANome, ACPF, ATipoPEsquisa, AIDTerceirizada, AId);
end;

function TModelMetodos.ListaTerceirizadas(ARazao, AFantasia, ACNPJ, ATipoPesquisa: String; AId: Integer): TFDJSONDataSets;
begin
     Result := Model.Metodos.Terceirizadas.ServerHBeauty.ListaTerceirizadas(ARazao, AFantasia, ACNPJ, ATipoPesquisa,  AId);
end;

function TModelMetodos.ManipulaEstadoRegistro(ABloqueia : Boolean; AIdUsuario, AIdRegistro : Integer; ACampoID, ATabela : String) : Boolean;
begin
     Result := Model.Metodos.Genericos.ServerHBeauty.ManipulaEstadoRegistro(ABloqueia, AIdUsuario, AIdRegistro, ACampoID, ATabela);
end;

function TModelMetodos.pesquisaCargos(AIdCargo: Integer; ANomeCargo: String): TFDJSONDataSets;
begin
     Result := Model.Metodos.Profissionais.Cargos.ServerHBeauty.pesquisaCargos(AIdCargo, ANomeCargo);
end;

function TModelMetodos.pesquisaHabilidade(AIDHabilidade, AIDCargo : Integer; ANomeHabilidade: String): TFDJSONDataSets;
begin
     Result := Model.Metodos.Habilidades.ServerHBeauty.pesquisaHabilidade(AIDHabilidade, AIDCargo, ANomeHabilidade);
end;

end.

