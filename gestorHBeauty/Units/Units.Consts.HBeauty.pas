unit Units.Consts.HBeauty;

interface

uses
  System.UITypes,
  Model.Genericos.Servidor.HBeauty,
  Units.Enumerados.HBeauty;

function BloqueiaRegistro(ABloqueia : Boolean; AIdSelecionado : Integer; ATabela : TTabelaCadastrada) : Boolean;


const

     AurlXMLGetIdCidade    : String = 'http://servicos.cptec.inpe.br/XML/listaCidades?city=%s';
     AurlXMLGetTemperatura : String = 'http://servicos.cptec.inpe.br/XML/Cidade/%s/previsao.xml';


     //grid do Form de Profissionais
     AFieldsProfissionais  : Array [0..10] of  String = ('ID_PROFIS', 'CPF_PROFIS','NOME_PROFIS','SOBRENOME_PROFIS','LOGRADOURO_PROFIS', 'NRLOG_PROFIS',
                                                         'COMPLLOG_PROFIS','BAIRROLOG_PROFIS','CEP_PROFIS','CIDADELOG_PROFIS','UFLOG_PROFIS');
     ACaptionProfissionais : Array [0..10] of String  = ('Código','CPF','Nome','SobreNome','Logradouro','Nr.','Complemento','Bairro','CEP','Cidade','UF');
     ASizeColProfissionais : Array [0..10] of Single  = (60, 170, 150, 250, 350, 70, 100, 200, 100, 180, 50);

     //grid do Form de cadastro de telefones
     AFieldsTelefones  : Array [0..4] of  String = ('ID_FONE','NR_FONE','CONTATO_FONE','WHATS_FONE','RESTRITO_FONE');
     ACaptionTelefones : Array [0..4] of String  = ('Código','Telefone','Contato','ZAP','Restrito');
     ASizeColTelefones : Array [0..4] of Single  = (70, 150, 150, 50, 50);

     //grid do Form de cadastro de telefones
     AFieldsEmails  : Array [0..2] of  String = ('ID_EMAIL','EMAIL_EMAIL','RESTRITO_EMAIL');
     ACaptionEmails : Array [0..2] of String  = ('Código','E-Mail','Restrito');
     ASizeColEmails : Array [0..2] of Single  = (70, 400, 50);

     //grid do Form de Empresas Terceirizadas
     AFieldsTerceirizadas  : Array [0..10] of  String = ('ID_TERCEIRIZADA', 'CNPJ_TERCEIRIZADA','RAZAO_TERCEIRIZADA','FANTASIA_TERCEIRIZADA','LOGLOG_TERCEIRIZADA', 'NRLOG_TERCEIRIZADA',
                                                         'COMPLLOG_TERCEIRIZADA','BAIRROLOG_TERCEIRIZADA','CEPlog_TERCEIRIZADA','CIDADELOG_TERCEIRIZADA','UFLOG_TERCEIRIZADA');
     ACaptionTerceirizadas : Array [0..10] of String  = ('Código','CNPJ','Razão Social','Nome Fantasia','Logradouro','Nr.','Complemento','Bairro','CEP','Cidade','UF');
     ASizeColTerceirizadas : Array [0..10] of Single  = (60, 170, 300, 200, 350, 70, 100, 200, 100, 180, 50);

     //grid do Form dos Fornecedores
     AFieldsFornecedores  : Array [0..10] of  String = ('ID_FORN', 'CNPJCPF_FORN', 'NOME_FORN', 'PSEUDO_FORN', 'LOGRADOURO_FORN', 'NRLOG_FORN',
                                                         'COMPLLOG_FORN', 'BAILOG_FORN', 'CEPLOG_FORN', 'CIDLOG_FORN', 'UFLOG_FORN');
     ACaptionFornecedores : Array [0..10] of String  = ('Código','CNPJ','Razão Social','Nome Fantasia','Logradouro','Nr.','Complemento','Bairro','CEP','Cidade','UF');
     ASizeColFornecedores : Array [0..10] of Single  = (60, 170, 300, 200, 350, 70, 100, 200, 100, 180, 50);

     //grid do Form de Habilidades
     AFieldsHabilidades  : Array [0..3] of String = ('ID_HABILIDADE', 'NOME_CARGO', 'NOME_HABILIDADE','DESCR_HABILIDADE');
     ACaptionHabilidades : Array [0..3] of String  = ('Código','Cargo','Habilidade','Descrição');
     ASizeColHabilidades : Array [0..3] of Single  = (60, 200, 200, 300);

     //grid do Form de Habilidades
     AFieldsCargos  : Array [0..2] of String = ('ID_CARGO', 'NOME_CARGO', 'DESCR_CARGO');
     ACaptionCargos : Array [0..2] of String  = ('Código','Cargo','Descrição');
     ASizeColCargos : Array [0..2] of Single  = (60, 200, 400);

     //grid do Form de Vendedores
     AFieldsVendedores  : Array [0..10] of String = ('ID_VEND','CPF_VEND','NOME_VEND','SOBRENOME_VEND','LOG_VEND','NRLOG_VEND','COMPLOG_VEND', 'BAILOG_VEND','CEPLOG_VEND','CIDLOG_VEND','UFLOG_VEND');
     ACaptionVendedores : Array [0..10] of String  = ('Código','CPF', 'Nome', 'SobreNome','Logradouro', 'Nr.', 'Complemento','Bairro','CEP','Cidade','UF');
     ASizeColVendedores : Array [0..10] of Single  = (60, 170, 300, 350, 350, 70, 100, 200, 100, 180, 50);

     //grid do Form de Marcas
     AFieldsMarcas  : Array [0..1] of String = ('ID_MARCA','MARCA_MARCA');
     ACaptionMarcas : Array [0..1] of String  = ('Código','Marca');
     ASizeColMarcas : Array [0..1] of Single  = (60, 400);


     //Status da ação do form
     tpInicia    : String = 'Inicia';
     tpTermina   : String = 'Termina';
     tpContenha  : String = 'Contenha';
     tpIgual     : String = 'Igual';

     //Prefixo das imagens
     pxFotoPessoa  : String = 'PES'; //Prefixo para fotos das pessoas
     pxFotoProduto : String = 'PRO'; //Prefixo para fotos dos produtos
     pxFotoServico : String = 'SER'; //Prefixo para fotos dos serviços

     apTitulo    : pWideChar = 'HBeauty';

     sfIncluir   : Integer = 0;
     sfAlterar   : Integer = 1;
     sfExcluir   : Integer = 2;

var
   rResultado : String;

   ctrCOR_BOTOES_POSITIVO  : TAlphaColor;
   ctrCOR_BOTOES_NEGATIVO  : TAlphaColor;
   ctrCOR_RODAPE_FORMS     : TAlphaColor;
   ctrCOR_CABECARIO_FORMS  : TAlphaColor;

   ctrLOGO_EMPRESA         : String;
   ctrIMG_FUNDO_PRINCIPAL  : String;
   ctrIMG_FUNDO_LOGIN      : String;
   ctrPATH_IMAGENS         : String;
   ctrPATH_LOGOS           : String;
   ctrMINI_LOGO_EMPRESA    : String;
   ctrSIZE_FOTO_PES        : String;
   ctrSIZE_FOTO_PRO        : String;
   ctrSIZE_FOTO_SER        : String;
   ctrSIZE_LOGO            : String;
   ctrPATH_FOTOS           : String;
   ctrFULL_SCREEN          : Boolean;

   gIDUsuarioConectado     : Integer = 0;
implementation

function BloqueiaRegistro(ABloqueia : Boolean; AIdSelecionado : Integer; ATabela : TTabelaCadastrada) : Boolean;
begin
    case ATabela of
        tcProfissionais : Result := ManipulaEstadoRegistro(ABloqueia, AIdSelecionado, 'ID_PROFIS','HBPROFISSIONAIS');
        tcFornecedores  : Result := ManipulaEstadoRegistro(ABloqueia, AIdSelecionado, 'ID_FORN','HBFORNECEDOR');
        tcClientes      : Result := ManipulaEstadoRegistro(ABloqueia, AIdSelecionado, 'ID_CLI','HBCLIENTE');
        tcTercerizadas  : Result := ManipulaEstadoRegistro(ABloqueia, AIdSelecionado, 'ID_TERCEIRIZADA','HBTERCEIRIZADA');
        tcTelefones     : Result := ManipulaEstadoRegistro(ABloqueia, AIdSelecionado, 'ID_FONE','HBTELEFONES');
        tcEmails        : Result := ManipulaEstadoRegistro(ABloqueia, AIdSelecionado, 'ID_EMAIL','HBEMAILS');
        tcHabilidades   : Result := ManipulaEstadoRegistro(ABloqueia, AIdSelecionado, 'ID_HABILIDADE','HBHABILIDADES');
        tcCargo         : Result := ManipulaEstadoRegistro(ABloqueia, AIdSelecionado, 'ID_CARGO','HBCARGO');
        tcVendedor      : Result := ManipulaEstadoRegistro(ABloqueia, AIdSelecionado, 'ID_VEND','HBVENDEDOR');
    end;
end;



end.
