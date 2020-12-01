unit Model.Fornecedor.HBeauty;

interface

uses
  Model.Endereco.HBeauty,
  FMX.Forms, ACBrValidador;

type

    TModelFornecedor = class

    private
    FCODIGO_FORN  : String;
    FPSEUDO_FORN  : String;
    FCNPJCPF_FORN : String;
    FID_FORN      : Integer;
    FIERG_FORN    : String;
    FNOME_FORN    : String;
    FDATACAD_FORN : TDate;
    FENDERECO     : TModelEndereco;
    FValidador    : TACBRValidador;
    FForm         : TForm;

    procedure SetCNPJCPF_FORN(const Value: String);
    procedure SetCODIGO_FORN(const Value: String);
    procedure SetDATACAD_FORN(const Value: TDate);
    procedure SetENDERECO(const Value: TModelEndereco);
    procedure SetID_FORN(const Value: Integer);
    procedure SetIERG_FORN(const Value: String);
    procedure SetNOME_FORN(const Value: String);
    procedure SetPSEUDO_FORN(const Value: String);

    public

    property ID_FORN          : Integer        read FID_FORN      write SetID_FORN;
    property CODIGO_FORN      : String         read FCODIGO_FORN  write SetCODIGO_FORN;
    property NOME_FORN        : String         read FNOME_FORN    write SetNOME_FORN;
    property PSEUDO_FORN      : String         read FPSEUDO_FORN  write SetPSEUDO_FORN;
    property CNPJCPF_FORN     : String         read FCNPJCPF_FORN write SetCNPJCPF_FORN;
    property IERG_FORN        : String         read FIERG_FORN    write SetIERG_FORN;
    property ENDERECO         : TModelEndereco read FENDERECO     write SetENDERECO;
    property DATACAD_FORN     : TDate          read FDATACAD_FORN write SetDATACAD_FORN;
    constructor Create(AForm : TForm);
    end;

implementation

uses
  FMX.Platform.Win, Winapi.Windows, Units.Strings.HBeauty,
  Units.Consts.HBeauty, System.SysUtils;

{ TModelFornecedor }

constructor TModelFornecedor.Create(AForm: TForm);
begin
     FForm := AForm;
     FValidador := TACBRValidador.Create(nil);
     FENDERECO  := TModelEndereco.Create(AForm);
end;

procedure TModelFornecedor.SetCNPJCPF_FORN(const Value: String);
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
            FCNPJCPF_FORN := ApenasNumeros(Value);
        end;
end;

procedure TModelFornecedor.SetCODIGO_FORN(const Value: String);
begin
  FCODIGO_FORN := Value;
end;

procedure TModelFornecedor.SetDATACAD_FORN(const Value: TDate);
begin
  FDATACAD_FORN := Value;
end;

procedure TModelFornecedor.SetENDERECO(const Value: TModelEndereco);
begin
  FENDERECO := Value;
end;

procedure TModelFornecedor.SetID_FORN(const Value: Integer);
begin
  FID_FORN := Value;
end;

procedure TModelFornecedor.SetIERG_FORN(const Value: String);
begin
  FIERG_FORN := Value;
end;

procedure TModelFornecedor.SetNOME_FORN(const Value: String);
begin
    if Length(Value) < 5 then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                       'Razão Social inválida, verifique!.', apTitulo,
                       MB_OK + MB_ICONINFORMATION);
                       Abort;
        end
    else
        begin
             FNOME_FORN := Value;
        end;

end;

procedure TModelFornecedor.SetPSEUDO_FORN(const Value: String);
begin
  FPSEUDO_FORN := Value;
end;

end.
