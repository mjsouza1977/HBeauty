unit View.Telefones.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, View.Principal.HBeauty, FMX.TMSButton, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions,
  FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Edit, FMX.TMSBitmap;

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
    Edit12: TEdit;
    Label14: TLabel;
    Rectangle2: TRectangle;
    Edit1: TEdit;
    Label2: TLabel;
    WhatsApp: TCheckBox;
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
     Units.Utils.Dados.HBeauty;

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

     ControlaBotoes(Self, False);

end;

procedure TfrmCadastroTelefones.btnSalvarClick(Sender: TObject);
begin

     ControlaBotoes(Self, True);

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
