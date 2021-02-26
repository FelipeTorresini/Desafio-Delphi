unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco;

type
  TMaquina = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

uses
  TypInfo, SysUtils;

function TMaquina.MontarTroco(aTroco: Double): TList;
var
  lMinhaLista: TList;
  lTroco: TTroco;
  lQuantidade: Integer;
  lTipoCedula: TCedula;
  i: Integer;
begin
  lMinhaLista := TList.Create;
  try
    // repeat na função calculartroco para que trabalhe o valor do troco restante, trazendo as quantidades
    // e o tipo da cedula ate que troco seja menor ou igual a zero
    repeat
      lTipoCedula := TTroco.CalcularTroco(aTroco, lQuantidade);
      lTroco := TTroco.Create(lTipoCedula, lQuantidade);
      lMinhaLista.Add(lTroco);
    until aTroco <= 0;

    for i := 0 to lMinhaLista.Count - 1 do
    begin
      // usei getenumname para que fosse possivel visualizar o nome do tipo da cedula
      writeln(GetEnumName(TypeInfo(TCedula), Integer(TTroco(lMinhaLista[i]).Tipo)) + '-'
                + IntToStr(TTroco(lMinhaLista[i]).Quantidade));
    end;

  finally
    Result := lMinhaLista;
    lMinhaLista.Free;
  end;
end;

end.

