unit View.Contatos.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, View.Principal.HBeauty, FMX.TMSButton, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions,
  FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Edit, FMX.TMSBitmap,
  Units.Enumerados.HBeauty, View.Loading.HBeauty;

type
  TfrmCadastroContatos = class(TForm)
    recCabecarioTelefones: TRectangle;
    recRodapeTelefones: TRectangle;
    lblTitulo: TLabel;
    lblNome: TLabel;
    grdListaContatos: TTMSFMXGrid;
    lytCadastroTelefone: TLayout;
    btnFechar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    btnAlterar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    Rectangle15: TRectangle;
    edtTelefone: TEdit;
    Label14: TLabel;
    Rectangle2: TRectangle;
    edtContato: TEdit;
    Label2: TLabel;
    chkWhatsApp: TCheckBox;
    chkRestrito: TCheckBox;
    chkInativar: TCheckBox;
    imgIconeForm: TTMSFMXImage;
    lblTituloForm: TLabel;
    Line1: TLine;
    lytCadastroEmail: TLayout;
    Rectangle3: TRectangle;
    edtEmail: TEdit;
    Label3: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FNomeTabela: String;
    FIdRegTab: Integer;
    FTitulo: String;
    FNome: String;
    FStatus : TAcaoBotao;
    FTipoForm: TTipoForm;
    procedure SetIdRegTab(const Value: Integer);
    procedure SetNomeTabela(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetTitulo(const Value: String);
    procedure SetTipoForm(const Value: TTipoForm);
    { Private declarations }
  public
    property NomeTabela : String    read FNomeTabela write SetNomeTabela;
    property IdRegTab   : Integer   read FIdRegTab   write SetIdRegTab;
    property Titulo     : String    read FTitulo     write SetTitulo;
    property Nome       : String    read FNome       write SetNome;
    property TipoForm   : TTipoForm read FTipoForm   write SetTipoForm;
  end;


var
  frmCadastroContatos: TfrmCadastroContatos;

implementation

{$R *.fmx}

uses Units.Utils.HBeauty,
     Model.Dados.Server.HBeauty,
     Model.Contatos.Servidor.HBeauty,
     Units.Consts.HBeauty,
     Units.Utils.Dados.HBeauty,
     Model.Telefones.HBeauty,
     Units.Classes.HBeauty,
     Units.Strings.HBeauty,
     Winapi.Windows,
     FMX.PLatForm.Win;

procedure TfrmCadastroContatos.btnAlterarClick(Sender: TObject);
begin

     ControlaBotoes(Self, False);

end;

procedure TfrmCadastroContatos.btnCancelarClick(Sender: TObject);
begin

     ControlaBotoes(Self, True);

end;

procedure TfrmCadastroContatos.btnFecharClick(Sender: TObject);
begin

     Close;

end;

procedure TfrmCadastroContatos.btnIncluirClick(Sender: TObject);
begin

     FStatus := TAcaoBotao.abIncluir;
     gclTelefone := TModelTelefones.Create(Self);
     ControlaBotoes(Self, False);

end;

procedure TfrmCadastroContatos.btnSalvarClick(Sender: TObject);
begin

    if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                  'Confirma a inclusão deste telefone?', apTitulo,
                  MB_YESNO + MB_ICONEXCLAMATION) = ID_YES then
        begin
            case FStatus of
                 abIncluir : begin
                                  try
                                      try
                                          gclTelefone.Telefone   := ApenasNumeros(edtTelefone.Text);
                                          gclTelefone.Contato    := edtContato.Text;
                                          gclTelefone.WhatsApp   := chkWhatsApp.IsChecked;
                                          gclTelefone.Restrito   := chkRestrito.IsChecked;
                                          gclTelefone.NomeTabela := PrefixoTabela(tcTelefone);
                                          CadastraTelefone(gclTelefone);
                                          MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                     'Registro salvo com sucesso!', apTitulo,
                                                     MB_OK + MB_ICONINFORMATION);
                                          FormShow(Self);
                                          ControlaBotoes(Self, True);
                                      except on E:Exception do
                                          begin
                                               MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                          pChar('Ocorreu um erro ao tentar salvar este registro, ' +
                                                                'verifique sua conexão com a internet e tente ' +
                                                                'novamente. Caso o problema persistir entre em contato ' +
                                                                'com a MS Software informando a mensagem abaixo!' + #13#13 +
                                                                'Mensagem: ' + E.Message),
                                                          apTitulo,
                                                          MB_OK + MB_ICONWARNING);
                                               Abort;
                                          end;
                                      end;
                                      finally
                                          FreeAndNil(frmLoading);
                                  end;
                             end;
            end;
        end;

end;

procedure TfrmCadastroContatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     Action := TCloseAction.caFree;

end;

procedure TfrmCadastroContatos.FormCreate(Sender: TObject);
begin
     case TipoForm of
         tfEmail    : begin
                          imgIconeForm.BitmapName := 'Email';
                          lblTituloForm.Text      := 'Cadastro de E-Mails';
                      end;
         tfTelefone : begin
                          imgIconeForm.BitmapName := 'Telefone';
                          lblTituloForm.Text      := 'Cadastro de Telefones';
                      end;
     end;

end;

procedure TfrmCadastroContatos.FormShow(Sender: TObject);
var
AIndex : Integer;
S : String;
begin

     case FTipoForm of
        tfTelefone : begin
                         CarregaTelefones(FNomeTabela, FIdRegTab);
                         CarregaGrid(ModelConexaoDados.memContatos,grdListaContatos,AFieldsTelefones, ACaptionTelefones, ASizeColTelefones);
                         for AIndex := 1 to grdListaContatos.RowCount - 1 do
                             begin
                                 if Trim(ExtraiTextoGrid(grdListaContatos.Cells[3, AIndex])) = 'F' then
                                     begin
                                          grdListaContatos.Cells[3, AIndex] := '';
                                          grdListaContatos.AddBitmapFile(3, AIndex, ExtractFilePath(ParamStr(0)) + 'Imagens\Icones\Error.png');
                                     end
                                 else
                                     begin
                                          grdListaContatos.Cells[3, AIndex] := '';
                                          grdListaContatos.AddBitmapFile(3, AIndex, ExtractFilePath(ParamStr(0)) + 'Imagens\Icones\zap.png');
                                     end;
                                 if Trim(ExtraiTextoGrid(grdListaContatos.Cells[4, AIndex])) = 'F' then
                                     begin
                                          grdListaContatos.Cells[4, AIndex] := '';
                                          grdListaContatos.AddBitmapFile(4, AIndex, ExtractFilePath(ParamStr(0)) + 'Imagens\Icones\Error.png');
                                     end
                                 else
                                     begin
                                          grdListaContatos.Cells[4, AIndex] := '';
                                          grdListaContatos.AddBitmapFile(4, AIndex, ExtractFilePath(ParamStr(0)) + 'Imagens\Icones\Check.png');
                                     end;
                             end;
                     end;
           tfEmail : begin
                        CarregaEmails(FNomeTabela, FIdRegTab);
                        CarregaGrid(ModelConexaoDados.memContatos, grdListaContatos, AFieldsEmails, ACaptionEmails, ASizeColEmails);
                        for AIndex := 1 to grdListaContatos.RowCount - 1 do
                             begin
                                 if Trim(ExtraiTextoGrid(grdListaContatos.Cells[2, AIndex])) = 'F' then
                                     begin
                                          grdListaContatos.Cells[3, AIndex] := '';
                                          grdListaContatos.AddBitmapFile(3, AIndex, ExtractFilePath(ParamStr(0)) + 'Imagens\Icones\Error.png');
                                     end
                                 else
                                     begin
                                          grdListaContatos.Cells[3, AIndex] := '';
                                          grdListaContatos.AddBitmapFile(3, AIndex, ExtractFilePath(ParamStr(0)) + 'Imagens\Icones\Check.png');
                                     end;
                             end;
                     end;
     end;
end;

procedure TfrmCadastroContatos.SetIdRegTab(const Value: Integer);
begin
  FIdRegTab := Value;
end;

procedure TfrmCadastroContatos.SetNome(const Value: String);
begin
  FNome        := Value;
  lblNome.Text := FNome;
end;

procedure TfrmCadastroContatos.SetNomeTabela(const Value: String);
begin
  FNomeTabela := Value;
end;

procedure TfrmCadastroContatos.SetTipoForm(const Value: TTipoForm);
begin
  FTipoForm := Value;
end;

procedure TfrmCadastroContatos.SetTitulo(const Value: String);
begin
  FTitulo        := Value;
  lblTitulo.Text := FTitulo;
end;


end.
