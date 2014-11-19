/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_P_TAB_H_INCLUDED
# define YY_YY_P_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    KW_PROGRAM = 258,
    KW_BEGIN = 259,
    KW_END = 260,
    KW_USES = 261,
    KW_VAR = 262,
    KW_CONST = 263,
    KW_IF = 264,
    KW_THEN = 265,
    KW_ELSE = 266,
    KW_CHAR = 267,
    KW_INTEGER = 268,
    KW_REAL = 269,
    KW_FOR = 270,
    KW_TO = 271,
    KW_DO = 272,
    ASSIGN = 273,
    LE = 274,
    IDENT = 275,
    STRING_CONST = 276,
    FLOAT_CONST = 277,
    INTEGER_CONST = 278,
    CHARACTER_CONST = 279
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 14 "p.y" /* yacc.c:1909  */
 /* DEKLARACJA TYPU TOKENÓW */
	char s[ MAX_STR_LEN + 1 ]; /* pole tekstowe dla nazw itp. */
	int i; /* pole całkowite */
	double d; /* pole zmiennoprzecinkowe */

#line 85 "p.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_P_TAB_H_INCLUDED  */
