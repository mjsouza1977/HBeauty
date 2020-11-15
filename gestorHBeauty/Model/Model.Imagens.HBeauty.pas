unit Model.Imagens.HBeauty;

interface

type
    TModelImagens = class

        private
    FIDIMAGEM: Integer;
    FUPDATEIMAGEM: TDateTime;
    FNOMEFILEIMAGEM: String;
    procedure SetIDIMAGEM(const Value: Integer);
    procedure SetNOMEFILEIMAGEM(const Value: String);
    procedure SetUPDATEIMAGEM(const Value: TDateTime);

        public
            property IDIMAGEM       : Integer   read FIDIMAGEM       write SetIDIMAGEM;
            property NOMEFILEIMAGEM : String    read FNOMEFILEIMAGEM write SetNOMEFILEIMAGEM;
            property UPDATEIMAGEM   : TDateTime read FUPDATEIMAGEM   write SetUPDATEIMAGEM;
    end;


implementation

{ TModelImagens }

procedure TModelImagens.SetIDIMAGEM(const Value: Integer);
begin
  FIDIMAGEM := Value;
end;

procedure TModelImagens.SetNOMEFILEIMAGEM(const Value: String);
begin
  FNOMEFILEIMAGEM := Value;
end;

procedure TModelImagens.SetUPDATEIMAGEM(const Value: TDateTime);
begin
  FUPDATEIMAGEM := Value;
end;

end.
