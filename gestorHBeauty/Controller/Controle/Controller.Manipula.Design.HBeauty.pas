unit Controller.Manipula.Design.HBeauty;


interface

uses
  Units.Consts.HBeauty;


procedure CarregaPesonalizacaoLogin;
procedure CarregaPesonalizacaoPrincipal;

implementation



uses
    View.Login.HBeauty,
    View.Principal.HBeauty;

procedure CarregaPesonalizacaoPrincipal;
begin

     //Imagens
     frmPrincipal.imgLogoPrincipal.Bitmap.LoadFromFile(ctrPATH_LOGOS + ctrLOGO_EMPRESA);
     frmPrincipal.MenuLogo.Bitmap.LoadFromFile(ctrPATH_LOGOS + ctrMINI_LOGO_EMPRESA);
     frmPrincipal.Fill.Bitmap.Bitmap.LoadFromFile(ctrPATH_IMAGENS + ctrIMG_FUNDO_LOGIN);

     //Cor Titulo e rodape do form
     frmPrincipal.recCabecarioPrincipal.Fill.Color := ctrCOR_CABECARIO_FORMS;

     //Define se o Form cobria toda a tela
     frmPrincipal.FullScreen := ctrFULL_SCREEN;
end;

procedure CarregaPesonalizacaoLogin;
begin
     //Imagens
     frmLogin.Fill.Bitmap.Bitmap.LoadFromFile(ctrPATH_IMAGENS + ctrIMG_FUNDO_LOGIN);
     frmLogin.imgLogoLogin.Bitmap.LoadFromFile(ctrPATH_LOGOS + ctrLOGO_EMPRESA);

     //Cor dos botões positivos
     frmLogin.recbtnEntrar.Fill.Color     := ctrCOR_BOTOES_POSITIVO;
     frmLogin.recbtnValidar.Fill.Color    := ctrCOR_BOTOES_POSITIVO;

     //Cor dos botões negativos
     frmLogin.recbtnSair.Fill.Color       := ctrCOR_BOTOES_NEGATIVO;
     frmLogin.recbtnVoltar.Fill.Color     := ctrCOR_BOTOES_NEGATIVO;

     //Cor do titulo e roda do form
     frmLogin.recTopFormLogin.Fill.Color  := ctrCOR_CABECARIO_FORMS;
     frmLogin.recRodapeLogin.Fill.Color   := ctrCOR_RODAPE_FORMS;

end;

end.
