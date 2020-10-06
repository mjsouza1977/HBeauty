program ServerHBeauty;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  View.Principal.ServerHBeauty in 'View\View.Principal.ServerHBeauty.pas' {frmServerPrincipal},
  Model.WebModule.ServerHBeauty in 'Model\Model.WebModule.ServerHBeauty.pas' {ModelWebModule: TWebModule},
  Model.Metodos.ServerHBeauty in 'Model\Metodos\Model.Metodos.ServerHBeauty.pas' {ModelMetodos: TDataModule},
  Controller.Dados.HBeautyServer in 'Controller\Conexao\Controller.Dados.HBeautyServer.pas' {$R *.res},
  Controller.Conexao.HBeautyServer in 'Controller\Conexao\Controller.Conexao.HBeautyServer.pas' {ControllerConexao: TDataModule},
  Model.Controle.ServerHBeauty in 'Model\Metodos\Model.Controle.ServerHBeauty.pas',
  Model.Usuarios.ServerHBeauty in 'Model\Metodos\Model.Usuarios.ServerHBeauty.pas',
  Utils.Query.HBeautyServer in 'Utils\Utils.Query.HBeautyServer.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmServerPrincipal, frmServerPrincipal);
  Application.Run;
end.
