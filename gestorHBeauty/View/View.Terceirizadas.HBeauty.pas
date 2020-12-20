unit View.Terceirizadas.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, ACBrBase, ACBrValidador, FMX.StdCtrls, FMX.Layouts, FMX.EditBox, FMX.NumberBox, FMX.ListBox,
  FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.TMSBaseControl, FMX.TMSBaseGroup, FMX.TMSRadioGroup, FMX.Edit,
  FMX.TabControl, FMX.Controls.Presentation, FMX.TMSButton, Model.Terceirizadas.Servidor.HBeauty, Units.Strings.HBeauty, Units.Utils.Dados.HBeauty, Units.Utils.HBeauty,
  Units.Enumerados.HBeauty, Model.Profissionais.Servidor.HBeauty, FMX.Effects, FMX.Filter.Effects, Controller.Formata.HBeauty, Units.Mensagens.HBeauty;

type
  TfrmGerenciadorTerceirizadas = class(TForm)
    recRodapeTerceirizada: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    tabCabecarioTerceirizada: TTabControl;
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
    tabGerenciadorTerceirizada: TTabControl;
    tabListaTerceirizadas: TTabItem;
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
    grdListaTerceirizada: TTMSFMXGrid;
    StyleBook1: TStyleBook;
    tabFichaTerceirizada: TTabItem;
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
    tabListaProfissionaisTerceirizados: TTabItem;
    ACBrValidador1: TACBrValidador;
    grdListaProfissionalTerceirizado: TTMSFMXGrid;
    FillRGBEffect2: TFillRGBEffect;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure grdListaTerceirizadaCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCadastraTelefoneClick(Sender: TObject);
    procedure btnCadastraEmailClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtCNPJKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtIEKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtRazaoSocialKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtNomeFantasiaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCepLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLogradouroKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtNumeroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtComplementoLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtBairroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCidadeLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtUFLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCNPJExit(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCNPJTyping(Sender: TObject);
    procedure edtCepLogTyping(Sender: TObject);
    procedure tabListaProfissionaisTerceirizadosClick(Sender: TObject);
  private
    FIdSelecionado : Integer;
    FStatus : TAcaoBotao;
    procedure HabilitaTab(AHabilita: Boolean);
    procedure AlimentaClasseTerceirizada;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerenciadorTerceirizadas: TfrmGerenciadorTerceirizadas;

implementation

uses
  Units.Classes.HBeauty,
  Controller.Manipula.Design.HBeauty, Model.Terceirizada.HBeauty, Model.Dados.Server.HBeauty,
  Units.Consts.HBeauty, Winapi.Windows, FMX.Platform.Win, View.Contatos.HBeauty,
  Model.Endereco.HBeauty;

{$R *.fmx}

procedure TfrmGerenciadorTerceirizadas.HabilitaTab(AHabilita : Boolean);
begin

     tabFichaTerceirizada.Visible  := AHabilita;
     tabListaProfissionaisTerceirizados.Visible := AHabilita;
     tabListaTerceirizadas.Visible := not AHabilita;

end;

procedure TfrmGerenciadorTerceirizadas.tabListaProfissionaisTerceirizadosClick(Sender: TObject);
begin
    if FIdSelecionado < 0 then
        begin
            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                       'Selecione uma empresa na lista para para vizualizar os profissionais vinculados!',
                       'HBeauty', MB_OK + MB_ICONINFORMATION);
             Exit;
        end
    else
        begin
            ListaProfissionais('','','',FIdSelecionado,0);
            CarregaGrid(ModelConexaoDados.memProfissionais,grdListaProfissionalTerceirizado,AFieldsProfissionais, ACaptionProfissionais, ASizeColProfissionais);
        end;
end;

procedure TfrmGerenciadorTerceirizadas.btnAlterarClick(Sender: TObject);
begin
     if FIdSelecionado > 0 then
         begin
             ListaTerceirizadas('','','','',FIdSelecionado);
             edtCNPJ.Text           := FormatarCNPJouCPF(ModelConexaoDados.memTerceirizada.FieldByName('CNPJ_TERCEIRIZADA').AsString);
             edtIE.Text             := ModelConexaoDados.memTerceirizada.FieldByName('IE_TERCEIRIZADA').AsString;
             edtRazaoSocial.Text    := ModelConexaoDados.memTerceirizada.FieldByName('RAZAO_TERCEIRIZADA').AsString;
             edtNomeFantasia.Text   := ModelConexaoDados.memTerceirizada.FieldByName('FANTASIA_TERCEIRIZADA').AsString;
             edtLogradouro.Text     := ModelConexaoDados.memTerceirizada.FieldByName('LOGLOG_TERCEIRIZADA').AsString;
             edtNumeroLog.Text      := ModelConexaoDados.memTerceirizada.FieldByName('NRLOG_TERCEIRIZADA').AsString;
             edtComplementoLog.Text := ModelConexaoDados.memTerceirizada.FieldByName('COMPLLOG_TERCEIRIZADA').AsString;
             edtBairroLog.Text      := ModelConexaoDados.memTerceirizada.FieldByName('BAIRROLOG_TERCEIRIZADA').AsString;
             edtCepLog.Text         := FormatarCEP(ModelConexaoDados.memTerceirizada.FieldByName('CEPLOG_TERCEIRIZADA').AsString);
             edtCidadeLog.Text      := ModelConexaoDados.memTerceirizada.FieldByName('CIDADELOG_TERCEIRIZADA').AsString;
             edtUFLog.Text          := ModelConexaoDados.memTerceirizada.FieldByName('UFLOG_TERCEIRIZADA').AsString;

             AlimentaClasseTerceirizada;

             CarregaProfissionalTerceirizado(FIdSelecionado);
             CarregaGrid(ModelConexaoDados.memProfissionais,grdListaProfissionalTerceirizado,AFieldsProfissionais, ACaptionProfissionais, ASizeColProfissionais);

             ControlaBotoes(Self, False);
             FStatus                := abAlterar;
             BloqueiaRegistro(True, FIdSelecionado, tcTercerizadas);
             HabilitaTab(True);
             tabGerenciadorTerceirizada.TabIndex := 1;
             tabCabecarioTerceirizada.Next;
         end
     else
         begin
             if ModelConexaoDados.memTerceirizada.RecordCount = 0 then
                 begin
                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                            '',
                            'HBeauty', MB_OK + MB_ICONINFORMATION);
                     Exit;
                 end;
             MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                        'Selecione um profissional na lista para alterar!',
                        'HBeauty', MB_OK + MB_ICONINFORMATION);
             Exit;
         end;
end;

procedure TfrmGerenciadorTerceirizadas.btnCadastraEmailClick(Sender: TObject);
begin

     if FStatus = abIncluir then
        begin
            if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                         'Para cadastrar os e-mails é necessário primeiro salvar a empresa.'+#13#13+
                         'Deseja salvar agora?', apTitulo, MB_YESNO + MB_ICONQUESTION) = IDYES then
                begin
                    FIdSelecionado := CadastraTerceirizada(gclTerceirizada, Self);
                    ControlaBotoes(Self, True);

                    if FIdSelecionado <> 0 then
                       begin
                           Application.CreateForm(TfrmCadastroContatos, frmCadastroContatos);
                           frmCadastroContatos.TipoForm   := tfEmail;
                           frmCadastroContatos.IdRegTab   := FIdSelecionado;
                           frmCadastroContatos.NomeTabela := PrefixoTabela(tcTercerizadas);
                           frmCadastroContatos.Nome       := edtRazaoSocial.Text;
                           frmCadastroContatos.Titulo     := 'Empresa Terceirizada';
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
            frmCadastroContatos.NomeTabela := PrefixoTabela(tcTercerizadas);
            frmCadastroContatos.Nome       := edtRazaoSocial.Text;
            frmCadastroContatos.Titulo     := 'Empresa Terceirizada';
            frmCadastroContatos.TituloForm := 'Cadastro de E-mails';
            frmCadastroContatos.imgIconeForm.BitmapName := 'Email';
            frmCadastroContatos.ShowModal;
        end;
end;

procedure TfrmGerenciadorTerceirizadas.btnCadastraTelefoneClick(Sender: TObject);
begin
    if FStatus = abIncluir then
        begin
            if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                         'Para cadastrar os telefones é necessário primeiro salvar a empresa.'+#13#13+
                         'Deseja salvar agora?', 'HBeauty', MB_YESNO + MB_ICONQUESTION) = IDYES then
                begin
                    AlimentaClasseTerceirizada;
                    FIdSelecionado := CadastraTerceirizada(gclTerceirizada, Self);

                    if FIdSelecionado <> 0 then
                        begin
                            Application.CreateForm(TfrmCadastroContatos, frmCadastroContatos);
                            frmCadastroContatos.TipoForm     := tfTelefone;
                            frmCadastroContatos.IdRegTab     := FIdSelecionado;
                            frmCadastroContatos.NomeTabela   := PrefixoTabela(tcTercerizadas);
                            frmCadastroContatos.Titulo       := 'Empresa Terceirizada';
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
            frmCadastroContatos.NomeTabela := PrefixoTabela(tcTercerizadas);
            frmCadastroContatos.Nome       := edtRazaoSocial.Text;
            frmCadastroContatos.Titulo     := 'Empresa Terceirizada';
            frmCadastroContatos.imgIconeForm.BitmapName := 'Telefone';
            frmCadastroContatos.TituloForm := 'Cadastro de Telefone';

            frmCadastroContatos.ShowModal;
        end;
end;

procedure TfrmGerenciadorTerceirizadas.btnCancelarClick(Sender: TObject);
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
                         tabCabecarioTerceirizada.TabIndex := 0;
                         tabGerenciadorTerceirizada.TabIndex := 0;
                         ControlaBotoes(Self, True);
                         Abort;
                     end;
     end;

     if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                   pChar(AMensagem), apTitulo, MB_YESNO + MB_ICONQUESTION) = IDYES then
         begin
             LimpaForm(Self);
             HabilitaTab(False);
             tabCabecarioTerceirizada.TabIndex := 0;
             tabGerenciadorTerceirizada.TabIndex := 0;
             BloqueiaRegistro(False, FIdSelecionado, tcTercerizadas);
             ControlaBotoes(Self, True);
         end;

end;

procedure TfrmGerenciadorTerceirizadas.btnFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmGerenciadorTerceirizadas.btnIncluirClick(Sender: TObject);
begin
     HabilitaTab(True);
     LimpaForm(Self);
     ControlaBotoes(Self, False);
     FStatus := abIncluir;
     lblStatus.Text := 'Inclusão';
     tabCabecarioTerceirizada.Next;
     tabGerenciadorTerceirizada.ActiveTab := tabFichaTerceirizada;
end;

procedure TfrmGerenciadorTerceirizadas.AlimentaClasseTerceirizada;
begin
    gclTerceirizada.ID_TERCEIRIZADA       := FIdSelecionado;
    gclTerceirizada.CNPJ_TERCEIRIZADA     := ApenasNumeros(edtCNPJ.Text);
    gclTerceirizada.RAZAO_TERCEIRIZADA    := edtRazaoSocial.Text;
    gclTerceirizada.FANTASIA_TERCEIRIZADA := edtNomeFantasia.Text;
    gclTerceirizada.ENDERECO_TERCEIRIZADA.LOGRADOURO := edtLogradouro.Text;
    gclTerceirizada.ENDERECO_TERCEIRIZADA.NRLOG      := StrToInt(edtNumeroLog.Text);
    gclTerceirizada.ENDERECO_TERCEIRIZADA.COMPLLOG   := edtComplementoLog.Text;
    gclTerceirizada.ENDERECO_TERCEIRIZADA.BAIRROLOG  := edtBairroLog.Text;
    gclTerceirizada.ENDERECO_TERCEIRIZADA.CEP        := edtCepLog.Text;
    gclTerceirizada.ENDERECO_TERCEIRIZADA.CIDADELOG  := edtCidadeLog.Text;
    gclTerceirizada.ENDERECO_TERCEIRIZADA.UFLOG      := edtUFLog.Text;
    if edtIE.Text <> 'ISENTO' then
       gclTerceirizada.IE_TERCEIRIZADA    := ApenasNumeros(edtIE.Text) else
       gclTerceirizada.IE_TERCEIRIZADA    := edtIE.Text;

end;

procedure TfrmGerenciadorTerceirizadas.btnPesquisarClick(Sender: TObject);
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
          0 : ListaTerceirizadas(edtPesquisaBase.Text,'', '',TipoPesquisa,0);
          1 : ListaTerceirizadas('',edtPesquisaBase.Text,'',TipoPesquisa,0);
          2 : ListaTerceirizadas('','',ApenasNumeros(edtPesquisaBase.Text),TipoPesquisa,0);
     end;

     CarregaGrid(ModelConexaoDados.memTerceirizada,grdListaTerceirizada,AFieldsTerceirizadas, ACaptionTerceirizadas, ASizeColTerceirizadas);

     if ModelConexaoDados.memTerceirizada.RecordCount > 0 then
        FIdSelecionado :=  ExtraiTextoGrid(grdListaTerceirizada.Cells[0, 1]).ToInteger;

end;

procedure TfrmGerenciadorTerceirizadas.btnSalvarClick(Sender: TObject);
begin
    rResultado := '';
    case FStatus of
         abIncluir : begin
                         case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                         'Confirma a inclusão desta empresa?',
                                         apTitulo, MB_YESNO + MB_ICONQUESTION) of
                             IDYES : begin
                                         AlimentaClasseTerceirizada;
                                         Try
                                            FIdSelecionado := CadastraTerceirizada(gclTerceirizada, Self);
                                            case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                            'Empresa cadastrado com sucesso.'+#13#13+
                                                            'Deseja cadastrar outra empresa?', apTitulo,
                                                             MB_YESNO + MB_ICONQUESTION) of
                                                IDYES : begin
                                                             FStatus := abIncluir;
                                                             LimpaForm(Self);
                                                             edtCNPJ.SetFocus;
                                                        end;
                                                 IDNO : begin
                                                             FStatus := abNulo;
                                                             tabGerenciadorTerceirizada.TabIndex := 0;
                                                             tabCabecarioTerceirizada.Previous;
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
                                                                        apTitulo, MB_OK + MB_ICONWARNING);
                                                             Exit;
                                                         end;
                                                 end;

                                         end;
                                     end;
                         end;
                     end;
         abAlterar : begin
                         case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                         'Confirma a alteração desta empresa?',
                                         apTitulo, MB_YESNO + MB_ICONQUESTION) of
                             IDYES : begin
                                         try
                                             AlimentaClasseTerceirizada;
                                             AtualizaTerceirizada(gclTerceirizada);
                                             BloqueiaRegistro(False, FIdSelecionado, tcTercerizadas);
                                             MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                        'Registro salvo com sucesso!', apTitulo,
                                                        MB_OK + MB_ICONINFORMATION);
                                             btnPesquisarClick(Self);
                                             LimpaForm(Self);
                                             HabilitaTab(False);
                                             ControlaBotoes(Self, True);
                                             tabCabecarioTerceirizada.Previous;
                                             tabGerenciadorTerceirizada.TabIndex := 0;
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

procedure TfrmGerenciadorTerceirizadas.edtBairroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(kEY, edtCidadeLog);
end;

procedure TfrmGerenciadorTerceirizadas.edtCepLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
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

procedure TfrmGerenciadorTerceirizadas.edtCepLogTyping(Sender: TObject);
begin
Formatar(edtCepLog, erCEP);
end;

procedure TfrmGerenciadorTerceirizadas.edtCidadeLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(kEY, edtUFLog);
end;

procedure TfrmGerenciadorTerceirizadas.edtCNPJExit(Sender: TObject);
begin
     if Length(ApenasNumeros(edtCNPJ.Text)) = 14 then
        edtCNPJ.Text := ACBrValidador.FormatarCNPJ(edtCNPJ.Text);
end;

procedure TfrmGerenciadorTerceirizadas.edtCNPJKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(kEY, edtIE);
end;

procedure TfrmGerenciadorTerceirizadas.edtCNPJTyping(Sender: TObject);
begin
Formatar(edtCNPJ, erCNPJ);
end;

procedure TfrmGerenciadorTerceirizadas.edtComplementoLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(kEY, edtBairroLog);
end;

procedure TfrmGerenciadorTerceirizadas.edtIEKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(kEY, edtRazaoSocial);
end;

procedure TfrmGerenciadorTerceirizadas.edtLogradouroKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(kEY, edtNumeroLog);
end;

procedure TfrmGerenciadorTerceirizadas.edtNomeFantasiaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(kEY, edtCepLog);
end;

procedure TfrmGerenciadorTerceirizadas.edtNumeroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(kEY, edtComplementoLog);
end;

procedure TfrmGerenciadorTerceirizadas.edtRazaoSocialKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(kEY, edtNomeFantasia);
end;

procedure TfrmGerenciadorTerceirizadas.edtUFLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(kEY, edtCNPJ);
end;

procedure TfrmGerenciadorTerceirizadas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     BloqueiaRegistro(False, FIdSelecionado, tcTercerizadas);
     FreeAndNil(gclTerceirizada);
     Action := TCloseAction.caFree;
end;

procedure TfrmGerenciadorTerceirizadas.FormCreate(Sender: TObject);
begin
     CarregaPersonalizacaoCabecarioRodape(Self);
     tabCabecarioTerceirizada.TabIndex   := 0;
     tabGerenciadorTerceirizada.TabIndex := 0;
     gclTerceirizada := TModelTerceirizada.Create(Self);

     grdListaTerceirizada.Cells[0,0]  := 'Código';
     grdListaTerceirizada.Cells[1,0]  := 'CNPJ';
     grdListaTerceirizada.Cells[2,0]  := 'Razão Social';
     grdListaTerceirizada.Cells[3,0]  := 'Nome Fantasia';
     grdListaTerceirizada.Cells[4,0]  := 'Logradouro';
     grdListaTerceirizada.Cells[5,0]  := 'Nr.';
     grdListaTerceirizada.Cells[6,0]  := 'Complemento';
     grdListaTerceirizada.Cells[7,0]  := 'Bairro';
     grdListaTerceirizada.Cells[8,0]  := 'CEP';
     grdListaTerceirizada.Cells[9,0]  := 'Cidade';
     grdListaTerceirizada.Cells[10,0] := 'UF';

     grdListaProfissionalTerceirizado.Cells[0,0] := 'CPF';
     grdListaProfissionalTerceirizado.Cells[1,0] := 'Nome';
     grdListaProfissionalTerceirizado.Cells[2,0] := 'SobreNome';
     grdListaProfissionalTerceirizado.Cells[3,0] := 'Logradouro';
     grdListaProfissionalTerceirizado.Cells[4,0] := 'Nr.';
     grdListaProfissionalTerceirizado.Cells[5,0] := 'Complemento';
     grdListaProfissionalTerceirizado.Cells[6,0] := 'Bairro';
     grdListaProfissionalTerceirizado.Cells[7,0] := 'CEP';
     grdListaProfissionalTerceirizado.Cells[8,0] := 'Cidade';
     grdListaProfissionalTerceirizado.Cells[9,0] := 'UF';
end;

procedure TfrmGerenciadorTerceirizadas.grdListaTerceirizadaCellClick(Sender: TObject; ACol, ARow: Integer);
begin
FIdSelecionado := ExtraiTextoGrid(grdListaTerceirizada.Cells[0, ARow]).ToInteger;
end;

end.
