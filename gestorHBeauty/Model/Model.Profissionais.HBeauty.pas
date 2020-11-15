unit Model.Profissionais.HBeauty;

interface

uses ACBRValidador,
     Units.Strings.HBeauty,
     FMX.Forms,
     Model.Endereco.HBeauty,
     Model.Chaves.HBeauty,
     Model.Imagens.HBeauty;

type

    TModelProfissionais = class

    private
    FSENHA_PROFIS      : String;
    FNOME_PROFIS       : String;
    FIDEMPTER_PROFIS   : Integer;
    FIDCARGO_PROFISS   : Integer;
    FRG_PROFIS         : String;
    FSOBRENOME_PROFIS  : String;
    FTERC_PROFIS       : Boolean;
    FCODIGO_PROFIS     : String;
    FCPF_PROFIS        : String;
    FSALARIO_PROFIS    : Currency;
    FID_PROFIS         : Integer;
    FCOMISSAO_PROFIS   : Currency;
    FValidador         : TACBRValidador;
    FForm              : TForm;
    FENDERECO_PROFIS   : TModelEndereco;
    FTOKEN_PROFIS      : TModelChaves;
    FIMAGENS           : TModelImagens;

    procedure SetCODIGO_PROFIS     (const Value: String);
    procedure SetCOMISSAO_PROFIS   (const Value: Currency);
    procedure SetCPF_PROFIS        (const Value: String);
    procedure SetID_PROFIS         (const Value: Integer);
    procedure SetIDCARGO_PROFISS   (const Value: Integer);
    procedure SetIDEMPTER_PROFIS   (const Value: Integer);
    procedure SetNOME_PROFIS       (const Value: String);
    procedure SetRG_PROFIS         (const Value: String);
    procedure SetSALARIO_PROFIS    (const Value: Currency);
    procedure SetSENHA_PROFIS      (const Value: String);
    procedure SetSOBRENOME_PROFIS  (const Value: String);
    procedure SetTERC_PROFIS       (const Value: Boolean);
    procedure SetENDERECO_PROFIS(const Value: TModelEndereco);
    procedure SetTOKEN_PROFIS(const Value: TModelChaves);
    procedure SetIMAGENS(const Value: TModelImagens);

    public

    property ID_PROFIS          : Integer        read FID_PROFIS        write SetID_PROFIS;
    property IDCARGO_PROFISS    : Integer        read FIDCARGO_PROFISS  write SetIDCARGO_PROFISS;
    property IDEMPTER_PROFIS    : Integer        read FIDEMPTER_PROFIS  write SetIDEMPTER_PROFIS;
    property CODIGO_PROFIS      : String         read FCODIGO_PROFIS    write SetCODIGO_PROFIS;
    property NOME_PROFIS        : String         read FNOME_PROFIS      write SetNOME_PROFIS;
    property SOBRENOME_PROFIS   : String         read FSOBRENOME_PROFIS write SetSOBRENOME_PROFIS;
    property CPF_PROFIS         : String         read FCPF_PROFIS       write SetCPF_PROFIS;
    property RG_PROFIS          : String         read FRG_PROFIS        write SetRG_PROFIS;
    property TERC_PROFIS        : Boolean        read FTERC_PROFIS      write SetTERC_PROFIS;
    property SALARIO_PROFIS     : Currency       read FSALARIO_PROFIS   write SetSALARIO_PROFIS;
    property COMISSAO_PROFIS    : Currency       read FCOMISSAO_PROFIS  write SetCOMISSAO_PROFIS;
    property SENHA_PROFIS       : String         read FSENHA_PROFIS     write SetSENHA_PROFIS;
    property ENDERECO_PROFIS    : TModelEndereco read FENDERECO_PROFIS  write SetENDERECO_PROFIS;
    property TOKEN_PROFIS       : TModelChaves   read FTOKEN_PROFIS     write SetTOKEN_PROFIS;
    property IMAGENS            : TModelImagens  read FIMAGENS          write SetIMAGENS;
    constructor Create(AForm : TForm);
    end;

implementation

uses
  FMX.Platform.Win, Winapi.Windows, System.SysUtils, Units.Consts.HBeauty;

{ TModelProfissionais }

constructor TModelProfissionais.Create(AForm : TForm);
begin
     FValidador       := TACBrValidador.Create(nil);
     FENDERECO_PROFIS := TModelEndereco.Create(AForm);
     FIMAGENS         := TModelImagens.Create;
     FTOKEN_PROFIS    := TModelChaves.Create;
     FForm            := AForm;
end;


procedure TModelProfissionais.SetCODIGO_PROFIS(const Value: String);
begin
  FCODIGO_PROFIS := Value;
end;

procedure TModelProfissionais.SetCOMISSAO_PROFIS(const Value: Currency);
begin
  FCOMISSAO_PROFIS := Value;
end;

procedure TModelProfissionais.SetCPF_PROFIS(const Value: String);
begin

     FValidador.TipoDocto := docCPF;
     FValidador.Documento := ApenasNumeros(Value);

     case FValidador.Validar of

          True  : FCPF_PROFIS := Value;
          False : begin
                       MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                                  'C.P.F. Inválido, verifique!',
                                  apTitulo,
                                  MB_OK + MB_ICONINFORMATION);
                       Abort;
                  end;

     end;

end;

procedure TModelProfissionais.SetENDERECO_PROFIS(const Value: TModelEndereco);
begin
  FENDERECO_PROFIS := Value;
end;

procedure TModelProfissionais.SetIDCARGO_PROFISS(const Value: Integer);
begin
  FIDCARGO_PROFISS := Value;
end;

procedure TModelProfissionais.SetIDEMPTER_PROFIS(const Value: Integer);
begin
  FIDEMPTER_PROFIS := Value;
end;

procedure TModelProfissionais.SetID_PROFIS(const Value: Integer);
begin
  FID_PROFIS := Value;
end;

procedure TModelProfissionais.SetIMAGENS(const Value: TModelImagens);
begin
  FIMAGENS := Value;
end;

procedure TModelProfissionais.SetNOME_PROFIS(const Value: String);
begin
    if Length(Trim(Value)) < 4 then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                       'Nome do profissional inválido, verifique!',
                       apTitulo,
                       MB_ICONINFORMATION);
            Abort;
        end
    else
        begin
            FNOME_PROFIS := Value;
        end;
end;

procedure TModelProfissionais.SetRG_PROFIS(const Value: String);
begin
  FRG_PROFIS := Value;
end;

procedure TModelProfissionais.SetSALARIO_PROFIS(const Value: Currency);
begin
  FSALARIO_PROFIS := Value;
end;

procedure TModelProfissionais.SetSENHA_PROFIS(const Value: String);
begin
  FSENHA_PROFIS := Value;
end;

procedure TModelProfissionais.SetSOBRENOME_PROFIS(const Value: String);
begin
    if Length(Trim(Value)) < 3 then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                       'Sobrenome do profissional inválido, verifique!',
                       apTitulo,
                       MB_ICONINFORMATION);
            Abort;
        end
    else
        begin
            FSOBRENOME_PROFIS := Value;
        end;
end;

procedure TModelProfissionais.SetTERC_PROFIS(const Value: Boolean);
begin
  FTERC_PROFIS := Value;
end;

procedure TModelProfissionais.SetTOKEN_PROFIS(const Value: TModelChaves);
begin
  FTOKEN_PROFIS := Value;
end;

end.
