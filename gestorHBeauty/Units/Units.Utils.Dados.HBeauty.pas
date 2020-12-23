unit Units.Utils.Dados.HBeauty;

interface

uses
    System.UIConsts, System.Classes, FireDAC.Comp.Client, FMX.TMSGrid, ACBrValidador,
    FMX.Forms, Model.Endereco.HBeauty, Units.Strings.HBeauty;


procedure CarregaVariaveisControle;
procedure CarregaGrid(ATable : TFDMemTable; AGrid: TTMSFMXGrid; const AListaFields, AListaCaptionFields : Array of String; AListaSizeColuna : Array of Single);
procedure LimpaForm(AForm : TForm);
function PesquisaCEP(AForm: TForm;ACep : String) : TModelEndereco;
function TamanhoImagem(fImagem : String) : String;

implementation


uses
  Units.Classes.HBeauty,
  Units.Consts.HBeauty,
  Model.Dados.Server.HBeauty,
  Model.Controles.Servidor.HBeauty, System.SysUtils, Units.Utils.HBeauty, Units.Enumerados.HBeauty,
  View.Principal.HBeauty, FMX.Edit, FMX.ListBox, FMX.StdCtrls, FMX.NumberBox,
  Winapi.Windows, FMX.Platform.Win, Vcl.Dialogs, FMX.Graphics, Controller.Formata.HBeauty,
  FMX.Memo;

function PesquisaCEP(AForm : TForm; ACep : String) : TModelEndereco;
var
AValidador : TACBrValidador;
AResultado : TModelEndereco;
begin
     try
         AResultado := TModelEndereco.Create(AForm);
         AValidador := TACBrValidador.Create(nil);
         AValidador.Documento := ACep;
         AValidador.TipoDocto := TACBrValTipoDocto.docCEP;

         case AValidador.Validar of
              False : begin
                          MessageBox(WindowHandleToPlatform(AForm.Handle).wnd,
                                     'Cep inválido, verifique!', apTitulo,
                                     MB_OK + MB_ICONINFORMATION);
                          TEdit(AForm.FindComponent('edtCepLog')).SetFocus;
                          Abort;
                      end;
               True : begin
                          ModelConexaoDados.RESTRequest.Params.ParameterByName('pCEP').Value := ApenasNumeros(ACep);
                          ModelConexaoDados.RESTRequest.Execute;
                          if (ModelConexaoDados.memCep.RecordCount > 0) and (ModelConexaoDados.memCeplogradouro.AsString <> '') then
                              begin
                                  AResultado.UFLOG      := ModelConexaoDados.memCepuf.Value;
                                  AResultado.CEP        := ACBrValidador.FormatarCEP(ModelConexaoDados.memCepcep.Value);
                                  AResultado.LOGRADOURO := ModelConexaoDados.memCeplogradouro.Value;
                                  AResultado.BAIRROLOG  := ModelConexaoDados.memCepbairro.Value;
                                  AResultado.CIDADELOG  := ModelConexaoDados.memCeplocalidade.Value;

                                  Result := AResultado;
                              end
                          else
                              begin
                                   MessageBox(WindowHandleToPlatform(AForm.Handle).Wnd,
                                              'Cep não encontrado, verifique!', apTitulo,
                                              MB_OK + MB_ICONINFORMATION);
                                   Abort;
                              end;
                      end;
         end;
     finally
         AValidador.DisposeOf;
     end;
end;

procedure LimpaForm(AForm : TForm);
var
AIndex : Integer;
begin
     for AIndex := 0 to AForm.ComponentCount - 1 do
         begin
              if AForm.Components[AIndex] is TNumberBox then TNumberBox(AForm.Components[AIndex]).Value := 0;
              if AForm.Components[AIndex] is TEdit      then TEdit(AForm.Components[AIndex]).Text := '';
              if AForm.Components[AIndex] is TComboBox  then TComboBox(AForm.Components[AIndex]).ItemIndex := -1;
              if AForm.Components[AIndex] is TCheckBox  then TCheckBox(AForm.Components[AIndex]).IsChecked := False;
              if AForm.Components[AIndex] is TMemo      then TMemo(AForm.Components[AIndex]).Text := '';
         end;

end;

function getValueControle(AControleValue: String): String;
begin

   ModelConexaoDados.memControles.Filter := 'NOME_CONTROLE = ' + QuotedStr(AControleValue);
   ModelConexaoDados.memControles.Filtered := True;

   Result := ModelConexaoDados.memControles.FieldByName('VALOR_CONTROLE').AsString;

end;

function TamanhoImagem(fImagem : String) : String;
var
vImagem : TBitmap;
vLargura, vAltura : Integer;
begin

vImagem  := TBitmap.Create();
vImagem.LoadFromFile(fImagem);

vAltura  := vImagem.Height;
vLargura := vImagem.Width;

Result   := vLargura.ToString+'x'+vAltura.ToString;

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
    ctrSIZE_FOTO_PES        := getValueControle('SIZE_FOTO_PES');
    ctrSIZE_FOTO_PRO        := getValueControle('SIZE_FOTO_PRO');
    ctrSIZE_FOTO_SER        := getValueControle('SIZE_FOTO_SER');
    ctrPATH_FOTOS           := getValueControle('PATH_FOTOS');
    ctrSIZE_LOGO            := getValueControle('SIZE_LOGO');
end;

procedure CarregaGrid(ATable : TFDMemTable; AGrid: TTMSFMXGrid; const AListaFields, AListaCaptionFields : Array of String; AListaSizeColuna : Array of Single);
var
ALinha, i : Integer;
begin

     ALinha := 0;
     AGrid.RowCount := ALinha + 1;
     for i := 0 to Length(AListaCaptionFields) - 1 do
         begin
              AGrid.Cells[i,ALinha]  := AListaCaptionFields[i];
              AGrid.Columns[i].Width :=  AListaSizeColuna[i];
         end;

     ATable.First;
     while not ATable.Eof do
         begin
              Inc(ALinha);
              AGrid.RowCount := ALinha + 1;
              for i := 0 to Length(AListaFields) - 1 do
                  begin
                      if (AListaCaptionFields[i] = 'CPF') or (AListaCaptionFields[i] = 'CNPJ') or (AListaCaptionFields[i] = 'CNPJ/CPF') then
                          AGrid.Cells[i,ALinha] := '<font size="16">' +  ACBrValidador.FormatarCNPJouCPF(ATable.FieldByName(AListaFields[i]).AsString) + '</font>' else
                      if AListaCaptionFields[i]  = 'CEP' then
                          AGrid.Cells[i,ALinha] := '<font size="16">' +  ACBrValidador.FormatarCEP(ATable.FieldByName(AListaFields[i]).AsString) + '</font>' else
                      if AListaCaptionFields[i]  = 'Código' then
                         AGrid.Cells[i,ALinha]  := '<font size="16">' +  FormatFloat('0000', ATable.FieldByName(AListaFields[i]).AsInteger) + '</font>' else
                          AGrid.Cells[i,ALinha] := '<font size="16">' +  ATable.FieldByName(AListaFields[i]).AsString + '</font>';
                      if AListaCaptionFields[i]  = 'Telefone' then
                         AGrid.Cells[i,ALinha]  := '<font size="16">' +  ACBrValidador.FormatarFone(ATable.FieldByName(AListaFields[i]).AsString) + '</font>';

                  end;

              ATable.Next;
         end;

end;

end.
