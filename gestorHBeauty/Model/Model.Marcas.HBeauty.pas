unit Model.Marcas.HBeauty;

interface

uses
    FMX.Forms, Model.Imagens.HBeauty;

type
    TModelMarcas = class
    private
    FMARCA_MARCA: String;
    FLOCK: String;
    FIDUSULOCK: Integer;
    FID_MARCA: Integer;
    FForm : TForm;
    FIMAGENS: TModelImagens;
    procedure SetID_MARCA(const Value: Integer);
    procedure SetIDUSULOCK(const Value: Integer);
    procedure SetLOCK(const Value: String);
    procedure SetMARCA_MARCA(const Value: String);
    procedure SetIMAGENS(const Value: TModelImagens);

    public
    property ID_MARCA     : Integer       read FID_MARCA    write SetID_MARCA;
    property MARCA_MARCA  : String        read FMARCA_MARCA write SetMARCA_MARCA;
    property IDUSULOCK    : Integer       read FIDUSULOCK   write SetIDUSULOCK;
    property LOCK         : String        read FLOCK        write SetLOCK;
    property IMAGENS      : TModelImagens read FIMAGENS     write SetIMAGENS;
    constructor Create(AForm : TForm);
    end;

implementation

uses
  FMX.Platform.Win, Units.Consts.HBeauty, Winapi.Windows, System.SysUtils;

constructor TModelMarcas.Create(AForm: TForm);
begin
     FForm := AForm;
     FIMAGENS := TModelImagens.Create;
end;

procedure TModelMarcas.SetIDUSULOCK(const Value: Integer);
begin
  FIDUSULOCK := Value;
end;

procedure TModelMarcas.SetID_MARCA(const Value: Integer);
begin
  FID_MARCA := Value;
end;

procedure TModelMarcas.SetIMAGENS(const Value: TModelImagens);
begin
  FIMAGENS := Value;
end;

procedure TModelMarcas.SetLOCK(const Value: String);
begin
  FLOCK := Value;
end;

procedure TModelMarcas.SetMARCA_MARCA(const Value: String);
begin
    if Length(Value) < 3 then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                       'Marca inválida, verifique!.', apTitulo,
                       MB_OK + MB_ICONINFORMATION);
                       Abort;
        end
    else
        begin
             FMARCA_MARCA := Value;
        end;
end;

end.
