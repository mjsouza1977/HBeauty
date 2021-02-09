program gestorHBeauty;

uses
  System.StartUpCopy,
  FMX.Forms,
  Controller.ConexaoWS.HBeauty in 'Controller\Controller.ConexaoWS.HBeauty.pas',
  Controller.Formata.HBeauty in 'Controller\Controller.Formata.HBeauty.pas',
  Controller.Manipula.XML.HBeauty in 'Controller\Controller.Manipula.XML.HBeauty.pas',
  Controller.ClientModule.HBeauty in 'Controller\Conexao\Controller.ClientModule.HBeauty.pas' {ControllerClientModule: TDataModule},
  Controller.Conexao.Proxy.HBeauty in 'Controller\Conexao\Controller.Conexao.Proxy.HBeauty.pas',
  Controller.Manipula.Design.HBeauty in 'Controller\Controle\Controller.Manipula.Design.HBeauty.pas',
  Model.Contatos.Servidor.HBeauty in 'Model\DadosServidor\Model.Contatos.Servidor.HBeauty.pas',
  Model.Controles.Servidor.HBeauty in 'Model\DadosServidor\Model.Controles.Servidor.HBeauty.pas',
  Model.Fornecedor.Servidor.HBeauty in 'Model\DadosServidor\Model.Fornecedor.Servidor.HBeauty.pas',
  Model.Genericos.Servidor.HBeauty in 'Model\DadosServidor\Model.Genericos.Servidor.HBeauty.pas',
  Model.Imagens.Servidor.HBeauty in 'Model\DadosServidor\Model.Imagens.Servidor.HBeauty.pas',
  Model.Marca.Servidor.HBeauty in 'Model\DadosServidor\Model.Marca.Servidor.HBeauty.pas',
  Model.Produtos.Servidor.HBeauty in 'Model\DadosServidor\Model.Produtos.Servidor.HBeauty.pas',
  Model.Profissionais.Servidor.HBeauty in 'Model\DadosServidor\Model.Profissionais.Servidor.HBeauty.pas',
  Model.Terceirizadas.Servidor.HBeauty in 'Model\DadosServidor\Model.Terceirizadas.Servidor.HBeauty.pas',
  Model.Usuarios.Servidor.HBeauty in 'Model\DadosServidor\Model.Usuarios.Servidor.HBeauty.pas',
  Model.Vendedor.Servidor.HBeauty in 'Model\DadosServidor\Model.Vendedor.Servidor.HBeauty.pas',
  Model.Cargos.HBeauty in 'Model\Model.Cargos.HBeauty.pas',
  Model.Chaves.HBeauty in 'Model\Model.Chaves.HBeauty.pas',
  Model.Dados.Server.HBeauty in 'Model\Model.Dados.Server.HBeauty.pas' {ModelConexaoDados: TDataModule},
  Model.Emails.HBeauty in 'Model\Model.Emails.HBeauty.pas',
  Model.Endereco.HBeauty in 'Model\Model.Endereco.HBeauty.pas',
  Model.Fornecedor.HBeauty in 'Model\Model.Fornecedor.HBeauty.pas',
  Model.Imagens.HBeauty in 'Model\Model.Imagens.HBeauty.pas',
  Model.Marcas.HBeauty in 'Model\Model.Marcas.HBeauty.pas',
  Model.Produtos.HBeauty in 'Model\Model.Produtos.HBeauty.pas',
  Model.Profissionais.HBeauty in 'Model\Model.Profissionais.HBeauty.pas',
  Model.Telefones.HBeauty in 'Model\Model.Telefones.HBeauty.pas',
  Model.Terceirizada.HBeauty in 'Model\Model.Terceirizada.HBeauty.pas',
  Model.Usuarios.HBeauty in 'Model\Model.Usuarios.HBeauty.pas',
  Model.Vendedores.HBeauty in 'Model\Model.Vendedores.HBeauty.pas',
  Units.Classes.HBeauty in 'Units\Units.Classes.HBeauty.pas',
  Units.Consts.HBeauty in 'Units\Units.Consts.HBeauty.pas',
  Units.Enumerados.HBeauty in 'Units\Units.Enumerados.HBeauty.pas',
  Units.Formata.HBeauty in 'Units\Units.Formata.HBeauty.pas',
  Units.Mensagens.HBeauty in 'Units\Units.Mensagens.HBeauty.pas',
  Units.Strings.HBeauty in 'Units\Units.Strings.HBeauty.pas',
  Units.Utils.Dados.HBeauty in 'Units\Units.Utils.Dados.HBeauty.pas',
  Units.Utils.HBeauty in 'Units\Units.Utils.HBeauty.pas',
  View.Cargos.HBeauty in 'View\View.Cargos.HBeauty.pas' {frmCadastroCargos},
  View.ConflitoImagens.HBeauty in 'View\View.ConflitoImagens.HBeauty.pas' {frmFotosRepetidas},
  View.Contatos.HBeauty in 'View\View.Contatos.HBeauty.pas' {frmCadastroContatos},
  View.Fornecedores.HBeauty in 'View\View.Fornecedores.HBeauty.pas' {frmCadastroFornecedores},
  View.Loading.HBeauty in 'View\View.Loading.HBeauty.pas' {frmLoading},
  View.Login.HBeauty in 'View\View.Login.HBeauty.pas' {frmLogin},
  View.Marcas.HBeauty in 'View\View.Marcas.HBeauty.pas' {frmCadastroMarcas},
  View.Principal.HBeauty in 'View\View.Principal.HBeauty.pas' {frmPrincipal},
  View.Produtos.HBeauty in 'View\View.Produtos.HBeauty.pas' {frmGerenciadorProdutos},
  View.Profissionais.HBeauty in 'View\View.Profissionais.HBeauty.pas' {frmGerenciadorProfissionais},
  View.Repositorio.HBeauty in 'View\View.Repositorio.HBeauty.pas' {Form1},
  View.Terceirizadas.HBeauty in 'View\View.Terceirizadas.HBeauty.pas' {frmGerenciadorTerceirizadas},
  View.Vendedores.HBeauty in 'View\View.Vendedores.HBeauty.pas' {frmGerenciadorVendedores};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TControllerClientModule, ControllerClientModule);
  Application.CreateForm(TModelConexaoDados, ModelConexaoDados);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
