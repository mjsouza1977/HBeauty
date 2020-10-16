//
// Created by the DataSnap proxy generator.
// 13/10/2020 21:20:40
//

unit Controller.Conexao.Proxy.HBeauty;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TModelMetodosClient = class(TDSAdminRestClient)
  private
    FListaProfissionaisCommand: TDSRestCommand;
    FListaProfissionaisCommand_Cache: TDSRestCommand;
    FCarregaControleCommand: TDSRestCommand;
    FCarregaControleCommand_Cache: TDSRestCommand;
    FValidaLoginCommand: TDSRestCommand;
    FValidaLoginCommand_Cache: TDSRestCommand;
    FCadastraProfissionalCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function ListaProfissionais(ANome: string; ACPF: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function ListaProfissionais_Cache(ANome: string; ACPF: string; ATipoPesquisa: string; AId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function CarregaControle(const ARequestFilter: string = ''): TFDJSONDataSets;
    function CarregaControle_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function ValidaLogin(Usuario: string; Senha: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function ValidaLogin_Cache(Usuario: string; Senha: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function CadastraProfissional(ATerceirizado: Boolean; AIdCargo: Integer; AIdEmpTer: Integer; ANrLog: Integer; ACodigo: string; ANome: string; ASobreNome: string; ACPF: string; ARG: string; ALogradouro: string; AComplemento: string; ABairro: string; ACidade: string; AUF: string; ACep: string; ASalario: Currency; AComissao: Currency; const ARequestFilter: string = ''): Integer;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
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

implementation

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
  FListaProfissionaisCommand.DisposeOf;
  FListaProfissionaisCommand_Cache.DisposeOf;
  FCarregaControleCommand.DisposeOf;
  FCarregaControleCommand_Cache.DisposeOf;
  FValidaLoginCommand.DisposeOf;
  FValidaLoginCommand_Cache.DisposeOf;
  FCadastraProfissionalCommand.DisposeOf;
  inherited;
end;

end.

