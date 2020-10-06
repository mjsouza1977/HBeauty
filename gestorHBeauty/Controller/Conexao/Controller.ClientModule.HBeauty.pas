unit Controller.ClientModule.HBeauty;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSClientRest, Controller.Conexao.Proxy.HBeauty;

type
  TControllerClientModule = class(TDataModule)
    DSRestConnection: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FModelMetodosClient: TModelMetodosClient;

    function GetModelMetodosClient: TModelMetodosClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ModelMetodosClient: TModelMetodosClient read GetModelMetodosClient write FModelMetodosClient;

end;

var
  ControllerClientModule: TControllerClientModule;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

constructor TControllerClientModule.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TControllerClientModule.Destroy;
begin
  FModelMetodosClient.Free;
  inherited;
end;

function TControllerClientModule.GetModelMetodosClient: TModelMetodosClient;
begin
  if FModelMetodosClient = nil then
    FModelMetodosClient:= TModelMetodosClient.Create(DSRestConnection, FInstanceOwner);
  Result := FModelMetodosClient;
end;

end.
