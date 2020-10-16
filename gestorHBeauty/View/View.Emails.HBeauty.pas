unit View.Emails.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions,
  FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.TMSButton, FMX.Controls.Presentation, FMX.Objects, FMX.TMSBitmap;

type
  TfrmCadastroEmails = class(TForm)
    recCabecarioTelefones: TRectangle;
    TMSFMXImage1: TTMSFMXImage;
    Line1: TLine;
    lblTituloForm: TLabel;
    recRodapeTelefones: TRectangle;
    btnFechar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    btnAlterar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    lblTitulo: TLabel;
    lblNome: TLabel;
    grdListaEdita: TTMSFMXGrid;
    lytCadastro: TLayout;
    Rectangle15: TRectangle;
    Edit12: TEdit;
    Label14: TLabel;
    Rectangle2: TRectangle;
    Edit1: TEdit;
    Label2: TLabel;
    WhatsApp: TCheckBox;
    chkRestrito: TCheckBox;
    chkInativar: TCheckBox;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroEmails: TfrmCadastroEmails;

implementation

{$R *.fmx}

uses UNits.Utils.HBeauty;

procedure TfrmCadastroEmails.btnAlterarClick(Sender: TObject);
begin
ControlaBotoes(Self, False);
end;

procedure TfrmCadastroEmails.btnCancelarClick(Sender: TObject);
begin
ControlaBotoes(Self, True);
end;

procedure TfrmCadastroEmails.btnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadastroEmails.btnIncluirClick(Sender: TObject);
begin
ControlaBotoes(Self, False);
end;

procedure TfrmCadastroEmails.btnSalvarClick(Sender: TObject);
begin
ControlaBotoes(Self, True);
end;

procedure TfrmCadastroEmails.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     Action := TCloseAction.caFree;

end;

end.
