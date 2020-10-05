unit View.Principal.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Controls.Presentation, FMX.MultiView, FMX.Layouts, FMX.StdCtrls, Xml.xmldom,
  Xml.XMLIntf, FMX.ScrollBox, FMX.Memo, Xml.XMLDoc, Controller.ConexaoWS.HBeauty, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Response.Adapter, System.Actions, FMX.ActnList, FMX.Menus, Controller.Manipula.XML.HBeauty, Units.Strings.HBeauty, Xml.omnixmldom,
  Xml.adomxmldom, Units.Consts.HBeauty, Units.Utils.HBeauty, Xml.Win.msxmldom;

type
  TfrmPrincipal = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Image1: TImage;
    Layout1: TLayout;
    Layout2: TLayout;
    Label1: TLabel;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    lblData: TLabel;
    lblClima: TLabel;
    XMLDocument: TXMLDocument;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Circle1: TCircle;
    MenuPrincipal: TMenuBar;
    MenuLogo: TMenuItem;
    mnCadastros: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    StyleBook1: TStyleBook;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    aniLoadingTemperatura: TAniIndicator;
    Rectangle3: TRectangle;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
Node : IXMLNode;
AMin, AMax, AIdCidade : String;
begin

    aniLoadingTemperatura.Enabled := True;
    aniLoadingTemperatura.Enabled := True;
    TThread.CreateAnonymousThread(
    procedure
    begin
        try
            try
                Sleep(1000);
                XMLDocument.FileName := Format(AurlXMLGetIdCidade, [RemoveAcento('São Paulo')]);
                XMLDocument.Active := True;
                Node := XMLDocument.ChildNodes.FindNode('cidades');
                AIdCidade := Node.ChildNodes['cidade'].ChildNodes['id'].Text;

                XMLDocument.FileName := Format(AurlXMLGetTemperatura,[AIdCidade]);
                XMLDocument.Active := True;
                Node := XMLDocument.ChildNodes.FindNode('cidade');
                AMin := Node.ChildNodes['previsao'].ChildNodes['maxima'].Text;
                AMax := Node.ChildNodes['previsao'].ChildNodes['minima'].Text;
                TThread.Synchronize(nil,
                procedure
                begin
                    lblData.Text  := DateToStr(Now);
                    lblClima.Text := 'São Paulo - ' + AMin + 'º\' + AMax + 'º';
                end);
            except
                  TThread.CurrentThread.Terminate;
            end;
        finally
            aniLoadingTemperatura.Enabled := False;
            aniLoadingTemperatura.Visible := False;
        end;
    end).Start;


end;

end.
