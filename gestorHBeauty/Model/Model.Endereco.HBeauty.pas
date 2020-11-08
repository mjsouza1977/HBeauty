unit Model.Endereco.HBeauty;


interface

uses
    Units.Strings.HBeauty,
    ACBRValidador,
    FMX.Forms,
    FMX.Platform.Win;

type
    TModelEndereco = class

    private
    FLOGRADOURO: String;
    FCOMPLLOG: String;
    FCEP: String;
    FNRLOG: Integer;
    FCIDADELOG: String;
    FBAIRROLOG: String;
    FUFLOG: String;
    FValidador : TACBRValidador;
    FForm : TForm;
    FMsg : String;
    procedure SetBAIRROLOG(const Value: String);
    procedure SetCEP(const Value: String);
    procedure SetCIDADELOG(const Value: String);
    procedure SetCOMPLLOG(const Value: String);
    procedure SetLOGRADOURO(const Value: String);
    procedure SetNRLOG(const Value: Integer);
    procedure SetUFLOG(const Value: String);

    public

    property LOGRADOURO  : String   read FLOGRADOURO write SetLOGRADOURO;
    property NRLOG       : Integer  read FNRLOG      write SetNRLOG;
    property COMPLLOG    : String   read FCOMPLLOG   write SetCOMPLLOG;
    property BAIRROLOG   : String   read FBAIRROLOG  write SetBAIRROLOG;
    property CIDADELOG   : String   read FCIDADELOG  write SetCIDADELOG;
    property UFLOG       : String   read FUFLOG      write SetUFLOG;
    property CEP         : String   read FCEP        write SetCEP;
    constructor create(AForm : TForm);


    end;

implementation

uses
  Winapi.Windows, Units.Consts.HBeauty, System.SysUtils;

{ TModelEndereco }

constructor TModelEndereco.create(AForm: TForm);
begin
     FForm := AForm;
end;

procedure TModelEndereco.SetBAIRROLOG(const Value: String);
begin
    if Value = '' then
       begin
           MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                     'Bairro inválido, verifique!', apTitulo,
                      MB_OK + MB_ICONINFORMATION);
           Abort;
       end
   else
       begin
           FBAIRROLOG := Value;
       end;
end;

procedure TModelEndereco.SetCEP(const Value: String);
begin

    FMsg := ACBRValidador.ValidarCEP(Value, FUFLOG);

    if FMsg <> '' then
        begin
           MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                     pChar(FMsg), apTitulo,
                      MB_OK + MB_ICONINFORMATION);
           Abort;
        end
    else
        begin
             FCEP := ApenasNumeros(Value);
        end;
end;

procedure TModelEndereco.SetCIDADELOG(const Value: String);
begin
    if Value = '' then
        begin
           MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                     'Cidade inválida, verifique!', apTitulo,
                      MB_OK + MB_ICONINFORMATION);
           Abort;
        end
    else
        begin
            FCIDADELOG := Value;
        end;
end;

procedure TModelEndereco.SetCOMPLLOG(const Value: String);
begin
  FCOMPLLOG := Value;
end;

procedure TModelEndereco.SetLOGRADOURO(const Value: String);
begin
    if Value = '' then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                      'Logradouro inválido, verifique!', apTitulo,
                       MB_OK + MB_ICONINFORMATION);
            Abort;
        end
    else
        begin
            FLOGRADOURO := Value;
        end;
end;

procedure TModelEndereco.SetNRLOG(const Value: Integer);
begin
  FNRLOG := Value;
end;

procedure TModelEndereco.SetUFLOG(const Value: String);
begin

    FMsg := '';
    FMsg := ACBRValidador.ValidarUF(Value);
    if FMsg <> '' then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                      pChar(FMsg), apTitulo,
                       MB_OK + MB_ICONINFORMATION);
            Abort;
        end
    else
        begin
            FUFLOG := Value;
        end;
end;

end.
