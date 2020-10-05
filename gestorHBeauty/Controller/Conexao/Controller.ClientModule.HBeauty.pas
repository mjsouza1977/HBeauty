unit Controller.ClientModule.HBeauty;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSClientRest, Controller.Conexao.Proxy.HBeauty;

type
  TControllerClientModule = class(TDataModule)
    DSRestConnection: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FModelMetodosUsuariosClient: TModelMetodosUsuariosClient;

    function GetModelMetodosUsuariosClient: TModelMetodosUsuariosClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ModelMetodosUsuariosClient: TModelMetodosUsuariosClient read GetModelMetodosUsuariosClient write FModelMetodosUsuariosClient;

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
  FModelMetodosUsuariosClient.Free;
  inherited;
end;

function TControllerClientModule.GetModelMetodosUsuariosClient: TModelMetodosUsuariosClient;
begin
  if FModelMetodosUsuariosClient = nil then
    FModelMetodosUsuariosClient:= TModelMetodosUsuariosClient.Create(DSRestConnection, FInstanceOwner);
  Result := FModelMetodosUsuariosClient;
end;

end.
