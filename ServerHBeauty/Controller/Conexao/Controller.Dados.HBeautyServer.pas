unit Controller.Dados.HBeautyServer;

interface

uses
  FireDAC.Comp.Client, System.Classes, Controller.Conexao.HBeautyServer;
type
    TControllerQuery = class(TFDQuery)
    private

    public
    constructor Create(AOwer : TComponent; AConexao : TFDConnection); overload;
    destructor destroy; override;

    end;

var
   AFDQuery : TFDQuery;

implementation

{ TMyQuery }


{ TControllerQuery }

constructor TControllerQuery.Create(AOwer : TComponent; AConexao : TFDConnection);
begin
  AFDQuery := TFDQuery.Create(AOwer);
  AFDQuery.Connection := AConexao;
end;

destructor TControllerQuery.destroy;
begin

  inherited;
end;

end.
