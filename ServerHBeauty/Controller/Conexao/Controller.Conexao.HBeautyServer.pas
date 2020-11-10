unit Controller.Conexao.HBeautyServer;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.FBDef, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.FB, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON;

type
  TControllerConexao = class(TDataModule)
    qryQuery: TFDQuery;
    qryQueryAux: TFDQuery;
    FDStanStorageBinLink2: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink2: TFDPhysFBDriverLink;
    Conexao: TFDConnection;
    fdTransacao: TFDTransaction;
  private


  public

  end;

var
  ControllerConexao: TControllerConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TControllerConexao }


end.
