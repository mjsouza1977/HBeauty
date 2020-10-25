unit View.Profissionais.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TMSBaseGroup, FMX.TMSRadioGroup, FMX.Edit, FMX.TMSButton, FMX.TMSBaseControl, FMX.TMSGridCell,
  FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.TabControl,
  View.Principal.HBeauty, FMX.TMSListEditor, FMX.TMSCustomEdit, FMX.TMSEdit, FMX.TMSLabelEdit, FMX.ListBox, FMX.EditBox, FMX.NumberBox,
  Units.Utils.HBeauty, View.Telefones.HBeauty, View.Emails.HBeauty,
  Model.Profissionais.HBeauty, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  Model.Dados.Server.HBeauty, ACBrBase, ACBrValidador,  Model.Contatos.Servidor.HBeauty,
  Units.Enumerados.HBeauty;

type
  TfrmGerenciadorProfissionais = class(TForm)
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
    recRodapeGerenciadorProfissionais: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnAtualizar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    recCabecarioGerenciadoProfissionais: TRectangle;
    btnPesquisar: TTMSFMXButton;
    Label1: TLabel;
    Rectangle6: TRectangle;
    edtPesquisaBase: TEdit;
    rbOperador: TTMSFMXRadioGroup;
    rbPor: TTMSFMXRadioGroup;
    tabFichaProfissional: TTabItem;
    tabCabecarioProfissionais: TTabControl;
    tabPesquisa: TTabItem;
    tabDados: TTabItem;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    cbEmpresaTerceirizada: TComboBox;
    Rectangle14: TRectangle;
    Rectangle17: TRectangle;
    edtEmails: TEdit;
    TMSFMXButton3: TTMSFMXButton;
    TMSFMXButton4: TTMSFMXButton;
    Rectangle3: TRectangle;
    edtTelefones: TEdit;
    gbTerceirizada: TGroupBox;
    gbEmails: TGroupBox;
    gbTelefones: TGroupBox;
    rgDados: TTMSFMXRadioGroup;
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
    tabCargoSalario: TTabItem;
    gbSalario: TGroupBox;
    Rectangle20: TRectangle;
    NumberBox2: TNumberBox;
    gbComissao: TGroupBox;
    Rectangle22: TRectangle;
    Label15: TLabel;
    NumberBox3: TNumberBox;
    ListView1: TListView;
    Rectangle15: TRectangle;
    ACBrValidador1: TACBrValidador;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure TMSFMXButton3Click(Sender: TObject);
    procedure TMSFMXButton4Click(Sender: TObject);
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
    procedure edtComissaoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtTelefonesKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure grdListaProfissionaisCellClick(Sender: TObject; ACol, ARow: Integer);
  private
    FStatus : TAcaoBotao;
    FIdSelecionado : Integer;
  public

  end;

var
  frmGerenciadorProfissionais: TfrmGerenciadorProfissionais;

implementation

{$R *.fmx}

uses
    Units.Classes.HBeauty,
    Model.Profissionais.Servidor.HBeauty,
    Units.Strings.HBeauty, Winapi.Windows,
    FMX.Platform.Win, Units.Utils.Dados.HBeauty, Units.Consts.HBeauty;

procedure TfrmGerenciadorProfissionais.btnAlterarClick(Sender: TObject);
begin
     if FIdSelecionado > 0 then
         begin
             ListaProfissionais('','','',FIdSelecionado);
             edtCPF.Text            := FormatarCNPJouCPF(ModelConexaoDados.memProfissionais.FieldByName('CPF_PROFIS').AsString);
             edtRG.Text             := ModelConexaoDados.memProfissionais.FieldByName('RG_PROFIS').AsString;
             edtNome.Text           := ModelConexaoDados.memProfissionais.FieldByName('NOME_PROFIS').AsString;
             edtSobreNome.Text      := ModelConexaoDados.memProfissionais.FieldByName('SOBRENOME_PROFIS').AsString;
             edtLogradouro.Text     := ModelConexaoDados.memProfissionais.FieldByName('LOGRADOURO_PROFIS').AsString;
             edtNumeroLog.Text      := ModelConexaoDados.memProfissionais.FieldByName('NRLOG_PROFIS').AsString;
             edtComplementoLog.Text := ModelConexaoDados.memProfissionais.FieldByName('COMPLLOG_PROFIS').AsString;
             edtBairroLog.Text      := ModelConexaoDados.memProfissionais.FieldByName('BAIRROLOG_PROFIS').AsString;
             edtCepLog.Text         := ModelConexaoDados.memProfissionais.FieldByName('CEP_PROFIS').AsString;
             edtCidadeLog.Text      := ModelConexaoDados.memProfissionais.FieldByName('CIDADELOG_PROFIS').AsString;
             edtUFLog.Text          := ModelConexaoDados.memProfissionais.FieldByName('UFLOG_PROFIS').AsString;
             ControlaBotoes(Self, False);
             FStatus                := abAlterar;
             tabGerenciadorProfissionais.TabIndex := 1;
         end
     else
         begin
             MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                        'Selecione um profissional na lista para alterar!',
                        'HBeauty', MB_OK + MB_ICONINFORMATION);
             Exit;
         end;

end;

procedure TfrmGerenciadorProfissionais.btnCancelarClick(Sender: TObject);
begin
     ControlaBotoes(Self, True);
end;

procedure TfrmGerenciadorProfissionais.btnFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmGerenciadorProfissionais.btnIncluirClick(Sender: TObject);
begin
     ControlaBotoes(Self, False);
     FStatus := abIncluir;
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
          0 : ListaProfissionais(edtPesquisaBase.Text,'',TipoPesquisa,0);
          1 : ListaProfissionais('',ApenasNumeros(edtPesquisaBase.Text),TipoPesquisa,0);
     end;

     CarregaGrid(ModelConexaoDados.memProfissionais,grdListaProfissionais,AFieldsProfissionais, ACaptionProfissionais, ASizeColProfissionais);
end;

procedure TfrmGerenciadorProfissionais.btnSalvarClick(Sender: TObject);
begin

    case FStatus of
         abIncluir : begin
                         gclProfissional.IDCARGO_PROFISS    := 0;
                         gclProfissional.IDEMPTER_PROFIS    := 0;
                         gclProfissional.CODIGO_PROFIS      := '';
                         gclProfissional.NOME_PROFIS        := edtNome.Text;
                         gclProfissional.SOBRENOME_PROFIS   := edtSobreNome.Text;
                         gclProfissional.CPF_PROFIS         := ApenasNumeros(edtCPF.Text);
                         gclProfissional.RG_PROFIS          := edtRG.Text;
                         gclProfissional.TERC_PROFIS        := False;
                         gclProfissional.SALARIO_PROFIS     := 2.200;
                         gclProfissional.COMISSAO_PROFIS    := 30;

                         gclProfissional.ENDERECO_PROFIS.LOGRADOURO  := edtLogradouro.Text;
                         gclProfissional.ENDERECO_PROFIS.NRLOG       := edtNumeroLog.Text.ToInteger;
                         gclProfissional.ENDERECO_PROFIS.BAIRROLOG   := edtBairroLog.Text;
                         gclProfissional.ENDERECO_PROFIS.CIDADELOG   := edtCidadeLog.Text;
                         gclProfissional.ENDERECO_PROFIS.UFLOG       := edtUFLog.Text;
                         gclProfissional.ENDERECO_PROFIS.CEP         := edtCepLog.Text;

                         Try
                            FIdSelecionado := CadastraProfissional(gclProfissional);
                            FStatus        := abNulo;
                         Except
                             On E:Exception do
                                 begin
                                     if Pos('Session ID', E.Message) > 0 then
                                         btnSalvarClick(Self) else
                                         MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                    pChar('Ocorreu um erro ao tentar salvar o registro!'+#13+
                                                    'Tente novamente, caso o problema persistir entre em contato ' +
                                                    'com a MS Software e informe o erro abaixo.'+#13#13+
                                                    'Erro: ' + E.Message), 'HBeauty', MB_OK +MB_ICONERROR);
                                         Exit;
                                 end;

                         end;
                     end;
    end;

end;

procedure TfrmGerenciadorProfissionais.edtBairroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtCidadeLog);
end;

procedure TfrmGerenciadorProfissionais.edtCepLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtLogradouro);
end;

procedure TfrmGerenciadorProfissionais.edtCidadeLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtUFLog);
end;

procedure TfrmGerenciadorProfissionais.edtComissaoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtTelefones);
end;

procedure TfrmGerenciadorProfissionais.edtComplementoLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtBairroLog);
end;

procedure TfrmGerenciadorProfissionais.edtCPFKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtRG);
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

procedure TfrmGerenciadorProfissionais.edtTelefonesKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtEmails);
end;

procedure TfrmGerenciadorProfissionais.edtUFLogKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, cbEmpresaTerceirizada);
end;

procedure TfrmGerenciadorProfissionais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FreeAndNil(gclProfissional);
     Action := TCloseAction.caFree;
end;

procedure TfrmGerenciadorProfissionais.FormCreate(Sender: TObject);
begin
     gclProfissional := TModelProfissionais.Create(Self);

     grdListaProfissionais.Cells[0,0] := 'CPF';
     grdListaProfissionais.Cells[1,0] := 'Nome';
     grdListaProfissionais.Cells[2,0] := 'SobreNome';
     grdListaProfissionais.Cells[3,0] := 'Logradouro';
     grdListaProfissionais.Cells[4,0] := 'Nr.';
     grdListaProfissionais.Cells[5,0] := 'Complemento';
     grdListaProfissionais.Cells[6,0] := 'Bairro';
     grdListaProfissionais.Cells[7,0] := 'CEP';
     grdListaProfissionais.Cells[8,0] := 'Cidade';
     grdListaProfissionais.Cells[9,0] := 'UF';

end;

procedure TfrmGerenciadorProfissionais.grdListaProfissionaisCellClick(Sender: TObject; ACol, ARow: Integer);
begin
FIdSelecionado := ExtraiTextoGrid(grdListaProfissionais.Cells[0, ARow]).ToInteger;
end;

procedure TfrmGerenciadorProfissionais.TMSFMXButton3Click(Sender: TObject);
begin

    if FIdSelecionado = 0 then
        begin
            if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                         'Para cadastrar os telefones é necessário primeiro salvar o profissional'+#13#13+
                         'Deseja salvar agora?', 'HBeauty', MB_YESNO + MB_ICONQUESTION) = IDYES then
                begin
                    btnSalvarClick(Self);

                    if FIdSelecionado <> 0 then
                        begin
                            Application.CreateForm(TfrmCadastroTelefones, frmCadastroTelefones);
                            frmCadastroTelefones.IdRegTab   := FIdSelecionado;
                            frmCadastroTelefones.NomeTabela := PrefixoTabela(tcPtofissionais);
                            frmCadastroTelefones.ShowModal;
                        end;
                end;
        end
    else
        begin
            Application.CreateForm(TfrmCadastroTelefones, frmCadastroTelefones);
            frmCadastroTelefones.IdRegTab   := FIdSelecionado;
            frmCadastroTelefones.NomeTabela := PrefixoTabela(tcPtofissionais);
            frmCadastroTelefones.Nome       := edtNome.Text + ' ' + edtSobreNome.Text;
            frmCadastroTelefones.Titulo     := 'Profissional';
            frmCadastroTelefones.ShowModal;
        end;

end;

procedure TfrmGerenciadorProfissionais.TMSFMXButton4Click(Sender: TObject);
begin

     if FIdSelecionado = 0 then
        begin
            if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                         'Para cadastrar os e-mails é necessário primeiro salvar o profissional'+#13#13+
                         'Deseja salvar agora?', 'HBeauty', MB_YESNO + MB_ICONQUESTION) = IDYES then
                begin
                    btnSalvarClick(Self);

                    if FIdSelecionado <> 0 then
                       begin
                           Application.CreateForm(TfrmCadastroEmails, frmCadastroEmails);
                           frmCadastroEmails.IdRegTab   := FIdSelecionado;
                           frmCadastroEmails.NomeTabela := PrefixoTabela(tcPtofissionais);
                           frmCadastroEmails.ShowModal;
                       end;
                end;
        end;
end;

end.
