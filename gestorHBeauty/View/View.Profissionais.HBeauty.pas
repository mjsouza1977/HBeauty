unit View.Profissionais.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TMSBaseGroup, FMX.TMSRadioGroup, FMX.Edit, FMX.TMSButton, FMX.TMSBaseControl, FMX.TMSGridCell,
  FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.TabControl,
  FMX.TMSListEditor, FMX.TMSCustomEdit, FMX.TMSEdit, FMX.TMSLabelEdit, FMX.ListBox, FMX.EditBox, FMX.NumberBox,
  Units.Utils.HBeauty, Model.Profissionais.HBeauty, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  Model.Dados.Server.HBeauty, ACBrBase, ACBrValidador,  Model.Contatos.Servidor.HBeauty,
  Units.Enumerados.HBeauty, View.Loading.HBeauty, FMX.TMSCustomPicker, FMX.TMSCheckGroupPicker, FMX.TMSCheckGroup, FMX.TMSBitmapContainer, FMX.TMSRichEditorEmoticons,
  FireDAC.Comp.Client, Model.Endereco.HBeauty, FMX.Effects, FMX.Filter.Effects, Controller.Formata.HBeauty, Model.Terceirizada.HBeauty,
  Model.Terceirizadas.Servidor.HBeauty, Units.Consts.HBeauty, Units.Mensagens.HBeauty, Model.Vendedor.Servidor.HBeauty;

type
  TfrmGerenciadorProfissionais = class(TForm)
    recRodapeGerenciadorProfissionais: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    recCabecarioGerenciadoProfissionais: TRectangle;
    btnPesquisar: TTMSFMXButton;
    Label1: TLabel;
    Rectangle6: TRectangle;
    edtPesquisaBase: TEdit;
    rbOperador: TTMSFMXRadioGroup;
    rbPor: TTMSFMXRadioGroup;
    tabCabecarioProfissionais: TTabControl;
    tabPesquisa: TTabItem;
    tabDados: TTabItem;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    ACBrValidador1: TACBrValidador;
    tabGerenciadorProfissionais: TTabControl;
    tabListaProfissionais: TTabItem;
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
    grdListaProfissionais: TTMSFMXGrid;
    StyleBook1: TStyleBook;
    tabFichaProfissional: TTabItem;
    rgDados: TTMSFMXRadioGroup;
    gbTerceirizada: TGroupBox;
    Rectangle1: TRectangle;
    edtNome: TEdit;
    Label2: TLabel;
    Rectangle10: TRectangle;
    edtCPF: TEdit;
    Label10: TLabel;
    Rectangle12: TRectangle;
    edtRG: TEdit;
    Label11: TLabel;
    Rectangle13: TRectangle;
    edtSobreNome: TEdit;
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
    Rectangle3: TRectangle;
    Label4: TLabel;
    lblNome: TLabel;
    Label13: TLabel;
    lblStatus: TLabel;
    Image1: TImage;
    FillRGBEffect1: TFillRGBEffect;
    Label14: TLabel;
    FotoProfissional: TCircle;
    opFile: TOpenDialog;
    Rectangle14: TRectangle;
    cbEmpresaTerceirizada: TComboBox;
    tabCargoSalario: TTabItem;
    recHabilidades: TRectangle;
    vsbHabilidades: TVertScrollBox;
    lytModelo: TLayout;
    CheckBox6: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCadastraTelefoneClick(Sender: TObject);
    procedure btnCadastraEmailClick(Sender: TObject);
    procedure edtCPFKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtRGKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtNomeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtSobreNomeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCepLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLogradouroKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtNumeroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtComplementoLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtBairroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCidadeLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtUFLogKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure grdListaProfissionaisCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure edtCPFExit(Sender: TObject);
    procedure edtCepLogExit(Sender: TObject);
    procedure edtCPFTyping(Sender: TObject);
    procedure edtCepLogTyping(Sender: TObject);
    procedure FotoProfissionalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FStatus : TAcaoBotao;
    FIdSelecionado : Integer;
    FQtdeHabilidades : Integer;
    procedure HabilitaTab(AHabilita : Boolean);
    function CarregaListaHabilidades(ADataSet : TFDMemTable; ADataSetEdit : TFDMemTable = nil) : Integer;
//    procedure gravaHabilidadesSelecionadas;

  public
    procedure AlimentaClasseProfissional;

  end;

var
  frmGerenciadorProfissionais: TfrmGerenciadorProfissionais;
  lcScrollListaHabilidade : TVertScrollBox;
implementation

{$R *.fmx}

uses
    Units.Classes.HBeauty,
    Model.Profissionais.Servidor.HBeauty,
    Units.Strings.HBeauty, Winapi.Windows,
    FMX.Platform.Win, Units.Utils.Dados.HBeauty,
    System.UIConsts,
    Controller.Manipula.Design.HBeauty,
    Model.Genericos.Servidor.HBeauty,
    Model.Imagens.Servidor.HBeauty,
    View.Principal.HBeauty,
    View.Contatos.HBeauty;


//procedure TfrmGerenciadorProfissionais.gravaHabilidadesSelecionadas;
//var
//    AIndex : Integer;
//begin
//    for AIndex := 0 to FQtdeHabilidades - 1 do
//        begin
//            if TCheckBox(Self.FindComponent('chkHabilidade' + AIndex.ToString)).IsChecked then
//                cadastraHabilidadeProfissional(TCheckBox(Self.FindComponent('chkHabilidade' + AIndex.ToString)).TagString.ToInteger, FIdSelecionado);
//        end;
//end;

function TfrmGerenciadorProfissionais.CarregaListaHabilidades(ADataSet : TFDMemTable; ADataSetEdit : TFDMemTable = nil) : Integer;
var
ALayout   : TLayout;
ACheckBox : TCheckBox;
AIndex    : Integer;
begin


     lcScrollListaHabilidade := TVertScrollBox.Create(Self);
     lcScrollListaHabilidade.Parent := recHabilidades;
     lcScrollListaHabilidade.Align  := TAlignLayout.Client;
     lcScrollListaHabilidade.Margins.Left   := 5;
     lcScrollListaHabilidade.Margins.Right  := 5;
     lcScrollListaHabilidade.Margins.Top    := 5;
     lcScrollListaHabilidade.Margins.Bottom := 5;

     AIndex := 0;
     ADataSet.First;

     while not ADataSet.Eof do
         begin
             ALayout := TLayout.Create(nil);
             ALayout.Parent := lcScrollListaHabilidade;
             ALayout.Align  := TAlignLayout.Top;
             ALayout.Height := 35;

             ACheckBox := TCheckBox.Create(Self);
             ACheckBox.Parent := ALayout;
             ACheckBox.Align  := TAlignLayout.Right;
             ACheckBox.Width  := 20;
             ACheckBox.Text   := '';
             ACheckBox.Margins.Left  := 5;
             ACheckBox.Margins.Right := 5;
             ACheckBox.TagString     := 'F';
             ACheckBox.Name          := 'chkFeminino' + ADataSet.FieldByName('ID_HABILIDADE').AsString;


             ACheckBox := TCheckBox.Create(Self);
             ACheckBox.Parent := ALayout;
             ACheckBox.Align  := TAlignLayout.Right;
             ACheckBox.Width  := 20;
             ACheckBox.Text   := '';
             ACheckBox.Margins.Left  := 5;
             ACheckBox.Margins.Right := 5;
             ACheckBox.TagString     := 'M';
             ACheckBox.Name          := 'chkMasculino' + ADataSet.FieldByName('ID_HABILIDADE').AsString;

             ACheckBox := TCheckBox.Create(Self);
             ACheckBox.Parent := ALayout;
             ACheckBox.Align  := TAlignLayout.Client;
             ACheckBox.Margins.Left  := 10;
             ACheckBox.Margins.Right := 5;
             ACheckBox.Text      := ADataSet.FieldByName('NOME_HABILIDADE').AsString;
             ACheckBox.TagString := ADataSet.FieldByName('ID_HABILIDADE').AsString;
             ACheckBox.IsChecked := False;
             ACheckBox.StyledSettings := ACheckBox.StyledSettings - [TStyledSetting.Size,
                                                                     TStyledSetting.FontColor,
                                                                     TStyledSetting.Family,
                                                                     TStyledSetting.Style];
             ACheckBox.FontColor  := StringToAlphaColor('#FF980000');
             ACheckBox.Font.Size  := 14;
             ACheckBox.Font.Style := [TFontStyle.fsBold];
             ACheckBox.Name       := 'chkHabilidade' + AIndex.ToString;
             AIndex := AIndex + 1;
             if ADataSetEdit <> nil then
                 begin
                     ADataSetEdit.Filtered := False;
                     if ADataSetEdit.RecordCount > 0 then
                         begin
                              ADataSetEdit.Filter   := 'IDHABIL_PROFXHABIL=' + QuotedStr(ADataSet.FieldByName('ID_HABILIDADE').AsString);
                              ADataSetEdit.Filtered := True;
                              if ADataSetEdit.RecordCount > 0 then
                                  begin
                                      TCheckBox(frmGerenciadorProfissionais.FindComponent('chkHabilidade' + (AIndex - 1).ToString)).IsChecked := True;

                                      TCheckBox(frmGerenciadorProfissionais.FindComponent('chkMasculino' + (AIndex - 1).ToString)).IsChecked  :=
                                                StringToBool('T','F',ADataSet.FieldByName('MASCULINO_PROFXHABIL').AsString);

                                      TCheckBox(frmGerenciadorProfissionais.FindComponent('chkFeminino' + (AIndex - 1).ToString)).IsChecked  :=
                                                StringToBool('T','F',ADataSet.FieldByName('FEMININO_PROFXHABIL').AsString);
                                  end
                              else
                                  begin
                                      TCheckBox(frmGerenciadorProfissionais.FindComponent('chkHabilidade' + (AIndex - 1).ToString)).IsChecked := False;
                                      TCheckBox(frmGerenciadorProfissionais.FindComponent('chkMasculino' + (AIndex - 1).ToString)).IsChecked  := False;
                                      TCheckBox(frmGerenciadorProfissionais.FindComponent('chkFeminino' + (AIndex - 1).ToString)).IsChecked  := False;
                                  end;
                         end;
                 end;

             ADataSet.Next;
         end;
     Result := AIndex;
end;

procedure TfrmGerenciadorProfissionais.AlimentaClasseProfissional;
begin
    gclProfissional.ID_PROFIS          := FIdSelecionado;
    gclProfissional.IDCARGO_PROFISS    := 0;
    gclProfissional.NOME_PROFIS        := edtNome.Text;
    gclProfissional.SOBRENOME_PROFIS   := edtSobreNome.Text;
    gclProfissional.CPF_PROFIS         := ApenasNumeros(edtCPF.Text);
    gclProfissional.RG_PROFIS          := edtRG.Text;

    gclProfissional.ENDERECO_PROFIS.LOGRADOURO  := edtLogradouro.Text;
    gclProfissional.ENDERECO_PROFIS.NRLOG       := edtNumeroLog.Text.ToInteger;
    gclProfissional.ENDERECO_PROFIS.BAIRROLOG   := edtBairroLog.Text;
    gclProfissional.ENDERECO_PROFIS.CIDADELOG   := edtCidadeLog.Text;
    gclProfissional.ENDERECO_PROFIS.UFLOG       := edtUFLog.Text;
    gclProfissional.ENDERECO_PROFIS.CEP         := edtCepLog.Text;
end;

procedure TfrmGerenciadorProfissionais.HabilitaTab(AHabilita : Boolean);
begin

     tabFichaProfissional.Visible  := AHabilita;
     tabCargoSalario.Visible       := AHabilita;
     tabListaProfissionais.Visible := not AHabilita;

end;

procedure TfrmGerenciadorProfissionais.btnAlterarClick(Sender: TObject);
begin
     if FIdSelecionado > 0 then
         begin
             Case BloqueiaRegistro(True, FIdSelecionado,tcProfissionais) of
                  False : begin
                              FStatus                := abAlterar;
                              ListaProfissionais('','','',0,FIdSelecionado);
                              //carregaHabilidadesProfissional(FIdSelecionado);

                              edtCPF.Text            := FormatarCNPJouCPF(ModelConexaoDados.memProfissionais.FieldByName('CPF_PROFIS').AsString);
                              edtRG.Text             := ModelConexaoDados.memProfissionais.FieldByName('RG_PROFIS').AsString;
                              edtNome.Text           := ModelConexaoDados.memProfissionais.FieldByName('NOME_PROFIS').AsString;
                              edtSobreNome.Text      := ModelConexaoDados.memProfissionais.FieldByName('SOBRENOME_PROFIS').AsString;
                              edtLogradouro.Text     := ModelConexaoDados.memProfissionais.FieldByName('LOGRADOURO_PROFIS').AsString;
                              edtNumeroLog.Text      := ModelConexaoDados.memProfissionais.FieldByName('NRLOG_PROFIS').AsString;
                              edtComplementoLog.Text := ModelConexaoDados.memProfissionais.FieldByName('COMPLLOG_PROFIS').AsString;
                              edtBairroLog.Text      := ModelConexaoDados.memProfissionais.FieldByName('BAIRROLOG_PROFIS').AsString;
                              edtCepLog.Text         := FormatarCEP(ModelConexaoDados.memProfissionais.FieldByName('CEP_PROFIS').AsString);
                              edtCidadeLog.Text      := ModelConexaoDados.memProfissionais.FieldByName('CIDADELOG_PROFIS').AsString;
                              edtUFLog.Text          := ModelConexaoDados.memProfissionais.FieldByName('UFLOG_PROFIS').AsString;
                              cbEmpresaTerceirizada.ItemIndex := cbEmpresaTerceirizada.Items.IndexOf(ModelConexaoDados.memProfissionais.FieldByName('FANTASIA_TERCEIRIZADA').AsString);
                              if ModelConexaoDados.memProfissionais.FieldByName('NOMEFILEIMAGEM').AsString <> '' then
                                  begin
                                      FotoProfissional.Fill.Bitmap.Bitmap.LoadFromFile(ctrPATH_FOTOS + ModelConexaoDados.memProfissionais.FieldByName('NOMEFILEIMAGEM').AsString);
                                      gclProfissional.IMAGENS.NOMEFILEIMAGEM := ModelConexaoDados.memProfissionais.FieldByName('NOMEFILEIMAGEM').AsString;
                                  end
                              else
                                  begin
                                      FotoProfissional.Fill.Bitmap.Bitmap := nil;
                                      gclProfissional.IMAGENS.NOMEFILEIMAGEM := '';
                                  end;


                              AlimentaClasseProfissional;

                              carregaHabilidades;

                              ControlaBotoes(Self, False);
                              HabilitaTab(True);
                              tabGerenciadorProfissionais.TabIndex := 1;
                              tabCabecarioProfissionais.Next;
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

procedure TfrmGerenciadorProfissionais.btnCancelarClick(Sender: TObject);
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
                         HabilitaTab(False);
                         tabCabecarioProfissionais.TabIndex := 0;
                         tabGerenciadorProfissionais.TabIndex := 0;
                         ControlaBotoes(Self, True);
                         Abort;
                     end;
     end;

     if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                   pChar(AMensagem), apTitulo, MB_YESNO + MB_ICONQUESTION) = IDYES then
         begin
             lcScrollListaHabilidade.DisposeOf;
             LimpaForm(Self);
             HabilitaTab(False);
             tabCabecarioProfissionais.TabIndex := 0;
             tabGerenciadorProfissionais.TabIndex := 0;
             ControlaBotoes(Self, True);
             BloqueiaRegistro(False, FIdSelecionado, tcProfissionais);
         end;

end;

procedure TfrmGerenciadorProfissionais.btnFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmGerenciadorProfissionais.btnIncluirClick(Sender: TObject);
begin
     HabilitaTab(True);
     LimpaForm(Self);
     ControlaBotoes(Self, False);
     FStatus := abIncluir;
     lblStatus.Text := 'Inclusão';
     tabCabecarioProfissionais.Next;
     tabGerenciadorProfissionais.ActiveTab := tabFichaProfissional;
end;

procedure TfrmGerenciadorProfissionais.btnPesquisarClick(Sender: TObject);
var
TipoPesquisa : String;
begin

     case rbOperador.ItemIndex of
          0 : TipoPesquisa := tpInicia;
          1 : TipoPesquisa := tpTermina;
          2 : TipoPesquisa := tpContenha;
          3 : TipoPesquisa := tpIgual;
     end;

     case rbPor.ItemIndex of
          0 : ListaProfissionais(edtPesquisaBase.Text,'',TipoPesquisa,0,0);
          1 : ListaProfissionais('',ApenasNumeros(edtPesquisaBase.Text),TipoPesquisa,0,0);
     end;

     CarregaGrid(ModelConexaoDados.memProfissionais,grdListaProfissionais,AFieldsProfissionais, ACaptionProfissionais, ASizeColProfissionais);

     if ModelConexaoDados.memProfissionais.RecordCount > 0 then
        FIdSelecionado :=  ExtraiTextoGrid(grdListaProfissionais.Cells[0, 1]).ToInteger;
end;

procedure TfrmGerenciadorProfissionais.btnSalvarClick(Sender: TObject);
begin
    rResultado := '';
    case FStatus of
         abIncluir : begin
                         case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                         'Confirma a inclusão deste profissional?',
                                         apTitulo, MB_YESNO + MB_ICONQUESTION) of
                             IDYES : begin
                                         AlimentaClasseProfissional;
                                         gclProfissional.IDEMPTER_PROFIS := Integer(cbEmpresaTerceirizada.Items.Objects[cbEmpresaTerceirizada.ItemIndex]);
                                         Try
                                            FIdSelecionado := CadastraProfissional(gclProfissional, Self);
                                            //apagaHabilidadesProfissional(FIdSelecionado);
                                            //gravaHabilidadesSelecionadas;

                                            case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                            'Profissional cadastrado com sucesso.'+#13#13+
                                                            'Deseja cadastrar outro profissional?', apTitulo,
                                                             MB_YESNO + MB_ICONQUESTION) of
                                                IDYES : begin
                                                             lcScrollListaHabilidade.DisposeOf;
                                                             FStatus := abIncluir;
                                                             LimpaForm(Self);
                                                             edtCPF.SetFocus;
                                                        end;
                                                 IDNO : begin
                                                             lcScrollListaHabilidade.DisposeOf;
                                                             FStatus := abNulo;
                                                             tabGerenciadorProfissionais.TabIndex := 0;
                                                             tabCabecarioProfissionais.Previous;
                                                             HabilitaTab(False);
                                                             ControlaBotoes(Self, True);
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
                                         'Confirma a alteração deste profissional?',
                                         apTitulo, MB_YESNO + MB_ICONQUESTION) of
                             IDYES : begin
                                         try
                                             AlimentaClasseProfissional;
                                             gclProfissional.IDEMPTER_PROFIS := Integer(cbEmpresaTerceirizada.Items.Objects[cbEmpresaTerceirizada.ItemIndex]);
                                             rResultado := AtualizaProfissional(gclProfissional);
                                             if rResultado = '' then
                                                 begin
                                                     //apagaHabilidadesProfissional(FIdSelecionado);
                                                     //gravaHabilidadesSelecionadas;
                                                     BloqueiaRegistro(False, FIdSelecionado, tcProfissionais);
                                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                'Registro salvo com sucesso!', apTitulo,
                                                                MB_OK + MB_ICONINFORMATION);
                                                     btnPesquisarClick(Self);
                                                     lcScrollListaHabilidade.DisposeOf;
                                                     LimpaForm(Self);
                                                     HabilitaTab(False);
                                                     ControlaBotoes(Self, True);
                                                     tabCabecarioProfissionais.Previous;
                                                     tabGerenciadorProfissionais.TabIndex := 0;
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

procedure TfrmGerenciadorProfissionais.edtBairroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtCidadeLog);
end;

procedure TfrmGerenciadorProfissionais.edtCepLogExit(Sender: TObject);
var
AEndereco : TModelEndereco;
begin
   try
       AEndereco := TModelEndereco.Create(Self);
       AEndereco := PesquisaCEP(Self, edtCepLog.Text);

       edtCepLog.Text     := AEndereco.CEP;
       edtLogradouro.Text := AEndereco.LOGRADOURO;
       edtBairroLog.Text  := AEndereco.BAIRROLOG;
       edtCidadeLog.Text  := AEndereco.CIDADELOG;
       edtUFLog.Text      := AEndereco.UFLOG;
   finally
       AEndereco.DisposeOf;
   end;
end;

procedure TfrmGerenciadorProfissionais.edtCepLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtLogradouro);
end;

procedure TfrmGerenciadorProfissionais.edtCepLogTyping(Sender: TObject);
begin
Formatar(edtCepLog, erCEP);
end;

procedure TfrmGerenciadorProfissionais.edtCidadeLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtUFLog);
end;

procedure TfrmGerenciadorProfissionais.edtComplementoLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtBairroLog);
end;

procedure TfrmGerenciadorProfissionais.edtCPFExit(Sender: TObject);
begin
     if Length(ApenasNumeros(edtCPF.Text)) = 11 then
        edtCPF.Text := ACBrValidador.FormatarCPF(edtCPF.Text);
end;

procedure TfrmGerenciadorProfissionais.edtCPFKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtRG);
end;

procedure TfrmGerenciadorProfissionais.edtCPFTyping(Sender: TObject);
begin
Formatar(edtCPF, erCPF);
end;

procedure TfrmGerenciadorProfissionais.edtLogradouroKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

     NextField(Key, edtNumeroLog);

end;

procedure TfrmGerenciadorProfissionais.edtNomeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtSobreNome);
end;

procedure TfrmGerenciadorProfissionais.edtNumeroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtComplementoLog);
end;

procedure TfrmGerenciadorProfissionais.edtRGKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtNome);
end;

procedure TfrmGerenciadorProfissionais.edtSobreNomeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtCepLog);
end;

procedure TfrmGerenciadorProfissionais.edtUFLogKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, cbEmpresaTerceirizada);
end;

procedure TfrmGerenciadorProfissionais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     BloqueiaRegistro(False, FIdSelecionado, tcProfissionais);
     FreeAndNil(gclProfissional);
     Action := TCloseAction.caFree;
end;

procedure TfrmGerenciadorProfissionais.FormCreate(Sender: TObject);
begin
     CarregaPersonalizacaoCabecarioRodape(Self);
     HabilitaTab(False);
     tabCabecarioProfissionais.TabIndex   := 0;
     tabGerenciadorProfissionais.TabIndex := 0;
     gclProfissional := TModelProfissionais.Create(Self);

     CarregaGrid(nil,grdListaProfissionais,AFieldsProfissionais, ACaptionProfissionais, ASizeColProfissionais, True);

end;

procedure TfrmGerenciadorProfissionais.FormShow(Sender: TObject);
begin
     CarregaCamposTerceirizada('ID_TERCEIRIZADA, FANTASIA_TERCEIRIZADA');
     carregaCargos;
     ModelConexaoDados.memTerceirizada.First;
     cbEmpresaTerceirizada.Items.Clear;
     cbEmpresaTerceirizada.Items.Add('');
     while not ModelConexaoDados.memTerceirizada.Eof do
          begin
              cbEmpresaTerceirizada.Items.AddObject(ModelConexaoDados.memTerceirizada.FieldByName('FANTASIA_TERCEIRIZADA').AsString ,
                                                    TObject(ModelConexaoDados.memTerceirizada.FieldByName('ID_TERCEIRIZADA').AsInteger));
              ModelConexaoDados.memTerceirizada.Next;
          end;
end;

procedure TfrmGerenciadorProfissionais.FotoProfissionalClick(Sender: TObject);
var
ANomeImagem, AExtensao : String;
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
                    if TamanhoImagem(opFile.FileName) <> ctrSIZE_FOTO_PES then
                        begin
                            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                      pChar('O arquivo da foto deve ser no formato de ' + ctrSIZE_FOTO_PES + '!'),
                                      apTitulo, MB_OK + MB_ICONEXCLAMATION);
                            Exit;
                        end
                    else
                        begin
                             if gclProfissional.IMAGENS.NOMEFILEIMAGEM = '' then
                                 begin
                                     ANomeImagem := AtualizaFotoProfissional(gclProfissional.ID_PROFIS, GravaImagem(pxFotoPessoa,AExtensao));
                                     if ANomeImagem <> '' then
                                         begin
                                             CopyFile(pChar(opFile.FileName), pChar(ctrPATH_FOTOS + ANomeImagem), False);
                                             FotoProfissional.Fill.Bitmap.Bitmap.LoadFromFile(ctrPATH_FOTOS + ANomeImagem);
                                         end
                                     else
                                         begin
                                             MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                        'Não foi possível salvar os dados da imagem, tente novamente!',
                                                        apTitulo, MB_OK + MB_ICONEXCLAMATION);
                                             Exit;
                                         end;
                                 end
                             else
                                 begin
                                     CopyFile(pChar(opFile.FileName), pChar(ctrPATH_FOTOS + ANomeImagem), False);
                                     FotoProfissional.Fill.Bitmap.Bitmap.LoadFromFile(ctrPATH_FOTOS + ANomeImagem);
                                 end;
                        end;
                end;
        end;
end;

procedure TfrmGerenciadorProfissionais.grdListaProfissionaisCellClick(Sender: TObject; ACol, ARow: Integer);
begin
FIdSelecionado := ExtraiTextoGrid(grdListaProfissionais.Cells[0, ARow]).ToInteger;
end;

procedure TfrmGerenciadorProfissionais.btnCadastraTelefoneClick(Sender: TObject);
begin

    if FStatus = abIncluir then
        begin
            if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                         'Para cadastrar os telefones é necessário primeiro salvar o profissional'+#13#13+
                         'Deseja salvar agora?', 'HBeauty', MB_YESNO + MB_ICONQUESTION) = IDYES then
                begin
                    AlimentaClasseProfissional;
                    FIdSelecionado := CadastraProfissional(gclProfissional, Self);

                    if FIdSelecionado <> 0 then
                        begin
                            Application.CreateForm(TfrmCadastroContatos, frmCadastroContatos);
                            frmCadastroContatos.TipoForm     := tfTelefone;
                            frmCadastroContatos.IdRegTab     := FIdSelecionado;
                            frmCadastroContatos.NomeTabela   := PrefixoTabela(tcProfissionais);
                            frmCadastroContatos.Titulo       := 'Profissional';
                            frmCadastroContatos.TituloForm   := 'Cadastro de Telefone';
                            frmCadastroContatos.imgIconeForm.BitmapName := 'Telefone';
                            frmCadastroContatos.ShowModal;
                            FStatus := abNulo;
                        end;
                end;
        end
    else
        begin
            Application.CreateForm(TfrmCadastroContatos, frmCadastroContatos);
            frmCadastroContatos.TipoForm   := tfTelefone;
            frmCadastroContatos.IdRegTab   := FIdSelecionado;
            frmCadastroContatos.NomeTabela := PrefixoTabela(tcProfissionais);
            frmCadastroContatos.Nome       := edtNome.Text + ' ' + edtSobreNome.Text;
            frmCadastroContatos.Titulo     := 'Profissional';
            frmCadastroContatos.imgIconeForm.BitmapName := 'Telefone';
            frmCadastroContatos.TituloForm := 'Cadastro de Telefone';

            frmCadastroContatos.ShowModal;
        end;

end;

procedure TfrmGerenciadorProfissionais.btnCadastraEmailClick(Sender: TObject);
begin

     if FStatus = abIncluir then
        begin
            if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                         'Para cadastrar os e-mails é necessário primeiro salvar o profissional'+#13#13+
                         'Deseja salvar agora?', apTitulo, MB_YESNO + MB_ICONQUESTION) = IDYES then
                begin
                    FIdSelecionado := CadastraProfissional(gclProfissional, Self);
                    ControlaBotoes(Self, True);

                    if FIdSelecionado <> 0 then
                       begin
                           Application.CreateForm(TfrmCadastroContatos, frmCadastroContatos);
                           frmCadastroContatos.TipoForm   := tfEmail;
                           frmCadastroContatos.IdRegTab   := FIdSelecionado;
                           frmCadastroContatos.NomeTabela := PrefixoTabela(tcProfissionais);
                           frmCadastroContatos.Nome       := edtNome.Text + ' ' + edtSobreNome.Text;
                           frmCadastroContatos.Titulo     := 'Profissional';
                           frmCadastroContatos.TituloForm := 'Cadastro de E-mails';
                           frmCadastroContatos.imgIconeForm.BitmapName := 'Email';
                           frmCadastroContatos.ShowModal;
                       end;
                end;
        end
    else
        begin
            Application.CreateForm(TfrmCadastroContatos, frmCadastroContatos);
            frmCadastroContatos.TipoForm   := tfEmail;
            frmCadastroContatos.IdRegTab   := FIdSelecionado;
            frmCadastroContatos.NomeTabela := PrefixoTabela(tcProfissionais);
            frmCadastroContatos.Nome       := edtNome.Text + ' ' + edtSobreNome.Text;
            frmCadastroContatos.Titulo     := 'Profissional';
            frmCadastroContatos.TituloForm := 'Cadastro de E-mails';
            frmCadastroContatos.imgIconeForm.BitmapName := 'Email';
            frmCadastroContatos.ShowModal;
        end;

end;

end.
