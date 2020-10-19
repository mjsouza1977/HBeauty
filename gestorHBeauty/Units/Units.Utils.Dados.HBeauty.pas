unit Units.Utils.Dados.HBeauty;

interface

uses
    System.UIConsts, System.Classes, FireDAC.Comp.Client, FMX.TMSGrid, ACBrValidador;


procedure CarregaVariaveisControle;
procedure CarregaGrid(ATable : TFDMemTable; AGrid: TTMSFMXGrid; const AListaFields, AListaCaptionFields : Array of String);

implementation


uses
  Units.Classes.HBeauty,
  Units.Consts.HBeauty,
  Model.Dados.Server.HBeauty,
  Model.Controles.Servidor.HBeauty, System.SysUtils, Units.Utils.HBeauty, Units.Enumerados.HBeauty,
  View.Principal.HBeauty;


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

procedure CarregaGrid(ATable : TFDMemTable; AGrid: TTMSFMXGrid; const AListaFields, AListaCaptionFields : Array of String);
var
ALinha, i : Integer;
begin

     ALinha := 0;
     AGrid.RowCount := ALinha + 1;
     for i := 0 to Length(AListaCaptionFields) - 1 do
         AGrid.Cells[i,ALinha] := AListaCaptionFields[i];

     ATable.First;
     while not ATable.Eof do
         begin
              Inc(ALinha);
              AGrid.RowCount := ALinha + 1;
              for i := 0 to Length(AListaFields) - 1 do
                  begin
                      if (AListaCaptionFields[i] = 'CPF') or (AListaCaptionFields[i] = 'CNPJ') or (AListaCaptionFields[i] = 'CNPJ/CPF') then
                          AGrid.Cells[i,ALinha] := '<font size="16">' +  ACBrValidador.FormatarCNPJouCPF(ATable.FieldByName(AListaFields[i]).AsString) + '</font>' else
                      if AListaCaptionFields[i] = 'CEP' then
                          AGrid.Cells[i,ALinha] := '<font size="16">' +  ACBrValidador.FormatarCEP(ATable.FieldByName(AListaFields[i]).AsString) + '</font>' else
                      if AListaCaptionFields[i] = 'Código' then
                         AGrid.Cells[i,ALinha] := '<font size="16">' +  FormatFloat('0000', ATable.FieldByName(AListaFields[i]).AsInteger) + '</font>' else
                          AGrid.Cells[i,ALinha] := '<font size="16">' +  ATable.FieldByName(AListaFields[i]).AsString + '</font>';
                  end;

              ATable.Next;
         end;

end;

end.
