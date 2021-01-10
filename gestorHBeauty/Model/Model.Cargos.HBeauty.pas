unit Model.Cargos.HBeauty;

interface

uses
    FMX.Forms, Units.Utils.HBeauty;

type
    TModelCargos = class
        private
        FNOME_CARGO: String;
        FID_CARGO: Integer;
        FDESCR_CARGO: String;
        FForm : TForm;
    FCODIGO_CARGO: Integer;
        procedure SetDESCR_CARGO(const Value: String);
        procedure SetID_CARGO(const Value: Integer);
        procedure SetNOME_CARGO(const Value: String);
    procedure SetCODIGO_CARGO(const Value: Integer);

        public
        property ID_CARGO     : Integer read FID_CARGO     write SetID_CARGO;
        property CODIGO_CARGO : Integer read FCODIGO_CARGO write SetCODIGO_CARGO;
        property NOME_CARGO   : String  read FNOME_CARGO   write SetNOME_CARGO;
        property DESCR_CARGO  : String  read FDESCR_CARGO  write SetDESCR_CARGO;
        constructor Create(AForm : TForm);
    end;

implementation

uses
  Winapi.Windows, FMX.Platform.Win, Units.Consts.HBeauty, System.SysUtils;

{ TModelCargos }

constructor TModelCargos.Create(AForm: TForm);
begin
    FForm := AForm;
end;

procedure TModelCargos.SetCODIGO_CARGO(const Value: Integer);
begin
  FCODIGO_CARGO := Value;
end;

procedure TModelCargos.SetDESCR_CARGO(const Value: String);
begin
  FDESCR_CARGO := Value;
end;

procedure TModelCargos.SetID_CARGO(const Value: Integer);
begin
  FID_CARGO := Value;
end;

procedure TModelCargos.SetNOME_CARGO(const Value: String);
begin

    if validaCampoVazio(FForm,Value, 'Cargo', 5) then
        FNOME_CARGO := Value;

end;

end.
