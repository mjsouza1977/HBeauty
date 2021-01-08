unit Model.Produtos.HBeauty;

interface

implementation

type
    TModelProdutos = class
    private
    FRESERVALJ_PROD   : Currency;
    FORIENT_PROD      : String;
    FCODIGO_PROD      : String;
    FCODIGOBARRAS_PROD: String;
    FPRPROMO_PROD     : Currency;
    FDETALHES_PROD    : String;
    FUND_PROD         : String;
    FPRCUSTO_PROD     : Currency;
    FID_PROD          : Integer;
    FESTOQUELJ_PROD   : Currency;
    FMEDIDADOSE_PROD  : String;
    FDESCR_PROD       : String;
    FPRVENDA_PROD     : Currency;
    FCCEST_PROD       : String;
    FINFO_PROD        : String;
    FDOSE_PROD        : Currency;
    FIDFORN_PROD      : Integer;
    FCLSSFISCAL_PROD  : String;
    FEMB_PROD         : String;
    FIDUSULOCK        : Integer;
    FPESO_PROD        : Currency;
    FRESERVAAPP_PROD  : Currency;
    FOBS_PROD         : String;
    FALOCK            : Boolean;
    FIDMARCA_PROD     : Integer;
    FESTOQUEAPP_PROD  : Currency;

    procedure SetALOCK            (const Value: Boolean);
    procedure SetCCEST_PROD       (const Value: String);
    procedure SetCLSSFISCAL_PROD  (const Value: String);
    procedure SetCODIGO_PROD      (const Value: String);
    procedure SetCODIGOBARRAS_PROD(const Value: String);
    procedure SetDESCR_PROD       (const Value: String);
    procedure SetDETALHES_PROD    (const Value: String);
    procedure SetDOSE_PROD        (const Value: Currency);
    procedure SetEMB_PROD         (const Value: String);
    procedure SetESTOQUEAPP_PROD  (const Value: Currency);
    procedure SetESTOQUELJ_PROD   (const Value: Currency);
    procedure SetID_PROD          (const Value: Integer);
    procedure SetIDFORN_PROD      (const Value: Integer);
    procedure SetIDMARCA_PROD     (const Value: Integer);
    procedure SetIDUSULOCK        (const Value: Integer);
    procedure SetINFO_PROD        (const Value: String);
    procedure SetMEDIDADOSE_PROD  (const Value: String);
    procedure SetOBS_PROD         (const Value: String);
    procedure SetORIENT_PROD      (const Value: String);
    procedure SetPESO_PROD        (const Value: Currency);
    procedure SetPRCUSTO_PROD     (const Value: Currency);
    procedure SetPRPROMO_PROD     (const Value: Currency);
    procedure SetPRVENDA_PROD     (const Value: Currency);
    procedure SetRESERVAAPP_PROD  (const Value: Currency);
    procedure SetRESERVALJ_PROD   (const Value: Currency);
    procedure SetUND_PROD         (const Value: String);

    public
    property ID_PROD            : Integer  read FID_PROD           write SetID_PROD;
    property IDFORN_PROD        : Integer  read FIDFORN_PROD       write SetIDFORN_PROD;
    property IDMARCA_PROD       : Integer  read FIDMARCA_PROD      write SetIDMARCA_PROD;
    property IDUSULOCK          : Integer  read FIDUSULOCK         write SetIDUSULOCK;
    property CODIGO_PROD        : String   read FCODIGO_PROD       write SetCODIGO_PROD;
    property CODIGOBARRAS_PROD  : String   read FCODIGOBARRAS_PROD write SetCODIGOBARRAS_PROD;
    property DESCR_PROD         : String   read FDESCR_PROD        write SetDESCR_PROD;
    property EMB_PROD           : String   read FEMB_PROD          write SetEMB_PROD;
    property UND_PROD           : String   read FUND_PROD          write SetUND_PROD;
    property ORIENT_PROD        : String   read FORIENT_PROD       write SetORIENT_PROD;
    property OBS_PROD           : String   read FOBS_PROD          write SetOBS_PROD;
    property MEDIDADOSE_PROD    : String   read FMEDIDADOSE_PROD   write SetMEDIDADOSE_PROD;
    property CCEST_PROD         : String   read FCCEST_PROD        write SetCCEST_PROD;
    property CLSSFISCAL_PROD    : String   read FCLSSFISCAL_PROD   write SetCLSSFISCAL_PROD;
    property INFO_PROD          : String   read FINFO_PROD         write SetINFO_PROD;
    property DETALHES_PROD      : String   read FDETALHES_PROD     write SetDETALHES_PROD;
    property ESTOQUELJ_PROD     : Currency read FESTOQUELJ_PROD    write SetESTOQUELJ_PROD;
    property ESTOQUEAPP_PROD    : Currency read FESTOQUEAPP_PROD   write SetESTOQUEAPP_PROD;
    property RESERVALJ_PROD     : Currency read FRESERVALJ_PROD    write SetRESERVALJ_PROD;
    property RESERVAAPP_PROD    : Currency read FRESERVAAPP_PROD   write SetRESERVAAPP_PROD;
    property PRCUSTO_PROD       : Currency read FPRCUSTO_PROD      write SetPRCUSTO_PROD;
    property PRVENDA_PROD       : Currency read FPRVENDA_PROD      write SetPRVENDA_PROD;
    property PRPROMO_PROD       : Currency read FPRPROMO_PROD      write SetPRPROMO_PROD;
    property PESO_PROD          : Currency read FPESO_PROD         write SetPESO_PROD;
    property DOSE_PROD          : Currency read FDOSE_PROD         write SetDOSE_PROD;
    property ALOCK              : Boolean  read FALOCK             write SetALOCK;
    end;

{ TModelProdutos }

procedure TModelProdutos.SetALOCK(const Value: Boolean);
begin
  FALOCK := Value;
end;

procedure TModelProdutos.SetCCEST_PROD(const Value: String);
begin
  FCCEST_PROD := Value;
end;

procedure TModelProdutos.SetCLSSFISCAL_PROD(const Value: String);
begin
  FCLSSFISCAL_PROD := Value;
end;

procedure TModelProdutos.SetCODIGOBARRAS_PROD(const Value: String);
begin
  FCODIGOBARRAS_PROD := Value;
end;

procedure TModelProdutos.SetCODIGO_PROD(const Value: String);
begin
  FCODIGO_PROD := Value;
end;

procedure TModelProdutos.SetDESCR_PROD(const Value: String);
begin
  FDESCR_PROD := Value;
end;

procedure TModelProdutos.SetDETALHES_PROD(const Value: String);
begin
  FDETALHES_PROD := Value;
end;

procedure TModelProdutos.SetDOSE_PROD(const Value: Currency);
begin
  FDOSE_PROD := Value;
end;

procedure TModelProdutos.SetEMB_PROD(const Value: String);
begin
  FEMB_PROD := Value;
end;

procedure TModelProdutos.SetESTOQUEAPP_PROD(const Value: Currency);
begin
  FESTOQUEAPP_PROD := Value;
end;

procedure TModelProdutos.SetESTOQUELJ_PROD(const Value: Currency);
begin
  FESTOQUELJ_PROD := Value;
end;

procedure TModelProdutos.SetIDFORN_PROD(const Value: Integer);
begin
  FIDFORN_PROD := Value;
end;

procedure TModelProdutos.SetIDMARCA_PROD(const Value: Integer);
begin
  FIDMARCA_PROD := Value;
end;

procedure TModelProdutos.SetIDUSULOCK(const Value: Integer);
begin
  FIDUSULOCK := Value;
end;

procedure TModelProdutos.SetID_PROD(const Value: Integer);
begin
  FID_PROD := Value;
end;

procedure TModelProdutos.SetINFO_PROD(const Value: String);
begin
  FINFO_PROD := Value;
end;

procedure TModelProdutos.SetMEDIDADOSE_PROD(const Value: String);
begin
  FMEDIDADOSE_PROD := Value;
end;

procedure TModelProdutos.SetOBS_PROD(const Value: String);
begin
  FOBS_PROD := Value;
end;

procedure TModelProdutos.SetORIENT_PROD(const Value: String);
begin
  FORIENT_PROD := Value;
end;

procedure TModelProdutos.SetPESO_PROD(const Value: Currency);
begin
  FPESO_PROD := Value;
end;

procedure TModelProdutos.SetPRCUSTO_PROD(const Value: Currency);
begin
  FPRCUSTO_PROD := Value;
end;

procedure TModelProdutos.SetPRPROMO_PROD(const Value: Currency);
begin
  FPRPROMO_PROD := Value;
end;

procedure TModelProdutos.SetPRVENDA_PROD(const Value: Currency);
begin
  FPRVENDA_PROD := Value;
end;

procedure TModelProdutos.SetRESERVAAPP_PROD(const Value: Currency);
begin
  FRESERVAAPP_PROD := Value;
end;

procedure TModelProdutos.SetRESERVALJ_PROD(const Value: Currency);
begin
  FRESERVALJ_PROD := Value;
end;

procedure TModelProdutos.SetUND_PROD(const Value: String);
begin
  FUND_PROD := Value;
end;

end.
