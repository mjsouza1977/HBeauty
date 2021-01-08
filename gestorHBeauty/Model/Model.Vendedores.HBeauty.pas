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
        procedure SetDTCAD_VEND(const Value: TDate);
        procedure SetENDERECO_VEND(const Value: TModelEndereco);
        procedure SetID_VEND(const Value: Integer);
        procedure SetNOME_VEND(const Value: String);
        procedure SetRG_VEND(const Value: String);
        procedure SetCPF_VEND(const Value: String);
        procedure SetSOBRENOME_VEND(const Value: String);
        procedure SetFSYSTEMA(const Value: String);

        public
        property ID_VEND        : Integer        read FID_VEND        write SetID_VEND;
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

procedure TModelVendedor.SetCPF_VEND(const Value: String);
var
ARes : String;
begin

      ARes := validaCNPJCPF(Value, 'C.P.F.');

      if ARes = '200' then
          begin
              FCPF_VEND := Value;
          end
      else
          begin
              MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                         pChar(ARes), apTitulo, MB_OK + MB_ICONWARNING);
              Abort;
          end;

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
    if Length(Trim(Value)) < 4 then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                       'Nome do profissional inválido, verifique!',
                       apTitulo,
                       MB_OK + MB_ICONINFORMATION);
            Abort;
        end
    else
        begin
            FNOME_VEND := Value;
        end;
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
