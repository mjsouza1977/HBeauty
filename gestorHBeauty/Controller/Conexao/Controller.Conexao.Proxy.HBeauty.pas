//
// Created by the DataSnap proxy generator.
// 01/11/2020 12:34:48
//

unit Controller.Conexao.Proxy.HBeauty;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TModelMetodosClient = class(TDSAdminRestClient)
  private
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
    FcarregaHabilidadesCommand: TDSRestCommand;
    FcarregaHabilidadesCommand_Cache: TDSRestCommand;
    FcarregaHabilidadesProfissionalCommand: TDSRestCommand;
    FcarregaHabilidadesProfissionalCommand_Cache: TDSRestCommand;
    FcadastraHabilidadeCommand: TDSRestCommand;
    FapagaHabilidadesProfissionalCommand: TDSRestCommand;
    FatualizaHabilidadeCommand: TDSRestCommand;
    FcadastraHabilidadeProfissionalCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function AtualizaEmail(AEmail: string; AIdEmail: Integer; ARestrito: Boolean; const ARequestFilter: string = ''): Boolean;
    function AtualizaTelefone(AFone: string; AContato: string; AIdTelefone: Integer; AWhatsFone: Boolean; ARestrito: Boolean; const ARequestFilter: string = ''): Boolean;
    function CadastraTelefone(AFone: string; AContato: string; APrefixoTabela: string; AIdRegTab: Integer; AWhatsFone: Boolean; ARestrito: Boolean; const ARequestFilter: string = ''): Integer;
    function CadastraEmail(AEmail: string; APrefixoTabela: string; AIdRegTab: Integer; ARestrito: Boolean; const ARequestFilter: string = ''): Integer;
    function CarregaEmails(ATipoEmail: string; AIdTabEmail: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function CarregaEmails_Cache(ATipoEmail: string; AIdTabEmail: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function CarregaTelefones(ATipoFone: string; AIdTabFone: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function CarregaTelefones_Cache(ATipoFone: string; AIdTabFone: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function ListaProfissionais(ANome: string; ACPF: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function ListaProfissionais_Cache(ANome: string; ACPF: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function CarregaControle(const ARequestFilter: string = ''): TFDJSONDataSets;
    function CarregaControle_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function ValidaLogin(Usuario: string; Senha: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function ValidaLogin_Cache(Usuario: string; Senha: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function CadastraProfissional(ATerceirizado: Boolean; AIdCargo: Integer; AIdEmpTer: Integer; ANrLog: Integer; ACodigo: string; ANome: string; ASobreNome: string; ACPF: string; ARG: string; ALogradouro: string; AComplemento: string; ABairro: string; ACidade: string; AUF: string; ACep: string; ASalario: Currency; AComissao: Currency; const ARequestFilter: string = ''): Integer;
    function AtualizaProfissional(ATerceirizado: Boolean; AIdProfiss: Integer; AIdCargo: Integer; AIdEmpTer: Integer; ANrLog: Integer; ACodigo: string; ANome: string; ASobreNome: string; ACPF: string; ARG: string; ALogradouro: string; AComplemento: string; ABairro: string; ACidade: string; AUF: string; ACep: string; ASalario: Currency; AComissao: Currency; const ARequestFilter: string = ''): Boolean;
    function carregaHabilidades(const ARequestFilter: string = ''): TFDJSONDataSets;
    function carregaHabilidades_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function carregaHabilidadesProfissional(AAIdProfissional: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function carregaHabilidadesProfissional_Cache(AAIdProfissional: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function cadastraHabilidade(ANomeHabilidade: string; ADescricaoHabilidade: string; const ARequestFilter: string = ''): Integer;
    function apagaHabilidadesProfissional(AIdProfissional: Integer; const ARequestFilter: string = ''): Boolean;
    function atualizaHabilidade(AIdHabilidade: Integer; ANomeHabilidade: string; ADescricaoHabilidade: string; const ARequestFilter: string = ''): Boolean;
    function cadastraHabilidadeProfissional(AIdHabilidade: Integer; AIdProfissional: Integer; const ARequestFilter: string = ''): Boolean;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TModelMetodos_AtualizaEmail: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'AEmail'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdEmail'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ARestrito'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TModelMetodos_AtualizaTelefone: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'AFone'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AContato'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdTelefone'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AWhatsFone'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'ARestrito'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
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

  TModelMetodos_ListaProfissionais: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATipoPesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_ListaProfissionais_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ANome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATipoPesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
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
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TModelMetodos_carregaHabilidades: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TModelMetodos_carregaHabilidades_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
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

  TModelMetodos_cadastraHabilidade: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ANomeHabilidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ADescricaoHabilidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TModelMetodos_apagaHabilidadesProfissional: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdProfissional'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TModelMetodos_atualizaHabilidade: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'AIdHabilidade'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANomeHabilidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ADescricaoHabilidade'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TModelMetodos_cadastraHabilidadeProfissional: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdHabilidade'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdProfissional'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

implementation

function TModelMetodosClient.AtualizaEmail(AEmail: string; AIdEmail: Integer; ARestrito: Boolean; const ARequestFilter: string): Boolean;
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
  Result := FAtualizaEmailCommand.Parameters[3].Value.GetBoolean;
end;

function TModelMetodosClient.AtualizaTelefone(AFone: string; AContato: string; AIdTelefone: Integer; AWhatsFone: Boolean; ARestrito: Boolean; const ARequestFilter: string): Boolean;
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
  Result := FAtualizaTelefoneCommand.Parameters[5].Value.GetBoolean;
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

function TModelMetodosClient.ListaProfissionais(ANome: string; ACPF: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string): TFDJSONDataSets;
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
  FListaProfissionaisCommand.Parameters[3].Value.SetInt32(AId);
  FListaProfissionaisCommand.Execute(ARequestFilter);
  if not FListaProfissionaisCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FListaProfissionaisCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FListaProfissionaisCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FListaProfissionaisCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TModelMetodosClient.ListaProfissionais_Cache(ANome: string; ACPF: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
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
  FListaProfissionaisCommand_Cache.Parameters[3].Value.SetInt32(AId);
  FListaProfissionaisCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FListaProfissionaisCommand_Cache.Parameters[4].Value.GetString);
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

function TModelMetodosClient.AtualizaProfissional(ATerceirizado: Boolean; AIdProfiss: Integer; AIdCargo: Integer; AIdEmpTer: Integer; ANrLog: Integer; ACodigo: string; ANome: string; ASobreNome: string; ACPF: string; ARG: string; ALogradouro: string; AComplemento: string; ABairro: string; ACidade: string; AUF: string; ACep: string; ASalario: Currency; AComissao: Currency; const ARequestFilter: string): Boolean;
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
  Result := FAtualizaProfissionalCommand.Parameters[18].Value.GetBoolean;
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

function TModelMetodosClient.cadastraHabilidade(ANomeHabilidade: string; ADescricaoHabilidade: string; const ARequestFilter: string): Integer;
begin
  if FcadastraHabilidadeCommand = nil then
  begin
    FcadastraHabilidadeCommand := FConnection.CreateCommand;
    FcadastraHabilidadeCommand.RequestType := 'GET';
    FcadastraHabilidadeCommand.Text := 'TModelMetodos.cadastraHabilidade';
    FcadastraHabilidadeCommand.Prepare(TModelMetodos_cadastraHabilidade);
  end;
  FcadastraHabilidadeCommand.Parameters[0].Value.SetWideString(ANomeHabilidade);
  FcadastraHabilidadeCommand.Parameters[1].Value.SetWideString(ADescricaoHabilidade);
  FcadastraHabilidadeCommand.Execute(ARequestFilter);
  Result := FcadastraHabilidadeCommand.Parameters[2].Value.GetInt32;
end;

function TModelMetodosClient.apagaHabilidadesProfissional(AIdProfissional: Integer; const ARequestFilter: string): Boolean;
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
  Result := FapagaHabilidadesProfissionalCommand.Parameters[1].Value.GetBoolean;
end;

function TModelMetodosClient.atualizaHabilidade(AIdHabilidade: Integer; ANomeHabilidade: string; ADescricaoHabilidade: string; const ARequestFilter: string): Boolean;
begin
  if FatualizaHabilidadeCommand = nil then
  begin
    FatualizaHabilidadeCommand := FConnection.CreateCommand;
    FatualizaHabilidadeCommand.RequestType := 'GET';
    FatualizaHabilidadeCommand.Text := 'TModelMetodos.atualizaHabilidade';
    FatualizaHabilidadeCommand.Prepare(TModelMetodos_atualizaHabilidade);
  end;
  FatualizaHabilidadeCommand.Parameters[0].Value.SetInt32(AIdHabilidade);
  FatualizaHabilidadeCommand.Parameters[1].Value.SetWideString(ANomeHabilidade);
  FatualizaHabilidadeCommand.Parameters[2].Value.SetWideString(ADescricaoHabilidade);
  FatualizaHabilidadeCommand.Execute(ARequestFilter);
  Result := FatualizaHabilidadeCommand.Parameters[3].Value.GetBoolean;
end;

function TModelMetodosClient.cadastraHabilidadeProfissional(AIdHabilidade: Integer; AIdProfissional: Integer; const ARequestFilter: string): Boolean;
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
  Result := FcadastraHabilidadeProfissionalCommand.Parameters[2].Value.GetBoolean;
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
  FcarregaHabilidadesCommand.DisposeOf;
  FcarregaHabilidadesCommand_Cache.DisposeOf;
  FcarregaHabilidadesProfissionalCommand.DisposeOf;
  FcarregaHabilidadesProfissionalCommand_Cache.DisposeOf;
  FcadastraHabilidadeCommand.DisposeOf;
  FapagaHabilidadesProfissionalCommand.DisposeOf;
  FatualizaHabilidadeCommand.DisposeOf;
  FcadastraHabilidadeProfissionalCommand.DisposeOf;
  inherited;
end;

end.

