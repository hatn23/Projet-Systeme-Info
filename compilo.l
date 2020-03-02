%{
    #include <stdlib.h>
    #include "compilo.h"
%}


TAB         [\t]+
NEWLINE     [\n]+
DIGIT       [0-9]
NUMBER      {DIGIT}+
EXP         [eE][+-]?{NUMBER}
REAL        {NUMBER}("."{NUMBER})?{EXP}?
ALPHABET    [A-Za-z]
ALPHANUM    {ALPHABET}({ALPHABET}|{NUM}|"_")*?

%%
"main"      {return (tMain);}
"int"       {return (tINT);}
"const"     {return (tCONST);}
"char"      {return (tCHAR);}
"float"     {return (tFLOAT);}
"void"     {return (tVOID);}
"printf"    {return(tPRINTF);}
{TAB}       {}
{NEWLINE}   {}
{NUMBER}    {yylval=atoi(yytext);
             return (tNUMBER);}
{REAL}      {yylval=atof(yytext);
             return (tREAL);}  
"if"        {return (tIF);}
"else"      {return (tELSE);}
"while"     {return (tWHILE);}
"return"    {return (tRET);}
"+"         {return (tADD);}
"-"         {return (tSUB);}
"*"         {return (tMUL);}
"/"         {return (tDIV);}
"="         {return (tEQUAL);}
"("         {return (tOB);}
")"         {return (tCB);}
"=="        {return (tCMP);}
","         {return (tSEP);}
";"         {return (tSEMCOL);}
"<"         {return (tINF);}
">"         {return (tSUP);}
"<="        {return (tINFEQUAL);}
">="        {return (tSUPEQUAL);}
.           {return (tERROR);}

%%
int yywrap(void){
    return 1;
}

int main(void){
    yylex();
}

