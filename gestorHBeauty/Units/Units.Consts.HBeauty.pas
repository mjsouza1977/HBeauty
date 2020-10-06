unit Units.Consts.HBeauty;

interface

uses
  System.UITypes;

const

     AurlXMLGetIdCidade    : String = 'http://servicos.cptec.inpe.br/XML/listaCidades?city=%s';
     AurlXMLGetTemperatura : String = 'http://servicos.cptec.inpe.br/XML/Cidade/%s/previsao.xml';

var
   ctrFCOR_BOTOES_NEGATIVO : TAlphaColor;
   ctrFCOR_BOTOES_POSITIVO : TAlphaColor;

implementation

end.
