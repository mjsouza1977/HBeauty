program gestorHBeauty;



uses
  System.StartUpCopy,
  FMX.Forms,
  View.Principal.HBeauty in 'View\View.Principal.HBeauty.pas' {frmPrincipal},
  Controller.ConexaoWS.HBeauty in 'Controller\Controller.ConexaoWS.HBeauty.pas',
  Controller.Manipula.XML.HBeauty in 'Controller\Controller.Manipula.XML.HBeauty.pas',
  Units.Strings.HBeauty in 'Units\Units.Strings.HBeauty.pas',
  View.Login.HBeauty in 'View\View.Login.HBeauty.pas' {frmLogin},
  Controller.ClientModule.HBeauty in 'Controller\Conexao\Controller.ClientModule.HBeauty.pas' {ControllerClientModule: TDataModule},
  Units.Utils.HBeauty in 'Units\Units.Utils.HBeauty.pas',
  Units.Consts.HBeauty in 'Units\Units.Consts.HBeauty.pas',
  Units.Classes.HBeauty in 'Units\Units.Classes.HBeauty.pas',
  Model.Dados.Server.HBeauty in 'Model\Model.Dados.Server.HBeauty.pas' {ModelConexaoDados: TDataModule},
  Model.Usuarios.HBeauty in 'Model\Model.Usuarios.HBeauty.pas',
  Model.Usuarios.Servidor.HBeauty in 'Model\DadosServidor\Model.Usuarios.Servidor.HBeauty.pas',
  Model.Controles.Servidor.HBeauty in 'Model\DadosServidor\Model.Controles.Servidor.HBeauty.pas',
  Units.Utils.Dados.HBeauty in 'Units\Units.Utils.Dados.HBeauty.pas',
  Controller.Manipula.Design.HBeauty in 'Controller\Controle\Controller.Manipula.Design.HBeauty.pas',
  Model.Profissionais.HBeauty in 'Model\Model.Profissionais.HBeauty.pas',
  Units.Formata.HBeauty in 'Units\Units.Formata.HBeauty.pas',
  Model.Endereco.HBeauty in 'Model\Model.Endereco.HBeauty.pas',
  Model.Chaves.HBeauty in 'Model\Model.Chaves.HBeauty.pas',
  View.Contatos.HBeauty in 'View\View.Contatos.HBeauty.pas' {frmCadastroContatos},
  Units.Enumerados.HBeauty in 'Units\Units.Enumerados.HBeauty.pas',
  Model.Profissionais.Servidor.HBeauty in 'Model\DadosServidor\Model.Profissionais.Servidor.HBeauty.pas',
  Model.Contatos.Servidor.HBeauty in 'Model\DadosServidor\Model.Contatos.Servidor.HBeauty.pas',
  Model.Telefones.HBeauty in 'Model\Model.Telefones.HBeauty.pas',
  Model.Emails.HBeauty in 'Model\Model.Emails.HBeauty.pas',
  View.Loading.HBeauty in 'View\View.Loading.HBeauty.pas' {frmLoading},
  Model.Habilidades.HBeauty in 'Model\Model.Habilidades.HBeauty.pas',
  View.Terceirizadas.HBeauty in 'View\View.Terceirizadas.HBeauty.pas' {frmGerenciadorTerceirizadas},
  Model.Terceirizada.HBeauty in 'Model\Model.Terceirizada.HBeauty.pas',
  Controller.Conexao.Proxy.HBeauty in 'Controller\Conexao\Controller.Conexao.Proxy.HBeauty.pas',
  Model.Terceirizadas.Servidor.HBeauty in 'Model\DadosServidor\Model.Terceirizadas.Servidor.HBeauty.pas',
  View.Profissionais.HBeauty in 'View\View.Profissionais.HBeauty.pas' {frmGerenciadorProfissionais};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TControllerClientModule, ControllerClientModule);
  Application.CreateForm(TModelConexaoDados, ModelConexaoDados);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmGerenciadorTerceirizadas, frmGerenciadorTerceirizadas);
  Application.CreateForm(TfrmGerenciadorProfissionais, frmGerenciadorProfissionais);
  Application.Run;
end.
