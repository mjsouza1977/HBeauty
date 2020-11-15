unit Model.Documentos.HBeauty;

interface

uses
FMX.Forms, Model.Endereco.HBeauty;

type
    TModelDocumentos = class
    private

    FCNPJ: String;
    FIE: String;
    FForm : TForm;
    FRG: String;
    FCPF: String;
    FENDERECO: TModelEndereco;
    procedure SetCNPJ(const Value: String);
    procedure SetIE(const Value: String);
    procedure SetCNPJCPF(const Value: String);
    procedure SetCPF(const Value: String);
    procedure SetRG(const Value: String);
    procedure SetENDERECO(const Value: TModelEndereco);

    public

    property CNPJ     : String          read FCNPJ     write SetCNPJ;
    property IE       : String          read FIE       write SetIE;
    property CPF      : String          read FCPF      write SetCPF;
    property RG       : String          read FRG       write SetRG;
    property ENDERECO : TModelEndereco  read FENDERECO write SetENDERECO;
    constructor Create(AForm : TForm);

    end;

implementation

uses
  ACBrValidador,
  FMX.Platform.Win,
  Winapi.Windows,
  Units.Strings.HBeauty,
  Units.Consts.HBeauty, System.SysUtils;

{ ModelDocumentos }

constructor TModelDocumentos.Create(AForm: TForm);
begin
    FForm     := TForm.Create(nil);
    FENDERECO := TModelEndereco.create(AForm);
end;

procedure TModelDocumentos.SetCNPJ(const Value: String);
var
AMsg : String;
begin
    AMsg := ACBRValidador.ValidarCNPJ(ApenasNumeros(Value));
    if AMsg <> '' then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                      pChar(AMsg), apTitulo,
                      MB_OK + MB_ICONINFORMATION);
                      Abort;
        end
    else
        begin
            FCNPJ := ApenasNumeros(Value);
        end;
end;


procedure TModelDocumentos.SetCNPJCPF(const Value: String);
begin

end;

procedure TModelDocumentos.SetCPF(const Value: String);
begin
    FValidador.TipoDocto := docCPF;
    FValidador.Documento := ApenasNumeros(Value);

    case FValidador.Validar of

         True  : FCPF_PROFIS := Value;
         False : begin
                      MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                                 'C.P.F. Inválido, verifique!',
                                 apTitulo,
                                 MB_OK + MB_ICONINFORMATION);
                      Abort;
                 end;
    end;

end;

procedure TModelDocumentos.SetENDERECO(const Value: TModelEndereco);
begin
  FENDERECO := Value;
end;

procedure TModelDocumentos.SetIE(const Value: String);
var
AMsg : String;
begin
    AMsg := '';
    if ApenasNumeros(Value) <> '' then
        begin
            AMsg := ACBRValidador.ValidarIE(ApenasNumeros(Value), FENDERECO.UFLOG);
            AMsg := AMsg + #13#13 + 'Caso seja isento preencha "ISENTO" no campo I.E.';
            if AMsg <> '' then
                begin
                    MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                               pChar(AMsg), apTitulo, MB_OK + MB_ICONWARNING);
                               Abort;
                end
            else
               begin
                   FIE := ApenasNumeros(Value);
               end;
        end
    else
        begin
            if Value <> 'ISENTO' then
                begin
                    MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                               'Caso a Incrição seja iseno, preencha "ISENTO" no campo I.E.',
                               apTitulo, MB_OK + MB_ICONWARNING);
                               Abort;
                end
            else
                begin
                    FIE := Value;
                end;
        end;
end;

procedure TModelDocumentos.SetRG(const Value: String);
begin
  FRG := Value;
end;

end.
