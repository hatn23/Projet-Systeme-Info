/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
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
    tNUMBER = 258,
    tREAL = 259,
    tVAR = 260,
    tADD = 261,
    tSUB = 262,
    tDIV = 263,
    tMUL = 264,
    tEQUAL = 265,
    tOB = 266,
    tCB = 267,
    tOA = 268,
    tCA = 269,
    tINT = 270,
    tFLOAT = 271,
    tCHAR = 272,
    tVOID = 273,
    tERROR = 274,
    tSEMCOL = 275,
    tSEP = 276,
    tMain = 277,
    tRET = 278,
    tWHILE = 279,
    tIF = 280,
    tELSE = 281,
    tCONST = 282,
    tPRINTF = 283,
    tCMP = 284,
    tINF = 285,
    tSUP = 286,
    tINFEQUAL = 287,
    tSUPEQUAL = 288
  };
#endif
/* Tokens.  */
#define tNUMBER 258
#define tREAL 259
#define tVAR 260
#define tADD 261
#define tSUB 262
#define tDIV 263
#define tMUL 264
#define tEQUAL 265
#define tOB 266
#define tCB 267
#define tOA 268
#define tCA 269
#define tINT 270
#define tFLOAT 271
#define tCHAR 272
#define tVOID 273
#define tERROR 274
#define tSEMCOL 275
#define tSEP 276
#define tMain 277
#define tRET 278
#define tWHILE 279
#define tIF 280
#define tELSE 281
#define tCONST 282
#define tPRINTF 283
#define tCMP 284
#define tINF 285
#define tSUP 286
#define tINFEQUAL 287
#define tSUPEQUAL 288

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 7 "compilo.y" /* yacc.c:1909  */

    char *str;
    int number;
    float reel;

#line 126 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
