unit Model.Usuarios.HBeauty;

interface

type
    TModelUsuarios = class
    private
    FCARGO_USU: String;
    FLOGIN_USU: String;
    FCEL_USU: String;
    FNOME_USU: Integer;
    FEMAIL_USU: String;
    FID_USU: Integer;
    FSENHA_USU: String;
    procedure SetCARGO_USU(const Value: String);
    procedure SetCEL_USU(const Value: String);
    procedure SetEMAIL_USU(const Value: String);
    procedure SetID_USU(const Value: Integer);
    procedure SetLOGIN_USU(const Value: String);
    procedure SetNOME_USU(const Value: Integer);
    procedure SetSENHA_USU(const Value: String);

    public

    property ID_USU     : Integer read FID_USU write SetID_USU;
    property NOME_USU   : Integer read FNOME_USU write SetNOME_USU;
    property EMAIL_USU  : String read FEMAIL_USU write SetEMAIL_USU;
    property CEL_USU    : String read FCEL_USU write SetCEL_USU;
    property CARGO_USU  : String read FCARGO_USU write SetCARGO_USU;
    property LOGIN_USU  : String read FLOGIN_USU write SetLOGIN_USU;
    property SENHA_USU  : String read FSENHA_USU write SetSENHA_USU;

    end;

implementation

{ TModelUsuarios }

procedure TModelUsuarios.SetCARGO_USU(const Value: String);
begin
  FCARGO_USU := Value;
end;

procedure TModelUsuarios.SetCEL_USU(const Value: String);
begin
  FCEL_USU := Value;
end;

procedure TModelUsuarios.SetEMAIL_USU(const Value: String);
begin
  FEMAIL_USU := Value;
end;

procedure TModelUsuarios.SetID_USU(const Value: Integer);
begin
  FID_USU := Value;
end;

procedure TModelUsuarios.SetLOGIN_USU(const Value: String);
begin
  FLOGIN_USU := Value;
end;

procedure TModelUsuarios.SetNOME_USU(const Value: Integer);
begin
  FNOME_USU := Value;
end;

procedure TModelUsuarios.SetSENHA_USU(const Value: String);
begin
  FSENHA_USU := Value;
end;

end.
