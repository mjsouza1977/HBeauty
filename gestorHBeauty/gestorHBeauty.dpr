program gestorHBeauty;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Principal.HBeauty in 'View\View.Principal.HBeauty.pas' {frmPrincipal},
  Controller.ConexaoWS.HBeauty in 'Controller\Controller.ConexaoWS.HBeauty.pas',
  Controller.Manipula.XML.HBeauty in 'Controller\Controller.Manipula.XML.HBeauty.pas',
  Units.Strings.HBeauty in 'Units\Units.Strings.HBeauty.pas',
  View.Login.HBeauty in 'View\View.Login.HBeauty.pas' {frmLogin},
  Controller.Conexao.Proxy.HBeauty in 'Controller\Conexao\Controller.Conexao.Proxy.HBeauty.pas',
  Controller.ClientModule.HBeauty in 'Controller\Conexao\Controller.ClientModule.HBeauty.pas' {ControllerClientModule: TDataModule},
  Controller.Dados.HBeauty in 'Controller\Conexao\Controller.Dados.HBeauty.pas' {ControllerDados: TDataModule},
  Units.Utils.HBeauty in 'Units\Units.Utils.HBeauty.pas',
  Units.Consts.HBeauty in 'Units\Units.Consts.HBeauty.pas',
  Units.Classes.HBeauty in 'Units\Units.Classes.HBeauty.pas',
  Model.Dados.Server.HBeauty in 'Model\Model.Dados.Server.HBeauty.pas' {ModelConexao: TDataModule},
  Model.Usuarios.HBeauty in 'Model\Model.Usuarios.HBeauty.pas',
  Model.Usuarios.Servidor.HBeauty in 'Model\DadosServidor\Model.Usuarios.Servidor.HBeauty.pas',
  Model.Controle.HBeauty in 'Model\Model.Controle.HBeauty.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TModelConexao, ModelConexao);
  Application.CreateForm(TControllerClientModule, ControllerClientModule);
  Application.CreateForm(TControllerDados, ControllerDados);
  Application.CreateForm(TModelConexao, ModelConexao);
  Application.CreateForm(TModelConexao, ModelConexao);
  Application.Run;
end.
