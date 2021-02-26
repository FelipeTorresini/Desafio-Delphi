program QS7;

uses
  uTroco in 'uTroco.pas',
  uIMaquina in 'uIMaquina.pas',
  uMaquina in 'uMaquina.pas';

{$APPTYPE CONSOLE}

{$R *.RES}

var
  maquina: TMaquina;
begin
  maquina := TMaquina.Create;
  try
    // usei como exemplo o valor 125.25
     maquina.MontarTroco(125.25);
  finally
    maquina.Free;
  end;

	Readln;
end.

