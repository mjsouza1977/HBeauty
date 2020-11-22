unit Model.Cargos.HBeauty;

interface

uses
    FMX.Forms;

type
    TModelCargos = class
        private
        FNOME_CARGO: String;
        FID_CARGO: Integer;
        FDESCR_CARGO: String;
        FForm : TForm;
        procedure SetDESCR_CARGO(const Value: String);
        procedure SetID_CARGO(const Value: Integer);
        procedure SetNOME_CARGO(const Value: String);

        public
        property ID_CARGO    : Integer read FID_CARGO    write SetID_CARGO;
        property NOME_CARGO  : String  read FNOME_CARGO  write SetNOME_CARGO;
        property DESCR_CARGO : String  read FDESCR_CARGO write SetDESCR_CARGO;
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
    if Value = '' then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                       'O campo cargo não pode ficar vazio!',
                       apTitulo, MB_OK + MB_ICONINFORMATION);
            Abort;
        end
    else
        begin
             FNOME_CARGO := Value;
        end;
end;

end.
