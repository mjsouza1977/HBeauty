unit View.Habilidades.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.TMSBaseControl, FMX.TMSBitmap, ACBrBase, ACBrValidador, FMX.Effects,
  FMX.Filter.Effects, FMX.Controls.Presentation, FMX.TMSButton, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Layouts, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData,
  FMX.TMSCustomGrid, FMX.TMSGrid;

type
  TfrmCadastroHabilidades = class(TForm)
    recRodapeHabilidades: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    StyleBook2: TStyleBook;
    recCabecarioTelefones: TRectangle;
    imgIconeForm: TTMSFMXImage;
    Line1: TLine;
    lblTituloForm: TLabel;
    Label1: TLabel;
    grdListaHabilidade: TTMSFMXGrid;
    lytCadastroTelefone: TLayout;
    Rectangle15: TRectangle;
    edtTelefone: TEdit;
    Label14: TLabel;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroHabilidades: TfrmCadastroHabilidades;

implementation

{$R *.fmx}

end.
