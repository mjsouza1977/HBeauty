unit Units.Utils.ServerBeauty;

interface

type
    TTipoPesquisa = (tpInicia, tpTermina, tpContenha, tpIgual);


implementation

function TipoPesquisa(ATipo : TTipoPesquisa) : String;
begin

     case ATipo of
          tpInicia   : Result := 'Inicia';
          tpTermina  : Result := 'Termina';
          tpContenha : Result := 'Contenha';
          tpIgual    : Result := 'Igual';
     end;

end;


end.
