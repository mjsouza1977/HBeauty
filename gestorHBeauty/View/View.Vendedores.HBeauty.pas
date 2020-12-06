unit View.Vendedores.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, ACBrBase, ACBrValidador, FMX.Effects, FMX.Filter.Effects, FMX.StdCtrls, FMX.EditBox, FMX.NumberBox,
  FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSBaseGroup, FMX.TMSRadioGroup,
  FMX.Edit, FMX.TabControl, FMX.Controls.Presentation, FMX.TMSButton,

  Units.Consts.HBeauty,
  Units.Enumerados.HBeauty;

type
  TfrmVendedores = class(TForm)
    recRodapeTerceirizada: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    tabCabecarioVendedor: TTabControl;
    tabPesquisa: TTabItem;
    recCabecarioVendedor: TRectangle;
    btnPesquisar: TTMSFMXButton;
    Label1: TLabel;
    Rectangle6: TRectangle;
    edtPesquisaBase: TEdit;
    rbOperador: TTMSFMXRadioGroup;
    rbPor: TTMSFMXRadioGroup;
    tabDados: TTabItem;
    Rectangle3: TRectangle;
    Label4: TLabel;
    lblNome: TLabel;
    Label13: TLabel;
    lblStatus: TLabel;
    tabGerenciadorVendedores: TTabControl;
    tabListaVendedor: TTabItem;
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
    grdListaVendedor: TTMSFMXGrid;
    StyleBook1: TStyleBook;
    tabFichaVendedor: TTabItem;
    rgDados: TTMSFMXRadioGroup;
    Rectangle10: TRectangle;
    edtCNPJ: TEdit;
    Label10: TLabel;
    Rectangle12: TRectangle;
    edtIE: TEdit;
    Label11: TLabel;
    Rectangle13: TRectangle;
    edtNomeFantasia: TEdit;
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
    grpContatos: TGroupBox;
    btnCadastraTelefone: TTMSFMXButton;
    btnCadastraEmail: TTMSFMXButton;
    StyleBook2: TStyleBook;
    StyleBook3: TStyleBook;
    FillRGBEffect2: TFillRGBEffect;
    ACBrValidador1: TACBrValidador;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FIDSelecionado : Integer;
    procedure HabilitaTab(AHabilita: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendedores: TfrmVendedores;

implementation

uses
  Units.Classes.HBeauty, Model.Vendedores.HBeauty;

{$R *.fmx}

procedure TfrmVendedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     BloqueiaRegistro(False, FIdSelecionado, tcVendedor);
     FreeAndNil(gclVendedor);
     Action := TCloseAction.caFree;

end;

procedure TfrmVendedores.HabilitaTab(AHabilita : Boolean);
begin
     tabFichaVendedor.Visible := AHabilita;
     tabListaVendedor.Visible := not AHabilita;
end;


procedure TfrmVendedores.FormCreate(Sender: TObject);
begin
     CarregaPersonalizacaoCabecarioRodape(Self);
     HabilitaTab(False);
     tabCabecarioVendedor.TabIndex   := 0;
     tabGerenciadorVendedores.TabIndex := 0;
     gclVendedor := TModelVendedor.Create(Self);

     grdListaVendedor.Cells[0,0] := 'Código';
     grdListaVendedor.Cells[1,0] := 'CPF';
     grdListaVendedor.Cells[2,0] := 'Nome';
     grdListaVendedor.Cells[3,0] := 'Logradouro';
     grdListaVendedor.Cells[4,0] := 'Nr.';
     grdListaVendedor.Cells[5,0] := 'Complemento';
     grdListaVendedor.Cells[6,0] := 'Bairro';
     grdListaVendedor.Cells[7,0] := 'CEP';
     grdListaVendedor.Cells[8,0] := 'Cidade';
     grdListaVendedor.Cells[9,0] := 'UF';
end;

end.
