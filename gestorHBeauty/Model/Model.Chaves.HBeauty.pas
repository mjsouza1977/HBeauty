unit Model.Chaves.HBeauty;

interface

type
    TModelChaves = class

    private
    FTOKEN: String;
    procedure SetTOKEN(const Value: String);

    public

    property TOKEN : String read FTOKEN write SetTOKEN;


    end;

implementation

{ TModelChaves }

procedure TModelChaves.SetTOKEN(const Value: String);
begin
  FTOKEN := Value;
end;

end.
