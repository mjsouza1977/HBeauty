unit View.Produtos.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.EditBox, FMX.NumberBox, FMX.Effects, FMX.Filter.Effects, FMX.ListBox, FMX.StdCtrls,
  FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.Layouts, FMX.Edit, FMX.TabControl,
  FMX.Controls.Presentation, FMX.TMSButton;

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
    grdListaProdutos: TTMSFMXGrid;
    tabFichaFornecedor: TTabItem;
    StyleBook2: TStyleBook;
    FillRGBEffect2: TFillRGBEffect;
    Rectangle16: TRectangle;
    lblNumero: TLabel;
    edtNumeroLog: TNumberBox;
    Rectangle10: TRectangle;
    edtCNPJ: TEdit;
    Label10: TLabel;
    Rectangle14: TRectangle;
    cbFornecedores: TComboBox;
    Label2: TLabel;
    Rectangle1: TRectangle;
    cbMarcas: TComboBox;
    Label3: TLabel;
    Rectangle2: TRectangle;
    edtRazaoSocial: TEdit;
    Label5: TLabel;
    Rectangle4: TRectangle;
    Edit1: TEdit;
    Label6: TLabel;
    Rectangle5: TRectangle;
    ComboBox2: TComboBox;
    Label7: TLabel;
    Rectangle7: TRectangle;
    Label8: TLabel;
    NumberBox1: TNumberBox;
    Rectangle8: TRectangle;
    Edit2: TEdit;
    Label9: TLabel;
    Rectangle9: TRectangle;
    Edit3: TEdit;
    Label11: TLabel;
    Rectangle12: TRectangle;
    Label12: TLabel;
    NumberBox2: TNumberBox;
    Rectangle13: TRectangle;
    Label14: TLabel;
    NumberBox3: TNumberBox;
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
