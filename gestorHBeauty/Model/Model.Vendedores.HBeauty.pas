unit Model.Vendedores.HBeauty;

interface

uses
  Model.Endereco.HBeauty, FMX.Forms, ACBrValidador;

type
        TModelVendedor = class
        private
        FNOME_VEND: String;
        FENDERECO_VEND: TModelEndereco;
        FRG_VEND: String;
        FDTCAD_VEND: TDate;
        FID_VEND: Integer;
        FForm : TForm;
        FValidador : TACBRValidador;
        FCPF_VEND: String;
        FSOBRENOME_VEND: String;
        FFSYSTEMA: String;
        FCODIGO_VEND: Integer;
        procedure SetDTCAD_VEND(const Value: TDate);
        procedure SetENDERECO_VEND(const Value: TModelEndereco);
        procedure SetID_VEND(const Value: Integer);
        procedure SetNOME_VEND(const Value: String);
        procedure SetRG_VEND(const Value: String);
        procedure SetCPF_VEND(const Value: String);
        procedure SetSOBRENOME_VEND(const Value: String);
        procedure SetFSYSTEMA(const Value: String);
        procedure SetCODIGO_VEND(const Value: Integer);

        public
        property ID_VEND        : Integer        read FID_VEND        write SetID_VEND;
        property CODIGO_VEND    : Integer        read FCODIGO_VEND    write SetCODIGO_VEND;
        property NOME_VEND      : String         read FNOME_VEND      write SetNOME_VEND;
        property SOBRENOME_VEND : String         read FSOBRENOME_VEND write SetSOBRENOME_VEND;
        property RG_VEND        : String         read FRG_VEND        write SetRG_VEND;
        property CPF_VEND       : String         read FCPF_VEND       write SetCPF_VEND;
        property ENDERECO_VEND  : TModelEndereco read FENDERECO_VEND  write SetENDERECO_VEND;
        property DTCAD_VEND     : TDate          read FDTCAD_VEND     write SetDTCAD_VEND;
        property FSYSTEMA       : String         read FFSYSTEMA       write SetFSYSTEMA;
        constructor Create(AForm : TForm);

    end;
implementation

uses
  Winapi.Windows, FMX.Platform.Win, Units.Consts.HBeauty, Units.Strings.HBeauty,
  System.SysUtils, Units.Utils.HBeauty;

{ TModelVendedor }

constructor TModelVendedor.Create(AForm: TForm);
begin
     FForm          := AForm;
     FENDERECO_VEND := TModelEndereco.create(FForm);
     FValidador     := TACBRValidador.Create(nil);
end;

procedure TModelVendedor.SetCODIGO_VEND(const Value: Integer);
begin
  FCODIGO_VEND := Value;
end;

procedure TModelVendedor.SetCPF_VEND(const Value: String);
begin

      if validaCNPJCPF(FForm, Value, 'C.P.F.') then
          FCPF_VEND := Value;

end;

procedure TModelVendedor.SetDTCAD_VEND(const Value: TDate);
begin
  FDTCAD_VEND := Value;
end;

procedure TModelVendedor.SetENDERECO_VEND(const Value: TModelEndereco);
begin
  FENDERECO_VEND := Value;
end;

procedure TModelVendedor.SetFSYSTEMA(const Value: String);
begin
  FFSYSTEMA := Value;
end;

procedure TModelVendedor.SetID_VEND(const Value: Integer);
begin
  FID_VEND := Value;
end;

procedure TModelVendedor.SetNOME_VEND(const Value: String);
begin

    if validaCampoVazio(FForm, Value, 'nome do profissional', 4) then
        FNOME_VEND := Value;

end;

procedure TModelVendedor.SetRG_VEND(const Value: String);
begin
  FRG_VEND := Value;
end;

procedure TModelVendedor.SetSOBRENOME_VEND(const Value: String);
begin
  FSOBRENOME_VEND := Value;
end;

end.
