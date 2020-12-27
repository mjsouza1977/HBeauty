unit View.Produtos.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox, FMX.Effects, FMX.Filter.Effects, FMX.StdCtrls, FMX.EditBox, FMX.NumberBox, FMX.TMSBaseGroup,
  FMX.TMSRadioGroup, FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.Layouts, FMX.Edit,
  FMX.TabControl, FMX.Controls.Presentation, FMX.TMSButton;

type
  TForm1 = class(TForm)
    recRodapeTerceirizada: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    tabCabecarioFornecedor: TTabControl;
    tabPesquisa: TTabItem;
    recCabecarioTerceirizada: TRectangle;
    btnPesquisar: TTMSFMXButton;
    Label1: TLabel;
    Rectangle6: TRectangle;
    edtPesquisaBase: TEdit;
    tabDados: TTabItem;
    Rectangle3: TRectangle;
    Label4: TLabel;
    lblNome: TLabel;
    Label13: TLabel;
    lblStatus: TLabel;
    tabGerenciadorFornecedor: TTabControl;
    tabListaFornecedor: TTabItem;
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
    grdListaFornecedor: TTMSFMXGrid;
    tabFichaFornecedor: TTabItem;
    rgDados: TTMSFMXRadioGroup;
    Rectangle10: TRectangle;
    edtCNPJ: TEdit;
    Label10: TLabel;
    Rectangle16: TRectangle;
    lblNumero: TLabel;
    edtNumeroLog: TNumberBox;
    gbVendedor: TGroupBox;
    StyleBook2: TStyleBook;
    FillRGBEffect2: TFillRGBEffect;
    Rectangle14: TRectangle;
    cbVendedores: TComboBox;
    Rectangle1: TRectangle;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Rectangle2: TRectangle;
    Edit1: TEdit;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
