//
// Created by the DataSnap proxy generator.
// 09/10/2020 21:10:01
//

unit Controller.Conexao.Proxy.HBeauty;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TModelMetodosClient = class(TDSAdminRestClient)
  private
    FCarregaControleCommand: TDSRestCommand;
    FCarregaControleCommand_Cache: TDSRestCommand;
    FValidaLoginCommand: TDSRestCommand;
    FValidaLoginCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function CarregaControle(const ARequestFilter: string = ''): TFDJSONDataSets;
    function CarregaControle_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function ValidaLogin(Usuario: string; Senha: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function ValidaLogin_Cache(Usuario: string; Senha: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
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

implementation

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
  FCarregaControleCommand.DisposeOf;
  FCarregaControleCommand_Cache.DisposeOf;
  FValidaLoginCommand.DisposeOf;
  FValidaLoginCommand_Cache.DisposeOf;
  inherited;
end;

end.

