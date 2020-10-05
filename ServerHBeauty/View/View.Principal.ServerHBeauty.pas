unit View.Principal.ServerHBeauty;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmServerPrincipal = class(TForm)
    btnIniciar: TButton;
    EditPort: TEdit;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    Image1: TImage;
    TrayIcon: TTrayIcon;
    procedure FormCreate(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServerPrincipal: TfrmServerPrincipal;

implementation

{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, Datasnap.DSSession;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TfrmServerPrincipal.ApplicationEvents1Minimize(Sender: TObject);
begin
     Self.Hide();
     Self.WindowState := wsMinimized;
     TrayIcon.Visible := True;
end;

procedure TfrmServerPrincipal.btnIniciarClick(Sender: TObject);
begin
  if btnIniciar.Caption = 'Iniciar' then
      begin
          StartServer;
          btnIniciar.Caption := 'Parar';
      end
  else
      begin
          TerminateThreads;
          btnIniciar.Caption := 'Iniciar';
          FServer.Active := False;
          FServer.Bindings.Clear;
      end;
end;

procedure TfrmServerPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if btnIniciar.Caption = 'Parar' then
        Action := caNone else
        Action := caFree;
end;

procedure TfrmServerPrincipal.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
end;

procedure TfrmServerPrincipal.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
  end;
end;

procedure TfrmServerPrincipal.TrayIconDblClick(Sender: TObject);
begin

  TrayIcon.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();

end;

end.
