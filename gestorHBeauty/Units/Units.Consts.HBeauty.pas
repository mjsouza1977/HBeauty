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
     ACaptionProfissionais : Array [0..10] of String  = ('C�digo','CPF','Nome','SobreNome','Logradouro','Nr.','Complemento','Bairro','CEP','Cidade','UF');
     ASizeColProfissionais : Array [0..10] of Single  = (50, 170, 150, 250, 350, 70, 100, 200, 100, 180, 50);

     //grid do Form de cadastro de telefones
     AFieldsTelefones  : Array [0..4] of  String = ('ID_FONE','NR_FONE','CONTATO_FONE','WHATS_FONE','RESTRITO_FONE');
     ACaptionTelefones : Array [0..4] of String  = ('C�digo','Telefone','Contato','ZAP','Restrito');
     ASizeColTelefones : Array [0..4] of Single  = (70, 150, 150, 50, 50);

     //grid do Form de cadastro de telefones
     AFieldsEmails  : Array [0..2] of  String = ('ID_EMAIL','EMAIL_EMAIL','RESTRITO_EMAIL');
     ACaptionEmails : Array [0..2] of String  = ('C�digo','E-Mail','Restrito');
     ASizeColEmails : Array [0..2] of Single  = (70, 400, 50);

     //grid do Form de Empresas Terceirizadas
     AFieldsTerceirizadas  : Array [0..10] of  String = ('ID_TERCEIRIZADA', 'CNPJ_TERCEIRIZADA','RAZAO_TERCEIRIZADA','FANTASIA_TERCEIRIZADA','LOGLOG_TERCEIRIZADA', 'NRLOG_TERCEIRIZADA',
                                                         'COMPLLOG_TERCEIRIZADA','BAIRROLOG_TERCEIRIZADA','CEPlog_TERCEIRIZADA','CIDADELOG_TERCEIRIZADA','UFLOG_TERCEIRIZADA');
     ACaptionTerceirizadas : Array [0..10] of String  = ('C�digo','CNPJ','Raz�o Social','Nome Fantasia','Logradouro','Nr.','Complemento','Bairro','CEP','Cidade','UF');
     ASizeColTerceirizadas : Array [0..10] of Single  = (50, 170, 300, 200, 350, 70, 100, 200, 100, 180, 50);

     //grid do Form de Habilidades
     AFieldsHabilidades  : Array [0..2] of  String = ('ID_HABILIDADE', 'NOME_HABILIDADE','DESCR_HABILIDADE');
     ACaptionHabilidades : Array [0..2] of String  = ('C�digo','Habilidade','Descri��o');
     ASizeColHabilidades : Array [0..2] of Single  = (50, 170, 300);


     //Status da a��o do form
     tpInicia    : String = 'Inicia';
     tpTermina   : String = 'Termina';
     tpContenha  : String = 'Contenha';
     tpIgual     : String = 'Igual';

     //Prefixo das imagens
     pxFotoPessoa  : String = 'PES'; //Prefixo para fotos das pessoas
     pxFotoProduto : String = 'PRO'; //Prefixo para fotos dos produtos
     pxFotoServico : String = 'SER'; //Prefixo para fotos dos servi�os

     apTitulo    : pWideChar = 'HBeauty';

     sfIncluir   : Integer = 0;
     sfAlterar   : Integer = 1;
     sfExcluir   : Integer = 2;

var
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
    end;
end;



end.
