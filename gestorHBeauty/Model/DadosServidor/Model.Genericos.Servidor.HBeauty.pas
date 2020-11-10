unit Model.Genericos.Servidor.HBeauty;

interface

uses Controller.Conexao.Proxy.HBeauty, Controller.ClientModule.HBeauty,
  FMX.Forms;

function DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela : String; AForm : TForm) : Boolean;
function ManipulaEstadoRegistro(ABloqueia : Boolean; AIdRegistro: Integer; ACampoID, ATabela, ACampoLock: String) : Boolean;

implementation

uses
  Winapi.Windows, FMX.Platform.Win, Units.Consts.HBeauty, System.SysUtils;

function ManipulaEstadoRegistro(ABloqueia : Boolean; AIdRegistro: Integer; ACampoID, ATabela, ACampoLock: String) : Boolean;
begin
    Result := ControllerClientModule.ModelMetodosClient.ManipulaEstadoRegistro(ABloqueia ,AIdRegistro, ACampoID, ATabela, ACampoLock);
end;

function DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela : String; AForm : TForm) : Boolean;
var
ARepetido : String;
begin

    ARepetido := '';
    ARepetido := ControllerClientModule.ModelMetodosClient.DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela);

    if ARepetido <> '' then
        begin
            Result := True;
            MessageBox(WindowHandleToPlatform(AForm.Handle).Wnd,
                       pChar('A empresa ' + ARepetido + ' esta cadastrada com o CNPJ informado, verifique!'),
                        apTitulo, MB_OK + MB_ICONWARNING);
            Abort;
        end
    else
        begin
            Result := False;
        end;
end;

end.
