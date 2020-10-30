unit Units.Consts.HBeauty;

interface

uses
  System.UITypes;


const

     AurlXMLGetIdCidade    : String = 'http://servicos.cptec.inpe.br/XML/listaCidades?city=%s';
     AurlXMLGetTemperatura : String = 'http://servicos.cptec.inpe.br/XML/Cidade/%s/previsao.xml';


     //grid do Form de Profissionais
     AFieldsProfissionais  : Array [0..10] of  String = ('ID_PROFIS', 'CPF_PROFIS','NOME_PROFIS','SOBRENOME_PROFIS','LOGRADOURO_PROFIS', 'NRLOG_PROFIS',
                                                         'COMPLLOG_PROFIS','BAIRROLOG_PROFIS','CEP_PROFIS','CIDADELOG_PROFIS','UFLOG_PROFIS');
     ACaptionProfissionais : Array [0..10] of String  = ('Código','CPF','Nome','SobreNome','Logradouro','Nr.','Complemento','Bairro','CEP','Cidade','UF');
     ASizeColProfissionais : Array [0..10] of Single  = (50, 150, 150, 250, 350, 70, 100, 200, 100, 180, 50);

     //grid do Form de cadastro de telefones
     AFieldsTelefones  : Array [0..4] of  String = ('ID_FONE','NR_FONE','CONTATO_FONE','WHATS_FONE','RESTRITO_FONE');
     ACaptionTelefones : Array [0..4] of String  = ('Código','Telefone','Contato','ZAP','Restrito');
     ASizeColTelefones : Array [0..4] of Single  = (70, 150, 150, 50, 50);

     //grid do Form de cadastro de telefones
     AFieldsEmails  : Array [0..2] of  String = ('ID_EMAIL','EMAIL_EMAIL','RESTRITO_EMAIL');
     ACaptionEmails : Array [0..2] of String  = ('Código','E-Mail','Restrito');
     ASizeColEmails : Array [0..2] of Single  = (70, 400, 50);

     //Status da ação do form
     tpInicia    : String = 'Inicia';
     tpTermina   : String = 'Termina';
     tpContenha  : String = 'Contenha';
     tpIgual     : String = 'Igual';

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

   ctrFULL_SCREEN          : Boolean;
implementation


end.
