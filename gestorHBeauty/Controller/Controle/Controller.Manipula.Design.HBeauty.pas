unit Controller.Manipula.Design.HBeauty;


interface

uses
  Units.Consts.HBeauty, FMX.Forms;


procedure CarregaPesonalizacaoLogin;
procedure CarregaPesonalizacaoPrincipal;
procedure CarregaPersonalizacaoCabecarioRodape(AForm : TForm);

implementation

uses
    View.Login.HBeauty,
    View.Principal.HBeauty, FMX.Objects;

const
     corVermelhoMatriz : String = '#FFCE4B33';
     corLaranjaMatriz  : String = '#FFCE4B33';
     corRosaMatriz     : String = '#FFAE2B65';

     corVermelhoEscuro : String = '#FFAE2B65';
     corLaranjaEscuro  : String = '#FF823E02';
     corRosaEscuro     : String = '#FF6E0131';

     corVermelhoClaro : String = '#FFFFC78B';
     corLaranjaClaro  : String = '#FFDD79A5';
     corRosaClaro     : String = '#FF6E0131';


procedure CarregaPersonalizacaoCabecarioRodape(AForm : TForm);
var
AIndex : Integer;
begin

     for AIndex := 0 to AForm.ComponentCount - 1 do
         begin
             if AForm.Components[AIndex] is TRectangle then
                begin
                    //COnfigura Rodape e cabecario dos forms
                    if (Pos('Cabecario',(AForm.Components[AIndex] as TRectangle).Name) > 0) then
                       (AForm.Components[AIndex] as TRectangle).Fill.Color := ctrCOR_CABECARIO_FORMS;
                    if  (Pos('Rodape',(AForm.Components[AIndex] as TRectangle).Name) > 0) then
                       (AForm.Components[AIndex] as TRectangle).Fill.Color := ctrCOR_RODAPE_FORMS;
                    //Configura a cor dos botões dos forms
                    if (Pos('Positivo',(AForm.Components[AIndex] as TRectangle).Name) > 0) then
                       (AForm.Components[AIndex] as TRectangle).Fill.Color := ctrCOR_BOTOES_POSITIVO;
                    if (Pos('Negativo',(AForm.Components[AIndex] as TRectangle).Name) > 0) then
                       (AForm.Components[AIndex] as TRectangle).Fill.Color := ctrCOR_BOTOES_NEGATIVO;

                end;

         end;

end;

procedure CarregaPesonalizacaoPrincipal;
begin

     //Imagens
     frmPrincipal.imgLogoPrincipal.Bitmap.LoadFromFile(ctrPATH_LOGOS + ctrLOGO_EMPRESA);
     frmPrincipal.MenuLogo.Bitmap.LoadFromFile(ctrPATH_LOGOS + ctrMINI_LOGO_EMPRESA);
     frmPrincipal.Fill.Bitmap.Bitmap.LoadFromFile(ctrPATH_IMAGENS + ctrIMG_FUNDO_LOGIN);

     CarregaPersonalizacaoCabecarioRodape(frmPrincipal);

     //Define se o Form cobria toda a tela
     frmPrincipal.FullScreen := ctrFULL_SCREEN;
end;

procedure CarregaPesonalizacaoLogin;
begin
     //Imagens
     frmLogin.Fill.Bitmap.Bitmap.LoadFromFile(ctrPATH_IMAGENS + ctrIMG_FUNDO_LOGIN);
     frmLogin.imgLogoLogin.Bitmap.LoadFromFile(ctrPATH_LOGOS + ctrLOGO_EMPRESA);

end;

end.
