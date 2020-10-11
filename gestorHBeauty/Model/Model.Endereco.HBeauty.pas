unit Model.Endereco.HBeauty;

interface

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


    end;

implementation

{ TModelEndereco }

procedure TModelEndereco.SetBAIRROLOG(const Value: String);
begin
  FBAIRROLOG := Value;
end;

procedure TModelEndereco.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TModelEndereco.SetCIDADELOG(const Value: String);
begin
  FCIDADELOG := Value;
end;

procedure TModelEndereco.SetCOMPLLOG(const Value: String);
begin
  FCOMPLLOG := Value;
end;

procedure TModelEndereco.SetLOGRADOURO(const Value: String);
begin
  FLOGRADOURO := Value;
end;

procedure TModelEndereco.SetNRLOG(const Value: Integer);
begin
  FNRLOG := Value;
end;

procedure TModelEndereco.SetUFLOG(const Value: String);
begin
  FUFLOG := Value;
end;

end.
