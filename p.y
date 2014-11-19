%{
#include <stdio.h> /* printf() */
#include "common.h" /* MAX_STR_LEN */
%}


/* DEKLARACJA SYMBOLI KOŃCOWYCH */
%token KW_PROGRAM KW_BEGIN KW_END KW_USES KW_VAR KW_CONST KW_IF KW_THEN KW_ELSE
%token KW_CHAR KW_INTEGER KW_REAL KW_FOR KW_TO KW_DO
%token ASSIGN LE
%token IDENT STRING_CONST FLOAT_CONST INTEGER_CONST CHARACTER_CONST

%union 
{ /* DEKLARACJA TYPU TOKENÓW */
	char s[ MAX_STR_LEN + 1 ]; /* pole tekstowe dla nazw itp. */
	int i; /* pole całkowite */
	double d; /* pole zmiennoprzecinkowe */
}

%%

Grammar: /* empty */
	| TOKENS
;
	
TOKENS: TOKEN
	| TOKENS TOKEN
;

TOKEN: KEYWORD | OPERATOR | IDENT | CONSTS | CHARS | error
;

KEYWORD: KW_PROGRAM | KW_BEGIN | KW_END | KW_USES | KW_VAR | KW_CONST | KW_IF 
	| KW_THEN | KW_ELSE | KW_CHAR | KW_INTEGER | KW_REAL | KW_FOR | KW_TO
        | KW_DO
;

OPERATOR: ASSIGN | LE 

CONSTS: STRING_CONST | FLOAT_CONST | INTEGER_CONST | CHARACTER_CONST
;

CHARS:	'+' | '-' | '*' | '/' | ';' | ',' | '=' | ':' | '.'
	| '(' | ')' | '{' | '}'
;	

%%


int main( void )
{
	int ret;
	printf( "Autor: Imie i Nazwisko\n" );
	printf( "yytext              Typ elementu    Wartość elementu znakowo\n\n" );
	/* wywołanie analizatora składniowego */
	ret = yyparse();
	return ret;
}

int yyerror( const char *txt )
{
	printf( "Syntax error %s", txt );
	return( 0 );
}
