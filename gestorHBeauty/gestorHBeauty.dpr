program GestorHBeauty;



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
  View.Profissionais.HBeauty in 'View\View.Profissionais.HBeauty.pas' {frmGerenciadorProfissionais},
  Controller.Formata.HBeauty in 'Controller\Controller.Formata.HBeauty.pas',
  Model.Genericos.Servidor.HBeauty in 'Model\DadosServidor\Model.Genericos.Servidor.HBeauty.pas',
  Model.Imagens.Servidor.HBeauty in 'Model\DadosServidor\Model.Imagens.Servidor.HBeauty.pas',
  Model.Imagens.HBeauty in 'Model\Model.Imagens.HBeauty.pas',
  View.Habilidades.HBeauty in 'View\View.Habilidades.HBeauty.pas' {frmCadastroHabilidades},
  View.Cargos.HBeauty in 'View\View.Cargos.HBeauty.pas' {frmCadastroCargos},
  Model.Cargos.HBeauty in 'Model\Model.Cargos.HBeauty.pas',
  Units.Mensagens.HBeauty in 'Units\Units.Mensagens.HBeauty.pas',
  Model.Fornecedor.HBeauty in 'Model\Model.Fornecedor.HBeauty.pas',
  View.Fornecedores.HBeauty in 'View\View.Fornecedores.HBeauty.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TControllerClientModule, ControllerClientModule);
  Application.CreateForm(TModelConexaoDados, ModelConexaoDados);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
