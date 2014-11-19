%{
#include <stdio.h> /* printf() */
#include <string.h> /* strcpy */
#include <stdlib.h> /* atoi(), atof() */
#include "common.h" /* MAX_STR_LEN */
#include "p.tab.h" /* deklaracja symboli końcowych */

int process_token(const char *text, const char *TokenType,
                  const char *TokenVal, const int TokenID); 

int comm_beg = 0; /* wiersz rozpoczęcia komentarza */
%}


/* deklaracja dodatkowych warunków początkowych analizatora leksykalnego */
/* (nie deklarujemy domyślnego warunku początkowego INITIAL */
/* ..................... */
%x  ST_COMMENT_1 ST_COMMENT_2 ST_TEXT_CONST

/* pomocnicze wyrażenia regularne */
alpha 		[a-zA-Z]
num			[0-9]
alphanum	[a-zA-Z0-9]
alphanum2	[a-zA-Z0-9_]


%%


 /* usuwanie komentarzy wielowierszowych (*..*) */
 /* z wykorzystaniem mechanizmu warunków początkowych */
 /* ..................... */


 /* usuwanie komentarzy wielowierszowych {..} */
 /* z wykorzystaniem mechanizmu warunków początkowych */
 /* ..................... */


 /* wykrycie błędu: Nieoczekiwane zamknięcie komentarza w wierszu */
 /* ..................... */


 /* wykrywanie stałych tekstowych '..' */
 /* z wykorzystaniem mechanizmu warunków początkowych */
 /* ..................... */


 /* wykrycie dyrektyw postaci {$I name.ext} */
 /* (bez wykorzystaniem mechanizmu warunków początkowych) */
 /* ..................... */


 /* wykrycie słów kluczowych bez uwzględniania wielkości liter! */
 /* ..................... */


 /* wykrycie symboli końcowych opisywanych złożonymi wyrażeniami regularnymi */
 /* ..................... */


 /* wycięcie białych znaków */
 /* ..................... */


 /* operatory wieloznakowe np.: :=, <= */ 
 /* ..................... */


 /* operatory jednoznakowe oraz interpunkcja */
 /* ..................... */


%%

/* Nazwa:       process_token
 * Cel:         Wypisanie informacji o wykrytym elemencie i przekazanie
 *              tej informacji wyżej z ewentualną wartością elementu, jeśli
 *              takowa występuje.
 * Parametry:   text            - (i) tekst, do którego nastąpiło dopasowanie;
 *              TokenType       - (i) napis będący tekstową reprezentacją
 *                                      nazwy typu elementu;
 *              TokenVal        - (i) wartość elementu, o ile występuje;
 *              TokenID         - (i) identyfikator typu elementu zadeklarowany
 *                                      za pomocą dyrektywy %token
 *                                      w pliku ada.y.
 * Zwraca:      Identyfikator typu elementu (TokenID).
 * Uwagi:       Informacja o wykrytym elemencie zwracana jest
 *              w trzech kolumnach. W pierwszej wypisywany jest tekst,
 *              do którego nastąpiło dopasowanie, w drugiej - typ elementu,
 *              w trzeciej - wartość elementu (o ile występuje).
 */
int process_token(const char *text, const char *TokenType,
                  const char *TokenVal, const int TokenID)
{
  int l;
  printf("%-20.20s%-15s %s\n", text, TokenType, TokenVal);
  switch (TokenID) {

  case INTEGER_CONST:
    yylval.i = atoi(text); break;

  case FLOAT_CONST:
    yylval.d = atof(text); break;

  case IDENT:
    strncpy(yylval.s, text, MAX_STR_LEN); break;

  case STRING_CONST:
    l = strlen(text);
    strncpy(yylval.s, text + 1, l - 2 <= MAX_STR_LEN ? l - 1 : MAX_STR_LEN);
    break;

  case CHARACTER_CONST:
    yylval.i = text[1]; break;

  }
  return(TokenID);
}/*process_token*/


int yywrap( void )
{ /* funkcja wywoływana po napotkaniu końca strumienia wejściowego */

	/* sprawdzenie, czy bieżący warunek początkowy automatu YYSTATE */
	/* różni się od warunku początkowego INITIAL. Jeżeli tak, */
	/* to oznacza to niezamknięty komentarz lub stałą tekstową - */
	/* wypisujemy informację o błędzie.*/
	/* ..................... */


	return( 1 ); /* koniecznie, by analiza nie rozpoczęła się od nowa */
}

