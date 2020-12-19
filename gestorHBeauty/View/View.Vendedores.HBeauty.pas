unit View.Vendedores.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, ACBrBase, ACBrValidador, FMX.Effects, FMX.Filter.Effects, FMX.StdCtrls, FMX.EditBox, FMX.NumberBox,
  FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSBaseGroup, FMX.TMSRadioGroup,
  FMX.Edit, FMX.TabControl, FMX.Controls.Presentation, FMX.TMSButton,

  Units.Consts.HBeauty,
  Units.Enumerados.HBeauty,
  Controller.Manipula.Design.HBeauty, Model.Vendedor.Servidor.HBeauty, Units.Utils.Dados.HBeauty, Units.Utils.HBeauty, Units.Strings.HBeauty, Controller.Formata.HBeauty;

type
  TfrmGerenciadorVendedores = class(TForm)
    recRodapeTerceirizada: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    tabCabecarioVendedor: TTabControl;
    tabPesquisa: TTabItem;
    recCabecarioVendedor: TRectangle;
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
    tabGerenciadorVendedores: TTabControl;
    tabListaVendedor: TTabItem;
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
    grdListaVendedor: TTMSFMXGrid;
    StyleBook1: TStyleBook;
    tabFichaVendedor: TTabItem;
    rgDados: TTMSFMXRadioGroup;
    Rectangle10: TRectangle;
    edtCPF: TEdit;
    Label10: TLabel;
    Rectangle12: TRectangle;
    edtRG: TEdit;
    Label11: TLabel;
    Rectangle13: TRectangle;
    edtNome: TEdit;
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
    StyleBook3: TStyleBook;
    FillRGBEffect2: TFillRGBEffect;
    ACBrValidador1: TACBrValidador;
    Rectangle1: TRectangle;
    edtSobreNome: TEdit;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure edtCPFKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtRGKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtNomeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLogradouroKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtNumeroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtComplementoLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtBairroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCepLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCidadeLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtUFLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCPFTyping(Sender: TObject);
    procedure grdListaVendedorCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure rgDadosKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtSobreNomeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCepLogTyping(Sender: TObject);
    procedure btnCadastraTelefoneClick(Sender: TObject);
    procedure btnCadastraEmailClick(Sender: TObject);
  private
    FIDSelecionado : Integer;
    FStatus : TAcaoBotao;
    procedure HabilitaTab(AHabilita: Boolean);
    procedure AlimentaClasseVendedores;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerenciadorVendedores: TfrmGerenciadorVendedores;

implementation

uses
  Units.Classes.HBeauty, Model.Vendedores.HBeauty, Model.Dados.Server.HBeauty,
  Winapi.Windows, FMX.Platform.Win, Units.Mensagens.HBeauty,
  Model.Endereco.HBeauty, View.Contatos.HBeauty;

{$R *.fmx}

procedure TfrmGerenciadorVendedores.AlimentaClasseVendedores;
begin
    gclVendedor.ID_VEND          := FIdSelecionado;
    gclVendedor.NOME_VEND        := edtNome.Text;
    gclVendedor.SOBRENOME_VEND   := edtSobreNome.Text;
    gclVendedor.CPF_VEND         := ApenasNumeros(edtCPF.Text);
    gclVendedor.RG_VEND          := edtRG.Text;

    gclVendedor.ENDERECO_VEND.LOGRADOURO  := edtLogradouro.Text;
    gclVendedor.ENDERECO_VEND.NRLOG       := edtNumeroLog.Text.ToInteger;
    gclVendedor.ENDERECO_VEND.BAIRROLOG   := edtBairroLog.Text;
    gclVendedor.ENDERECO_VEND.CIDADELOG   := edtCidadeLog.Text;
    gclVendedor.ENDERECO_VEND.UFLOG       := edtUFLog.Text;
    gclVendedor.ENDERECO_VEND.CEP         := edtCepLog.Text;
end;

procedure TfrmGerenciadorVendedores.btnAlterarClick(Sender: TObject);
begin
     if FIdSelecionado > 0 then
         begin
             Case BloqueiaRegistro(True, FIdSelecionado, tcVendedor) of
                  False : begin
                              FStatus                := abAlterar;
                              PesquisaVendedor('','','',FIdSelecionado);

                              edtCPF.Text            := FormatarCPF(ModelConexaoDados.memVendedores.FieldByName('CPF_VEND').AsString);
                              edtRG.Text             := ModelConexaoDados.memVendedores.FieldByName('RG_VEND').AsString;
                              edtNome.Text           := ModelConexaoDados.memVendedores.FieldByName('NOME_VEND').AsString;
                              edtSobreNome.Text      := ModelConexaoDados.memVendedores.FieldByName('SOBRENOME_VEND').AsString;
                              edtLogradouro.Text     := ModelConexaoDados.memVendedores.FieldByName('LOG_VEND').AsString;
                              edtNumeroLog.Text      := ModelConexaoDados.memVendedores.FieldByName('NRLOG_VEND').AsString;
                              edtComplementoLog.Text := ModelConexaoDados.memVendedores.FieldByName('COMPLOG_VEND').AsString;
                              edtBairroLog.Text      := ModelConexaoDados.memVendedores.FieldByName('BAILOG_VEND').AsString;
                              edtCepLog.Text         := FormatarCEP(ModelConexaoDados.memVendedores.FieldByName('CEPLOG_VEND').AsString);
                              edtCidadeLog.Text      := ModelConexaoDados.memVendedores.FieldByName('CIDLOG_VEND').AsString;
                              edtUFLog.Text          := ModelConexaoDados.memVendedores.FieldByName('UFLOG_VEND').AsString;

                              AlimentaClasseVendedores;

                              ControlaBotoes(Self, False);
                              HabilitaTab(True);
                              tabGerenciadorVendedores.TabIndex := 1;
                              lblNome.Text := edtNome.Text + ' ' + edtSobreNome.Text;
                              tabCabecarioVendedor.Next;
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
                        'Selecione um vendedor na lista para alterar!',
                        apTitulo, MB_OK + MB_ICONINFORMATION);
             Exit;
         end;
end;

procedure TfrmGerenciadorVendedores.btnCadastraEmailClick(Sender: TObject);
begin
     if FStatus = abIncluir then
        begin
            if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                         'Para cadastrar os e-mails é necessário primeiro salvar o vendedor.'+#13#13+
                         'Deseja salvar agora?', apTitulo, MB_YESNO + MB_ICONQUESTION) = IDYES then
                begin
                    FIdSelecionado := CadastraVendedor(gclVendedor);
                    ControlaBotoes(Self, True);

                    if FIdSelecionado <> 0 then
                       begin
                           Application.CreateForm(TfrmCadastroContatos, frmCadastroContatos);
                           frmCadastroContatos.TipoForm   := tfEmail;
                           frmCadastroContatos.IdRegTab   := FIdSelecionado;
                           frmCadastroContatos.NomeTabela := PrefixoTabela(tcVendedor);
                           frmCadastroContatos.Nome       := edtNome.Text + ' ' + edtSobreNome.Text;
                           frmCadastroContatos.Titulo     := 'Vendedor';
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
            frmCadastroContatos.NomeTabela := PrefixoTabela(tcVendedor);
            frmCadastroContatos.Nome       := edtNome.Text + ' ' + edtSobreNome.Text;
            frmCadastroContatos.Titulo     := 'Vendedor';
            frmCadastroContatos.TituloForm := 'Cadastro de E-mails';
            frmCadastroContatos.imgIconeForm.BitmapName := 'Email';
            frmCadastroContatos.ShowModal;
        end;
end;

procedure TfrmGerenciadorVendedores.btnCadastraTelefoneClick(Sender: TObject);
begin
    if FStatus = abIncluir then
        begin
            if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                         'Para cadastrar os telefones é necessário primeiro salvar o vendedor.'+#13#13+
                         'Deseja salvar agora?', 'HBeauty', MB_YESNO + MB_ICONQUESTION) = IDYES then
                begin
                    AlimentaClasseVendedores;
                    FIdSelecionado := CadastraVendedor(gclVendedor);

                    if FIdSelecionado <> 0 then
                        begin
                            Application.CreateForm(TfrmCadastroContatos, frmCadastroContatos);
                            frmCadastroContatos.TipoForm     := tfTelefone;
                            frmCadastroContatos.IdRegTab     := FIdSelecionado;
                            frmCadastroContatos.NomeTabela   := PrefixoTabela(tcVendedor);
                            frmCadastroContatos.Titulo       := 'Vendedor';
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
            frmCadastroContatos.NomeTabela := PrefixoTabela(tcVendedor);
            frmCadastroContatos.Nome       := edtNome.Text + ' ' + edtSobreNome.Text;
            frmCadastroContatos.Titulo     := 'Vendedor';
            frmCadastroContatos.imgIconeForm.BitmapName := 'Telefone';
            frmCadastroContatos.TituloForm := 'Cadastro de Telefone';

            frmCadastroContatos.ShowModal;
        end;
end;

procedure TfrmGerenciadorVendedores.btnCancelarClick(Sender: TObject);
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
                         tabCabecarioVendedor.TabIndex := 0;
                         tabGerenciadorVendedores.TabIndex := 0;
                         ControlaBotoes(Self, True);
                         Abort;
                     end;
     end;

     if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                   pChar(AMensagem), apTitulo, MB_YESNO + MB_ICONQUESTION) = IDYES then
         begin
             BloqueiaRegistro(False, FIdSelecionado, tcVendedor);
             LimpaForm(Self);
             HabilitaTab(False);
             tabCabecarioVendedor.TabIndex := 0;
             tabGerenciadorVendedores.TabIndex := 0;
             ControlaBotoes(Self, True);
         end;
end;

procedure TfrmGerenciadorVendedores.btnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfrmGerenciadorVendedores.btnIncluirClick(Sender: TObject);
begin
     HabilitaTab(True);
     LimpaForm(Self);
     ControlaBotoes(Self, False);
     FStatus := abIncluir;
     lblStatus.Text := 'Inclusão';
     tabCabecarioVendedor.Next;
     tabGerenciadorVendedores.ActiveTab := tabFichaVendedor;
end;

procedure TfrmGerenciadorVendedores.btnPesquisarClick(Sender: TObject);
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
          0 : PesquisaVendedor(edtPesquisaBase.Text,'',TipoPesquisa,0);
          1 : PesquisaVendedor('',ApenasNumeros(edtPesquisaBase.Text),TipoPesquisa,0);
     end;

     CarregaGrid(ModelConexaoDados.memVendedores,grdListaVendedor, AFieldsVendedores, ACaptionVendedores, ASizeColVendedores);

     if ModelConexaoDados.memVendedores.RecordCount > 0 then
        FIdSelecionado :=  ExtraiTextoGrid(grdListaVendedor.Cells[0, 1]).ToInteger;
end;

procedure TfrmGerenciadorVendedores.btnSalvarClick(Sender: TObject);
begin
    rResultado := '';
    case FStatus of
         abIncluir : begin
                         case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                         'Confirma a inclusão deste vendedor?',
                                         apTitulo, MB_YESNO + MB_ICONQUESTION) of
                             IDYES : begin
                                         AlimentaClasseVendedores;
                                         Try
                                            FIDSelecionado := cadastraVendedor(gclVendedor);

                                            case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                            'Vendedor cadastrado com sucesso.'+#13#13+
                                                            'Deseja cadastrar outro profissional?', apTitulo,
                                                             MB_YESNO + MB_ICONQUESTION) of
                                                IDYES : begin
                                                             FStatus := abIncluir;
                                                             LimpaForm(Self);
                                                             edtCPF.SetFocus;
                                                        end;
                                                 IDNO : begin
                                                             FStatus := abNulo;
                                                             tabGerenciadorVendedores.TabIndex := 0;
                                                             tabCabecarioVendedor.Previous;
                                                             HabilitaTab(False);
                                                             ControlaBotoes(Self, True);
                                                        end;
                                            end;

                                         Except
                                             On E:Exception do
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
         abAlterar : begin
                         case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                         'Confirma a alteração deste vendedor?',
                                         apTitulo, MB_YESNO + MB_ICONQUESTION) of
                             IDYES : begin
                                         try
                                             AlimentaClasseVendedores;
                                             rResultado := atualizaVendedor(gclVendedor);
                                             if rResultado = '' then
                                                 begin
                                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                'Registro salvo com sucesso!', apTitulo,
                                                                MB_OK + MB_ICONINFORMATION);
                                                     btnPesquisarClick(Self);
                                                     LimpaForm(Self);
                                                     HabilitaTab(False);
                                                     ControlaBotoes(Self, True);
                                                     tabCabecarioVendedor.Previous;
                                                     tabGerenciadorVendedores.TabIndex := 0;
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

procedure TfrmGerenciadorVendedores.edtBairroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtCidadeLog);
end;

procedure TfrmGerenciadorVendedores.edtCepLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
var
AEndereco : TModelEndereco;
begin
    if Key = VK_RETURN then
        begin
            try
                AEndereco := TModelEndereco.Create(Self);
                AEndereco := PesquisaCEP(Self, edtCepLog.Text);

                edtCepLog.Text     := FormatarCEP(AEndereco.CEP);
                edtLogradouro.Text := AEndereco.LOGRADOURO;
                edtBairroLog.Text  := AEndereco.BAIRROLOG;
                edtCidadeLog.Text  := AEndereco.CIDADELOG;
                edtUFLog.Text      := AEndereco.UFLOG;
                NextField(Key, edtLogradouro);
            finally
                AEndereco.DisposeOf;
            end;
        end;
end;

procedure TfrmGerenciadorVendedores.edtCepLogTyping(Sender: TObject);
begin
Formatar(edtCepLog,erCEP);
end;

procedure TfrmGerenciadorVendedores.edtCidadeLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtUFLog);
end;

procedure TfrmGerenciadorVendedores.edtComplementoLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtBairroLog);
end;

procedure TfrmGerenciadorVendedores.edtCPFExit(Sender: TObject);
begin
     if Length(ApenasNumeros(edtCPF.Text)) = 11 then
        edtCPF.Text := ACBrValidador.FormatarCPF(edtCPF.Text);
end;

procedure TfrmGerenciadorVendedores.edtCPFKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtRG);
end;

procedure TfrmGerenciadorVendedores.edtCPFTyping(Sender: TObject);
begin
Formatar(edtCPF, erCPF);
end;

procedure TfrmGerenciadorVendedores.edtLogradouroKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtNumeroLog);
end;

procedure TfrmGerenciadorVendedores.edtNomeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtSobreNome);
end;

procedure TfrmGerenciadorVendedores.edtNumeroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtComplementoLog);
end;

procedure TfrmGerenciadorVendedores.edtRGKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtNome);
end;

procedure TfrmGerenciadorVendedores.edtSobreNomeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtCepLog);
end;

procedure TfrmGerenciadorVendedores.edtUFLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtCPF);
end;

procedure TfrmGerenciadorVendedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     BloqueiaRegistro(False, FIdSelecionado, tcVendedor);
     FreeAndNil(gclVendedor);
     Action := TCloseAction.caFree;
end;

procedure TfrmGerenciadorVendedores.HabilitaTab(AHabilita : Boolean);
begin
     tabFichaVendedor.Visible := AHabilita;
     tabListaVendedor.Visible := not AHabilita;
end;


procedure TfrmGerenciadorVendedores.rgDadosKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtLogradouro);
end;

procedure TfrmGerenciadorVendedores.FormCreate(Sender: TObject);
begin
     CarregaPersonalizacaoCabecarioRodape(Self);
     HabilitaTab(False);
     tabCabecarioVendedor.TabIndex   := 0;
     tabGerenciadorVendedores.TabIndex := 0;
     gclVendedor := TModelVendedor.Create(Self);

     grdListaVendedor.Cells[0,0]  := 'Código';
     grdListaVendedor.Cells[1,0]  := 'CPF';
     grdListaVendedor.Cells[2,0]  := 'Nome';
     grdListaVendedor.Cells[3,0]  := 'SobreNome';
     grdListaVendedor.Cells[4,0]  := 'Logradouro';
     grdListaVendedor.Cells[5,0]  := 'Nr.';
     grdListaVendedor.Cells[6,0]  := 'Complemento';
     grdListaVendedor.Cells[7,0]  := 'Bairro';
     grdListaVendedor.Cells[8,0]  := 'CEP';
     grdListaVendedor.Cells[9,0]  := 'Cidade';
     grdListaVendedor.Cells[10,0] := 'UF';
end;

procedure TfrmGerenciadorVendedores.grdListaVendedorCellClick(Sender: TObject; ACol, ARow: Integer);
begin
FIdSelecionado := ExtraiTextoGrid(grdListaVendedor.Cells[0, ARow]).ToInteger;
end;

end.
