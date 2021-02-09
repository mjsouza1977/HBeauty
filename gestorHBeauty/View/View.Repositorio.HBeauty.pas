unit View.Repositorio.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, Units.Enumerados.HBeauty, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type

 TMyThread = class(TThread)
   private
        FUrlFtp, FFileFtp : String;
        FimgImage : TImage;
        Fms: TMemoryStream;
        FLoading : TAniIndicator;
        public

        procedure LoadingImages(APathFtp, ANomeImage : String; AImage : TImage; ALoading : TAniIndicator);


   protected
        procedure Execute; override;
        constructor create;
   end;

  TForm1 = class(TForm)
    grdlytFotos: TGridLayout;
    VertScrollBox1: TVertScrollBox;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    Rectangle19: TRectangle;
    Rectangle20: TRectangle;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    Rectangle23: TRectangle;
    Rectangle24: TRectangle;
    Rectangle25: TRectangle;
    Rectangle26: TRectangle;
    Rectangle27: TRectangle;
    Rectangle28: TRectangle;
    Rectangle29: TRectangle;
    Rectangle30: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    MyThread : TMyThread;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
uses
View.Produtos.HBeauty, IdFTP, Units.Consts.HBeauty, IdFTPCommon, System.Math;


procedure TMyThread.LoadingImages(APathFtp, ANomeImage : String; AImage : TImage; ALoading : TAniIndicator);
begin
    With Form1 do
        begin
            MyThread                 := TMyThread.create;
            MyThread.FUrlFtp         := APathFtp;
            MyThread.FFileFtp        := ANomeImage;
            MyThread.FimgImage       := AImage;
            MyThread.FLoading        := ALoading;
            MyThread.FreeOnTerminate := True;
            MyThread.Start;
        end;
end;

constructor TMyThread.create;
begin
     inherited Create(True);
end;

procedure TMyThread.Execute;
var
   AFtp : TIdFTP;

begin
  inherited;

    Synchronize(
    procedure
    begin
         FLoading.Enabled := True;
    end);
    Self.Fms := TMemoryStream.Create;
    Self.Fms.Position := 0;

    AFtp          := TIdFTP.Create(Application);
    AFtp.host     := ctrHOST_FTP; // Endereço do servidor AFtp
    AFtp.port     := ctrPORTA_FTP;
    AFtp.username := ctrUSUARIO_FTP; // Parametro nome usuario servidor AFtp
    AFtp.password := ctrSENHA_FTP; // Parametro senha servidor AFtp
    AFtp.Connect();
    AssErt(AFtp.Connected);

    AFtp.ChangeDir(Self.FUrlFtp);
    AFtp.TransferType := ftBinary;
    AFtp.Get(Self.FFileFtp, Self.Fms);

    Synchronize(
    procedure
    var
         img : TImage;
    begin
         img := TImage.Create(nil);
         img.Bitmap.LoadFromStream(Self.Fms);

         Self.FimgImage.Bitmap := img.Bitmap;
         FLoading.Enabled := False;

         img.DisposeOf;
         Self.Fms.DisposeOf;
         AFtp.DisposeOf;

    end);

end;

procedure TForm1.FormCreate(Sender: TObject);
var
i : Integer;
AImage : TImage;
ALoading : TAniIndicator;
AArquivos : TStringList;
begin

     try

        AArquivos:= TStringList.Create;
        AArquivos.Add('PRO1111111.JPG');
        AArquivos.Add('PRO2222222.JPG');
        AArquivos.Add('PRO6797213.JPG');

        for i := 0 to 2 do
            begin
                AImage := TImage.Create(nil);
                AImage.Parent := grdlytFotos;
                AImage.Name := 'Foto' + i.ToString;

                ALoading := TAniIndicator.Create(nil);
                ALoading.Parent := AImage;
                ALoading.Align  := TAlignLayout.Center;
                ALoading.Height := 50;
                ALoading.Width  := 50;
                ALoading.Name   := 'Loading' + i.ToString;

                MyThread.LoadingImages(ctrPATHIMAGEM_FTP, AArquivos.Strings[i], AImage, ALoading);

            end;
     finally
         FreeAndNil(AArquivos);
     end;

end;

procedure TForm1.FormResize(Sender: TObject);
var
ATotalItens, AItensLargura, AItensAltura : Single;
begin
     AItensLargura := Round(grdlytFotos.Width / grdlytFotos.ItemWidth);

     ATotalItens  := grdlytFotos.ControlsCount;
     AItensAltura := Ceil(ATotalItens / AItensLargura);

     grdlytFotos.Height := grdlytFotos.ItemHeight * AItensAltura;
end;

end.
