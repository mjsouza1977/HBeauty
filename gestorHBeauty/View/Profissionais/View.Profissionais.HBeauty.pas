unit View.Profissionais.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TMSBaseGroup, FMX.TMSRadioGroup, FMX.Edit, FMX.TMSButton, FMX.TMSBaseControl, FMX.TMSGridCell,
  FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.TabControl,
  View.Principal.HBeauty, FMX.TMSListEditor, FMX.TMSCustomEdit, FMX.TMSEdit, FMX.TMSLabelEdit, FMX.ListBox, FMX.EditBox, FMX.NumberBox;

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
    grdListaEdita: TTMSFMXGrid;
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
    Rectangle1: TRectangle;
    edtNome: TEdit;
    Label2: TLabel;
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
    Rectangle12: TRectangle;
    edtRG: TEdit;
    Label11: TLabel;
    Rectangle13: TRectangle;
    edtSobreNome: TEdit;
    Label12: TLabel;
    TMSFMXRadioGroup1: TTMSFMXRadioGroup;
    TMSFMXRadioGroup2: TTMSFMXRadioGroup;
    TMSFMXButton1: TTMSFMXButton;
    TMSFMXButton2: TTMSFMXButton;
    cbEmpresaTerceirizada: TComboBox;
    Rectangle14: TRectangle;
    Label13: TLabel;
    Rectangle10: TRectangle;
    edtCPF: TEdit;
    Label10: TLabel;
    TMSFMXRadioGroup3: TTMSFMXRadioGroup;
    Rectangle15: TRectangle;
    Label14: TLabel;
    edtComissao: TNumberBox;
    Rectangle16: TRectangle;
    lblNumero: TLabel;
    edtNumeroLog: TNumberBox;
    TMSFMXRadioGroup4: TTMSFMXRadioGroup;
    Rectangle3: TRectangle;
    Edit1: TEdit;
    Rectangle17: TRectangle;
    Edit2: TEdit;
    TMSFMXButton3: TTMSFMXButton;
    TMSFMXRadioGroup5: TTMSFMXRadioGroup;
    TMSFMXButton4: TTMSFMXButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerenciadorProfissionais: TfrmGerenciadorProfissionais;

implementation

{$R *.fmx}

procedure TfrmGerenciadorProfissionais.btnFecharClick(Sender: TObject);
begin

     Close;

end;

procedure TfrmGerenciadorProfissionais.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     Action := TCloseAction.caFree;

end;

end.
