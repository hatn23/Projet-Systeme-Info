%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
%}

%union{

}

%token  tNUMBER tREAL
%token  tADD tSUB tDIV tMUL tEQUAL
%token  tOB tCB
%token  tINT tFLOAT tCHAR
%token  tSEMICOL tSEP
%token  tMAIN tRET tWHILE tIF tELSE tINF tCONST
%token  tCMP tINF tSUP tINFEQUAL tSUPEQUAL

%left   tADD tSUB
%left   tMUL tDIV

%start S 
%%

S:          function
            |function S

function: 
