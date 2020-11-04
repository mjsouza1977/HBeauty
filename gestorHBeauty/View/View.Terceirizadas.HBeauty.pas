unit View.Terceirizadas.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, ACBrBase, ACBrValidador, FMX.StdCtrls, FMX.Layouts, FMX.EditBox, FMX.NumberBox, FMX.ListBox,
  FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.TMSBaseControl, FMX.TMSBaseGroup, FMX.TMSRadioGroup, FMX.Edit,
  FMX.TabControl, FMX.Controls.Presentation, FMX.TMSButton, Model.Terceirizadas.Servidor.HBeauty, Units.Strings.HBeauty, Units.Utils.Dados.HBeauty, Units.Utils.HBeauty;

type
  TfrmGerenciadorTerceirizadas = class(TForm)
    recRodapeTerceirizada: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    tabCabecarioTerceirizada: TTabControl;
    tabPesquisa: TTabItem;
    recCabecarioTerceirizada: TRectangle;
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
    tabGerenciadorTerceirizada: TTabControl;
    tabListaTerceirizadas: TTabItem;
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
    grdListaTerceirizada: TTMSFMXGrid;
    StyleBook1: TStyleBook;
    tabFichaProfissional: TTabItem;
    rgDados: TTMSFMXRadioGroup;
    Rectangle1: TRectangle;
    edtRazaoSocial: TEdit;
    Label2: TLabel;
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
    TMSFMXButton3: TTMSFMXButton;
    TMSFMXButton4: TTMSFMXButton;
    tabCargoSalario: TTabItem;
    ACBrValidador1: TACBrValidador;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
  private
    FIdSelecionado : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerenciadorTerceirizadas: TfrmGerenciadorTerceirizadas;

implementation

uses
  Units.Classes.HBeauty,
  Controller.Manipula.Design.HBeauty, Model.Terceirizada.HBeauty, Model.Dados.Server.HBeauty,
  Units.Consts.HBeauty;

{$R *.fmx}

procedure TfrmGerenciadorTerceirizadas.btnPesquisarClick(Sender: TObject);
var
TipoPesquisa : String;
begin

     case rbOperador.ItemIndex of
          0 : TipoPesquisa := tpInicia;
          1 : TipoPesquisa := tpTermina;
          2 : TipoPesquisa := tpContenha;
          3 : TipoPesquisa := tpIgual;
     end;

     case rbPor.ItemIndex of
          0 : ListaTerceirizadas(edtPesquisaBase.Text,'', '',TipoPesquisa,0);
          1 : ListaTerceirizadas('',edtPesquisaBase.Text,'',TipoPesquisa,0);
          2 : ListaTerceirizadas('','',ApenasNumeros(edtPesquisaBase.Text),TipoPesquisa,0);
     end;

     CarregaGrid(ModelConexaoDados.memTerceirizada,grdListaTerceirizada,AFieldsTerceirizadas, ACaptionTerceirizadas, ASizeColTerceirizadas);

     if ModelConexaoDados.memTerceirizada.RecordCount > 0 then
        FIdSelecionado :=  ExtraiTextoGrid(grdListaTerceirizada.Cells[0, 1]).ToInteger;

end;

procedure TfrmGerenciadorTerceirizadas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FreeAndNil(gclTerceirizada);
     Action := TCloseAction.caFree;
end;

procedure TfrmGerenciadorTerceirizadas.FormCreate(Sender: TObject);
begin
     CarregaPersonalizacaoCabecarioRodape(Self);
     tabCabecarioTerceirizada.TabIndex   := 0;
     tabGerenciadorTerceirizada.TabIndex := 0;
     gclTerceirizada := TModelTerceirizada.Create(Self);

     grdListaTerceirizada.Cells[0,0]  := 'Código';
     grdListaTerceirizada.Cells[1,0]  := 'CNPJ';
     grdListaTerceirizada.Cells[2,0]  := 'Razão Social';
     grdListaTerceirizada.Cells[3,0]  := 'Nome Fantasia';
     grdListaTerceirizada.Cells[4,0]  := 'Logradouro';
     grdListaTerceirizada.Cells[5,0]  := 'Nr.';
     grdListaTerceirizada.Cells[6,0]  := 'Complemento';
     grdListaTerceirizada.Cells[7,0]  := 'Bairro';
     grdListaTerceirizada.Cells[8,0]  := 'CEP';
     grdListaTerceirizada.Cells[9,0]  := 'Cidade';
     grdListaTerceirizada.Cells[10,0] := 'UF';
end;

end.
