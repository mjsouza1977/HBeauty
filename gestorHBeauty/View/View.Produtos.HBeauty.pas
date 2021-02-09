unit View.Produtos.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.EditBox, FMX.NumberBox, FMX.Effects, FMX.Filter.Effects, FMX.ListBox, FMX.StdCtrls,
  FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.Layouts, FMX.Edit, FMX.TabControl,
  FMX.Controls.Presentation, FMX.TMSButton, FMX.ScrollBox, FMX.Memo, Units.Utils.HBeauty, Controller.Manipula.Design.HBeauty, Units.Utils.Dados.HBeauty,
  Model.Fornecedor.Servidor.HBeauty, Model.Genericos.Servidor.HBeauty,
  Units.Enumerados.HBeauty, Model.Produtos.HBeauty, Model.Produtos.Servidor.HBeauty,
  Units.Consts.HBeauty, FMX.TMSBaseGroup, FMX.TMSRadioGroup,
  View.ConflitoImagens.HBeauty, View.Repositorio.HBeauty;

type
  TPesquisaPor = (tppFornecedor, tppMarca, tppProduto, tppCodBarra, tppCodigo);
  TfrmGerenciadorProdutos = class(TForm)
    tabCabecarioProduto: TTabControl;
    tabPesquisa: TTabItem;
    recCabecarioTerceirizada: TRectangle;
    btnPesquisar: TTMSFMXButton;
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
    tabOrientacoes: TTabItem;
    edtBarras: TEdit;
    Rectangle10: TRectangle;
    cbPesquisaPor: TComboBox;
    Label10: TLabel;
    Rectangle25: TRectangle;
    mmInformacoes: TMemo;
    Rectangle26: TRectangle;
    mmDetalhes: TMemo;
    Rectangle27: TRectangle;
    mmOrientacoes: TMemo;
    rbOperador: TTMSFMXRadioGroup;
    Label1: TLabel;
    grdlytFotos: TGridLayout;
    grdRelacionados: TGridLayout;
    grdSimilares: TGridLayout;
    tabControleBotoes: TTabControl;
    tbBotoesPrincipal: TTabItem;
    tbBotoesImagens: TTabItem;
    recRodapeBotoesPrincipal: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    Rectangle28: TRectangle;
    btnAdicionarFotos: TTMSFMXButton;
    lblTituloFotos: TLabel;
    opFile: TOpenDialog;
    lytImagens: TLayout;
    imgEditar: TImage;
    imgView: TImage;
    imgExcluir: TImage;
    imgCloud: TImage;
    imgLocal: TImage;
    imgNotFound: TImage;
    btnRepositorioFotos: TTMSFMXButton;
    tbBotoesRelacionamentos: TTabItem;
    Rectangle29: TRectangle;
    btnFotosVinculos: TTMSFMXButton;
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
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tabGerenciadorAppChange(Sender: TObject);
    procedure tabGerenciadorProdutosChange(Sender: TObject);
    procedure btnAdicionarFotosClick(Sender: TObject);
  private
    FIdSelecionado : Integer;
    FStatus : TAcaoBotao;
    FgridFotos : TGridLayout;
    procedure ControlaTab(Lista, Ficha, APP : Boolean);
    procedure AlimentaClasseProdutos;
    procedure AClickTeste(Sender: TObject);

    { Private declarations }
  public
    FListaImagens : TStringList;
    procedure carregaImagem(AParent : TFmxObject; ANomeArquivo : String; AStatus : TStatus);

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
  Units.Strings.HBeauty,
  Units.Mensagens.HBeauty,
  System.UIConsts,
  Model.Imagens.Servidor.HBeauty;

{$R *.fmx}

procedure TfrmGerenciadorProdutos.AlimentaClasseProdutos;
begin

     gclProdutos.ID_PROD           := FIdSelecionado;
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

procedure TfrmGerenciadorProdutos.btnAdicionarFotosClick(Sender: TObject);
var
ANomeImagem, AExtensao, ASQL : String;
begin
    if opFile.Execute then
        begin
            AExtensao := UpperCase(ExtractFileExt(opFile.FileName));
            if (Pos('JPG', AExtensao) = 0) and (Pos('JPEG', AExtensao) = 0) then
                begin
                    MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                              'Formato do arquivo inválido, selecione um arquivo do tipo "jpg"!',
                              apTitulo, MB_OK + MB_ICONEXCLAMATION);
                    Exit;
                end
            else
                begin
                    ASQL := 'SELECT NOMEFILEIMAGEM, PATHORIGINALIMAGEM FROM HBIMAGENS WHERE PATHORIGINALIMAGEM = '+ QuotedStr(opFile.FileName);
                    carregaCamposSQL(ModelConexaoDados.memGenerica, ASQL);

                    if ModelConexaoDados.memGenerica.RecordCount > 0 then
                        begin
                            Application.CreateForm(TfrmFotosRepetidas, frmFotosRepetidas);
                            DownloadImagemFTP(UpperCase(ModelConexaoDados.memGenerica.FieldByName('NOMEFILEIMAGEM').AsString),
                                              frmFotosRepetidas.imgFotoServer);
                            frmFotosRepetidas.imgFotoLocal.Bitmap.LoadFromFile(opFile.FileName);
                            frmFotosRepetidas.FNomeArquivo := opFile.FileName;
                            frmFotosRepetidas.ShowModal;
                        end
                    else
                        begin
                            FListaImagens.Add(opFile.FileName);
                            carregaImagem(grdlytFotos, opFile.FileName, stOffLine);
                        end;
                end;
        end;
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
                              edtPeso.Value            := ModelConexaoDados.memProdutos.FieldByName('PESO_PROD').AsCurrency;
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

procedure TfrmGerenciadorProdutos.btnCancelarClick(Sender: TObject);
var
AMensagem : String;
begin

     case FStatus of
         abIncluir : AMensagem := 'Tem certeza que deseja cancelar esta inclusão. ' +
                                  'Os dados serão perdidos.'+#13#13+
                                  'Deseja continuar?';
         abAlterar : AMensagem := 'Tem certeza que deseja cancelar esta alteração. ' +
                                  'Caso tenha feito alguma alteração os dados não serão salvos.'+#13#13+
                                  'Deseja continuar?';
            abNulo : begin
                         LimpaForm(Self);
                         ControlaTab(True, False, False);
                         tabCabecarioProduto.TabIndex := 0;
                         tabGerenciadorProdutos.TabIndex := 0;
                         tabGerenciadorApp.TabIndex := 0;
                         ControlaBotoes(Self, True);
                         Abort;
                     end;
     end;

     if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                   pChar(AMensagem), apTitulo, MB_YESNO + MB_ICONQUESTION) = IDYES then
         begin
             BloqueiaRegistro(False, FIdSelecionado, tcProdutos);
             LimpaForm(Self);
             ControlaTab(True, False, False);
             tabCabecarioProduto.TabIndex := 0;
             tabGerenciadorProdutos.TabIndex := 0;
             tabGerenciadorApp.TabIndex := 0;
             ControlaBotoes(Self, True);
         end;

end;

procedure TfrmGerenciadorProdutos.btnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfrmGerenciadorProdutos.btnIncluirClick(Sender: TObject);
begin
     tabCabecarioProduto.Next;
     tabGerenciadorProdutos.TabIndex := 1;
     ControlaTab(False, True, True);
     LimpaForm(Self);
     ControlaBotoes(Self, False);
     FStatus := abIncluir;
end;

procedure TfrmGerenciadorProdutos.btnPesquisarClick(Sender: TObject);
var
ACampo, TipoPesquisa : String;
begin

     case rbOperador.ItemIndex of
          0 : TipoPesquisa := tpInicia;
          1 : TipoPesquisa := tpTermina;
          2 : TipoPesquisa := tpContenha;
          3 : TipoPesquisa := tpIgual;
     end;

     case TPesquisaPor(cbPesquisaPor.ItemIndex) of
          tppFornecedor : ACampo := 'f.NOME_FORN';
          tppMarca      : ACampo := 'm.MARCA_MARCA';
          tppProduto    : ACampo := 'p.DESCR_PROD';
          tppCodBarra   : ACampo := 'p.CODIGOBARRAS_PROD';
          tppCodigo     : ACampo := 'p.CODIGO_PROD';
     end;

     pesquisaProdutos(edtPesquisaBase.Text, TipoPesquisa, ACampo, 'p.DESCR_PROD');
     CarregaGrid(ModelConexaoDados.memProdutos,grdListaProdutos, AFieldsProdutos, ACaptionProdutos, ASizeColProdutos);

     if ModelConexaoDados.memProdutos.RecordCount > 0 then
        FIdSelecionado :=  ExtraiTextoGrid(grdListaProdutos.Cells[0, 1]).ToInteger;

end;

procedure gravaImagens(AIDProduto : Integer);
var
ANomeArquivo : String;
begin

    with frmGerenciadorProdutos do
        begin
            for var i := 0 to FListaImagens.Count - 1 do
                begin
                    ANomeArquivo := GravaImagem(AIDProduto,
                                                pxFotoProduto,
                                                ExtractFileExt(FListaImagens.Strings[i]),
                                                pxFoto,
                                                pxFotoProduto,
                                                FListaImagens.Strings[i],
                                                'Nome');
                    CopyFile(pChar(FListaImagens.Strings[i]),
                             pChar(ctrPATH_FOTOS + ANomeArquivo), False);
                end;
        end;
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
                                                           gravaImagens(rResultado.ToInteger);
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
                                                                            tabGerenciadorApp.TabIndex := 0;
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
                                                     tabGerenciadorApp.TabIndex := 0;
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

procedure TfrmGerenciadorProdutos.AClickTeste(Sender : TObject);
begin
    ShowMessage(TImage(Sender).Name);
end;

procedure TfrmGerenciadorProdutos.carregaImagem(AParent : TFmxObject; ANomeArquivo : String; AStatus : TStatus);
var
FRecFotos    : TRectangle;
FlytLayout   : TLayout;
FImage       : TImage;
FImageStatus : TImage;
begin

    //Cria o Retangulo Base para a imagem
    FrecFotos := TRectangle.Create(nil);
    FrecFotos.Parent  := AParent;
    FrecFotos.Margins.Left   := 3;
    FrecFotos.Margins.Top    := 3;
    FrecFotos.Margins.Bottom := 3;
    FrecFotos.Margins.Right  := 3;
    FrecFotos.Stroke.Kind := TBrushKind.None;
    FrecFotos.Fill.Color  := StringToAlphaColor('#FFF0F0F0');
    FrecFotos.XRadius := 5;
    FrecFotos.YRadius := 5;

    //Layout do rodape que cntera os botões de ação
    FlytLayout        := TLayout.Create(nil);
    FlytLayout.Parent := FRecFotos;
    FlytLayout.Align  := TAlignLayout.Bottom;
    FlytLayout.Height := 25;

    //TImage que armazenara a imagem
    FImage          := TImage.Create(nil);
    FImage.Parent   := FRecFotos;
    FImage.Align    := TAlignLayout.Client;
    FImage.WrapMode := TImageWrapMode.Fit;
    FImage.ShowHint := False;
    FImage.OnClick := AClickTeste;
    case AStatus of
        stOnLine  : FImage.Hint := 'OnLine';
        stOffLine : FImage.Hint := 'OffLine';
    end;
    FIndexNomeImagem := FIndexNomeImagem + 1;
    FImage.Name     := 'AImagemProduto_' + FIndexNomeImagem.ToString;
    try
        case AStatus of
            stOnLine  : DownloadImagemFTP(ANomeArquivo, FImage);
            stOffLine : FImage.Bitmap.LoadFromFile(ANomeArquivo);
        end;
    except
        FImage.WrapMode := TImageWrapMode.Place;
        FImage.Bitmap := imgNotFound.Bitmap;
    end;

    //TImage que exibira o Status on-line ou OffLine
    FImageStatus            := TImage.Create(nil);
    FImageStatus.Parent     := FImage;
    FImageStatus.Position.X := 125;
    FImageStatus.Position.Y := 0;
    FImageStatus.Height     := 35;
    FImageStatus.Width      := 35;
    FImageStatus.WrapMode   := TImageWrapMode.Center;
//    case AStatus of
//        stOnLine  : FImageStatus.Bitmap := imgCloud.Bitmap;
//        stOffLine : FImageStatus.Bitmap := imgLocal.Bitmap;
//    end;

    //TImage que servira de botão Editar
    FImage          := TImage.Create(nil);
    FImage.Parent   := FlytLayout;
    FImage.Align    := TAlignLayout.Right;
    FImage.Width    := 35;
    FImage.WrapMode := TImageWrapMode.Fit;
    //FImage.Bitmap   := imgEditar.Bitmap;

    //TImage que servira de botão Excluir
    FImage          := TImage.Create(nil);
    FImage.Parent   := FlytLayout;
    FImage.Align    := TAlignLayout.Right;
    FImage.Width    := 35;
    FImage.WrapMode := TImageWrapMode.Fit;
    //FImage.Bitmap   := imgExcluir.Bitmap;

    //TImage que servira de botão Visualizar
    FImage          := TImage.Create(nil);
    FImage.Parent   := FlytLayout;
    FImage.Align    := TAlignLayout.Right;
    FImage.Width    := 35;
    FImage.WrapMode := TImageWrapMode.Fit;
   // FImage.Bitmap   := frmGerenciadorProdutos.imgView.Bitmap;

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

     DebloqueiaRegistro('HBPRODUTO');
     FreeAndNil(gclProdutos);
     Action := TCloseAction.caFree;

end;

procedure TfrmGerenciadorProdutos.FormCreate(Sender: TObject);
begin
     FListaImagens := TStringList.Create;

     lytImagens.Visible:= False;
     FIndexNomeImagem := 0;
     CarregaPersonalizacaoCabecarioRodape(Self);

     pesquisaProdutos('','Lista','','DESCR_PROD');
     CarregaGrid(ModelConexaoDados.memProdutos, grdListaProdutos, AFieldsProdutos, ACaptionProdutos, ASizeColProdutos, True);

     FormataItensComboBox(cbPesquisaPor, 'Segoe UI', 14);
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

procedure carregaNomeImagens(AIDProduto : Integer);
var
ASQL : String;
begin

     ASQL := 'SELECT IDIMAGEM, NOMEFILEIMAGEM, PATHORIGINALIMAGEM, UPDATEIMAGEM FROM HBIMAGENS ' +
             'WHERE (IDTABIMAGEM = ' + AIDProduto.ToString + ') AND ' +
             '(TIPOIMAGEM = ' + QuotedStr(pxFoto) + ') AND ' +
             '(REFIMAGEM = ' + QuotedStr(pxFotoProduto) + ')';

     carregaCamposSQL(ModelConexaoDados.memGenerica, ASQL);

end;

procedure TfrmGerenciadorProdutos.tabGerenciadorAppChange(Sender: TObject);
begin

     if tabGerenciadorApp.ActiveTab = tabFotos then
         begin
             lblTituloFotos.Text := 'Fotos dos' + #13 + 'Produtos';
             tabControleBotoes.ActiveTab := tbBotoesImagens;
             if Assigned(FgridFotos) then FreeAndNil(FgridFotos);

             FgridFotos := TGridLayout.Create(nil);
             FgridFotos.Parent := tabFotos;
             FgridFotos.Align := TAlignLayout.Client;
             FgridFotos.ItemHeight := 188;
             FgridFotos.ItemWidth  := 168;
             FgridFotos.Orientation := TOrientation.Horizontal;

             carregaNomeImagens(FIdSelecionado);

             if ModelConexaoDados.memGenerica.RecordCount > 0 then
                 begin
                    // FIndexNomeImagem := 0;
                     while not ModelConexaoDados.memGenerica.Eof do
                         begin
                             if ModelConexaoDados.memGenerica.FieldByName('UPDATEIMAGEM').AsString = 'F' then
                                 carregaImagem(FgridFotos,
                                               ModelConexaoDados.memGenerica.FieldByName('NOMEFILEIMAGEM').AsString,
                                               stOnLine)
                             else
                                 carregaImagem(FgridFotos,
                                               ModelConexaoDados.memGenerica.FieldByName('PATHORIGINALIMAGEM').AsString,
                                               stOffLine);

                             ModelConexaoDados.memGenerica.Next;
                         end;
                 end;

         end else
     if tabGerenciadorApp.ActiveTab = tabRelacionados then
         begin
             lblTituloFotos.Text := 'Produtos ' + #13 + 'Relacionados';
             tabControleBotoes.ActiveTab := tbBotoesImagens;
         end else
     if tabGerenciadorApp.ActiveTab = tabSimilares then
         begin
             lblTituloFotos.Text := 'Produtos ' + #13 + 'Similares';
             tabControleBotoes.ActiveTab := tbBotoesImagens;
         end
     else
         begin
              lblTituloFotos.Text := '';
              tabControleBotoes.ActiveTab := tbBotoesPrincipal;
         end;


end;

procedure TfrmGerenciadorProdutos.tabGerenciadorProdutosChange(Sender: TObject);
begin

     if (tabGerenciadorProdutos.ActiveTab = tabAPP) and
        (tabGerenciadorApp.ActiveTab = tabFotos) or
        (tabGerenciadorApp.ActiveTab = tabRelacionados) or
        (tabGerenciadorApp.ActiveTab = tabSimilares) then
         begin
             tabControleBotoes.ActiveTab := tbBotoesImagens;
         end
     else
         begin
             tabControleBotoes.ActiveTab := tbBotoesPrincipal;
         end;


end;

end.
