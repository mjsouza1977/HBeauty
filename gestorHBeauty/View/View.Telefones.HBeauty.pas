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
    procedure FormCreate(Sender: TObject);
  private
    FNomeTabela: String;
    FIdRegTab: Integer;
    procedure SetIdRegTab(const Value: Integer);
    procedure SetNomeTabela(const Value: String);
    { Private declarations }
  public
     property NomeTabela : String read FNomeTabela write SetNomeTabela;
     property IdRegTab   : Integer read FIdRegTab write SetIdRegTab;
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

procedure TfrmCadastroTelefones.FormCreate(Sender: TObject);
begin
     CarregaTelefones(FNomeTabela, FIdRegTab);
     CarregaGrid(ModelConexaoDados.memContatos,grdListaTelefone,AFieldsTelefones, ACaptionTelefones);
end;

procedure TfrmCadastroTelefones.SetIdRegTab(const Value: Integer);
begin
  FIdRegTab := Value;
end;

procedure TfrmCadastroTelefones.SetNomeTabela(const Value: String);
begin
  FNomeTabela := Value;
end;

end.
