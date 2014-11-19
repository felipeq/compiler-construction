Program ASCII; (* Wyświetla kody ASCII *)
Uses
	crt, dos;
{$I MyFile.inc}
Var
	i : Integer;
	c : Char;
	r : real;
Const	(* zakres wyświetlanych znaków *)
	minASCII = 30;
	maxASCII = 255;
Begin
	ClrScr(); (* intro na czystym ekranie *)
	Writeln( 'Kody ASCII od 30 do 255: (po 20 w wierszu):' );
	For i := minASCII To maxASCII Do (* wyświetlenie zadanych kodów ASCII *)
		Write( Chr( i ) : 4 );
	ReadKey; (* czekaj na naciśnięcie klawisza *)
	r := 12.34 * ( 56. + .78 ); { test liczb rzeczywistych }
	i := minASCII + 2 * (20 + maxASCII );
	*) { nieotwarty komentarz }
	}  { nieotwarty komentarz }
	{ komentarz
	wielowierszowy 1 }
	(* komentarz
	wielowierszowy 2 *)
	{ niezamknięty komentarz ...
End.

