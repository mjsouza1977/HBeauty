program ServerHBeauty;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  View.Principal.ServerHBeauty in 'View\View.Principal.ServerHBeauty.pas' {frmServerPrincipal},
  Model.WebModule.ServerHBeauty in 'Model\Model.WebModule.ServerHBeauty.pas' {ModelWebModule: TWebModule},
  Model.Metodos.ServerHBeauty in 'Model\Metodos\Model.Metodos.ServerHBeauty.pas' {ModelMetodos: TDataModule},
  Model.Usuarios.ServerHBeauty in 'Model\Metodos\Usuarios\Model.Usuarios.ServerHBeauty.pas',
  Model.Controle.ServerHBeauty in 'Model\Metodos\Controle\Model.Controle.ServerHBeauty.pas',
  Controller.Conexao.HBeautyServer in 'Controller\Conexao\Controller.Conexao.HBeautyServer.pas' {ControllerConexao: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmServerPrincipal, frmServerPrincipal);
  Application.CreateForm(TControllerConexao, ControllerConexao);
  Application.Run;
end.
