program ServerHBeauty;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  View.Principal.ServerHBeauty in 'View\View.Principal.ServerHBeauty.pas' {frmServerPrincipal},
  Model.WebModule.ServerHBeauty in 'Model\Model.WebModule.ServerHBeauty.pas' {ModelWebModule: TWebModule},
  Model.Metodos.ServerHBeauty in 'Model\Metodos\Model.Metodos.ServerHBeauty.pas' {ModelMetodos: TDataModule},
  Model.Metodos.Usuarios.ServerHBeauty in 'Model\Metodos\Usuarios\Model.Metodos.Usuarios.ServerHBeauty.pas',
  Model.Metodos.Controle.ServerHBeauty in 'Model\Metodos\Controle\Model.Metodos.Controle.ServerHBeauty.pas',
  Controller.Conexao.HBeautyServer in 'Controller\Conexao\Controller.Conexao.HBeautyServer.pas' {ControllerConexao: TDataModule},
  Model.Metodos.Profissionais.ServerHBeauty in 'Model\Metodos\Profissionais\Model.Metodos.Profissionais.ServerHBeauty.pas',
  Model.Chaves.ServerHBeauty in 'Model\Model.Chaves.ServerHBeauty.pas',
  Units.Utils.ServerBeauty in 'Units\Units.Utils.ServerBeauty.pas',
  Model.Metodos.Contatos.ServerHBeauty in 'Model\Metodos\Contatos\Model.Metodos.Contatos.ServerHBeauty.pas',
  Model.Metodos.Profissionais.Hablidades.ServerHBeauty in 'Model\Metodos\Profissionais\Model.Metodos.Profissionais.Hablidades.ServerHBeauty.pas',
  Model.Metodos.Terceirizadas.ServerHBeauty in 'Model\Metodos\Terceirizadas\Model.Metodos.Terceirizadas.ServerHBeauty.pas',
  Model.Metodos.Genericos.ServerHBeauty in 'Model\Metodos\Model.Metodos.Genericos.ServerHBeauty.pas';

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
