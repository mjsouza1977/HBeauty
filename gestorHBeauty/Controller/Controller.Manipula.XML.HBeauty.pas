unit Controller.Manipula.XML.HBeauty;




interface

uses
  Xml.XMLDoc, Units.Strings.HBeauty, Units.Consts.HBeauty;


type
    TControllerXML = class
    private
    FXMLDocumentIdCidade : TXMLDocument;
    FXMLDocumentTempCidade : TXMLDocument;

    public

    constructor Create;

    function getTemperatura(ACidade : String) : String;

    end;


implementation

uses
  Xml.XMLIntf, System.SysUtils;

{ TControllerXML }

constructor TControllerXML.Create;
begin

     FXMLDocumentIdCidade   := TXMLDocument.Create(nil);
     FXMLDocumentTempCidade := TXMLDocument.Create(nil);

end;

function TControllerXML.getTemperatura(ACidade : String) : String;
var
AMin, AMax : String;
Node : IXMLNode;
//AIdCidade : Integer;
begin

    //Extrai o ID da cidade
    FXMLDocumentIdCidade.FileName := Format(AurlXMLGetIdCidade, [RemoveAcento(ACidade)]);
    FXMLDocumentIdCidade.Active   := True;
    Node := FXMLDocumentIdCidade.ChildNodes.FindNode('cidades');

   // AIdCidade := StrToInt(Node.ChildNodes['cidade'].ChildNodes['id'].Text);

    //Com o id extrai a temperatura da cidade
    FXMLDocumentTempCidade.FileName := AurlXMLGetTemperatura;
    FXMLDocumentTempCidade.Active := True;
    Node := FXMLDocumentTempCidade.ChildNodes.FindNode('cidade');
    AMin := Node.ChildNodes['previsao'].ChildNodes['maxima'].Text;
    AMax := Node.ChildNodes['previsao'].ChildNodes['minima'].Text;

    Result :=  AMin + 'º\' + AMax + 'º';

end;

end.

