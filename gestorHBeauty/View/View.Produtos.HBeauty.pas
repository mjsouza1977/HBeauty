unit View.Produtos.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.EditBox, FMX.NumberBox, FMX.Effects, FMX.Filter.Effects, FMX.ListBox, FMX.StdCtrls,
  FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.Layouts, FMX.Edit, FMX.TabControl,
  FMX.Controls.Presentation, FMX.TMSButton, FMX.ScrollBox, FMX.Memo, Units.Utils.HBeauty, Controller.Manipula.Design.HBeauty, Units.Utils.Dados.HBeauty,
  Model.Fornecedor.Servidor.HBeauty, Model.Genericos.Servidor.HBeauty;

type
  TfrmGerenciadorProdutos = class(TForm)
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
    tabGerenciadorProdutos: TTabControl;
    tabListaProdutos: TTabItem;
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
    tabFichaProdutos: TTabItem;
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
    tabOrientacoes: TTabItem;
    recRodapeBotoesPrincipal: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    recRodapeBotoesApp: TRectangle;
    TMSFMXButton1: TTMSFMXButton;
    TMSFMXButton2: TTMSFMXButton;
    TMSFMXButton3: TTMSFMXButton;
    TMSFMXButton4: TTMSFMXButton;
    TMSFMXButton5: TTMSFMXButton;
    procedure Button1Click(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tabGerenciadorProdutosChange(Sender: TObject);
    procedure grdListaProdutosCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure cbMarcasClick(Sender: TObject);
  private
    FIdSelecionado : Integer;
    procedure ControlaTab(AOpcao: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerenciadorProdutos: TfrmGerenciadorProdutos;

implementation

uses
  Units.Consts.HBeauty, Model.Dados.Server.HBeauty, FireDAC.Comp.Client;

{$R *.fmx}

procedure TfrmGerenciadorProdutos.btnIncluirClick(Sender: TObject);
begin
     ControlaBotoes(Self, False);
end;

procedure TfrmGerenciadorProdutos.Button1Click(Sender: TObject);
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

procedure TfrmGerenciadorProdutos.cbMarcasClick(Sender: TObject);
var
AMemTable : TFDMemTable;
ASQL : String;
begin

    try
        AMemTable := TFDMemTable.Create(nil);
        ASQL := 'SELECT m.ID_MARCA, m.MARCA_MARCA FROM HBMARCA ' +
                'WHERE ID_MARCA IN (SELECT r.IDMARCA_FORNXMARCA FROM HBFORNXMARCA r, HBFORNECEDOR f ' +
                                   'WHERE r.IDFORN_FORNXMARCA = f.ID_FORN)';
        carregaCamposSQL(AMemTable, ASQL);
        AMemTable.First;
        cbMarcas.Clear;

        while not AMemTable.Eof do
            begin
                cbMarcas.Items.AddObject(AMemTable.FieldByName('MARCA_MARCA').AsString,
                                         TObject(AMemTable.FieldByName('ID_MARCA').AsInteger));
                AMemTable.Next;
            end;
    finally
        FreeAndNil(AMemTable);
    end;

end;

procedure TfrmGerenciadorProdutos.ControlaTab(AOpcao : Boolean);
begin

     tabListaProdutos.Visible := not AOpcao;
     tabFichaProdutos.Visible := Aopcao;
     tabFichaProdutos.Visible := AOpcao;

end;

procedure TfrmGerenciadorProdutos.FormCreate(Sender: TObject);
begin
     CarregaPersonalizacaoCabecarioRodape(Self);
     CarregaGrid(nil, grdListaProdutos, AFieldsProdutos, ACaptionProdutos, ASizeColProdutos, True);
     carregaCamposSelecionados(ModelConexaoDados.memFornecedores, 'ID_FORN, NOME_FORN', 'HBFORNECEDOR');

     ModelConexaoDados.memFornecedores.First;
     cbFornecedores.Clear;

     while not ModelConexaoDados.memFornecedores.Eof do
         begin
             cbFornecedores.Items.AddObject(ModelConexaoDados.memFornecedores.FieldByName('NOME_FORN').AsString,
                                            TObject(ModelConexaoDados.memFornecedores.FieldByName('ID_FORN').AsInteger));
             ModelConexaoDados.memFornecedores.Next;
         end;
end;

procedure TfrmGerenciadorProdutos.grdListaProdutosCellClick(Sender: TObject; ACol, ARow: Integer);
begin
    FIdSelecionado := ExtraiTextoGrid(grdListaProdutos.Cells[0, ARow]).ToInteger;
    ControlaTab(False);
end;

procedure TfrmGerenciadorProdutos.tabGerenciadorProdutosChange(Sender: TObject);
begin
     if tabGerenciadorProdutos.ActiveTab = tabAPP then
         recRodapeBotoesPrincipal.Visible := False else
         recRodapeBotoesPrincipal.Visible := True;
end;

end.
