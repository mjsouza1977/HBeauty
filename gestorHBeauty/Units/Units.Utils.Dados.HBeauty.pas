unit Units.Utils.Dados.HBeauty;

interface

uses
    System.UIConsts;


procedure CarregaVariaveisControle;

implementation


uses
  Units.Classes.HBeauty,
  Units.COnsts.HBeauty,
  Model.Dados.Server.HBeauty,
  Model.Controles.Servidor.HBeauty, System.SysUtils, Units.Utils.HBeauty;

function getValueControle(AControleValue: String): String;
begin

   ModelConexaoDados.memControles.Filter := 'NOME_CONTROLE = ' + QuotedStr(AControleValue);
   ModelConexaoDados.memControles.Filtered := True;

   Result := ModelConexaoDados.memControles.FieldByName('VALOR_CONTROLE').AsString;

end;

procedure CarregaVariaveisControle;
begin

    CarregaControle;

    ctrCOR_BOTOES_POSITIVO  := StringToAlphaColor(getValueControle('COR_BOTOES_POSITIVO'));
    ctrCOR_BOTOES_NEGATIVO  := StringToAlphaColor(getValueControle('COR_BOTOES_NEGATIVO'));
    ctrCOR_RODAPE_FORMS     := StringToAlphaColor(getValueControle('COR_RODAPE_FORMS'));
    ctrCOR_CABECARIO_FORMS  := StringToAlphaColor(getValueControle('COR_CABECARIO_FORMS'));
    ctrLOGO_EMPRESA         := getValueControle('LOGO_EMPRESA');
    ctrIMG_FUNDO_PRINCIPAL  := getValueControle('IMG_FUNDO_PRINCIPAL');
    ctrIMG_FUNDO_LOGIN      := getValueControle('IMG_FUNDO_LOGIN');
    ctrPATH_IMAGENS         := getValueControle('PATH_IMAGENS');
    ctrPATH_LOGOS           := getValueControle('PATH_LOGOS');
    ctrMINI_LOGO_EMPRESA    := getValueControle('MINI_LOGO_EMPRESA');
    ctrFULL_SCREEN          := StringToBool(getValueControle('FULL_SCREEN'), 'False','True');

end;

end.
