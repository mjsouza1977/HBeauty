unit View.Produtos.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.EditBox, FMX.NumberBox, FMX.Effects, FMX.Filter.Effects, FMX.ListBox, FMX.StdCtrls,
  FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.Layouts, FMX.Edit, FMX.TabControl,
  FMX.Controls.Presentation, FMX.TMSButton, FMX.ScrollBox, FMX.Memo;

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
    Rectangle14: TRectangle;
    cbFornecedores: TComboBox;
    Label2: TLabel;
    Rectangle1: TRectangle;
    cbMarcas: TComboBox;
    Label3: TLabel;
    Rectangle2: TRectangle;
    edtRazaoSocial: TEdit;
    Label5: TLabel;
    Rectangle10: TRectangle;
    edtCNPJ: TEdit;
    Label10: TLabel;
    Rectangle4: TRectangle;
    Edit1: TEdit;
    Label6: TLabel;
    Rectangle7: TRectangle;
    Label8: TLabel;
    NumberBox1: TNumberBox;
    Rectangle5: TRectangle;
    ComboBox2: TComboBox;
    Label7: TLabel;
    Rectangle15: TRectangle;
    Label15: TLabel;
    NumberBox4: TNumberBox;
    Rectangle18: TRectangle;
    Label17: TLabel;
    NumberBox5: TNumberBox;
    Rectangle17: TRectangle;
    ComboBox1: TComboBox;
    Label16: TLabel;
    Rectangle9: TRectangle;
    Edit3: TEdit;
    Label11: TLabel;
    Rectangle8: TRectangle;
    Edit2: TEdit;
    Label9: TLabel;
    Rectangle13: TRectangle;
    Label14: TLabel;
    NumberBox3: TNumberBox;
    Rectangle12: TRectangle;
    Label12: TLabel;
    NumberBox2: TNumberBox;
    Rectangle16: TRectangle;
    lblNumero: TLabel;
    edtNumeroLog: TNumberBox;
    Rectangle19: TRectangle;
    Label18: TLabel;
    NumberBox6: TNumberBox;
    Rectangle20: TRectangle;
    Label19: TLabel;
    NumberBox7: TNumberBox;
    Rectangle21: TRectangle;
    Label20: TLabel;
    NumberBox8: TNumberBox;
    Label22: TLabel;
    Rectangle22: TRectangle;
    Label23: TLabel;
    Rectangle23: TRectangle;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label21: TLabel;
    Label27: TLabel;
    tabAPP: TTabItem;
    tabGerenciadorApp: TTabControl;
    tabInformações: TTabItem;
    tabDetalhes: TTabItem;
    tabFotos: TTabItem;
    Memo1: TMemo;
    Rectangle24: TRectangle;
    Label28: TLabel;
    tabRelacionados: TTabItem;
    tabSimilares: TTabItem;
    Layout3: TLayout;
    Button1: TButton;
    tabOrientacoes: TTabItem;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
FScroll : TVertScrollBox;
FPanel : TPanel;
J, FCount : Integer;
YPos, XPos : Single;
begin

     FScroll := TVertScrollBox.Create(nil);
     FScroll.Parent := tabFotos;
     FScroll.Align  := TAlignLayout.Client;

     FCount := 0;
     XPos   := 5;
     YPos   := 5;
     for j  := 1 to 53 do
         begin
             FCount := FCount + 1;
             FPanel := TPanel.Create(nil);
             FPanel.Parent  := FScroll;

             FPanel.Height := (FScroll.Height / 2) - 13;
             FPanel.Width  := (FScroll.Width / 5) - 13;
             FPanel.Position.X := XPos;
             FPanel.Position.Y := YPos;
             XPos := XPos + (FPanel.Width + 9);

             if FCount = 5 then
                begin
                     YPos   := YPos + (FPanel.Height + 10);
                     XPos   := 5;
                     FCount := 0;
                end;
         end;
end;

end.
