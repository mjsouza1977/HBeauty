unit View.Login.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, View.Principal.HBeauty, FMX.TabControl,

  Units.Utils.Dados.HBeauty,
  Units.Utils.HBeauty;

type
  TfrmLogin = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Image1: TImage;
    Label5: TLabel;
    Label3: TLabel;
    Layout1: TLayout;
    Rectangle3: TRectangle;
    edtLoginPrincipal: TEdit;
    Label2: TLabel;
    Rectangle4: TRectangle;
    edtSenhaPrincipal: TEdit;
    Label1: TLabel;
    recbtnEntrar: TRectangle;
    Label6: TLabel;
    recbtnSair: TRectangle;
    Label4: TLabel;
    Rectangle5: TRectangle;
    lblEsqueciSenha: TLabel;
    Layout2: TLayout;
    StyleBook1: TStyleBook;
    tbcLogin: TTabControl;
    tbLogin: TTabItem;
    tbRecuperaSenha: TTabItem;
    Layout3: TLayout;
    Label8: TLabel;
    Rectangle8: TRectangle;
    edtCPFLogin: TEdit;
    Layout4: TLayout;
    Layout5: TLayout;
    Rectangle6: TRectangle;
    edtValidacao1: TEdit;
    Rectangle7: TRectangle;
    edtValidacao2: TEdit;
    Rectangle9: TRectangle;
    edtValidacao3: TEdit;
    Rectangle10: TRectangle;
    edtValidacao4: TEdit;
    Rectangle11: TRectangle;
    edtValidacao5: TEdit;
    Label7: TLabel;
    imgStatuValidacao: TImage;
    recbtnValidar: TRectangle;
    lblValidar: TLabel;
    recbtnVoltar: TRectangle;
    lblCaptionVoltar: TLabel;
    Rectangle12: TRectangle;
    Label9: TLabel;
    procedure recbtnEntrarClick(Sender: TObject);
    procedure edtValidacao1KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    lcCodigoValidacao : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
implementation

{$R *.fmx}

procedure TfrmLogin.edtValidacao1KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
var
vIndiceEdit : Integer;
vComponentName, vIdValidacao, vIndexComponentName : String;
begin

     vComponentName      := TEdit(Sender).Name;
     vIndexComponentName := Copy(vComponentName,1,Length(vComponentName) - 1);
     vIndiceEdit         := Copy(vComponentName, Length(vComponentName), 1).ToInteger + 1;

     if vIndiceEdit < 6 then
        if Length(TEdit(Sender).Text) = 1 then
           TEdit(Self.FindComponent(vIndexComponentName + vIndiceEdit.ToString)).SetFocus;

     for var i := 1 to 5 do
        vIdValidacao   := vIdValidacao   + TEdit(Self.FindComponent('edtValidacao' + i.ToString)).Text;

        if vIdValidacao = lcCodigoValidacao then
           begin
                CarregaImagemRessource(imgStatuValidacao, 'Check');
                recbtnValidar.Visible := True;
           end
        else
           begin
                CarregaImagemRessource(imgStatuValidacao, 'UnCheck');
                recbtnValidar.Visible := False;
           end;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin

     CarregaVariaveisControle;

end;

procedure TfrmLogin.recbtnEntrarClick(Sender: TObject);
begin
     Application.CreateForm(TfrmPrincipal, frmPrincipal);
     Application.MainForm := frmPrincipal;
     frmPrincipal.Show;
     frmLogin.Close;
end;

end.
