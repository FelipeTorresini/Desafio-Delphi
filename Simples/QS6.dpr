program QS6;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  uISubstitui in 'uISubstitui.pas',
  uSubstitui in 'uSubstitui.pas';

var
	substitui : TSubstitui;
begin
	substitui := TSubstitui.Create;
	try
		substitui.Substituir('O rato roeu a roupa do rei de roma','ro','teste');
	finally
		substitui.Free;
	end;

	Readln;
end.

