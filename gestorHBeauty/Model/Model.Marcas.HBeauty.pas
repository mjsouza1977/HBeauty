unit Model.Marcas.HBeauty;

interface

uses
    FMX.Forms, Model.Imagens.HBeauty, Units.Utils.Dados.HBeauty, Units.Utils.HBeauty;

type
    TModelMarcas = class
    private
    FMARCA_MARCA: String;
    FLOCK: String;
    FIDUSULOCK: Integer;
    FID_MARCA: Integer;
    FForm : TForm;
    FIMAGENS: TModelImagens;
    FCODIGO_MARCA: Integer;
    procedure SetID_MARCA(const Value: Integer);
    procedure SetIDUSULOCK(const Value: Integer);
    procedure SetLOCK(const Value: String);
    procedure SetMARCA_MARCA(const Value: String);
    procedure SetIMAGENS(const Value: TModelImagens);
    procedure SetCODIGO_MARCA(const Value: Integer);

    public
    property ID_MARCA     : Integer       read FID_MARCA     write SetID_MARCA;
    property CODIGO_MARCA : Integer       read FCODIGO_MARCA write SetCODIGO_MARCA;
    property MARCA_MARCA  : String        read FMARCA_MARCA  write SetMARCA_MARCA;
    property IDUSULOCK    : Integer       read FIDUSULOCK    write SetIDUSULOCK;
    property LOCK         : String        read FLOCK         write SetLOCK;
    property IMAGENS      : TModelImagens read FIMAGENS      write SetIMAGENS;
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

procedure TModelMarcas.SetCODIGO_MARCA(const Value: Integer);
begin
  FCODIGO_MARCA := Value;
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
    if validaCampoVazio(FForm, Value, 'Marca', 3) = True then
        FMARCA_MARCA := Value;
end;

end.
