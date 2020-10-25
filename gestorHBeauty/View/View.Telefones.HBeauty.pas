unit View.Telefones.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, View.Principal.HBeauty, FMX.TMSButton, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions,
  FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Edit, FMX.TMSBitmap,
  Units.Enumerados.HBeauty, View.Loading.HBeauty;

type
  TfrmCadastroTelefones = class(TForm)
    recCabecarioTelefones: TRectangle;
    recRodapeTelefones: TRectangle;
    lblTitulo: TLabel;
    lblNome: TLabel;
    grdListaTelefone: TTMSFMXGrid;
    lytCadastro: TLayout;
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
    TMSFMXImage1: TTMSFMXImage;
    lblTituloForm: TLabel;
    Line1: TLine;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FNomeTabela: String;
    FIdRegTab: Integer;
    FTitulo: String;
    FNome: String;
    FStatus : TAcaoBotao;
    procedure SetIdRegTab(const Value: Integer);
    procedure SetNomeTabela(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetTitulo(const Value: String);
    { Private declarations }
  public
     property NomeTabela : String  read FNomeTabela write SetNomeTabela;
     property IdRegTab   : Integer read FIdRegTab   write SetIdRegTab;
     property Titulo     : String  read FTitulo     write SetTitulo;
     property Nome       : String  read FNome       write SetNome;
  end;


var
  frmCadastroTelefones: TfrmCadastroTelefones;

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

procedure TfrmCadastroTelefones.btnAlterarClick(Sender: TObject);
begin

     ControlaBotoes(Self, False);

end;

procedure TfrmCadastroTelefones.btnCancelarClick(Sender: TObject);
begin

     ControlaBotoes(Self, True);

end;

procedure TfrmCadastroTelefones.btnFecharClick(Sender: TObject);
begin

     Close;

end;

procedure TfrmCadastroTelefones.btnIncluirClick(Sender: TObject);
begin

     FStatus := TAcaoBotao.abIncluir;
     gclTelefone := TModelTelefones.Create(Self);
     ControlaBotoes(Self, False);

end;

procedure TfrmCadastroTelefones.btnSalvarClick(Sender: TObject);
begin

    if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                  apTitulo,
                  'Confirma a inclusão deste telefone?',
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
                                          gclTelefone.NomeTabela := PrefixoTabela(tcTelefone)
                                          CadastraTelefone(gclTelefone);
                                          MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                     'Registro salvo com sucesso!', apTitulo,
                                                     MB_OK + MB_ICONINFORMATION);
                                          FormShow(Self);
                                          ControlaBotoes(Self, True);
                                      except on E:Exception do
                                          begin
                                               MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                          apTitulo, pChar('Ocorreu um erro ao tentar salvar este registro, ' +
                                                                    'verifique sua conexão com a internet e tente ' +
                                                                    'novamente. Caso o problema persistir entre em contato ' +
                                                                    'com a MS Software informando a mensagem abaixo!' + #13#13 +
                                                                    'Mensagem: ' + E.Message),
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

procedure TfrmCadastroTelefones.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     Action := TCloseAction.caFree;

end;

procedure TfrmCadastroTelefones.FormShow(Sender: TObject);
begin
     CarregaTelefones(FNomeTabela, FIdRegTab);
     CarregaGrid(ModelConexaoDados.memContatos,grdListaTelefone,AFieldsTelefones, ACaptionTelefones, ASizeColTelefones);
end;

procedure TfrmCadastroTelefones.SetIdRegTab(const Value: Integer);
begin
  FIdRegTab := Value;
end;

procedure TfrmCadastroTelefones.SetNome(const Value: String);
begin
  FNome        := Value;
  lblNome.Text := FNome;
end;

procedure TfrmCadastroTelefones.SetNomeTabela(const Value: String);
begin
  FNomeTabela := Value;
end;

procedure TfrmCadastroTelefones.SetTitulo(const Value: String);
begin
  FTitulo        := Value;
  lblTitulo.Text := FTitulo;
end;

end.
