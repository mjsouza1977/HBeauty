unit View.ConflitoImagens.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.TMSButton, FMX.Objects, FMX.Controls.Presentation;

type
  TfrmFotosRepetidas = class(TForm)
    Image1: TImage;
    imgFotoServer: TImage;
    imgFotoLocal: TImage;
    Label1: TLabel;
    imgCloud: TImage;
    imgLocal: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Line1: TLine;
    recbtnValidarPositivo: TRectangle;
    lblValidar: TLabel;
    recbtnVoltarNegativo: TRectangle;
    lblCaptionVoltar: TLabel;
    procedure recbtnVoltarNegativoClick(Sender: TObject);
    procedure recbtnValidarPositivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    FNomeArquivo : String;
    { Public declarations }
  end;

var
  frmFotosRepetidas: TfrmFotosRepetidas;

implementation

{$R *.fmx}

uses View.Produtos.HBeauty, Units.Enumerados.HBeauty;

procedure TfrmFotosRepetidas.recbtnValidarPositivoClick(Sender: TObject);
var
AExtensao : String;
begin
    AExtensao := UpperCase(ExtractFileExt(FNomeArquivo));
    frmGerenciadorProdutos.FListaImagens.Add(FNomeArquivo);
    frmGerenciadorProdutos.carregaImagem(frmGerenciadorProdutos.grdlytFotos, FNomeArquivo, stOffLine);
    frmFotosRepetidas.Close;
end;

procedure TfrmFotosRepetidas.recbtnVoltarNegativoClick(Sender: TObject);
begin
     imgFotoServer.Bitmap := nil;
     imgFotoLocal.Bitmap  := nil;
     Close;
end;

end.
