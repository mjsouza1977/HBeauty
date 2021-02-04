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
        public

        procedure LoadingImages(APathFtp, ANomeImage : String; AImage : TImage);


   protected
        procedure Execute; override;
        constructor create;
   end;

  TForm1 = class(TForm)
    grdlytFotos: TGridLayout;
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure Button1Click(Sender: TObject);
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
View.Produtos.HBeauty, IdFTP, Units.Consts.HBeauty, IdFTPCommon;


procedure TForm1.Button1Click(Sender: TObject);
begin

     MyThread.LoadingImages(ctrPATHIMAGEM_FTP, 'PRO1111111.JPG',Image1);
     MyThread.LoadingImages(ctrPATHIMAGEM_FTP, 'PRO2222222.JPG',Image2);
     MyThread.LoadingImages(ctrPATHIMAGEM_FTP, 'PRO6797213.JPG',Image3);

//     frmGerenciadorProdutos.carregaImagem(grdlytFotos,'PRO1111111.JPG', stOnLine);
//     frmGerenciadorProdutos.carregaImagem(grdlytFotos,'PRO2222222.JPG', stOnLine);
//     frmGerenciadorProdutos.carregaImagem(grdlytFotos,'PRO6797213.JPG', stOnLine);

end;

procedure TMyThread.LoadingImages(APathFtp, ANomeImage : String; AImage : TImage);
begin
    With Form1 do
        begin
            MyThread                 := TMyThread.create;
            MyThread.FUrlFtp         := APathFtp;
            MyThread.FFileFtp        := ANomeImage;
            MyThread.FimgImage       := AImage;
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

         img.DisposeOf;
         Self.Fms.DisposeOf;
         AFtp.DisposeOf;

    end);

end;

end.
