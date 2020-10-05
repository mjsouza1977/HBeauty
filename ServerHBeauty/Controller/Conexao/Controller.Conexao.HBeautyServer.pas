unit Controller.Conexao.HBeautyServer;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TControllerConexao = class(TDataModule)
  private
    Conexao: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FAConexao: TFDConnection;
    procedure SetAConexao(const Value: TFDConnection);

  public
    property AConexao : TFDConnection read FAConexao write SetAConexao;
    constructor create;
  end;

var
  ControllerConexao: TControllerConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TControllerConexao }


constructor TControllerConexao.create;
begin
   FAConexao := Conexao;
end;

procedure TControllerConexao.SetAConexao(const Value: TFDConnection);
begin
    FAConexao := Value;
end;

end.
