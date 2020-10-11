unit Controller.ConexaoWS.HBeauty;

interface

uses
  REST.Types, REST.Client, REST.Response.Adapter, REST.Authenticator.Basic;

type
    TType = (tpJSON, tpXML);

type
    TControllerConexao = class

    private
        FRESTClient   : TRESTClient;
        FRESTRequest  : TRESTRequest;
        FRESTResponse : TRESTResponse;
        FHTTPBasicAuthenticator : THTTPBasicAuthenticator;
        FRESTResponseDataSetAdapter : TRESTResponseDataSetAdapter;
    FContType: String;
    procedure SetContType(const Value: String);
    public

        property ContType : String read FContType write SetContType;
        constructor Create(Metodo: TRESTRequestMethod; AType : TType; AAuth : Boolean = False; AUser : String = ''; APassword : String = '');

        destructor Destroy; override;


    end;

implementation

uses
  System.SysUtils, System.Classes, System.JSON, Xml.XMLIntf;

{ TControllerConexao }

constructor TControllerConexao.Create(Metodo: TRESTRequestMethod; AType : TType; AAuth : Boolean = False; AUser : String = ''; APassword : String = '');
begin

    FRESTClient   := TRESTClient.Create(nil);
    FRESTRequest  := TRESTRequest.Create(nil);
    FRESTResponse := TRESTResponse.Create(nil);

    FRESTResponse.Content.Empty;
    if AAuth = True then
        begin
            FHTTPBasicAuthenticator   := THTTPBasicAuthenticator.Create(AUser, APassword);
            FRESTClient.Authenticator := FHTTPBasicAuthenticator;
        end;

    FRESTResponseDataSetAdapter := TRESTResponseDataSetAdapter.Create(nil);

    FRESTRequest.Client       := FRESTClient;
    FRESTRequest.Response     := FRESTResponse;

    case AType of
        tpJSON : FRESTResponse.ContentType := 'application/json';
        tpXML  : FRESTResponse.ContentType := 'text/xml';
    end;


    FRESTRequest.Method := Metodo;

    FRESTResponseDataSetAdapter.Response := FRESTResponse;

    FRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    FRESTClient.AcceptCharset  := 'utf-8, *;q=0.8';
    FRESTClient.RaiseExceptionOn500 := False;

end;

destructor TControllerConexao.Destroy;
begin
  FreeAndNil(FRESTClient);
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);
  FreeAndNil(FRESTResponseDataSetAdapter);

  inherited;
end;



procedure TControllerConexao.SetContType(const Value: String);
begin
  FContType := Value;
end;

end.

