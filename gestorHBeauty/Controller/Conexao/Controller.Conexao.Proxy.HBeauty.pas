//
// Created by the DataSnap proxy generator.
// 06/12/2020 18:03:00
//

unit Controller.Conexao.Proxy.HBeauty;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TModelMetodosClient = class(TDSAdminRestClient)
  private
    FCarregaProfissionalTerceirizadoCommand: TDSRestCommand;
    FCarregaProfissionalTerceirizadoCommand_Cache: TDSRestCommand;
    FAtualizaEmailCommand: TDSRestCommand;
    FAtualizaTelefoneCommand: TDSRestCommand;
    FCadastraTelefoneCommand: TDSRestCommand;
    FCadastraEmailCommand: TDSRestCommand;
    FCarregaEmailsCommand: TDSRestCommand;
    FCarregaEmailsCommand_Cache: TDSRestCommand;
    FCarregaTelefonesCommand: TDSRestCommand;
    FCarregaTelefonesCommand_Cache: TDSRestCommand;
    FListaProfissionaisCommand: TDSRestCommand;
    FListaProfissionaisCommand_Cache: TDSRestCommand;
    FCarregaControleCommand: TDSRestCommand;
    FCarregaControleCommand_Cache: TDSRestCommand;
    FValidaLoginCommand: TDSRestCommand;
    FValidaLoginCommand_Cache: TDSRestCommand;
    FCadastraProfissionalCommand: TDSRestCommand;
    FAtualizaProfissionalCommand: TDSRestCommand;
    FListaTerceirizadasCommand: TDSRestCommand;
    FListaTerceirizadasCommand_Cache: TDSRestCommand;
    FCadastraTerceirizadaCommand: TDSRestCommand;
    FAtualizaTerceirizadaCommand: TDSRestCommand;
    FCarregaCamposTerceirizadaCommand: TDSRestCommand;
    FCarregaCamposTerceirizadaCommand_Cache: TDSRestCommand;
    FCarregaCamposProfissionalCommand: TDSRestCommand;
    FCarregaCamposProfissionalCommand_Cache: TDSRestCommand;
    FDocumentoRepetidoCommand: TDSRestCommand;
    FManipulaEstadoRegistroCommand: TDSRestCommand;
    FGravaImagemCommand: TDSRestCommand;
    FAtualizaImagemCommand: TDSRestCommand;
    FAtualizaFotoProfissionalCommand: TDSRestCommand;
    FpesquisaHabilidadeCommand: TDSRestCommand;
    FpesquisaHabilidadeCommand_Cache: TDSRestCommand;
    FcarregaHabilidadesCommand: TDSRestCommand;
    FcarregaHabilidadesCommand_Cache: TDSRestCommand;
    FatualizaHabilidadesCommand: TDSRestCommand;
    FcadastraHabilidadeCommand: TDSRestCommand;
    FcarregaHabilidadesProfissionalCommand: TDSRestCommand;
    FcarregaHabilidadesProfissionalCommand_Cache: TDSRestCommand;
    FcadastraHabilidadeProfissionalCommand: TDSRestCommand;
    FapagaHabilidadesProfissionalCommand: TDSRestCommand;
    FcarregaCargosCommand: TDSRestCommand;
    FcarregaCargosCommand_Cache: TDSRestCommand;
    FpesquisaCargosCommand: TDSRestCommand;
    FpesquisaCargosCommand_Cache: TDSRestCommand;
    FcadastraCargoCommand: TDSRestCommand;
    FatualizaCargoCommand: TDSRestCommand;
    FcarregaFornecedoresCommand: TDSRestCommand;
    FcarregaFornecedoresCommand_Cache: TDSRestCommand;
    FPesquisaFornecedoresCommand: TDSRestCommand;
    FPesquisaFornecedoresCommand_Cache: TDSRestCommand;
    FcadastraFornecedorCommand: TDSRestCommand;
    FatualizaFornecedoresCommand: TDSRestCommand;
    FcarregaVendedoresCommand: TDSRestCommand;
    FcarregaVendedoresCommand_Cache: TDSRestCommand;
    FPesquisaVendedorCommand: TDSRestCommand;
    FPesquisaVendedorCommand_Cache: TDSRestCommand;
    FcadastraVendedorCommand: TDSRestCommand;
    FatualizaVendedorCommand: TDSRestCommand;
    FcarregaMarcasCommand: TDSRestCommand;
    FcarregaMarcasCommand_Cache: TDSRestCommand;
    FpesquisaMarcasCommand: TDSRestCommand;
    FpesquisaMarcasCommand_Cache: TDSRestCommand;
    FcadastraMarcaCommand: TDSRestCommand;
    FatualizaMarcaCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function CarregaProfissionalTerceirizado(AIdTerceirizado: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function CarregaProfissionalTerceirizado_Cache(AIdTerceirizado: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function AtualizaEmail(AEmail: string; AIdEmail: Integer; ARestrito: Boolean; const ARequestFilter: string = ''): string;
    function AtualizaTelefone(AFone: string; AContato: string; AIdTelefone: Integer; AWhatsFone: Boolean; ARestrito: Boolean; const ARequestFilter: string = ''): string;
    function CadastraTelefone(AFone: string; AContato: string; APrefixoTabela: string; AIdRegTab: Integer; AWhatsFone: Boolean; ARestrito: Boolean; const ARequestFilter: string = ''): Integer;
    function CadastraEmail(AEmail: string; APrefixoTabela: string; AIdRegTab: Integer; ARestrito: Boolean; const ARequestFilter: string = ''): Integer;
    function CarregaEmails(ATipoEmail: string; AIdTabEmail: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function CarregaEmails_Cache(ATipoEmail: string; AIdTabEmail: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function CarregaTelefones(ATipoFone: string; AIdTabFone: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function CarregaTelefones_Cache(ATipoFone: string; AIdTabFone: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function ListaProfissionais(ANome: string; ACPF: string; ATipoPesquisa: string; AIDTerceirizada: Integer; AId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function ListaProfissionais_Cache(ANome: string; ACPF: string; ATipoPesquisa: string; AIDTerceirizada: Integer; AId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function CarregaControle(const ARequestFilter: string = ''): TFDJSONDataSets;
    function CarregaControle_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function ValidaLogin(Usuario: string; Senha: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function ValidaLogin_Cache(Usuario: string; Senha: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function CadastraProfissional(ATerceirizado: Boolean; AIdCargo: Integer; AIdEmpTer: Integer; ANrLog: Integer; ACodigo: string; ANome: string; ASobreNome: string; ACPF: string; ARG: string; ALogradouro: string; AComplemento: string; ABairro: string; ACidade: string; AUF: string; ACep: string; ASalario: Currency; AComissao: Currency; const ARequestFilter: string = ''): Integer;
    function AtualizaProfissional(ATerceirizado: Boolean; AIdProfiss: Integer; AIdCargo: Integer; AIdEmpTer: Integer; ANrLog: Integer; ACodigo: string; ANome: string; ASobreNome: string; ACPF: string; ARG: string; ALogradouro: string; AComplemento: string; ABairro: string; ACidade: string; AUF: string; ACep: string; ASalario: Currency; AComissao: Currency; const ARequestFilter: string = ''): string;
    function ListaTerceirizadas(ARazao: string; AFantasia: string; ACNPJ: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function ListaTerceirizadas_Cache(ARazao: string; AFantasia: string; ACNPJ: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function CadastraTerceirizada(ANrLog: Integer; ACodigo: string; ARazao: string; AFantasia: string; ACNPJ: string; AIE: string; ALogradouro: string; AComplemento: string; ABairro: string; ACidade: string; AUF: string; ACep: string; const ARequestFilter: string = ''): Integer;
    function AtualizaTerceirizada(AIdTerc: Integer; ANrLog: Integer; ACodigo: string; ARazao: string; AFantasia: string; ACNPJ: string; AIE: string; ALogradouro: string; AComplemento: string; ABairro: string; ACidade: string; AUF: string; ACep: string; const ARequestFilter: string = ''): string;
    function CarregaCamposTerceirizada(ACampos: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function CarregaCamposTerceirizada_Cache(ACampos: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function CarregaCamposProfissional(ACampos: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function CarregaCamposProfissional_Cache(ACampos: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function DocumentoRepetido(ADocumento: string; ACampoDocumento: string; ACampoNome: string; ATabela: string; const ARequestFilter: string = ''): string;
    function ManipulaEstadoRegistro(ABloqueia: Boolean; AIdUsuario: Integer; AIdRegistro: Integer; ACampoID: string; ATabela: string; const ARequestFilter: string = ''): Boolean;
    function GravaImagem(APrefixo: string; AExtensao: string; const ARequestFilter: string = ''): Integer;
    function AtualizaImagem(AIDImagem: Integer; const ARequestFilter: string = ''): string;
    function AtualizaFotoProfissional(AIDProfissional: Integer; AIdFoto: Integer; const ARequestFilter: string = ''): string;
    function pesquisaHabilidade(AIDHabilidade: Integer; AIDCargo: Integer; ANomeHabilidade: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function pesquisaHabilidade_Cache(AIDHabilidade: Integer; AIDCargo: Integer; ANomeHabilidade: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function carregaHabilidades(const ARequestFilter: string = ''): TFDJSONDataSets;
    function carregaHabilidades_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function atualizaHabilidades(AIdHabilidade: Integer; AIdCargoHabilidade: Integer; AHabilidade: string; ADescricao: string; const ARequestFilter: string = ''): string;
    function cadastraHabilidade(AIDCargoHabilidade: Integer; AHabilidade: string; ADescricao: string; const ARequestFilter: string = ''): string;
    function carregaHabilidadesProfissional(AAIdProfissional: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function carregaHabilidadesProfissional_Cache(AAIdProfissional: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function cadastraHabilidadeProfissional(AIdHabilidade: Integer; AIdProfissional: Integer; const ARequestFilter: string = ''): string;
    function apagaHabilidadesProfissional(AIdProfissional: Integer; const ARequestFilter: string = ''): string;
    function carregaCargos(const ARequestFilter: string = ''): TFDJSONDataSets;
    function carregaCargos_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function pesquisaCargos(AIdCargo: Integer; ANomeCargo: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function pesquisaCargos_Cache(AIdCargo: Integer; ANomeCargo: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function cadastraCargo(ANomeCargo: string; ADescricaoCargo: string; const ARequestFilter: string = ''): string;
    function atualizaCargo(AIDCargo: Integer; ANomeCargo: string; ADescricaoCargo: string; const ARequestFilter: string = ''): string;
    function carregaFornecedores(const ARequestFilter: string = ''): TFDJSONDataSets;
    function carregaFornecedores_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function PesquisaFornecedores(ANome: string; APseudo: string; ACNPJ: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PesquisaFornecedores_Cache(ANome: string; APseudo: string; ACNPJ: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function cadastraFornecedor(AIdVendFor: Integer; ANrLog: Integer; ACodigo: string; ACNPJCPF: string; AIERG: string; ANome: string; APseudo: string; ALog: string; ACompl: string; ABairro: string; ACep: string; ACidade: string; AUF: string; const ARequestFilter: string = ''): string;
    function atualizaFornecedores(AIdForn: Integer; AIdVendFor: Integer; ANrLog: Integer; ACodigo: string; ACNPJCPF: string; AIERG: string; ANome: string; APseudo: string; ALog: string; ACompl: string; ABairro: string; ACep: string; ACidade: string; AUF: string; const ARequestFilter: string = ''): string;
    function carregaVendedores(const ARequestFilter: string = ''): TFDJSONDataSets;
    function carregaVendedores_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function PesquisaVendedor(ANome: string; ACPF: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PesquisaVendedor_Cache(ANome: string; ACPF: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function cadastraVendedor(ANrLog: Integer; ACPF: string; ARG: string; ANome: string; ALog: string; ACompl: string; ABairro: string; ACep: string; ACidade: string; AUF: string; const ARequestFilter: string = ''): string;
    function atualizaVendedor(AIdVend: Integer; ANrLog: Integer; ACPF: string; ARG: string; ANome: string; ALog: string; ACompl: string; ABairro: string; ACep: string; ACidade: string; AUF: string; const ARequestFilter: string = ''): string;
    function carregaMarcas(const ARequestFilter: string = ''): TFDJSONDataSets;
    function carregaMarcas_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function pesquisaMarcas(AIdMarca: Integer; AMarca: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function pesquisaMarcas_Cache(AIdMarca: Integer; AMarca: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function cadastraMarca(AMarca: string; const ARequestFilter: string = ''): string;
    function atualizaMarca(AIDMarca: Integer; AMarca: string; const ARequestFilter: string = ''): string;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TModelMetodos_CarregaProfissionalTerceirizado: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdTerceirizado'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_CarregaProfissionalTerceirizado_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdTerceirizado'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_AtualizaEmail: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'AEmail'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdEmail'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ARestrito'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_AtualizaTelefone: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'AFone'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AContato'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdTelefone'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AWhatsFone'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'ARestrito'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_CadastraTelefone: array [0..6] of TDSRestParameterMetaData =
  (
    (Name: 'AFone'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AContato'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'APrefixoTabela'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdRegTab'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AWhatsFone'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'ARestrito'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TModelMetodos_CadastraEmail: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'AEmail'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'APrefixoTabela'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdRegTab'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ARestrito'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TModelMetodos_CarregaEmails: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATipoEmail'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdTabEmail'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_CarregaEmails_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATipoEmail'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdTabEmail'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_CarregaTelefones: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATipoFone'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdTabFone'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_CarregaTelefones_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ATipoFone'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdTabFone'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_ListaProfissionais: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATipoPesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIDTerceirizada'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_ListaProfissionais_Cache: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATipoPesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIDTerceirizada'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_CarregaControle: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_CarregaControle_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_ValidaLogin: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Usuario'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Senha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_ValidaLogin_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Usuario'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Senha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_CadastraProfissional: array [0..17] of TDSRestParameterMetaData =
  (
    (Name: 'ATerceirizado'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'AIdCargo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdEmpTer'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANrLog'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACodigo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ASobreNome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARG'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ALogradouro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AComplemento'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ABairro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AUF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACep'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ASalario'; Direction: 1; DBXType: 25; TypeName: 'Currency'),
    (Name: 'AComissao'; Direction: 1; DBXType: 25; TypeName: 'Currency'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TModelMetodos_AtualizaProfissional: array [0..18] of TDSRestParameterMetaData =
  (
    (Name: 'ATerceirizado'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'AIdProfiss'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdCargo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdEmpTer'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANrLog'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACodigo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ASobreNome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARG'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ALogradouro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AComplemento'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ABairro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AUF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACep'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ASalario'; Direction: 1; DBXType: 25; TypeName: 'Currency'),
    (Name: 'AComissao'; Direction: 1; DBXType: 25; TypeName: 'Currency'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_ListaTerceirizadas: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ARazao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AFantasia'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACNPJ'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATipoPesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_ListaTerceirizadas_Cache: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ARazao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AFantasia'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACNPJ'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATipoPesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_CadastraTerceirizada: array [0..12] of TDSRestParameterMetaData =
  (
    (Name: 'ANrLog'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACodigo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARazao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AFantasia'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACNPJ'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIE'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ALogradouro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AComplemento'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ABairro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AUF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACep'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TModelMetodos_AtualizaTerceirizada: array [0..13] of TDSRestParameterMetaData =
  (
    (Name: 'AIdTerc'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANrLog'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACodigo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARazao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AFantasia'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACNPJ'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIE'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ALogradouro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AComplemento'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ABairro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AUF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACep'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_CarregaCamposTerceirizada: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACampos'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_CarregaCamposTerceirizada_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACampos'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_CarregaCamposProfissional: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACampos'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_CarregaCamposProfissional_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACampos'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_DocumentoRepetido: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ADocumento'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACampoDocumento'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACampoNome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATabela'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_ManipulaEstadoRegistro: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ABloqueia'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'AIdUsuario'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdRegistro'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACampoID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATabela'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TModelMetodos_GravaImagem: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'APrefixo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AExtensao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TModelMetodos_AtualizaImagem: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIDImagem'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_AtualizaFotoProfissional: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIDProfissional'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdFoto'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_pesquisaHabilidade: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'AIDHabilidade'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIDCargo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANomeHabilidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_pesquisaHabilidade_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'AIDHabilidade'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIDCargo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANomeHabilidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_carregaHabilidades: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_carregaHabilidades_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_atualizaHabilidades: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'AIdHabilidade'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdCargoHabilidade'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AHabilidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ADescricao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_cadastraHabilidade: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'AIDCargoHabilidade'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AHabilidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ADescricao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_carregaHabilidadesProfissional: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAIdProfissional'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_carregaHabilidadesProfissional_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AAIdProfissional'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_cadastraHabilidadeProfissional: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdHabilidade'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdProfissional'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_apagaHabilidadesProfissional: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdProfissional'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_carregaCargos: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_carregaCargos_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_pesquisaCargos: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCargo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANomeCargo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_pesquisaCargos_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCargo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANomeCargo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_cadastraCargo: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ANomeCargo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ADescricaoCargo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_atualizaCargo: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'AIDCargo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANomeCargo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ADescricaoCargo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_carregaFornecedores: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_carregaFornecedores_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_PesquisaFornecedores: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'APseudo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACNPJ'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATipoPesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_PesquisaFornecedores_Cache: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'APseudo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACNPJ'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATipoPesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_cadastraFornecedor: array [0..13] of TDSRestParameterMetaData =
  (
    (Name: 'AIdVendFor'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANrLog'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACodigo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACNPJCPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIERG'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'APseudo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ALog'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACompl'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ABairro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACep'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AUF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_atualizaFornecedores: array [0..14] of TDSRestParameterMetaData =
  (
    (Name: 'AIdForn'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdVendFor'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANrLog'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACodigo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACNPJCPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIERG'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'APseudo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ALog'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACompl'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ABairro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACep'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AUF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_carregaVendedores: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_carregaVendedores_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_PesquisaVendedor: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATipoPesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_PesquisaVendedor_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATipoPesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_cadastraVendedor: array [0..10] of TDSRestParameterMetaData =
  (
    (Name: 'ANrLog'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARG'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ALog'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACompl'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ABairro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACep'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AUF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_atualizaVendedor: array [0..11] of TDSRestParameterMetaData =
  (
    (Name: 'AIdVend'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANrLog'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ACPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARG'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ALog'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACompl'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ABairro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACep'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AUF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_carregaMarcas: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_carregaMarcas_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_pesquisaMarcas: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdMarca'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AMarca'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_pesquisaMarcas_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdMarca'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AMarca'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TModelMetodos_cadastraMarca: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AMarca'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TModelMetodos_atualizaMarca: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIDMarca'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AMarca'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation

function TModelMetodosClient.CarregaProfissionalTerceirizado(AIdTerceirizado: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FCarregaProfissionalTerceirizadoCommand = nil then
  begin
    FCarregaProfissionalTerceirizadoCommand := FConnection.CreateCommand;
    FCarregaProfissionalTerceirizadoCommand.RequestType := 'GET';
    FCarregaProfissionalTerceirizadoCommand.Text := 'TModelMetodos.CarregaProfissionalTerceirizado';
    FCarregaProfissionalTerceirizadoCommand.Prepare(TModelMetodos_CarregaProfissionalTerceirizado);
  end;
  FCarregaProfissionalTerceirizadoCommand.Parameters[0].Value.SetInt32(AIdTerceirizado);
  FCarregaProfissionalTerceirizadoCommand.Execute(ARequestFilter);
  if not FCarregaProfissionalTerceirizadoCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FCarregaProfissionalTerceirizadoCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FCarregaProfissionalTerceirizadoCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FCarregaProfissionalTerceirizadoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.CarregaProfissionalTerceirizado_Cache(AIdTerceirizado: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FCarregaProfissionalTerceirizadoCommand_Cache = nil then
  begin
    FCarregaProfissionalTerceirizadoCommand_Cache := FConnection.CreateCommand;
    FCarregaProfissionalTerceirizadoCommand_Cache.RequestType := 'GET';
    FCarregaProfissionalTerceirizadoCommand_Cache.Text := 'TModelMetodos.CarregaProfissionalTerceirizado';
    FCarregaProfissionalTerceirizadoCommand_Cache.Prepare(TModelMetodos_CarregaProfissionalTerceirizado_Cache);
  end;
  FCarregaProfissionalTerceirizadoCommand_Cache.Parameters[0].Value.SetInt32(AIdTerceirizado);
  FCarregaProfissionalTerceirizadoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FCarregaProfissionalTerceirizadoCommand_Cache.Parameters[1].Value.GetString);
end;

function TModelMetodosClient.AtualizaEmail(AEmail: string; AIdEmail: Integer; ARestrito: Boolean; const ARequestFilter: string): string;
begin
  if FAtualizaEmailCommand = nil then
  begin
    FAtualizaEmailCommand := FConnection.CreateCommand;
    FAtualizaEmailCommand.RequestType := 'GET';
    FAtualizaEmailCommand.Text := 'TModelMetodos.AtualizaEmail';
    FAtualizaEmailCommand.Prepare(TModelMetodos_AtualizaEmail);
  end;
  FAtualizaEmailCommand.Parameters[0].Value.SetWideString(AEmail);
  FAtualizaEmailCommand.Parameters[1].Value.SetInt32(AIdEmail);
  FAtualizaEmailCommand.Parameters[2].Value.SetBoolean(ARestrito);
  FAtualizaEmailCommand.Execute(ARequestFilter);
  Result := FAtualizaEmailCommand.Parameters[3].Value.GetWideString;
end;

function TModelMetodosClient.AtualizaTelefone(AFone: string; AContato: string; AIdTelefone: Integer; AWhatsFone: Boolean; ARestrito: Boolean; const ARequestFilter: string): string;
begin
  if FAtualizaTelefoneCommand = nil then
  begin
    FAtualizaTelefoneCommand := FConnection.CreateCommand;
    FAtualizaTelefoneCommand.RequestType := 'GET';
    FAtualizaTelefoneCommand.Text := 'TModelMetodos.AtualizaTelefone';
    FAtualizaTelefoneCommand.Prepare(TModelMetodos_AtualizaTelefone);
  end;
  FAtualizaTelefoneCommand.Parameters[0].Value.SetWideString(AFone);
  FAtualizaTelefoneCommand.Parameters[1].Value.SetWideString(AContato);
  FAtualizaTelefoneCommand.Parameters[2].Value.SetInt32(AIdTelefone);
  FAtualizaTelefoneCommand.Parameters[3].Value.SetBoolean(AWhatsFone);
  FAtualizaTelefoneCommand.Parameters[4].Value.SetBoolean(ARestrito);
  FAtualizaTelefoneCommand.Execute(ARequestFilter);
  Result := FAtualizaTelefoneCommand.Parameters[5].Value.GetWideString;
end;

function TModelMetodosClient.CadastraTelefone(AFone: string; AContato: string; APrefixoTabela: string; AIdRegTab: Integer; AWhatsFone: Boolean; ARestrito: Boolean; const ARequestFilter: string): Integer;
begin
  if FCadastraTelefoneCommand = nil then
  begin
    FCadastraTelefoneCommand := FConnection.CreateCommand;
    FCadastraTelefoneCommand.RequestType := 'GET';
    FCadastraTelefoneCommand.Text := 'TModelMetodos.CadastraTelefone';
    FCadastraTelefoneCommand.Prepare(TModelMetodos_CadastraTelefone);
  end;
  FCadastraTelefoneCommand.Parameters[0].Value.SetWideString(AFone);
  FCadastraTelefoneCommand.Parameters[1].Value.SetWideString(AContato);
  FCadastraTelefoneCommand.Parameters[2].Value.SetWideString(APrefixoTabela);
  FCadastraTelefoneCommand.Parameters[3].Value.SetInt32(AIdRegTab);
  FCadastraTelefoneCommand.Parameters[4].Value.SetBoolean(AWhatsFone);
  FCadastraTelefoneCommand.Parameters[5].Value.SetBoolean(ARestrito);
  FCadastraTelefoneCommand.Execute(ARequestFilter);
  Result := FCadastraTelefoneCommand.Parameters[6].Value.GetInt32;
end;

function TModelMetodosClient.CadastraEmail(AEmail: string; APrefixoTabela: string; AIdRegTab: Integer; ARestrito: Boolean; const ARequestFilter: string): Integer;
begin
  if FCadastraEmailCommand = nil then
  begin
    FCadastraEmailCommand := FConnection.CreateCommand;
    FCadastraEmailCommand.RequestType := 'GET';
    FCadastraEmailCommand.Text := 'TModelMetodos.CadastraEmail';
    FCadastraEmailCommand.Prepare(TModelMetodos_CadastraEmail);
  end;
  FCadastraEmailCommand.Parameters[0].Value.SetWideString(AEmail);
  FCadastraEmailCommand.Parameters[1].Value.SetWideString(APrefixoTabela);
  FCadastraEmailCommand.Parameters[2].Value.SetInt32(AIdRegTab);
  FCadastraEmailCommand.Parameters[3].Value.SetBoolean(ARestrito);
  FCadastraEmailCommand.Execute(ARequestFilter);
  Result := FCadastraEmailCommand.Parameters[4].Value.GetInt32;
end;

function TModelMetodosClient.CarregaEmails(ATipoEmail: string; AIdTabEmail: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FCarregaEmailsCommand = nil then
  begin
    FCarregaEmailsCommand := FConnection.CreateCommand;
    FCarregaEmailsCommand.RequestType := 'GET';
    FCarregaEmailsCommand.Text := 'TModelMetodos.CarregaEmails';
    FCarregaEmailsCommand.Prepare(TModelMetodos_CarregaEmails);
  end;
  FCarregaEmailsCommand.Parameters[0].Value.SetWideString(ATipoEmail);
  FCarregaEmailsCommand.Parameters[1].Value.SetInt32(AIdTabEmail);
  FCarregaEmailsCommand.Execute(ARequestFilter);
  if not FCarregaEmailsCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FCarregaEmailsCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FCarregaEmailsCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FCarregaEmailsCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.CarregaEmails_Cache(ATipoEmail: string; AIdTabEmail: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FCarregaEmailsCommand_Cache = nil then
  begin
    FCarregaEmailsCommand_Cache := FConnection.CreateCommand;
    FCarregaEmailsCommand_Cache.RequestType := 'GET';
    FCarregaEmailsCommand_Cache.Text := 'TModelMetodos.CarregaEmails';
    FCarregaEmailsCommand_Cache.Prepare(TModelMetodos_CarregaEmails_Cache);
  end;
  FCarregaEmailsCommand_Cache.Parameters[0].Value.SetWideString(ATipoEmail);
  FCarregaEmailsCommand_Cache.Parameters[1].Value.SetInt32(AIdTabEmail);
  FCarregaEmailsCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FCarregaEmailsCommand_Cache.Parameters[2].Value.GetString);
end;

function TModelMetodosClient.CarregaTelefones(ATipoFone: string; AIdTabFone: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FCarregaTelefonesCommand = nil then
  begin
    FCarregaTelefonesCommand := FConnection.CreateCommand;
    FCarregaTelefonesCommand.RequestType := 'GET';
    FCarregaTelefonesCommand.Text := 'TModelMetodos.CarregaTelefones';
    FCarregaTelefonesCommand.Prepare(TModelMetodos_CarregaTelefones);
  end;
  FCarregaTelefonesCommand.Parameters[0].Value.SetWideString(ATipoFone);
  FCarregaTelefonesCommand.Parameters[1].Value.SetInt32(AIdTabFone);
  FCarregaTelefonesCommand.Execute(ARequestFilter);
  if not FCarregaTelefonesCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FCarregaTelefonesCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FCarregaTelefonesCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FCarregaTelefonesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.CarregaTelefones_Cache(ATipoFone: string; AIdTabFone: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FCarregaTelefonesCommand_Cache = nil then
  begin
    FCarregaTelefonesCommand_Cache := FConnection.CreateCommand;
    FCarregaTelefonesCommand_Cache.RequestType := 'GET';
    FCarregaTelefonesCommand_Cache.Text := 'TModelMetodos.CarregaTelefones';
    FCarregaTelefonesCommand_Cache.Prepare(TModelMetodos_CarregaTelefones_Cache);
  end;
  FCarregaTelefonesCommand_Cache.Parameters[0].Value.SetWideString(ATipoFone);
  FCarregaTelefonesCommand_Cache.Parameters[1].Value.SetInt32(AIdTabFone);
  FCarregaTelefonesCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FCarregaTelefonesCommand_Cache.Parameters[2].Value.GetString);
end;

function TModelMetodosClient.ListaProfissionais(ANome: string; ACPF: string; ATipoPesquisa: string; AIDTerceirizada: Integer; AId: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FListaProfissionaisCommand = nil then
  begin
    FListaProfissionaisCommand := FConnection.CreateCommand;
    FListaProfissionaisCommand.RequestType := 'GET';
    FListaProfissionaisCommand.Text := 'TModelMetodos.ListaProfissionais';
    FListaProfissionaisCommand.Prepare(TModelMetodos_ListaProfissionais);
  end;
  FListaProfissionaisCommand.Parameters[0].Value.SetWideString(ANome);
  FListaProfissionaisCommand.Parameters[1].Value.SetWideString(ACPF);
  FListaProfissionaisCommand.Parameters[2].Value.SetWideString(ATipoPesquisa);
  FListaProfissionaisCommand.Parameters[3].Value.SetInt32(AIDTerceirizada);
  FListaProfissionaisCommand.Parameters[4].Value.SetInt32(AId);
  FListaProfissionaisCommand.Execute(ARequestFilter);
  if not FListaProfissionaisCommand.Parameters[5].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FListaProfissionaisCommand.Parameters[5].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FListaProfissionaisCommand.Parameters[5].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FListaProfissionaisCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.ListaProfissionais_Cache(ANome: string; ACPF: string; ATipoPesquisa: string; AIDTerceirizada: Integer; AId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FListaProfissionaisCommand_Cache = nil then
  begin
    FListaProfissionaisCommand_Cache := FConnection.CreateCommand;
    FListaProfissionaisCommand_Cache.RequestType := 'GET';
    FListaProfissionaisCommand_Cache.Text := 'TModelMetodos.ListaProfissionais';
    FListaProfissionaisCommand_Cache.Prepare(TModelMetodos_ListaProfissionais_Cache);
  end;
  FListaProfissionaisCommand_Cache.Parameters[0].Value.SetWideString(ANome);
  FListaProfissionaisCommand_Cache.Parameters[1].Value.SetWideString(ACPF);
  FListaProfissionaisCommand_Cache.Parameters[2].Value.SetWideString(ATipoPesquisa);
  FListaProfissionaisCommand_Cache.Parameters[3].Value.SetInt32(AIDTerceirizada);
  FListaProfissionaisCommand_Cache.Parameters[4].Value.SetInt32(AId);
  FListaProfissionaisCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FListaProfissionaisCommand_Cache.Parameters[5].Value.GetString);
end;

function TModelMetodosClient.CarregaControle(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FCarregaControleCommand = nil then
  begin
    FCarregaControleCommand := FConnection.CreateCommand;
    FCarregaControleCommand.RequestType := 'GET';
    FCarregaControleCommand.Text := 'TModelMetodos.CarregaControle';
    FCarregaControleCommand.Prepare(TModelMetodos_CarregaControle);
  end;
  FCarregaControleCommand.Execute(ARequestFilter);
  if not FCarregaControleCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FCarregaControleCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FCarregaControleCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FCarregaControleCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.CarregaControle_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FCarregaControleCommand_Cache = nil then
  begin
    FCarregaControleCommand_Cache := FConnection.CreateCommand;
    FCarregaControleCommand_Cache.RequestType := 'GET';
    FCarregaControleCommand_Cache.Text := 'TModelMetodos.CarregaControle';
    FCarregaControleCommand_Cache.Prepare(TModelMetodos_CarregaControle_Cache);
  end;
  FCarregaControleCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FCarregaControleCommand_Cache.Parameters[0].Value.GetString);
end;

function TModelMetodosClient.ValidaLogin(Usuario: string; Senha: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FValidaLoginCommand = nil then
  begin
    FValidaLoginCommand := FConnection.CreateCommand;
    FValidaLoginCommand.RequestType := 'GET';
    FValidaLoginCommand.Text := 'TModelMetodos.ValidaLogin';
    FValidaLoginCommand.Prepare(TModelMetodos_ValidaLogin);
  end;
  FValidaLoginCommand.Parameters[0].Value.SetWideString(Usuario);
  FValidaLoginCommand.Parameters[1].Value.SetWideString(Senha);
  FValidaLoginCommand.Execute(ARequestFilter);
  if not FValidaLoginCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FValidaLoginCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FValidaLoginCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FValidaLoginCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.ValidaLogin_Cache(Usuario: string; Senha: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FValidaLoginCommand_Cache = nil then
  begin
    FValidaLoginCommand_Cache := FConnection.CreateCommand;
    FValidaLoginCommand_Cache.RequestType := 'GET';
    FValidaLoginCommand_Cache.Text := 'TModelMetodos.ValidaLogin';
    FValidaLoginCommand_Cache.Prepare(TModelMetodos_ValidaLogin_Cache);
  end;
  FValidaLoginCommand_Cache.Parameters[0].Value.SetWideString(Usuario);
  FValidaLoginCommand_Cache.Parameters[1].Value.SetWideString(Senha);
  FValidaLoginCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FValidaLoginCommand_Cache.Parameters[2].Value.GetString);
end;

function TModelMetodosClient.CadastraProfissional(ATerceirizado: Boolean; AIdCargo: Integer; AIdEmpTer: Integer; ANrLog: Integer; ACodigo: string; ANome: string; ASobreNome: string; ACPF: string; ARG: string; ALogradouro: string; AComplemento: string; ABairro: string; ACidade: string; AUF: string; ACep: string; ASalario: Currency; AComissao: Currency; const ARequestFilter: string): Integer;
begin
  if FCadastraProfissionalCommand = nil then
  begin
    FCadastraProfissionalCommand := FConnection.CreateCommand;
    FCadastraProfissionalCommand.RequestType := 'GET';
    FCadastraProfissionalCommand.Text := 'TModelMetodos.CadastraProfissional';
    FCadastraProfissionalCommand.Prepare(TModelMetodos_CadastraProfissional);
  end;
  FCadastraProfissionalCommand.Parameters[0].Value.SetBoolean(ATerceirizado);
  FCadastraProfissionalCommand.Parameters[1].Value.SetInt32(AIdCargo);
  FCadastraProfissionalCommand.Parameters[2].Value.SetInt32(AIdEmpTer);
  FCadastraProfissionalCommand.Parameters[3].Value.SetInt32(ANrLog);
  FCadastraProfissionalCommand.Parameters[4].Value.SetWideString(ACodigo);
  FCadastraProfissionalCommand.Parameters[5].Value.SetWideString(ANome);
  FCadastraProfissionalCommand.Parameters[6].Value.SetWideString(ASobreNome);
  FCadastraProfissionalCommand.Parameters[7].Value.SetWideString(ACPF);
  FCadastraProfissionalCommand.Parameters[8].Value.SetWideString(ARG);
  FCadastraProfissionalCommand.Parameters[9].Value.SetWideString(ALogradouro);
  FCadastraProfissionalCommand.Parameters[10].Value.SetWideString(AComplemento);
  FCadastraProfissionalCommand.Parameters[11].Value.SetWideString(ABairro);
  FCadastraProfissionalCommand.Parameters[12].Value.SetWideString(ACidade);
  FCadastraProfissionalCommand.Parameters[13].Value.SetWideString(AUF);
  FCadastraProfissionalCommand.Parameters[14].Value.SetWideString(ACep);
  FCadastraProfissionalCommand.Parameters[15].Value.AsCurrency := ASalario;
  FCadastraProfissionalCommand.Parameters[16].Value.AsCurrency := AComissao;
  FCadastraProfissionalCommand.Execute(ARequestFilter);
  Result := FCadastraProfissionalCommand.Parameters[17].Value.GetInt32;
end;

function TModelMetodosClient.AtualizaProfissional(ATerceirizado: Boolean; AIdProfiss: Integer; AIdCargo: Integer; AIdEmpTer: Integer; ANrLog: Integer; ACodigo: string; ANome: string; ASobreNome: string; ACPF: string; ARG: string; ALogradouro: string; AComplemento: string; ABairro: string; ACidade: string; AUF: string; ACep: string; ASalario: Currency; AComissao: Currency; const ARequestFilter: string): string;
begin
  if FAtualizaProfissionalCommand = nil then
  begin
    FAtualizaProfissionalCommand := FConnection.CreateCommand;
    FAtualizaProfissionalCommand.RequestType := 'GET';
    FAtualizaProfissionalCommand.Text := 'TModelMetodos.AtualizaProfissional';
    FAtualizaProfissionalCommand.Prepare(TModelMetodos_AtualizaProfissional);
  end;
  FAtualizaProfissionalCommand.Parameters[0].Value.SetBoolean(ATerceirizado);
  FAtualizaProfissionalCommand.Parameters[1].Value.SetInt32(AIdProfiss);
  FAtualizaProfissionalCommand.Parameters[2].Value.SetInt32(AIdCargo);
  FAtualizaProfissionalCommand.Parameters[3].Value.SetInt32(AIdEmpTer);
  FAtualizaProfissionalCommand.Parameters[4].Value.SetInt32(ANrLog);
  FAtualizaProfissionalCommand.Parameters[5].Value.SetWideString(ACodigo);
  FAtualizaProfissionalCommand.Parameters[6].Value.SetWideString(ANome);
  FAtualizaProfissionalCommand.Parameters[7].Value.SetWideString(ASobreNome);
  FAtualizaProfissionalCommand.Parameters[8].Value.SetWideString(ACPF);
  FAtualizaProfissionalCommand.Parameters[9].Value.SetWideString(ARG);
  FAtualizaProfissionalCommand.Parameters[10].Value.SetWideString(ALogradouro);
  FAtualizaProfissionalCommand.Parameters[11].Value.SetWideString(AComplemento);
  FAtualizaProfissionalCommand.Parameters[12].Value.SetWideString(ABairro);
  FAtualizaProfissionalCommand.Parameters[13].Value.SetWideString(ACidade);
  FAtualizaProfissionalCommand.Parameters[14].Value.SetWideString(AUF);
  FAtualizaProfissionalCommand.Parameters[15].Value.SetWideString(ACep);
  FAtualizaProfissionalCommand.Parameters[16].Value.AsCurrency := ASalario;
  FAtualizaProfissionalCommand.Parameters[17].Value.AsCurrency := AComissao;
  FAtualizaProfissionalCommand.Execute(ARequestFilter);
  Result := FAtualizaProfissionalCommand.Parameters[18].Value.GetWideString;
end;

function TModelMetodosClient.ListaTerceirizadas(ARazao: string; AFantasia: string; ACNPJ: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FListaTerceirizadasCommand = nil then
  begin
    FListaTerceirizadasCommand := FConnection.CreateCommand;
    FListaTerceirizadasCommand.RequestType := 'GET';
    FListaTerceirizadasCommand.Text := 'TModelMetodos.ListaTerceirizadas';
    FListaTerceirizadasCommand.Prepare(TModelMetodos_ListaTerceirizadas);
  end;
  FListaTerceirizadasCommand.Parameters[0].Value.SetWideString(ARazao);
  FListaTerceirizadasCommand.Parameters[1].Value.SetWideString(AFantasia);
  FListaTerceirizadasCommand.Parameters[2].Value.SetWideString(ACNPJ);
  FListaTerceirizadasCommand.Parameters[3].Value.SetWideString(ATipoPesquisa);
  FListaTerceirizadasCommand.Parameters[4].Value.SetInt32(AId);
  FListaTerceirizadasCommand.Execute(ARequestFilter);
  if not FListaTerceirizadasCommand.Parameters[5].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FListaTerceirizadasCommand.Parameters[5].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FListaTerceirizadasCommand.Parameters[5].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FListaTerceirizadasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.ListaTerceirizadas_Cache(ARazao: string; AFantasia: string; ACNPJ: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FListaTerceirizadasCommand_Cache = nil then
  begin
    FListaTerceirizadasCommand_Cache := FConnection.CreateCommand;
    FListaTerceirizadasCommand_Cache.RequestType := 'GET';
    FListaTerceirizadasCommand_Cache.Text := 'TModelMetodos.ListaTerceirizadas';
    FListaTerceirizadasCommand_Cache.Prepare(TModelMetodos_ListaTerceirizadas_Cache);
  end;
  FListaTerceirizadasCommand_Cache.Parameters[0].Value.SetWideString(ARazao);
  FListaTerceirizadasCommand_Cache.Parameters[1].Value.SetWideString(AFantasia);
  FListaTerceirizadasCommand_Cache.Parameters[2].Value.SetWideString(ACNPJ);
  FListaTerceirizadasCommand_Cache.Parameters[3].Value.SetWideString(ATipoPesquisa);
  FListaTerceirizadasCommand_Cache.Parameters[4].Value.SetInt32(AId);
  FListaTerceirizadasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FListaTerceirizadasCommand_Cache.Parameters[5].Value.GetString);
end;

function TModelMetodosClient.CadastraTerceirizada(ANrLog: Integer; ACodigo: string; ARazao: string; AFantasia: string; ACNPJ: string; AIE: string; ALogradouro: string; AComplemento: string; ABairro: string; ACidade: string; AUF: string; ACep: string; const ARequestFilter: string): Integer;
begin
  if FCadastraTerceirizadaCommand = nil then
  begin
    FCadastraTerceirizadaCommand := FConnection.CreateCommand;
    FCadastraTerceirizadaCommand.RequestType := 'GET';
    FCadastraTerceirizadaCommand.Text := 'TModelMetodos.CadastraTerceirizada';
    FCadastraTerceirizadaCommand.Prepare(TModelMetodos_CadastraTerceirizada);
  end;
  FCadastraTerceirizadaCommand.Parameters[0].Value.SetInt32(ANrLog);
  FCadastraTerceirizadaCommand.Parameters[1].Value.SetWideString(ACodigo);
  FCadastraTerceirizadaCommand.Parameters[2].Value.SetWideString(ARazao);
  FCadastraTerceirizadaCommand.Parameters[3].Value.SetWideString(AFantasia);
  FCadastraTerceirizadaCommand.Parameters[4].Value.SetWideString(ACNPJ);
  FCadastraTerceirizadaCommand.Parameters[5].Value.SetWideString(AIE);
  FCadastraTerceirizadaCommand.Parameters[6].Value.SetWideString(ALogradouro);
  FCadastraTerceirizadaCommand.Parameters[7].Value.SetWideString(AComplemento);
  FCadastraTerceirizadaCommand.Parameters[8].Value.SetWideString(ABairro);
  FCadastraTerceirizadaCommand.Parameters[9].Value.SetWideString(ACidade);
  FCadastraTerceirizadaCommand.Parameters[10].Value.SetWideString(AUF);
  FCadastraTerceirizadaCommand.Parameters[11].Value.SetWideString(ACep);
  FCadastraTerceirizadaCommand.Execute(ARequestFilter);
  Result := FCadastraTerceirizadaCommand.Parameters[12].Value.GetInt32;
end;

function TModelMetodosClient.AtualizaTerceirizada(AIdTerc: Integer; ANrLog: Integer; ACodigo: string; ARazao: string; AFantasia: string; ACNPJ: string; AIE: string; ALogradouro: string; AComplemento: string; ABairro: string; ACidade: string; AUF: string; ACep: string; const ARequestFilter: string): string;
begin
  if FAtualizaTerceirizadaCommand = nil then
  begin
    FAtualizaTerceirizadaCommand := FConnection.CreateCommand;
    FAtualizaTerceirizadaCommand.RequestType := 'GET';
    FAtualizaTerceirizadaCommand.Text := 'TModelMetodos.AtualizaTerceirizada';
    FAtualizaTerceirizadaCommand.Prepare(TModelMetodos_AtualizaTerceirizada);
  end;
  FAtualizaTerceirizadaCommand.Parameters[0].Value.SetInt32(AIdTerc);
  FAtualizaTerceirizadaCommand.Parameters[1].Value.SetInt32(ANrLog);
  FAtualizaTerceirizadaCommand.Parameters[2].Value.SetWideString(ACodigo);
  FAtualizaTerceirizadaCommand.Parameters[3].Value.SetWideString(ARazao);
  FAtualizaTerceirizadaCommand.Parameters[4].Value.SetWideString(AFantasia);
  FAtualizaTerceirizadaCommand.Parameters[5].Value.SetWideString(ACNPJ);
  FAtualizaTerceirizadaCommand.Parameters[6].Value.SetWideString(AIE);
  FAtualizaTerceirizadaCommand.Parameters[7].Value.SetWideString(ALogradouro);
  FAtualizaTerceirizadaCommand.Parameters[8].Value.SetWideString(AComplemento);
  FAtualizaTerceirizadaCommand.Parameters[9].Value.SetWideString(ABairro);
  FAtualizaTerceirizadaCommand.Parameters[10].Value.SetWideString(ACidade);
  FAtualizaTerceirizadaCommand.Parameters[11].Value.SetWideString(AUF);
  FAtualizaTerceirizadaCommand.Parameters[12].Value.SetWideString(ACep);
  FAtualizaTerceirizadaCommand.Execute(ARequestFilter);
  Result := FAtualizaTerceirizadaCommand.Parameters[13].Value.GetWideString;
end;

function TModelMetodosClient.CarregaCamposTerceirizada(ACampos: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FCarregaCamposTerceirizadaCommand = nil then
  begin
    FCarregaCamposTerceirizadaCommand := FConnection.CreateCommand;
    FCarregaCamposTerceirizadaCommand.RequestType := 'GET';
    FCarregaCamposTerceirizadaCommand.Text := 'TModelMetodos.CarregaCamposTerceirizada';
    FCarregaCamposTerceirizadaCommand.Prepare(TModelMetodos_CarregaCamposTerceirizada);
  end;
  FCarregaCamposTerceirizadaCommand.Parameters[0].Value.SetWideString(ACampos);
  FCarregaCamposTerceirizadaCommand.Execute(ARequestFilter);
  if not FCarregaCamposTerceirizadaCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FCarregaCamposTerceirizadaCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FCarregaCamposTerceirizadaCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FCarregaCamposTerceirizadaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.CarregaCamposTerceirizada_Cache(ACampos: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FCarregaCamposTerceirizadaCommand_Cache = nil then
  begin
    FCarregaCamposTerceirizadaCommand_Cache := FConnection.CreateCommand;
    FCarregaCamposTerceirizadaCommand_Cache.RequestType := 'GET';
    FCarregaCamposTerceirizadaCommand_Cache.Text := 'TModelMetodos.CarregaCamposTerceirizada';
    FCarregaCamposTerceirizadaCommand_Cache.Prepare(TModelMetodos_CarregaCamposTerceirizada_Cache);
  end;
  FCarregaCamposTerceirizadaCommand_Cache.Parameters[0].Value.SetWideString(ACampos);
  FCarregaCamposTerceirizadaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FCarregaCamposTerceirizadaCommand_Cache.Parameters[1].Value.GetString);
end;

function TModelMetodosClient.CarregaCamposProfissional(ACampos: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FCarregaCamposProfissionalCommand = nil then
  begin
    FCarregaCamposProfissionalCommand := FConnection.CreateCommand;
    FCarregaCamposProfissionalCommand.RequestType := 'GET';
    FCarregaCamposProfissionalCommand.Text := 'TModelMetodos.CarregaCamposProfissional';
    FCarregaCamposProfissionalCommand.Prepare(TModelMetodos_CarregaCamposProfissional);
  end;
  FCarregaCamposProfissionalCommand.Parameters[0].Value.SetWideString(ACampos);
  FCarregaCamposProfissionalCommand.Execute(ARequestFilter);
  if not FCarregaCamposProfissionalCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FCarregaCamposProfissionalCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FCarregaCamposProfissionalCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FCarregaCamposProfissionalCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.CarregaCamposProfissional_Cache(ACampos: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FCarregaCamposProfissionalCommand_Cache = nil then
  begin
    FCarregaCamposProfissionalCommand_Cache := FConnection.CreateCommand;
    FCarregaCamposProfissionalCommand_Cache.RequestType := 'GET';
    FCarregaCamposProfissionalCommand_Cache.Text := 'TModelMetodos.CarregaCamposProfissional';
    FCarregaCamposProfissionalCommand_Cache.Prepare(TModelMetodos_CarregaCamposProfissional_Cache);
  end;
  FCarregaCamposProfissionalCommand_Cache.Parameters[0].Value.SetWideString(ACampos);
  FCarregaCamposProfissionalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FCarregaCamposProfissionalCommand_Cache.Parameters[1].Value.GetString);
end;

function TModelMetodosClient.DocumentoRepetido(ADocumento: string; ACampoDocumento: string; ACampoNome: string; ATabela: string; const ARequestFilter: string): string;
begin
  if FDocumentoRepetidoCommand = nil then
  begin
    FDocumentoRepetidoCommand := FConnection.CreateCommand;
    FDocumentoRepetidoCommand.RequestType := 'GET';
    FDocumentoRepetidoCommand.Text := 'TModelMetodos.DocumentoRepetido';
    FDocumentoRepetidoCommand.Prepare(TModelMetodos_DocumentoRepetido);
  end;
  FDocumentoRepetidoCommand.Parameters[0].Value.SetWideString(ADocumento);
  FDocumentoRepetidoCommand.Parameters[1].Value.SetWideString(ACampoDocumento);
  FDocumentoRepetidoCommand.Parameters[2].Value.SetWideString(ACampoNome);
  FDocumentoRepetidoCommand.Parameters[3].Value.SetWideString(ATabela);
  FDocumentoRepetidoCommand.Execute(ARequestFilter);
  Result := FDocumentoRepetidoCommand.Parameters[4].Value.GetWideString;
end;

function TModelMetodosClient.ManipulaEstadoRegistro(ABloqueia: Boolean; AIdUsuario: Integer; AIdRegistro: Integer; ACampoID: string; ATabela: string; const ARequestFilter: string): Boolean;
begin
  if FManipulaEstadoRegistroCommand = nil then
  begin
    FManipulaEstadoRegistroCommand := FConnection.CreateCommand;
    FManipulaEstadoRegistroCommand.RequestType := 'GET';
    FManipulaEstadoRegistroCommand.Text := 'TModelMetodos.ManipulaEstadoRegistro';
    FManipulaEstadoRegistroCommand.Prepare(TModelMetodos_ManipulaEstadoRegistro);
  end;
  FManipulaEstadoRegistroCommand.Parameters[0].Value.SetBoolean(ABloqueia);
  FManipulaEstadoRegistroCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FManipulaEstadoRegistroCommand.Parameters[2].Value.SetInt32(AIdRegistro);
  FManipulaEstadoRegistroCommand.Parameters[3].Value.SetWideString(ACampoID);
  FManipulaEstadoRegistroCommand.Parameters[4].Value.SetWideString(ATabela);
  FManipulaEstadoRegistroCommand.Execute(ARequestFilter);
  Result := FManipulaEstadoRegistroCommand.Parameters[5].Value.GetBoolean;
end;

function TModelMetodosClient.GravaImagem(APrefixo: string; AExtensao: string; const ARequestFilter: string): Integer;
begin
  if FGravaImagemCommand = nil then
  begin
    FGravaImagemCommand := FConnection.CreateCommand;
    FGravaImagemCommand.RequestType := 'GET';
    FGravaImagemCommand.Text := 'TModelMetodos.GravaImagem';
    FGravaImagemCommand.Prepare(TModelMetodos_GravaImagem);
  end;
  FGravaImagemCommand.Parameters[0].Value.SetWideString(APrefixo);
  FGravaImagemCommand.Parameters[1].Value.SetWideString(AExtensao);
  FGravaImagemCommand.Execute(ARequestFilter);
  Result := FGravaImagemCommand.Parameters[2].Value.GetInt32;
end;

function TModelMetodosClient.AtualizaImagem(AIDImagem: Integer; const ARequestFilter: string): string;
begin
  if FAtualizaImagemCommand = nil then
  begin
    FAtualizaImagemCommand := FConnection.CreateCommand;
    FAtualizaImagemCommand.RequestType := 'GET';
    FAtualizaImagemCommand.Text := 'TModelMetodos.AtualizaImagem';
    FAtualizaImagemCommand.Prepare(TModelMetodos_AtualizaImagem);
  end;
  FAtualizaImagemCommand.Parameters[0].Value.SetInt32(AIDImagem);
  FAtualizaImagemCommand.Execute(ARequestFilter);
  Result := FAtualizaImagemCommand.Parameters[1].Value.GetWideString;
end;

function TModelMetodosClient.AtualizaFotoProfissional(AIDProfissional: Integer; AIdFoto: Integer; const ARequestFilter: string): string;
begin
  if FAtualizaFotoProfissionalCommand = nil then
  begin
    FAtualizaFotoProfissionalCommand := FConnection.CreateCommand;
    FAtualizaFotoProfissionalCommand.RequestType := 'GET';
    FAtualizaFotoProfissionalCommand.Text := 'TModelMetodos.AtualizaFotoProfissional';
    FAtualizaFotoProfissionalCommand.Prepare(TModelMetodos_AtualizaFotoProfissional);
  end;
  FAtualizaFotoProfissionalCommand.Parameters[0].Value.SetInt32(AIDProfissional);
  FAtualizaFotoProfissionalCommand.Parameters[1].Value.SetInt32(AIdFoto);
  FAtualizaFotoProfissionalCommand.Execute(ARequestFilter);
  Result := FAtualizaFotoProfissionalCommand.Parameters[2].Value.GetWideString;
end;

function TModelMetodosClient.pesquisaHabilidade(AIDHabilidade: Integer; AIDCargo: Integer; ANomeHabilidade: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FpesquisaHabilidadeCommand = nil then
  begin
    FpesquisaHabilidadeCommand := FConnection.CreateCommand;
    FpesquisaHabilidadeCommand.RequestType := 'GET';
    FpesquisaHabilidadeCommand.Text := 'TModelMetodos.pesquisaHabilidade';
    FpesquisaHabilidadeCommand.Prepare(TModelMetodos_pesquisaHabilidade);
  end;
  FpesquisaHabilidadeCommand.Parameters[0].Value.SetInt32(AIDHabilidade);
  FpesquisaHabilidadeCommand.Parameters[1].Value.SetInt32(AIDCargo);
  FpesquisaHabilidadeCommand.Parameters[2].Value.SetWideString(ANomeHabilidade);
  FpesquisaHabilidadeCommand.Execute(ARequestFilter);
  if not FpesquisaHabilidadeCommand.Parameters[3].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FpesquisaHabilidadeCommand.Parameters[3].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FpesquisaHabilidadeCommand.Parameters[3].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FpesquisaHabilidadeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.pesquisaHabilidade_Cache(AIDHabilidade: Integer; AIDCargo: Integer; ANomeHabilidade: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FpesquisaHabilidadeCommand_Cache = nil then
  begin
    FpesquisaHabilidadeCommand_Cache := FConnection.CreateCommand;
    FpesquisaHabilidadeCommand_Cache.RequestType := 'GET';
    FpesquisaHabilidadeCommand_Cache.Text := 'TModelMetodos.pesquisaHabilidade';
    FpesquisaHabilidadeCommand_Cache.Prepare(TModelMetodos_pesquisaHabilidade_Cache);
  end;
  FpesquisaHabilidadeCommand_Cache.Parameters[0].Value.SetInt32(AIDHabilidade);
  FpesquisaHabilidadeCommand_Cache.Parameters[1].Value.SetInt32(AIDCargo);
  FpesquisaHabilidadeCommand_Cache.Parameters[2].Value.SetWideString(ANomeHabilidade);
  FpesquisaHabilidadeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FpesquisaHabilidadeCommand_Cache.Parameters[3].Value.GetString);
end;

function TModelMetodosClient.carregaHabilidades(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FcarregaHabilidadesCommand = nil then
  begin
    FcarregaHabilidadesCommand := FConnection.CreateCommand;
    FcarregaHabilidadesCommand.RequestType := 'GET';
    FcarregaHabilidadesCommand.Text := 'TModelMetodos.carregaHabilidades';
    FcarregaHabilidadesCommand.Prepare(TModelMetodos_carregaHabilidades);
  end;
  FcarregaHabilidadesCommand.Execute(ARequestFilter);
  if not FcarregaHabilidadesCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FcarregaHabilidadesCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FcarregaHabilidadesCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FcarregaHabilidadesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.carregaHabilidades_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FcarregaHabilidadesCommand_Cache = nil then
  begin
    FcarregaHabilidadesCommand_Cache := FConnection.CreateCommand;
    FcarregaHabilidadesCommand_Cache.RequestType := 'GET';
    FcarregaHabilidadesCommand_Cache.Text := 'TModelMetodos.carregaHabilidades';
    FcarregaHabilidadesCommand_Cache.Prepare(TModelMetodos_carregaHabilidades_Cache);
  end;
  FcarregaHabilidadesCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FcarregaHabilidadesCommand_Cache.Parameters[0].Value.GetString);
end;

function TModelMetodosClient.atualizaHabilidades(AIdHabilidade: Integer; AIdCargoHabilidade: Integer; AHabilidade: string; ADescricao: string; const ARequestFilter: string): string;
begin
  if FatualizaHabilidadesCommand = nil then
  begin
    FatualizaHabilidadesCommand := FConnection.CreateCommand;
    FatualizaHabilidadesCommand.RequestType := 'GET';
    FatualizaHabilidadesCommand.Text := 'TModelMetodos.atualizaHabilidades';
    FatualizaHabilidadesCommand.Prepare(TModelMetodos_atualizaHabilidades);
  end;
  FatualizaHabilidadesCommand.Parameters[0].Value.SetInt32(AIdHabilidade);
  FatualizaHabilidadesCommand.Parameters[1].Value.SetInt32(AIdCargoHabilidade);
  FatualizaHabilidadesCommand.Parameters[2].Value.SetWideString(AHabilidade);
  FatualizaHabilidadesCommand.Parameters[3].Value.SetWideString(ADescricao);
  FatualizaHabilidadesCommand.Execute(ARequestFilter);
  Result := FatualizaHabilidadesCommand.Parameters[4].Value.GetWideString;
end;

function TModelMetodosClient.cadastraHabilidade(AIDCargoHabilidade: Integer; AHabilidade: string; ADescricao: string; const ARequestFilter: string): string;
begin
  if FcadastraHabilidadeCommand = nil then
  begin
    FcadastraHabilidadeCommand := FConnection.CreateCommand;
    FcadastraHabilidadeCommand.RequestType := 'GET';
    FcadastraHabilidadeCommand.Text := 'TModelMetodos.cadastraHabilidade';
    FcadastraHabilidadeCommand.Prepare(TModelMetodos_cadastraHabilidade);
  end;
  FcadastraHabilidadeCommand.Parameters[0].Value.SetInt32(AIDCargoHabilidade);
  FcadastraHabilidadeCommand.Parameters[1].Value.SetWideString(AHabilidade);
  FcadastraHabilidadeCommand.Parameters[2].Value.SetWideString(ADescricao);
  FcadastraHabilidadeCommand.Execute(ARequestFilter);
  Result := FcadastraHabilidadeCommand.Parameters[3].Value.GetWideString;
end;

function TModelMetodosClient.carregaHabilidadesProfissional(AAIdProfissional: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FcarregaHabilidadesProfissionalCommand = nil then
  begin
    FcarregaHabilidadesProfissionalCommand := FConnection.CreateCommand;
    FcarregaHabilidadesProfissionalCommand.RequestType := 'GET';
    FcarregaHabilidadesProfissionalCommand.Text := 'TModelMetodos.carregaHabilidadesProfissional';
    FcarregaHabilidadesProfissionalCommand.Prepare(TModelMetodos_carregaHabilidadesProfissional);
  end;
  FcarregaHabilidadesProfissionalCommand.Parameters[0].Value.SetInt32(AAIdProfissional);
  FcarregaHabilidadesProfissionalCommand.Execute(ARequestFilter);
  if not FcarregaHabilidadesProfissionalCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FcarregaHabilidadesProfissionalCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FcarregaHabilidadesProfissionalCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FcarregaHabilidadesProfissionalCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.carregaHabilidadesProfissional_Cache(AAIdProfissional: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FcarregaHabilidadesProfissionalCommand_Cache = nil then
  begin
    FcarregaHabilidadesProfissionalCommand_Cache := FConnection.CreateCommand;
    FcarregaHabilidadesProfissionalCommand_Cache.RequestType := 'GET';
    FcarregaHabilidadesProfissionalCommand_Cache.Text := 'TModelMetodos.carregaHabilidadesProfissional';
    FcarregaHabilidadesProfissionalCommand_Cache.Prepare(TModelMetodos_carregaHabilidadesProfissional_Cache);
  end;
  FcarregaHabilidadesProfissionalCommand_Cache.Parameters[0].Value.SetInt32(AAIdProfissional);
  FcarregaHabilidadesProfissionalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FcarregaHabilidadesProfissionalCommand_Cache.Parameters[1].Value.GetString);
end;

function TModelMetodosClient.cadastraHabilidadeProfissional(AIdHabilidade: Integer; AIdProfissional: Integer; const ARequestFilter: string): string;
begin
  if FcadastraHabilidadeProfissionalCommand = nil then
  begin
    FcadastraHabilidadeProfissionalCommand := FConnection.CreateCommand;
    FcadastraHabilidadeProfissionalCommand.RequestType := 'GET';
    FcadastraHabilidadeProfissionalCommand.Text := 'TModelMetodos.cadastraHabilidadeProfissional';
    FcadastraHabilidadeProfissionalCommand.Prepare(TModelMetodos_cadastraHabilidadeProfissional);
  end;
  FcadastraHabilidadeProfissionalCommand.Parameters[0].Value.SetInt32(AIdHabilidade);
  FcadastraHabilidadeProfissionalCommand.Parameters[1].Value.SetInt32(AIdProfissional);
  FcadastraHabilidadeProfissionalCommand.Execute(ARequestFilter);
  Result := FcadastraHabilidadeProfissionalCommand.Parameters[2].Value.GetWideString;
end;

function TModelMetodosClient.apagaHabilidadesProfissional(AIdProfissional: Integer; const ARequestFilter: string): string;
begin
  if FapagaHabilidadesProfissionalCommand = nil then
  begin
    FapagaHabilidadesProfissionalCommand := FConnection.CreateCommand;
    FapagaHabilidadesProfissionalCommand.RequestType := 'GET';
    FapagaHabilidadesProfissionalCommand.Text := 'TModelMetodos.apagaHabilidadesProfissional';
    FapagaHabilidadesProfissionalCommand.Prepare(TModelMetodos_apagaHabilidadesProfissional);
  end;
  FapagaHabilidadesProfissionalCommand.Parameters[0].Value.SetInt32(AIdProfissional);
  FapagaHabilidadesProfissionalCommand.Execute(ARequestFilter);
  Result := FapagaHabilidadesProfissionalCommand.Parameters[1].Value.GetWideString;
end;

function TModelMetodosClient.carregaCargos(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FcarregaCargosCommand = nil then
  begin
    FcarregaCargosCommand := FConnection.CreateCommand;
    FcarregaCargosCommand.RequestType := 'GET';
    FcarregaCargosCommand.Text := 'TModelMetodos.carregaCargos';
    FcarregaCargosCommand.Prepare(TModelMetodos_carregaCargos);
  end;
  FcarregaCargosCommand.Execute(ARequestFilter);
  if not FcarregaCargosCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FcarregaCargosCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FcarregaCargosCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FcarregaCargosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.carregaCargos_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FcarregaCargosCommand_Cache = nil then
  begin
    FcarregaCargosCommand_Cache := FConnection.CreateCommand;
    FcarregaCargosCommand_Cache.RequestType := 'GET';
    FcarregaCargosCommand_Cache.Text := 'TModelMetodos.carregaCargos';
    FcarregaCargosCommand_Cache.Prepare(TModelMetodos_carregaCargos_Cache);
  end;
  FcarregaCargosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FcarregaCargosCommand_Cache.Parameters[0].Value.GetString);
end;

function TModelMetodosClient.pesquisaCargos(AIdCargo: Integer; ANomeCargo: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FpesquisaCargosCommand = nil then
  begin
    FpesquisaCargosCommand := FConnection.CreateCommand;
    FpesquisaCargosCommand.RequestType := 'GET';
    FpesquisaCargosCommand.Text := 'TModelMetodos.pesquisaCargos';
    FpesquisaCargosCommand.Prepare(TModelMetodos_pesquisaCargos);
  end;
  FpesquisaCargosCommand.Parameters[0].Value.SetInt32(AIdCargo);
  FpesquisaCargosCommand.Parameters[1].Value.SetWideString(ANomeCargo);
  FpesquisaCargosCommand.Execute(ARequestFilter);
  if not FpesquisaCargosCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FpesquisaCargosCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FpesquisaCargosCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FpesquisaCargosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.pesquisaCargos_Cache(AIdCargo: Integer; ANomeCargo: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FpesquisaCargosCommand_Cache = nil then
  begin
    FpesquisaCargosCommand_Cache := FConnection.CreateCommand;
    FpesquisaCargosCommand_Cache.RequestType := 'GET';
    FpesquisaCargosCommand_Cache.Text := 'TModelMetodos.pesquisaCargos';
    FpesquisaCargosCommand_Cache.Prepare(TModelMetodos_pesquisaCargos_Cache);
  end;
  FpesquisaCargosCommand_Cache.Parameters[0].Value.SetInt32(AIdCargo);
  FpesquisaCargosCommand_Cache.Parameters[1].Value.SetWideString(ANomeCargo);
  FpesquisaCargosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FpesquisaCargosCommand_Cache.Parameters[2].Value.GetString);
end;

function TModelMetodosClient.cadastraCargo(ANomeCargo: string; ADescricaoCargo: string; const ARequestFilter: string): string;
begin
  if FcadastraCargoCommand = nil then
  begin
    FcadastraCargoCommand := FConnection.CreateCommand;
    FcadastraCargoCommand.RequestType := 'GET';
    FcadastraCargoCommand.Text := 'TModelMetodos.cadastraCargo';
    FcadastraCargoCommand.Prepare(TModelMetodos_cadastraCargo);
  end;
  FcadastraCargoCommand.Parameters[0].Value.SetWideString(ANomeCargo);
  FcadastraCargoCommand.Parameters[1].Value.SetWideString(ADescricaoCargo);
  FcadastraCargoCommand.Execute(ARequestFilter);
  Result := FcadastraCargoCommand.Parameters[2].Value.GetWideString;
end;

function TModelMetodosClient.atualizaCargo(AIDCargo: Integer; ANomeCargo: string; ADescricaoCargo: string; const ARequestFilter: string): string;
begin
  if FatualizaCargoCommand = nil then
  begin
    FatualizaCargoCommand := FConnection.CreateCommand;
    FatualizaCargoCommand.RequestType := 'GET';
    FatualizaCargoCommand.Text := 'TModelMetodos.atualizaCargo';
    FatualizaCargoCommand.Prepare(TModelMetodos_atualizaCargo);
  end;
  FatualizaCargoCommand.Parameters[0].Value.SetInt32(AIDCargo);
  FatualizaCargoCommand.Parameters[1].Value.SetWideString(ANomeCargo);
  FatualizaCargoCommand.Parameters[2].Value.SetWideString(ADescricaoCargo);
  FatualizaCargoCommand.Execute(ARequestFilter);
  Result := FatualizaCargoCommand.Parameters[3].Value.GetWideString;
end;

function TModelMetodosClient.carregaFornecedores(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FcarregaFornecedoresCommand = nil then
  begin
    FcarregaFornecedoresCommand := FConnection.CreateCommand;
    FcarregaFornecedoresCommand.RequestType := 'GET';
    FcarregaFornecedoresCommand.Text := 'TModelMetodos.carregaFornecedores';
    FcarregaFornecedoresCommand.Prepare(TModelMetodos_carregaFornecedores);
  end;
  FcarregaFornecedoresCommand.Execute(ARequestFilter);
  if not FcarregaFornecedoresCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FcarregaFornecedoresCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FcarregaFornecedoresCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FcarregaFornecedoresCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.carregaFornecedores_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FcarregaFornecedoresCommand_Cache = nil then
  begin
    FcarregaFornecedoresCommand_Cache := FConnection.CreateCommand;
    FcarregaFornecedoresCommand_Cache.RequestType := 'GET';
    FcarregaFornecedoresCommand_Cache.Text := 'TModelMetodos.carregaFornecedores';
    FcarregaFornecedoresCommand_Cache.Prepare(TModelMetodos_carregaFornecedores_Cache);
  end;
  FcarregaFornecedoresCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FcarregaFornecedoresCommand_Cache.Parameters[0].Value.GetString);
end;

function TModelMetodosClient.PesquisaFornecedores(ANome: string; APseudo: string; ACNPJ: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPesquisaFornecedoresCommand = nil then
  begin
    FPesquisaFornecedoresCommand := FConnection.CreateCommand;
    FPesquisaFornecedoresCommand.RequestType := 'GET';
    FPesquisaFornecedoresCommand.Text := 'TModelMetodos.PesquisaFornecedores';
    FPesquisaFornecedoresCommand.Prepare(TModelMetodos_PesquisaFornecedores);
  end;
  FPesquisaFornecedoresCommand.Parameters[0].Value.SetWideString(ANome);
  FPesquisaFornecedoresCommand.Parameters[1].Value.SetWideString(APseudo);
  FPesquisaFornecedoresCommand.Parameters[2].Value.SetWideString(ACNPJ);
  FPesquisaFornecedoresCommand.Parameters[3].Value.SetWideString(ATipoPesquisa);
  FPesquisaFornecedoresCommand.Parameters[4].Value.SetInt32(AId);
  FPesquisaFornecedoresCommand.Execute(ARequestFilter);
  if not FPesquisaFornecedoresCommand.Parameters[5].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPesquisaFornecedoresCommand.Parameters[5].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPesquisaFornecedoresCommand.Parameters[5].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPesquisaFornecedoresCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.PesquisaFornecedores_Cache(ANome: string; APseudo: string; ACNPJ: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPesquisaFornecedoresCommand_Cache = nil then
  begin
    FPesquisaFornecedoresCommand_Cache := FConnection.CreateCommand;
    FPesquisaFornecedoresCommand_Cache.RequestType := 'GET';
    FPesquisaFornecedoresCommand_Cache.Text := 'TModelMetodos.PesquisaFornecedores';
    FPesquisaFornecedoresCommand_Cache.Prepare(TModelMetodos_PesquisaFornecedores_Cache);
  end;
  FPesquisaFornecedoresCommand_Cache.Parameters[0].Value.SetWideString(ANome);
  FPesquisaFornecedoresCommand_Cache.Parameters[1].Value.SetWideString(APseudo);
  FPesquisaFornecedoresCommand_Cache.Parameters[2].Value.SetWideString(ACNPJ);
  FPesquisaFornecedoresCommand_Cache.Parameters[3].Value.SetWideString(ATipoPesquisa);
  FPesquisaFornecedoresCommand_Cache.Parameters[4].Value.SetInt32(AId);
  FPesquisaFornecedoresCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPesquisaFornecedoresCommand_Cache.Parameters[5].Value.GetString);
end;

function TModelMetodosClient.cadastraFornecedor(AIdVendFor: Integer; ANrLog: Integer; ACodigo: string; ACNPJCPF: string; AIERG: string; ANome: string; APseudo: string; ALog: string; ACompl: string; ABairro: string; ACep: string; ACidade: string; AUF: string; const ARequestFilter: string): string;
begin
  if FcadastraFornecedorCommand = nil then
  begin
    FcadastraFornecedorCommand := FConnection.CreateCommand;
    FcadastraFornecedorCommand.RequestType := 'GET';
    FcadastraFornecedorCommand.Text := 'TModelMetodos.cadastraFornecedor';
    FcadastraFornecedorCommand.Prepare(TModelMetodos_cadastraFornecedor);
  end;
  FcadastraFornecedorCommand.Parameters[0].Value.SetInt32(AIdVendFor);
  FcadastraFornecedorCommand.Parameters[1].Value.SetInt32(ANrLog);
  FcadastraFornecedorCommand.Parameters[2].Value.SetWideString(ACodigo);
  FcadastraFornecedorCommand.Parameters[3].Value.SetWideString(ACNPJCPF);
  FcadastraFornecedorCommand.Parameters[4].Value.SetWideString(AIERG);
  FcadastraFornecedorCommand.Parameters[5].Value.SetWideString(ANome);
  FcadastraFornecedorCommand.Parameters[6].Value.SetWideString(APseudo);
  FcadastraFornecedorCommand.Parameters[7].Value.SetWideString(ALog);
  FcadastraFornecedorCommand.Parameters[8].Value.SetWideString(ACompl);
  FcadastraFornecedorCommand.Parameters[9].Value.SetWideString(ABairro);
  FcadastraFornecedorCommand.Parameters[10].Value.SetWideString(ACep);
  FcadastraFornecedorCommand.Parameters[11].Value.SetWideString(ACidade);
  FcadastraFornecedorCommand.Parameters[12].Value.SetWideString(AUF);
  FcadastraFornecedorCommand.Execute(ARequestFilter);
  Result := FcadastraFornecedorCommand.Parameters[13].Value.GetWideString;
end;

function TModelMetodosClient.atualizaFornecedores(AIdForn: Integer; AIdVendFor: Integer; ANrLog: Integer; ACodigo: string; ACNPJCPF: string; AIERG: string; ANome: string; APseudo: string; ALog: string; ACompl: string; ABairro: string; ACep: string; ACidade: string; AUF: string; const ARequestFilter: string): string;
begin
  if FatualizaFornecedoresCommand = nil then
  begin
    FatualizaFornecedoresCommand := FConnection.CreateCommand;
    FatualizaFornecedoresCommand.RequestType := 'GET';
    FatualizaFornecedoresCommand.Text := 'TModelMetodos.atualizaFornecedores';
    FatualizaFornecedoresCommand.Prepare(TModelMetodos_atualizaFornecedores);
  end;
  FatualizaFornecedoresCommand.Parameters[0].Value.SetInt32(AIdForn);
  FatualizaFornecedoresCommand.Parameters[1].Value.SetInt32(AIdVendFor);
  FatualizaFornecedoresCommand.Parameters[2].Value.SetInt32(ANrLog);
  FatualizaFornecedoresCommand.Parameters[3].Value.SetWideString(ACodigo);
  FatualizaFornecedoresCommand.Parameters[4].Value.SetWideString(ACNPJCPF);
  FatualizaFornecedoresCommand.Parameters[5].Value.SetWideString(AIERG);
  FatualizaFornecedoresCommand.Parameters[6].Value.SetWideString(ANome);
  FatualizaFornecedoresCommand.Parameters[7].Value.SetWideString(APseudo);
  FatualizaFornecedoresCommand.Parameters[8].Value.SetWideString(ALog);
  FatualizaFornecedoresCommand.Parameters[9].Value.SetWideString(ACompl);
  FatualizaFornecedoresCommand.Parameters[10].Value.SetWideString(ABairro);
  FatualizaFornecedoresCommand.Parameters[11].Value.SetWideString(ACep);
  FatualizaFornecedoresCommand.Parameters[12].Value.SetWideString(ACidade);
  FatualizaFornecedoresCommand.Parameters[13].Value.SetWideString(AUF);
  FatualizaFornecedoresCommand.Execute(ARequestFilter);
  Result := FatualizaFornecedoresCommand.Parameters[14].Value.GetWideString;
end;

function TModelMetodosClient.carregaVendedores(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FcarregaVendedoresCommand = nil then
  begin
    FcarregaVendedoresCommand := FConnection.CreateCommand;
    FcarregaVendedoresCommand.RequestType := 'GET';
    FcarregaVendedoresCommand.Text := 'TModelMetodos.carregaVendedores';
    FcarregaVendedoresCommand.Prepare(TModelMetodos_carregaVendedores);
  end;
  FcarregaVendedoresCommand.Execute(ARequestFilter);
  if not FcarregaVendedoresCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FcarregaVendedoresCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FcarregaVendedoresCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FcarregaVendedoresCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.carregaVendedores_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FcarregaVendedoresCommand_Cache = nil then
  begin
    FcarregaVendedoresCommand_Cache := FConnection.CreateCommand;
    FcarregaVendedoresCommand_Cache.RequestType := 'GET';
    FcarregaVendedoresCommand_Cache.Text := 'TModelMetodos.carregaVendedores';
    FcarregaVendedoresCommand_Cache.Prepare(TModelMetodos_carregaVendedores_Cache);
  end;
  FcarregaVendedoresCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FcarregaVendedoresCommand_Cache.Parameters[0].Value.GetString);
end;

function TModelMetodosClient.PesquisaVendedor(ANome: string; ACPF: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPesquisaVendedorCommand = nil then
  begin
    FPesquisaVendedorCommand := FConnection.CreateCommand;
    FPesquisaVendedorCommand.RequestType := 'GET';
    FPesquisaVendedorCommand.Text := 'TModelMetodos.PesquisaVendedor';
    FPesquisaVendedorCommand.Prepare(TModelMetodos_PesquisaVendedor);
  end;
  FPesquisaVendedorCommand.Parameters[0].Value.SetWideString(ANome);
  FPesquisaVendedorCommand.Parameters[1].Value.SetWideString(ACPF);
  FPesquisaVendedorCommand.Parameters[2].Value.SetWideString(ATipoPesquisa);
  FPesquisaVendedorCommand.Parameters[3].Value.SetInt32(AId);
  FPesquisaVendedorCommand.Execute(ARequestFilter);
  if not FPesquisaVendedorCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPesquisaVendedorCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPesquisaVendedorCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPesquisaVendedorCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.PesquisaVendedor_Cache(ANome: string; ACPF: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPesquisaVendedorCommand_Cache = nil then
  begin
    FPesquisaVendedorCommand_Cache := FConnection.CreateCommand;
    FPesquisaVendedorCommand_Cache.RequestType := 'GET';
    FPesquisaVendedorCommand_Cache.Text := 'TModelMetodos.PesquisaVendedor';
    FPesquisaVendedorCommand_Cache.Prepare(TModelMetodos_PesquisaVendedor_Cache);
  end;
  FPesquisaVendedorCommand_Cache.Parameters[0].Value.SetWideString(ANome);
  FPesquisaVendedorCommand_Cache.Parameters[1].Value.SetWideString(ACPF);
  FPesquisaVendedorCommand_Cache.Parameters[2].Value.SetWideString(ATipoPesquisa);
  FPesquisaVendedorCommand_Cache.Parameters[3].Value.SetInt32(AId);
  FPesquisaVendedorCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPesquisaVendedorCommand_Cache.Parameters[4].Value.GetString);
end;

function TModelMetodosClient.cadastraVendedor(ANrLog: Integer; ACPF: string; ARG: string; ANome: string; ALog: string; ACompl: string; ABairro: string; ACep: string; ACidade: string; AUF: string; const ARequestFilter: string): string;
begin
  if FcadastraVendedorCommand = nil then
  begin
    FcadastraVendedorCommand := FConnection.CreateCommand;
    FcadastraVendedorCommand.RequestType := 'GET';
    FcadastraVendedorCommand.Text := 'TModelMetodos.cadastraVendedor';
    FcadastraVendedorCommand.Prepare(TModelMetodos_cadastraVendedor);
  end;
  FcadastraVendedorCommand.Parameters[0].Value.SetInt32(ANrLog);
  FcadastraVendedorCommand.Parameters[1].Value.SetWideString(ACPF);
  FcadastraVendedorCommand.Parameters[2].Value.SetWideString(ARG);
  FcadastraVendedorCommand.Parameters[3].Value.SetWideString(ANome);
  FcadastraVendedorCommand.Parameters[4].Value.SetWideString(ALog);
  FcadastraVendedorCommand.Parameters[5].Value.SetWideString(ACompl);
  FcadastraVendedorCommand.Parameters[6].Value.SetWideString(ABairro);
  FcadastraVendedorCommand.Parameters[7].Value.SetWideString(ACep);
  FcadastraVendedorCommand.Parameters[8].Value.SetWideString(ACidade);
  FcadastraVendedorCommand.Parameters[9].Value.SetWideString(AUF);
  FcadastraVendedorCommand.Execute(ARequestFilter);
  Result := FcadastraVendedorCommand.Parameters[10].Value.GetWideString;
end;

function TModelMetodosClient.atualizaVendedor(AIdVend: Integer; ANrLog: Integer; ACPF: string; ARG: string; ANome: string; ALog: string; ACompl: string; ABairro: string; ACep: string; ACidade: string; AUF: string; const ARequestFilter: string): string;
begin
  if FatualizaVendedorCommand = nil then
  begin
    FatualizaVendedorCommand := FConnection.CreateCommand;
    FatualizaVendedorCommand.RequestType := 'GET';
    FatualizaVendedorCommand.Text := 'TModelMetodos.atualizaVendedor';
    FatualizaVendedorCommand.Prepare(TModelMetodos_atualizaVendedor);
  end;
  FatualizaVendedorCommand.Parameters[0].Value.SetInt32(AIdVend);
  FatualizaVendedorCommand.Parameters[1].Value.SetInt32(ANrLog);
  FatualizaVendedorCommand.Parameters[2].Value.SetWideString(ACPF);
  FatualizaVendedorCommand.Parameters[3].Value.SetWideString(ARG);
  FatualizaVendedorCommand.Parameters[4].Value.SetWideString(ANome);
  FatualizaVendedorCommand.Parameters[5].Value.SetWideString(ALog);
  FatualizaVendedorCommand.Parameters[6].Value.SetWideString(ACompl);
  FatualizaVendedorCommand.Parameters[7].Value.SetWideString(ABairro);
  FatualizaVendedorCommand.Parameters[8].Value.SetWideString(ACep);
  FatualizaVendedorCommand.Parameters[9].Value.SetWideString(ACidade);
  FatualizaVendedorCommand.Parameters[10].Value.SetWideString(AUF);
  FatualizaVendedorCommand.Execute(ARequestFilter);
  Result := FatualizaVendedorCommand.Parameters[11].Value.GetWideString;
end;

function TModelMetodosClient.carregaMarcas(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FcarregaMarcasCommand = nil then
  begin
    FcarregaMarcasCommand := FConnection.CreateCommand;
    FcarregaMarcasCommand.RequestType := 'GET';
    FcarregaMarcasCommand.Text := 'TModelMetodos.carregaMarcas';
    FcarregaMarcasCommand.Prepare(TModelMetodos_carregaMarcas);
  end;
  FcarregaMarcasCommand.Execute(ARequestFilter);
  if not FcarregaMarcasCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FcarregaMarcasCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FcarregaMarcasCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FcarregaMarcasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.carregaMarcas_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FcarregaMarcasCommand_Cache = nil then
  begin
    FcarregaMarcasCommand_Cache := FConnection.CreateCommand;
    FcarregaMarcasCommand_Cache.RequestType := 'GET';
    FcarregaMarcasCommand_Cache.Text := 'TModelMetodos.carregaMarcas';
    FcarregaMarcasCommand_Cache.Prepare(TModelMetodos_carregaMarcas_Cache);
  end;
  FcarregaMarcasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FcarregaMarcasCommand_Cache.Parameters[0].Value.GetString);
end;

function TModelMetodosClient.pesquisaMarcas(AIdMarca: Integer; AMarca: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FpesquisaMarcasCommand = nil then
  begin
    FpesquisaMarcasCommand := FConnection.CreateCommand;
    FpesquisaMarcasCommand.RequestType := 'GET';
    FpesquisaMarcasCommand.Text := 'TModelMetodos.pesquisaMarcas';
    FpesquisaMarcasCommand.Prepare(TModelMetodos_pesquisaMarcas);
  end;
  FpesquisaMarcasCommand.Parameters[0].Value.SetInt32(AIdMarca);
  FpesquisaMarcasCommand.Parameters[1].Value.SetWideString(AMarca);
  FpesquisaMarcasCommand.Execute(ARequestFilter);
  if not FpesquisaMarcasCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FpesquisaMarcasCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FpesquisaMarcasCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FpesquisaMarcasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.pesquisaMarcas_Cache(AIdMarca: Integer; AMarca: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FpesquisaMarcasCommand_Cache = nil then
  begin
    FpesquisaMarcasCommand_Cache := FConnection.CreateCommand;
    FpesquisaMarcasCommand_Cache.RequestType := 'GET';
    FpesquisaMarcasCommand_Cache.Text := 'TModelMetodos.pesquisaMarcas';
    FpesquisaMarcasCommand_Cache.Prepare(TModelMetodos_pesquisaMarcas_Cache);
  end;
  FpesquisaMarcasCommand_Cache.Parameters[0].Value.SetInt32(AIdMarca);
  FpesquisaMarcasCommand_Cache.Parameters[1].Value.SetWideString(AMarca);
  FpesquisaMarcasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FpesquisaMarcasCommand_Cache.Parameters[2].Value.GetString);
end;

function TModelMetodosClient.cadastraMarca(AMarca: string; const ARequestFilter: string): string;
begin
  if FcadastraMarcaCommand = nil then
  begin
    FcadastraMarcaCommand := FConnection.CreateCommand;
    FcadastraMarcaCommand.RequestType := 'GET';
    FcadastraMarcaCommand.Text := 'TModelMetodos.cadastraMarca';
    FcadastraMarcaCommand.Prepare(TModelMetodos_cadastraMarca);
  end;
  FcadastraMarcaCommand.Parameters[0].Value.SetWideString(AMarca);
  FcadastraMarcaCommand.Execute(ARequestFilter);
  Result := FcadastraMarcaCommand.Parameters[1].Value.GetWideString;
end;

function TModelMetodosClient.atualizaMarca(AIDMarca: Integer; AMarca: string; const ARequestFilter: string): string;
begin
  if FatualizaMarcaCommand = nil then
  begin
    FatualizaMarcaCommand := FConnection.CreateCommand;
    FatualizaMarcaCommand.RequestType := 'GET';
    FatualizaMarcaCommand.Text := 'TModelMetodos.atualizaMarca';
    FatualizaMarcaCommand.Prepare(TModelMetodos_atualizaMarca);
  end;
  FatualizaMarcaCommand.Parameters[0].Value.SetInt32(AIDMarca);
  FatualizaMarcaCommand.Parameters[1].Value.SetWideString(AMarca);
  FatualizaMarcaCommand.Execute(ARequestFilter);
  Result := FatualizaMarcaCommand.Parameters[2].Value.GetWideString;
end;

constructor TModelMetodosClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TModelMetodosClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TModelMetodosClient.Destroy;
begin
  FCarregaProfissionalTerceirizadoCommand.DisposeOf;
  FCarregaProfissionalTerceirizadoCommand_Cache.DisposeOf;
  FAtualizaEmailCommand.DisposeOf;
  FAtualizaTelefoneCommand.DisposeOf;
  FCadastraTelefoneCommand.DisposeOf;
  FCadastraEmailCommand.DisposeOf;
  FCarregaEmailsCommand.DisposeOf;
  FCarregaEmailsCommand_Cache.DisposeOf;
  FCarregaTelefonesCommand.DisposeOf;
  FCarregaTelefonesCommand_Cache.DisposeOf;
  FListaProfissionaisCommand.DisposeOf;
  FListaProfissionaisCommand_Cache.DisposeOf;
  FCarregaControleCommand.DisposeOf;
  FCarregaControleCommand_Cache.DisposeOf;
  FValidaLoginCommand.DisposeOf;
  FValidaLoginCommand_Cache.DisposeOf;
  FCadastraProfissionalCommand.DisposeOf;
  FAtualizaProfissionalCommand.DisposeOf;
  FListaTerceirizadasCommand.DisposeOf;
  FListaTerceirizadasCommand_Cache.DisposeOf;
  FCadastraTerceirizadaCommand.DisposeOf;
  FAtualizaTerceirizadaCommand.DisposeOf;
  FCarregaCamposTerceirizadaCommand.DisposeOf;
  FCarregaCamposTerceirizadaCommand_Cache.DisposeOf;
  FCarregaCamposProfissionalCommand.DisposeOf;
  FCarregaCamposProfissionalCommand_Cache.DisposeOf;
  FDocumentoRepetidoCommand.DisposeOf;
  FManipulaEstadoRegistroCommand.DisposeOf;
  FGravaImagemCommand.DisposeOf;
  FAtualizaImagemCommand.DisposeOf;
  FAtualizaFotoProfissionalCommand.DisposeOf;
  FpesquisaHabilidadeCommand.DisposeOf;
  FpesquisaHabilidadeCommand_Cache.DisposeOf;
  FcarregaHabilidadesCommand.DisposeOf;
  FcarregaHabilidadesCommand_Cache.DisposeOf;
  FatualizaHabilidadesCommand.DisposeOf;
  FcadastraHabilidadeCommand.DisposeOf;
  FcarregaHabilidadesProfissionalCommand.DisposeOf;
  FcarregaHabilidadesProfissionalCommand_Cache.DisposeOf;
  FcadastraHabilidadeProfissionalCommand.DisposeOf;
  FapagaHabilidadesProfissionalCommand.DisposeOf;
  FcarregaCargosCommand.DisposeOf;
  FcarregaCargosCommand_Cache.DisposeOf;
  FpesquisaCargosCommand.DisposeOf;
  FpesquisaCargosCommand_Cache.DisposeOf;
  FcadastraCargoCommand.DisposeOf;
  FatualizaCargoCommand.DisposeOf;
  FcarregaFornecedoresCommand.DisposeOf;
  FcarregaFornecedoresCommand_Cache.DisposeOf;
  FPesquisaFornecedoresCommand.DisposeOf;
  FPesquisaFornecedoresCommand_Cache.DisposeOf;
  FcadastraFornecedorCommand.DisposeOf;
  FatualizaFornecedoresCommand.DisposeOf;
  FcarregaVendedoresCommand.DisposeOf;
  FcarregaVendedoresCommand_Cache.DisposeOf;
  FPesquisaVendedorCommand.DisposeOf;
  FPesquisaVendedorCommand_Cache.DisposeOf;
  FcadastraVendedorCommand.DisposeOf;
  FatualizaVendedorCommand.DisposeOf;
  FcarregaMarcasCommand.DisposeOf;
  FcarregaMarcasCommand_Cache.DisposeOf;
  FpesquisaMarcasCommand.DisposeOf;
  FpesquisaMarcasCommand_Cache.DisposeOf;
  FcadastraMarcaCommand.DisposeOf;
  FatualizaMarcaCommand.DisposeOf;
  inherited;
end;

end.

