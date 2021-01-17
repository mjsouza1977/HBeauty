unit View.Produtos.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.EditBox, FMX.NumberBox, FMX.Effects, FMX.Filter.Effects, FMX.ListBox, FMX.StdCtrls,
  FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.Layouts, FMX.Edit, FMX.TabControl,
  FMX.Controls.Presentation, FMX.TMSButton, FMX.ScrollBox, FMX.Memo, Units.Utils.HBeauty, Controller.Manipula.Design.HBeauty, Units.Utils.Dados.HBeauty,
  Model.Fornecedor.Servidor.HBeauty, Model.Genericos.Servidor.HBeauty,
  Units.Enumerados.HBeauty, Model.Produtos.HBeauty, Model.Produtos.Servidor.HBeauty,
  Units.Consts.HBeauty;

type
  TfrmGerenciadorProdutos = class(TForm)
    tabCabecarioFornecedor: TTabControl;
    tabPesquisa: TTabItem;
    recCabecarioTerceirizada: TRectangle;
    btnPesquisar: TTMSFMXButton;
    Label1: TLabel;
    Rectangle6: TRectangle;
    edtPesquisaBase: TEdit;
    tabDados: TTabItem;
    Rectangle3: TRectangle;
    Label4: TLabel;
    lblNome: TLabel;
    Label13: TLabel;
    lblStatus: TLabel;
    tabGerenciadorProdutos: TTabControl;
    tabListaProdutos: TTabItem;
    Layout4: TLayout;
    recModal: TRectangle;
    recMsg: TRectangle;
    Layout1: TLayout;
    Line10: TLine;
    Image7: TImage;
    lblCaption: TLabel;
    Layout2: TLayout;
    imgIcoMsg: TImage;
    lblMensagem: TLabel;
    sbtnOK: TSpeedButton;
    sbtnSim: TSpeedButton;
    sbtnNao: TSpeedButton;
    Rectangle11: TRectangle;
    grdListaProdutos: TTMSFMXGrid;
    tabFichaProdutos: TTabItem;
    StyleBook2: TStyleBook;
    FillRGBEffect2: TFillRGBEffect;
    Rectangle14: TRectangle;
    cbFornecedores: TComboBox;
    Label2: TLabel;
    Rectangle1: TRectangle;
    cbMarcas: TComboBox;
    Label3: TLabel;
    Rectangle2: TRectangle;
    edtProduto: TEdit;
    Label5: TLabel;
    Rectangle4: TRectangle;
    Label6: TLabel;
    Rectangle7: TRectangle;
    Label8: TLabel;
    edtEmb: TNumberBox;
    Rectangle5: TRectangle;
    cbUnid: TComboBox;
    Label7: TLabel;
    Rectangle15: TRectangle;
    Label15: TLabel;
    edtPeso: TNumberBox;
    Rectangle18: TRectangle;
    Label17: TLabel;
    edtDose: TNumberBox;
    Rectangle17: TRectangle;
    cbMedidaDose: TComboBox;
    Label16: TLabel;
    Rectangle9: TRectangle;
    edtCEST: TEdit;
    Label11: TLabel;
    Rectangle8: TRectangle;
    edtCF: TEdit;
    Label9: TLabel;
    Rectangle13: TRectangle;
    Label14: TLabel;
    edtPromocao: TNumberBox;
    Rectangle12: TRectangle;
    Label12: TLabel;
    edtVenda: TNumberBox;
    Rectangle16: TRectangle;
    lblNumero: TLabel;
    edtCusto: TNumberBox;
    Rectangle19: TRectangle;
    Label18: TLabel;
    edtLargura: TNumberBox;
    Rectangle20: TRectangle;
    Label19: TLabel;
    edtAltura: TNumberBox;
    Rectangle21: TRectangle;
    Label20: TLabel;
    edtComprimento: TNumberBox;
    Label22: TLabel;
    Rectangle22: TRectangle;
    Label23: TLabel;
    Rectangle23: TRectangle;
    Label24: TLabel;
    lblMT3: TLabel;
    lblCM3: TLabel;
    Label21: TLabel;
    Label27: TLabel;
    tabAPP: TTabItem;
    tabGerenciadorApp: TTabControl;
    tabInformações: TTabItem;
    tabDetalhes: TTabItem;
    tabFotos: TTabItem;
    mmObservacao: TMemo;
    Rectangle24: TRectangle;
    Label28: TLabel;
    tabRelacionados: TTabItem;
    tabSimilares: TTabItem;
    Layout3: TLayout;
    tabOrientacoes: TTabItem;
    recRodapeBotoesPrincipal: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    edtBarras: TEdit;
    Rectangle10: TRectangle;
    cbTipoPesquisa: TComboBox;
    Label10: TLabel;
    Rectangle25: TRectangle;
    mmInformacoes: TMemo;
    Rectangle26: TRectangle;
    mmDetalhes: TMemo;
    Rectangle27: TRectangle;
    mmOrientacoes: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdListaProdutosCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure cbFornecedoresChange(Sender: TObject);
    procedure edtProdutoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtBarrasKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtEmbKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure cbUnidKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtPesoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtDoseKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure cbMedidaDoseKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLarguraKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtAlturaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtComprimentoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCustoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtVendaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtPromocaoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCFKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCESTKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FIdSelecionado : Integer;
    FStatus : TAcaoBotao;
    procedure ControlaTab(Lista, Ficha, APP : Boolean);
    procedure AlimentaClasseProdutos;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerenciadorProdutos: TfrmGerenciadorProdutos;

implementation

uses
  Model.Dados.Server.HBeauty,
  FireDAC.Comp.Client,
  Units.Classes.HBeauty,
  Winapi.Windows,
  FMX.Platform.Win,
  Units.Strings.HBeauty, Units.Mensagens.HBeauty;

{$R *.fmx}

procedure TfrmGerenciadorProdutos.AlimentaClasseProdutos;
begin

     gclProdutos.IDFORN_PROD       := Integer(cbFornecedores.Items.Objects[cbFornecedores.ItemIndex]);
     gclProdutos.IDMARCA_PROD      := Integer(cbMarcas.Items.Objects[cbMarcas.ItemIndex]);
     gclProdutos.CODIGOBARRAS_PROD := edtBarras.Text;
     gclProdutos.DESCR_PROD        := edtProduto.Text;
     gclProdutos.EMB_PROD          := edtEmb.Value.ToString;
     gclProdutos.UND_PROD          := cbUnid.Items.Text;
     gclProdutos.ORIENT_PROD       := mmOrientacoes.Text;
     gclProdutos.OBS_PROD          := mmObservacao.Text;
     gclProdutos.MEDIDADOSE_PROD   := cbMedidaDose.Items.Text;
     gclProdutos.CCEST_PROD        := edtCEST.Text;
     gclProdutos.CLSSFISCAL_PROD   := edtCF.Text;
     gclProdutos.INFO_PROD         := mmInformacoes.Text;
     gclProdutos.DETALHES_PROD     := mmDetalhes.Text;
     gclProdutos.PRCUSTO_PROD      := edtCusto.Value;
     gclProdutos.PRVENDA_PROD      := edtVenda.Value;
     gclProdutos.PRPROMO_PROD      := edtPromocao.Value;
     gclProdutos.PESO_PROD         := edtPeso.Value;
     gclProdutos.DOSE_PROD         := edtDose.Value;
     gclProdutos.LARGURA_PROD      := edtLargura.Value;
     gclProdutos.ALTURA_PROD       := edtAltura.Value;
     gclProdutos.COMPR_PROD        := edtComprimento.Value;

end;

procedure TfrmGerenciadorProdutos.btnAlterarClick(Sender: TObject);
begin
     if FIdSelecionado > 0 then
         begin
             Case BloqueiaRegistro(True, FIdSelecionado, tcProdutos) of
                  False : begin
                              FStatus                := abAlterar;
                              pesquisaProdutos('','','','DESCR_PROD', FIdSelecionado);

                              cbFornecedores.ItemIndex := cbFornecedores.Items.IndexOf(ModelConexaoDados.memProdutos.FieldByName('NOME_FORN').AsString);
                              cbMarcas.ItemIndex       := cbMarcas.Items.IndexOf(ModelConexaoDados.memProdutos.FieldByName('MARCA_MARCA').AsString);

                              edtProduto.Text          := ModelConexaoDados.memProdutos.FieldByName('DESCR_PROD').AsString;
                              edtBarras.Text           := ModelConexaoDados.memProdutos.FieldByName('CODIGOBARRAS_PROD').AsString;
                              edtEmb.Text              := ModelConexaoDados.memProdutos.FieldByName('EMB_PROD').AsString;
                              cbUnid.ItemIndex         := cbUnid.Items.IndexOf(ModelConexaoDados.memProdutos.FieldByName('UND_PROD').AsString);
                              edtPeso.Value            := ModelConexaoDados.memProfissionais.FieldByName('PESO_PROD').AsCurrency;
                              edtDose.Value            := ModelConexaoDados.memProdutos.FieldByName('DOSE_PROD').AsCurrency;
                              cbMedidaDose.ItemIndex   := cbMedidaDose.Items.IndexOf(ModelConexaoDados.memProdutos.FieldByName('MEDIDADOSE_PROD').AsString);
                              edtLargura.Value         := ModelConexaoDados.memProdutos.FieldByName('LARGURA_PROD').AsCurrency;
                              edtAltura.Value          := ModelConexaoDados.memProdutos.FieldByName('ALTURA_PROD').AsCurrency;
                              edtComprimento.Value     := ModelConexaoDados.memProdutos.FieldByName('COMPR_PROD').AsCurrency;
                              edtCusto.Value           := ModelConexaoDados.memProdutos.FieldByName('PRCUSTO_PROD').AsCurrency;
                              edtVenda.Value           := ModelConexaoDados.memProdutos.FieldByName('PRVENDA_PROD').AsCurrency;
                              edtPromocao.Value        := ModelConexaoDados.memProdutos.FieldByName('PRPROMO_PROD').AsCurrency;
                              edtCF.Text               := ModelConexaoDados.memProdutos.FieldByName('CLSSFISCAL_PROD').AsString;
                              edtCEST.Text             := ModelConexaoDados.memProdutos.FieldByName('CCEST_PROD').AsString;
                              mmObservacao.Text        := ModelConexaoDados.memProdutos.FieldByName('OBS_PROD').AsString;
                              mmInformacoes.Text       := ModelConexaoDados.memProdutos.FieldByName('INFO_PROD').AsString;
                              mmDetalhes.Text          := ModelConexaoDados.memProdutos.FieldByName('DETALHES_PROD').AsString;
                              mmOrientacoes.Text       := ModelConexaoDados.memProdutos.FieldByName('ORIENT_PROD').AsString;

                              AlimentaClasseProdutos;

                              ControlaBotoes(Self, False);
                              tabGerenciadorProdutos.TabIndex := 1;
                              ControlaTab(False, True, True);
                          end;
                   True : begin
                               MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                          'Este registro esta sendo editado por outro usuário!',
                                          apTitulo, MB_OK + MB_ICONSTOP);
                               Exit;
                          end;
             end;
         end
     else
         begin
             MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                        'Selecione um produto na lista para alterar!',
                        apTitulo, MB_OK + MB_ICONINFORMATION);
             Exit;
         end;
end;

procedure TfrmGerenciadorProdutos.btnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfrmGerenciadorProdutos.btnIncluirClick(Sender: TObject);
begin
     ControlaTab(False, True, True);
     LimpaForm(Self);
     ControlaBotoes(Self, False);
     FStatus := abIncluir;
     tabCabecarioFornecedor.TabIndex := 1;
end;

procedure TfrmGerenciadorProdutos.btnSalvarClick(Sender: TObject);
var
rResultado : String;
begin
    rResultado := '';
    case FStatus of
         abIncluir : begin
                         case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                         'Confirma a inclusão deste produto?',
                                         apTitulo, MB_YESNO + MB_ICONQUESTION) of
                             IDYES : begin
                                         AlimentaClasseProdutos;
                                         Try
                                            rResultado := cadastraProduto(gclProdutos);

                                            case isNumeric(rResultado) of
                                                True : begin
                                                           case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                           'Produto cadastrado com sucesso.'+#13#13+
                                                                           'Deseja cadastrar outro produto?', apTitulo,
                                                                            MB_YESNO + MB_ICONQUESTION) of
                                                               IDYES : begin
                                                                            FStatus := abIncluir;
                                                                            LimpaForm(Self);
                                                                            cbFornecedores.SetFocus;
                                                                            cbMarcas.Items.Clear;
                                                                       end;
                                                                IDNO : begin
                                                                            FStatus := abNulo;
                                                                            ControlaTab(True, False, False);
                                                                            ControlaBotoes(Self, True);
                                                                            tabGerenciadorProdutos.TabIndex := 0;
                                                                       end;
                                                           end;

                                                       end;
                                               False : begin
                                                           MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                      pChar(Format(MSG_ERRO_SERVIDOR,[rResultado])),
                                                                      apTitulo, MB_OK +MB_ICONWARNING);
                                                           Exit;
                                                       end;
                                            end;

                                         Except
                                             On E:Exception do
                                                 begin
                                                     if Pos('aborted', E.Message) = 0 then
                                                         begin
                                                             MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                        pChar(Format(MSG_ERRO_INTERNET,[E.Message])),
                                                                        apTitulo, MB_OK +MB_ICONWARNING);
                                                             Exit;
                                                         end;
                                                 end;

                                         end;
                                     end;
                         end;
                     end;
         abAlterar : begin
                         case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                         'Confirma a alteração deste produto?',
                                         apTitulo, MB_YESNO + MB_ICONQUESTION) of
                             IDYES : begin
                                         try
                                             AlimentaClasseProdutos;
                                             rResultado := atualizaProduto(gclProdutos);
                                             if rResultado = '' then
                                                 begin
                                                     BloqueiaRegistro(False, FIdSelecionado, tcProdutos);
                                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                'Produto salvo com sucesso!', apTitulo,
                                                                MB_OK + MB_ICONINFORMATION);
                                                     pesquisaProdutos('','Lista','','DESCR_PROD');
                                                     LimpaForm(Self);
                                                     ControlaTab(True, False, False);
                                                     ControlaBotoes(Self, True);
                                                     tabGerenciadorProdutos.TabIndex := 0;;
                                                 end
                                             else
                                                 begin
                                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                pChar(Format(MSG_ERRO_SERVIDOR,[rResultado])),
                                                                apTitulo, MB_OK + MB_ICONWARNING);
                                                     Exit;
                                                 end;

                                         except
                                              On E:Exception do
                                                 begin
                                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                pChar(Format(MSG_ERRO_INTERNET,[E.Message])),
                                                                apTitulo, MB_OK + MB_ICONWARNING);
                                                     Exit;
                                                 end;
                                         end;
                                     end;
                         end;
                     end;
    end;

end;

procedure TfrmGerenciadorProdutos.Button1Click(Sender: TObject);
var
FScroll : TVertScrollBox;
FPanel : TPanel;
J, FCount : Integer;
YPos, XPos : Single;
begin

     FScroll := TVertScrollBox.Create(nil);
     FScroll.Parent := tabFotos;
     FScroll.Align  := TAlignLayout.Client;

     FCount := 0;
     XPos   := 5;
     YPos   := 5;
     for j  := 1 to 53 do
         begin
             FCount := FCount + 1;
             FPanel := TPanel.Create(nil);
             FPanel.Parent  := FScroll;

             FPanel.Height := (FScroll.Height / 2) - 13;
             FPanel.Width  := (FScroll.Width / 5) - 13;
             FPanel.Position.X := XPos;
             FPanel.Position.Y := YPos;
             XPos := XPos + (FPanel.Width + 9);

             if FCount = 5 then
                begin
                     YPos   := YPos + (FPanel.Height + 10);
                     XPos   := 5;
                     FCount := 0;
                end;
         end;
end;

procedure TfrmGerenciadorProdutos.cbFornecedoresChange(Sender: TObject);
var
AMemTable : TFDMemTable;
ASQL : String;
begin

    cbMarcas.Clear;
    if cbFornecedores.ItemIndex > -1 then
        begin
            try
                AMemTable := TFDMemTable.Create(nil);
                ASQL := 'SELECT m.ID_MARCA, m.MARCA_MARCA FROM HBMARCA m ' +
                        'WHERE m.ID_MARCA IN (SELECT r.IDMARCA_FORNXMARCA FROM HBFORNXMARCA r, HBFORNECEDOR f ' +
                                              'WHERE (r.IDFORN_FORNXMARCA = f.ID_FORN) AND ' +
                                              '(f.ID_FORN = ' + Integer(cbFornecedores.Items.Objects[cbFornecedores.ItemIndex]).ToString + '))';
                carregaCamposSQL(AMemTable, ASQL);
                AMemTable.First;

                while not AMemTable.Eof do
                    begin
                        cbMarcas.Items.AddObject(AMemTable.FieldByName('MARCA_MARCA').AsString,
                                                 TObject(AMemTable.FieldByName('ID_MARCA').AsInteger));
                        AMemTable.Next;
                    end;
            finally
                FreeAndNil(AMemTable);
            end;
        end;
end;

procedure TfrmGerenciadorProdutos.cbMedidaDoseKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtLargura);
end;

procedure TfrmGerenciadorProdutos.cbUnidKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtPeso);
end;

procedure TfrmGerenciadorProdutos.ControlaTab(Lista, Ficha, APP : Boolean);
begin

     tabListaProdutos.Visible := Lista;
     tabFichaProdutos.Visible := Ficha;
     tabAPP.Visible           := App;

end;

procedure TfrmGerenciadorProdutos.edtAlturaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtComprimento);
end;

procedure TfrmGerenciadorProdutos.edtBarrasKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtEmb);
end;

procedure TfrmGerenciadorProdutos.edtCESTKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, mmObservacao);
end;

procedure TfrmGerenciadorProdutos.edtCFKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtCEST);
end;

procedure TfrmGerenciadorProdutos.edtComprimentoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtCusto);
end;

procedure TfrmGerenciadorProdutos.edtCustoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtVenda);
end;

procedure TfrmGerenciadorProdutos.edtDoseKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, cbMedidaDose);
end;

procedure TfrmGerenciadorProdutos.edtEmbKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, cbUnid);
end;

procedure TfrmGerenciadorProdutos.edtLarguraKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtAltura);
end;

procedure TfrmGerenciadorProdutos.edtPesoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtDose);
end;

procedure TfrmGerenciadorProdutos.edtProdutoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtBarras);
end;

procedure TfrmGerenciadorProdutos.edtPromocaoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtCF);
end;

procedure TfrmGerenciadorProdutos.edtVendaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtPromocao);
end;

procedure TfrmGerenciadorProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     FreeAndNil(gclProdutos);
     Action := TCloseAction.caFree;

end;

procedure TfrmGerenciadorProdutos.FormCreate(Sender: TObject);
begin
     CarregaPersonalizacaoCabecarioRodape(Self);
     pesquisaProdutos('','Lista','','DESCR_PROD');
     CarregaGrid(ModelConexaoDados.memProdutos, grdListaProdutos, AFieldsProdutos, ACaptionProdutos, ASizeColProdutos, True);

     FormataItensComboBox(cbTipoPesquisa, 'Segoe UI', 14);
     ControlaTab(True, False, False);

     gclProdutos := TModelProdutos.Create(Self);


     carregaCamposSelecionados(ModelConexaoDados.memFornecedores, 'ID_FORN, NOME_FORN', 'HBFORNECEDOR');
     ModelConexaoDados.memFornecedores.First;
     cbFornecedores.Clear;

     while not ModelConexaoDados.memFornecedores.Eof do
         begin
             cbFornecedores.Items.AddObject(ModelConexaoDados.memFornecedores.FieldByName('NOME_FORN').AsString,
                                            TObject(ModelConexaoDados.memFornecedores.FieldByName('ID_FORN').AsInteger));
             ModelConexaoDados.memFornecedores.Next;
         end;
end;

procedure TfrmGerenciadorProdutos.grdListaProdutosCellClick(Sender: TObject; ACol, ARow: Integer);
begin
    FIdSelecionado := ExtraiTextoGrid(grdListaProdutos.Cells[0, ARow]).ToInteger;
end;

end.
