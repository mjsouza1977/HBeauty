unit View.Fornecedores.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, ACBrBase, ACBrValidador, FMX.Effects, FMX.Filter.Effects, FMX.StdCtrls, FMX.EditBox, FMX.NumberBox,
  FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSBaseGroup, FMX.TMSRadioGroup,
  FMX.Edit, FMX.TabControl, FMX.Controls.Presentation, FMX.TMSButton, FMX.ListBox, Model.Fornecedor.Servidor.HBeauty, FireDAC.Comp.Client,
  Units.Enumerados.HBeauty;

type
  TfrmCadastroFornecedores = class(TForm)
    recRodapeTerceirizada: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    tabCabecarioFornecedor: TTabControl;
    tabPesquisa: TTabItem;
    recCabecarioTerceirizada: TRectangle;
    btnPesquisar: TTMSFMXButton;
    Label1: TLabel;
    Rectangle6: TRectangle;
    edtPesquisaBase: TEdit;
    rbOperador: TTMSFMXRadioGroup;
    rbPor: TTMSFMXRadioGroup;
    tabDados: TTabItem;
    Rectangle3: TRectangle;
    Label4: TLabel;
    lblNome: TLabel;
    Label13: TLabel;
    lblStatus: TLabel;
    tabGerenciadorFornecedor: TTabControl;
    tabListaFornecedor: TTabItem;
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
    grdListaFornecedor: TTMSFMXGrid;
    StyleBook1: TStyleBook;
    tabFichaFornecedor: TTabItem;
    rgDados: TTMSFMXRadioGroup;
    Rectangle1: TRectangle;
    edtRazaoSocial: TEdit;
    Label2: TLabel;
    Rectangle10: TRectangle;
    edtCNPJ: TEdit;
    Label10: TLabel;
    Rectangle12: TRectangle;
    edtIE: TEdit;
    Label11: TLabel;
    Rectangle13: TRectangle;
    edtNomeFantasia: TEdit;
    Label12: TLabel;
    Rectangle16: TRectangle;
    lblNumero: TLabel;
    edtNumeroLog: TNumberBox;
    Rectangle2: TRectangle;
    edtLogradouro: TEdit;
    Label3: TLabel;
    Rectangle4: TRectangle;
    edtComplementoLog: TEdit;
    Label5: TLabel;
    Rectangle5: TRectangle;
    edtBairroLog: TEdit;
    Label6: TLabel;
    Rectangle7: TRectangle;
    edtCepLog: TEdit;
    Label7: TLabel;
    Rectangle8: TRectangle;
    edtCidadeLog: TEdit;
    Label8: TLabel;
    Rectangle9: TRectangle;
    edtUFLog: TEdit;
    Label9: TLabel;
    grpContatos: TGroupBox;
    btnCadastraTelefone: TTMSFMXButton;
    btnCadastraEmail: TTMSFMXButton;
    StyleBook2: TStyleBook;
    FillRGBEffect2: TFillRGBEffect;
    ACBrValidador1: TACBrValidador;
    grpMarca: TGroupBox;
    recMarcas: TRectangle;
    vsbMarcas: TVertScrollBox;
    lytModelo: TLayout;
    CheckBox1: TCheckBox;
    gbVendedor: TGroupBox;
    Rectangle14: TRectangle;
    cbVendedores: TComboBox;
    TMSFMXButton1: TTMSFMXButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    FIdSelecionado : Integer;
    FScroll : TVertScrollBox;
    FStatus : TAcaoBotao;
    procedure listaMarcas(ATable : TFDMemTable; AIDForn : Integer);
    procedure AlimentaClasseFornecedores;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroFornecedores: TfrmCadastroFornecedores;

implementation

{$R *.fmx}

uses Units.Classes.HBeauty,
     Model.Fornecedor.HBeauty,
     Model.Dados.Server.HBeauty,
     Units.Consts.HBeauty,
     Controller.Manipula.Design.HBeauty,
     Model.Genericos.Servidor.HBeauty,
     System.UIConsts,
     Units.Strings.HBeauty,
     Units.Utils.HBeauty, Winapi.Windows, FMX.Platform.Win;

procedure TfrmCadastroFornecedores.AlimentaClasseFornecedores;
begin
    gclFornecedor.ID_FORN             := FIdSelecionado;
    gclFornecedor.CODIGO_FORN         := '';
    gclFornecedor.NOME_FORN           := edtRazaoSocial.Text;
    gclFornecedor.PSEUDO_FORN         := edtNomeFantasia.Text;
    gclFornecedor.CNPJCPF_FORN        := ApenasNumeros(edtCNPJ.Text);
    gclFornecedor.IERG_FORN           := edtIE.Text;

    gclFornecedor.ENDERECO.LOGRADOURO := edtLogradouro.Text;
    gclFornecedor.ENDERECO.NRLOG      := edtNumeroLog.Text.ToInteger;
    gclFornecedor.ENDERECO.BAIRROLOG  := edtBairroLog.Text;
    gclFornecedor.ENDERECO.CIDADELOG  := edtCidadeLog.Text;
    gclFornecedor.ENDERECO.UFLOG      := edtUFLog.Text;
    gclFornecedor.ENDERECO.CEP        := edtCepLog.Text;
end;

procedure TfrmCadastroFornecedores.btnAlterarClick(Sender: TObject);
begin
    if FIdSelecionado > 0 then
        begin
            Case BloqueiaRegistro(True, FIdSelecionado, tcFornecedores) of
                False : begin
                            FStatus                := abAlterar;
                            PesquisaFornecedores('','','','',FIdSelecionado);

                            carregaCamposSelecionados(ModelConexaoDados.memGenerica, 'ID_VEND, NOME_VEND, SOBRENOME_VEND','HBVENDEDOR','ORDER BY NOME_VEND');
                            ModelConexaoDados.memGenerica.First;
                            cbVendedores.Items.Clear;
                            cbVendedores.Items.Add('');
                            While not ModelConexaoDados.memGenerica.Eof do
                                begin
                                    cbVendedores.Items.AddObject(ModelConexaoDados.memGenerica.FieldByName('NOME_VEND').AsString + ' ' +
                                                                 ModelConexaoDados.memGenerica.FieldByName('SOBRENOME_VEND').AsString,
                                                                 TObject(ModelConexaoDados.memTerceirizada.FieldByName('ID_VEND').AsInteger));
                                    ModelConexaoDados.memGenerica.Next;
                                end;

                            carregaCamposSelecionados(ModelConexaoDados.memGenerica, 'ID_MARCA, MARCA_MARCA','HBMARCA','ORDER BY MARCA_MARCA');
                            listaMarcas(ModelConexaoDados.memGenerica, FIdSelecionado);

                            if ModelConexaoDados.memFornecedores.FieldByName('IDVEND_FORN').AsInteger > 0 then
                                cbVendedores.ItemIndex := cbVendedores.Items.IndexOf(ModelConexaoDados.memFornecedores.FieldByName('NOME_VEND').AsString + ' ' +
                                                                                     ModelConexaoDados.memFornecedores.FieldByName('SOBRENOME_VEND').AsString);

                            edtCNPJ.Text           := FormatarCNPJouCPF(ModelConexaoDados.memFornecedores.FieldByName('CNPJCPF_FORN').AsString);
                            edtIE.Text             := ModelConexaoDados.memFornecedores.FieldByName('IERG_FORN').AsString;
                            edtRazaoSocial.Text    := ModelConexaoDados.memFornecedores.FieldByName('NOME_FORN').AsString;
                            edtNomeFantasia.Text   := ModelConexaoDados.memFornecedores.FieldByName('PSEUDO_FORN').AsString;
                            edtLogradouro.Text     := ModelConexaoDados.memFornecedores.FieldByName('LOGRADOURO_FORN').AsString;
                            edtNumeroLog.Text      := ModelConexaoDados.memFornecedores.FieldByName('NRLOG_FORN').AsString;
                            edtComplementoLog.Text := ModelConexaoDados.memFornecedores.FieldByName('COMPLLOG_FORN').AsString;
                            edtBairroLog.Text      := ModelConexaoDados.memFornecedores.FieldByName('BAILOG_FORN').AsString;
                            edtCepLog.Text         := FormatarCEP(ModelConexaoDados.memFornecedores.FieldByName('CEPLOG_FORN').AsString);
                            edtCidadeLog.Text      := ModelConexaoDados.memFornecedores.FieldByName('CIDLOG_FORN').AsString;
                            edtUFLog.Text          := ModelConexaoDados.memFornecedores.FieldByName('UFLOG_FORN').AsString;

                            AlimentaClasseFornecedores;


                            ControlaBotoes(Self, False);
                            tabGerenciadorFornecedor.TabIndex := 1;
                            tabCabecarioFornecedor.Next;
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
                       'Selecione um profissional na lista para alterar!',
                       apTitulo, MB_OK + MB_ICONINFORMATION);
            Exit;
        end;
end;

procedure TfrmCadastroFornecedores.btnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadastroFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     BloqueiaRegistro(False, FIdSelecionado, tcFornecedores);
     FreeAndNil(gclFornecedor);
     Action := TCloseAction.caFree;
end;

procedure TfrmCadastroFornecedores.FormCreate(Sender: TObject);
begin
     CarregaPersonalizacaoCabecarioRodape(Self);
     tabCabecarioFornecedor.TabIndex   := 0;
     tabGerenciadorFornecedor.TabIndex := 0;
     gclFornecedor := TModelFornecedor.Create(Self);

     grdListaFornecedor.Cells[0,0] := 'CNPJ/CPF';
     grdListaFornecedor.Cells[1,0] := 'Razão Social';
     grdListaFornecedor.Cells[2,0] := 'Nome Fantasia';
     grdListaFornecedor.Cells[3,0] := 'Logradouro';
     grdListaFornecedor.Cells[4,0] := 'Nr.';
     grdListaFornecedor.Cells[5,0] := 'Complemento';
     grdListaFornecedor.Cells[6,0] := 'Bairro';
     grdListaFornecedor.Cells[7,0] := 'CEP';
     grdListaFornecedor.Cells[8,0] := 'Cidade';
     grdListaFornecedor.Cells[9,0] := 'UF';
end;

procedure TfrmCadastroFornecedores.listaMarcas(ATable : TFDMemTable; AIDForn : Integer);
var
ALayout : TLayout;
ACheckBox : TCheckBox;
FTable : TFDMemTable;
begin

    FScroll := TVertScrollBox.Create(nil);
    FScroll.Parent := recMarcas;
    FScroll.Align := TAlignLayout.Client;
    FScroll.Margins.Top    := 5;
    FScroll.Margins.Left   := 5;
    FScroll.Margins.Right  := 5;
    FScroll.Margins.Bottom := 5;

    try

        FTable := TFDMemTable.Create(nil);
        carregaCamposSelecionados(FTable,'*','HBFORNXMARCA','WHERE IDFORN_FORNXMARCA = ' + AIDForn.ToString);

        While not ATable.eof do
            begin
                ALayout := TLayout.Create(nil);
                ALayout.Parent := FScroll;
                ALayout.Align  := TAlignLayout.Top;
                ALayout.Height := 30;

                ACheckBox        := TCheckBox.Create(Self);
                ACheckBox.Parent := ALayout;
                ACheckBox.Align  := TAlignLayout.Client;
                ACheckBox.StyledSettings := ACheckBox.StyledSettings - [TStyledSetting.Size,
                                                                        TStyledSetting.FontColor,
                                                                        TStyledSetting.Family,
                                                                        TStyledSetting.Style];
                ACheckBox.FontColor  := StringToAlphaColor('#FF980000');
                ACheckBox.Font.Size  := 14;
                ACheckBox.Font.Style := [TFontStyle.fsBold];
                ACheckBox.Text       := ATable.FieldByName('MARCA_MARCA').AsString;
                ACheckBox.TagString  := ATable.FieldByName('ID_MARCA').AsString;

                FTable.Filtered := False;
                FTable.Filter   := 'IDMARCA_FORNXMARCA=' + ATable.FieldByName('ID_MARCA').AsString;
                FTable.Filtered := True;

                if FTable.RecordCount > 0 then
                   ACheckBox.IsChecked := True else
                   ACheckBox.IsChecked := False;

                ATable.Next;
            end;
    finally
        FreeAndNil(FTable);
    end;

end;

end.
